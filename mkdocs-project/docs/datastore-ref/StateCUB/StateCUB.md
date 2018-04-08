# TSTool / Datastore Reference / StateCUB #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)

-----------------

## Overview ##

The StateCUB time series input type corresponds to the file format used by the
[State of Colorado's StateCU consumptive use model](http://cdss.state.co.us/software/Pages/StateCU.aspx),
in particular the binary output file.
These files contain important water balance information for every location in the model.
The following table summarizes the contents of the binary files and
corresponding text report files (all files can be large for large data sets). 

|**Node Type**|**Monthly Binary File**|**Monthly Report File**|
|--|--|--|
|CU locations|`*.bd1`|`*.dwb`|

The following documentation describes the format of the BD1 binary file.
See the StateCU Documentation for a complete description of StateCU output files.
The following is a summary to explain how TSTool handles the format.

Unlike the StateMod binary files, the StateCU BD1 file does not have a fixed length record throughout the file.
Different sections of the file have fixed length segments, depending on the contents of the section.
The main sections and their format are described below, using terminology consistent with StateCU.

**<p style="text-align: center;">
Header Records (File Metadata)
</p>**

|**Field**|**Data**|**Type**|**Description**|
|--|--|--|--|
|1|`NumStr`|integer|Number of structures (CU locations).|
|2|`NumTS`|integer|Number of time steps.  The data period for the file is determined from first time series record plus (`NumTS – 1`).|
|3|`NumStrVar`|integer|Number of variables associated with each structure.|
|4|`NumTSVar`|integer|Number of time series variables (parameters) associated with each structure.|
|5|`NumTSA`|integer|Number of time steps in a year (`1`, `12`, `365`), although `12` (monthly data) is currently the only supported value.|

**<p style="text-align: center;">
Structure Header Records (Structure Metadata) - Repeat the Following for `NumStrVar`
</p>**

|**Field**|**Data**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Type**|**Description**|
|--|--|--|--|
|1|`StructureVarType`|char(1)|The type of the structure variable:  R for floating point number, I for integer, C for character string.|
|2|`StructureVarLen`|integer|Length of structure variable in bytes.|
|3|`StructureVarName`|char(24)|Structure variable name.|
|4|`StructureVarInReport`|integer|Whether the structure is in the DWB report file.|
|5|`StructureVarReportHeader`|char(60)|The report header to use for the structure variable.|

 
**<p style="text-align: center;">
Time Series Header Records (Time Series Metadata) - Repeat the Following for `NumTSVar`
</p>**

|**Field**|**Data**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Type**|**Description**|
|--|--|--|--|
|1|`TimeSeriesVarType`|char(1)|The type of the time series variable:  R for floating point number, I for integer, C for character string.|
|2|`TimeSeriesVarLen`|integer|Length of time series variable in bytes.|
|3|`TimeSeriesVarName`|char(24)|Time series variable name.|
|4|`TimeSeriesVarInReport`|integer|Whether the structure is in the DWB report file.|
|5|`TimeSeriesVarUnits`|char(10)|The units for the time series.|

**<p style="text-align: center;">
Structure Variable Data Records
</p>**

Repeat the following for `NumStr`, and for each `NumStrVar`.
The order of the variables is not fixed; however, the “Structure Index” variable contains a
numeric identifier that is used to sort the structures to lookup structures when reading the time series.

|**Field**|**Data**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Type**|**Description**|
|--|--|--|--|
|1|`StructureVarValue`|As per metadata.|The values of the structure variables, including “Structure Index” (1+), “Structure ID”, “Structure Name”.  Additional variables may be added later.  The index is used to create a sorted list of structure identifiers and names for applications like TSTool.|

**<p style="text-align: center;">
Time Series Data Records
</p>**

Repeat the following looping on `NumStr`, then `NumTimeSteps`, and then `NumTimeSeriesVar`.
The order of time series variables is the same for all structures and
throughout the entire file (variable “X” will always be in the same position in the inner loop).
The order of the structures may not agree with the order of the metadata from above.
The “Structure Index” variable in the time series records is used to map
the time series to the structure identified in the metadata above.

|**Field**|**Data**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Type**|**Description**|
|--|--|--|--|
|1|`TimeSeriesVarValue`|As per metadata.|The values of the time series variables, including “Structure Index” (matching “Structure Index” from the structure data), “Year” (Calendar 4-digit), “Month Index” (1-12), and variable names for values at each time step.  Additional variables may be added later.|

A visual representation of data is as follows (note that Structure 1 is an internal looping representation and the actual structure is identified by the “Structure Index” variable for the time series):

```text
Structure 1
    Timestep 1
        Variable 1
        ...
        Variable NumStrVar
    Timestep 2
        Variable 1
        ...
        Variable NumStrVar
    ...
    TimeStep NumTS
Structure 2
    Timestep 1
        Variable 1
        ...
        Variable NumStrVar
    Timestep 2
        Variable 1
        ...
        Variable NumStrVar
    ...
    TimeStep NumTS
...
Structure NumStr
```

The order of the structures in the time series data block may not be the same as
that in the header metadata due to the constraints of the StateCU model and
how it writes each section during different phases of execution.
Therefore, at initialization, the “Structure Index” variable value for each time series is
read for the first timestep of each structure to determine the mapping of the
structure in the time series data block with that in the main header.

Some time series variables are integers (e.g., the year and month)
and some are characters (e.g., the month name and model flags).
The integer variable “Year” has the same value for 12 monthly time steps and then increases by one.
The variable “Month Index” repeats the values 1 – 12 through the period of the time series.
Only floating point parameters are read by default.
In the future, integer and character time series may be allowed or the character values may be translated to a lookup table of numbers.

## Standard Time Series Properties ##

The standard time series identifier for StateCUB binary time series is of the form:

```
Location.StateCU.DataType.Interval~StateCUB~PathToFile
```

Time series properties are set using the following guidelines:

* The location part of the time series identifier is taken from the structure identifier field in the data.
* The data source part of the time series identifier is set to `StateCU`, because StateCU has created the output time series.
* The data type is assigned as the variable (parameter) name described above – See the StateCU documentation for more information.
* The data interval is assigned as Month.
* The scenario is set to blank (not used).
* The input type is set to `StateCUB`.
* The input name is set to the name of the file.
* The units are determined from the time series variable metadata.
* The missing data value is assigned to `-999.0`.
* The description is set to the structure name.
* The period is set to the information in the first time series record incremented by
the number of timesteps in the file (minus one).
Current the file only contains calendar year data (January to December).

## Limitations ##

StateCU binary files have the following limitations:

* The file does not contain a format version; therefore, it is difficult for software to
handle changes in the file format.  However, the current format is designed to
allow for changing structure and time series parameters without changing the file format.
* The file does not contain header information indicating the source of the
file (e.g., the creation date, user, directory, StateCU response file, command line).
Therefore, it is difficult to know with certainty how a file was created.
* Leap years are not explicitly handled with 29 days during model calculations.
Therefore there may be some loss of precision as data are processed through the model.
Refer to the StateCU documentation for more information on how values are calculated.
