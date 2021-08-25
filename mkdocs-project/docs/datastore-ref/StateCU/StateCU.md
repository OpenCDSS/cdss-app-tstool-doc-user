# TSTool / Datastore Reference / StateCU #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)

-------------

## Overview ##

The StateCU time series input type corresponds to the file formats used by the
[State of Colorado's StateCU consumptive use model](https://cdss.colorado.gov/modeling-data/consumptive-use-statecu), including:

* Crop pattern time series file, yearly (`*.cds`)
* Irrigation water requirement, formatted for StateMod (`*.ddc`)
* Historical direct diversions, monthly (`*.ddh`) and daily (`*.ddd`) (in StateMod format but treated as StateCU input when used with a StateCU data set)
* Irrigation practice time series, yearly (`*.ipy`)
* Irrigation water requirement (IWR, `*.iwr`) and water supply limited (WSL, `*.wsl`) output report files, including monthly and yearly values
* Frost dates, yearly
* Precipitation, monthly (in StateMod format)
* Temperature, monthly (in StateMod format)

See also the [StateCUB input type](../StateCUB/StateCUB.md), which corresponds to StateCU output binaryfiles,
the [StateMod input type](../StateMod/StateMod.md), which corresponds to StateMod input files,
and the [StateModB input type](../StateModB/StateModB.md), which corresponds to StateMod binary output files.

See the [StateCU Documentation](https://cdss.colorado.gov/software/statecu) for a complete description of StateCU input files.
Refer to the [StateMod Documentation](https://cdss.colorado.gov/software/statemod) for files that use the StateMod file format.

Important comments about the StateCU file formats are:

* Input files are divided into a header section (top) and data section (bottom).
Comments can occur only at the top and are lines that begin with `#`.
* One or more time series can be stored in a file.
* Consistency in the order and number of the stations is
required for each year of data, within the file.
* Other than comments, input files are fixed-format, compatible with Fortran applications.
See the StateCU Documentation and StateMod Documentation for field specifications.
* Input file formats are optimized to allow a full year of data to be read for the entire data set.
Reading a time series for a single location for the full period requires reading through the entire file.
* The precision of data values may be controlled by software, resulting in more or fewer fractional digits.
This may lead to round-off differences when comparing raw data values output by the software.

## Standard Time Series Properties ##

The standard time series identifier for StateCU files is of the form:

* `Location.StateCU..Month~StateCU~PathToDDCFile` (for DDC file)
* `Location.StateCU.CropArea-AllCrops.Year~StateCU~PathToIWRReport` (for IWR report acreage)
* `Location.StateCU.IWR.Month~StateCU~PathToIWRReport` (for IWR report monthly IWR)
* `Location.StateCU.IWR.Year~StateCU~PathToIWRReport` (for IWR report yearly IWR)
* `Location.StateCU.IWR_Depth.Year~StateCU~PathToIWRReport` (for IWR report IWR depth)
* `Location.StateCU.CropArea-AllCrops.Year~StateCU~PathToWSLReport` (for WSL report acreage)
* `Location.StateCU.WSL.Month~StateCU~PathToWSLReport` (for WSL report monthly WSL)
* `Location.StateCU.WSL.Year~StateCU~PathToWSLReport` (for WSL report yearly WSL)
* `Location.StateCU.WSL_Depth.Year~StateCU~PathToWSLReport` (for WSL report WSL depth)
* `Location.StateCU.DataType.Interval~StateCU~PathToFile` (historical time series data files)

StateCU files contain limited header information (e.g., period of record but no data type).
Time series properties are set using the following guidelines:

* For input files, the location part of the time series identifier is taken from the
identifier field in the data records (from the first year of data).
A change in the year indicates that all time series have been identified.
For output files, the location is identified by lines that start with an underscore
(this allows the StateCU interface to search for identifiers in output).
* The source part of the time series identifier is set to StateCU or blank.
* The data type may not be assigned because it is not defined in the file
(e.g., temperature and precipitation time series).
Currently no interpretation of the file name extension occurs.
Some specific applications may set the data type,
based on reading a StateCU data set response file (and therefore knowing the specific contents of the file).
* The data interval is assigned as Day, Month, or Year based on the file format (determined automatically).
* The scenario is typically not assigned.
* The input type part of the time series identifier is set to StateCU,
indicating the file format.
Software will use the interval and/or examine the file contents to
verify whether the data are in daily or monthly format.
* The input name part of the time series identifier is set to the file name,
either as the full path or a relative path to the working directory.
* The units are assigned to those indicated in the file header or based on the file type.
* The missing data value is assigned to -999.0.
* The description is set to the same value as the location.
A verbose description can typically be determined by cross-referencing the
identifier with another StateCU data file (e.g., CU Locations, `*.str`).
* The period is set based on the header information.
 
## Limitations ##

StateCU files have the following limitations:

* The formats of the files do not facilitate extracting one time series from the file.
Software has been optimized to perform this within current constraints.
* Some time series properties are not explicitly included in StateCU files (e.g., data type).
Therefore, general software like TSTool may not be able to provide default information.
For example, a graph may show multiple time series with nearly the same
legend text because more detailed information cannot be defaulted.
The following has not been implemented but may be in the future:  DDC file data type = IWR.
* Although the complete output report files contain all values needed to
evaluate water balance, these values are not available in files that can be easily read as time series.
Currently the verbose reports are not available for reading as part of the StateCU input type.
