# TSTool / Datastore Reference / RiverWare #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)

--------------

## Overview ##

RiverWare is a river and reservoir model developed by the Center for
Advanced Decision Support for Water and Environmental Systems (CADSWES) at the University of Colorado.
RiverWare uses data management interfaces (DMIs) to read time series data from various formats at run-time.
The format described in this appendix is a standard time series format that is
imported into the RiverWare data sets and can be output during runs.
The example below shows the format of a file.
Refer to the RiverWare Data Management Interface documentation for more information.
Important comments about the file format are:

* The file is divided into a header section (top) and data section (bottom).
Comments can occur anywhere in the file and are lines starting with `#`.
* The data period is defined by the `start_date` and `end_date` keywords.
Date/times must include hours and minutes regardless of the date/time precision
(the more precise information is ignored if not needed).
For day, month, and year interval data, specify `24:00` at the end of the line.
* The data interval is defined by the timestep keyword and consists of an
integer multiplier and a base interval string, separated by a space.
Recognized intervals are `HOUR`, `DAY`, `WEEK`, `MONTH`, and `YEAR`.
* The data units are specified using the units keyword and are the units after the scale is applied.
The scale keyword indicates a value that should be applied to the data
values to result in the specified units.
For example, a data value of `1.5` with units of `cfs` and a scale of `1000` will result of a value of `1500 cfs` in memory.
* Optional `set_units` and `set_scale` keywords may be used similar to units and scale to
indicate the units and scale to be converted to when data are read.
These properties can be written by TSTool’s [`WriteRiverWare`](../../command-ref/WriteRiverWare/WriteRiverWare.md)
command but currently are not evaluated by TSTool when reading data.

The following example illustrates the format of a RiverWare file.

```
# Comments
start_date: 1903-01-01 06:00
end_date: 2001-12-31 24:00
timestep: 6 HOUR
scale: 1
set_scale: 1
units: ft
set_units: ft
1356.00
1356.00
1356.00
1356.00
1356.00
NaN
NaN
…
```
 
## Standard Time Series Properties ##

The standard time series identifier for RiverWare time series files is of the form:

```
Location..DataType.Interval~RiverWare~PathToFile
```

RiverWare time series files contain limited information to assign to standard time series properties.
The following assignments are made:

* The location part of the identifier is taken from the first part of the file name.
It is assumed that the file name is of the form `ObjectName.SlotName`.
* The data source part of the time identifier is left blank.
* The data type is taken from the second part of the file name.
It is assumed that the file name is of the form `ObjectName.SlotName`.
* The data interval is determined from the timestep property in the file.
* The data units are determined from the units property in the file.
Currently the `set_units` property is not evaluated when reading data.
* The missing data value is assigned to `NaN` (not a number).
* The description is set to the location, a comma, followed by the data type.

## Limitations ##

RiverWare files have the following limitations:

* RiverWare time series files require that units be spelled exactly as required by RiverWare,
including upper/lower case.  TSTool currently does not know about RiverWare units and
therefore commands like [`WriteRiverWare`](../../command-ref/WriteRiverWare/WriteRiverWare.md)
must be used to verify that the units are correct for RiverWare.
* Only one time series can be saved in a file (other RiverWare files support multiple time series and may be supported in the future).
* RiverWare files do not store the data type or location information for the time series.
These values are assigned from the file name, as described above.
Relying on a file name convention may cause errors if the convention is not followed.
* Data lines do not contain the date.
Therefore, it is difficult to use the files in other applications without first assigning dates for all the values.
