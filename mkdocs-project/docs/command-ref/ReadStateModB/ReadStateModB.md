# TSTool / Command / ReadStateModB #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
    +   [`OutputVersion` Parameter Details](#outputversion-parameter-details)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `ReadStateModB` command reads time series from a StateMod binary output time series file.
See the [StateModB Input Type Appendix](../../datastore-ref/StateModB/StateModB.md).
The identifiers (or aliases) from the time series will be available as choices when editing other commands.
If this causes performance issues due to the large number of time series that may be read,
limit the time series that are read using the `TSID` parameter.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Read Time Series***

The following dialog is used to edit the command and illustrates the syntax of the command for
reading `Available_Flow` output parameter for all locations.

**<p style="text-align: center;">
![ReadStateModB](ReadStateModB.png)
</p>**

**<p style="text-align: center;">
`ReadStateModB` Command Editor when Matching a TSID Pattern (<a href="../ReadStateModB.png">see also the full-size image</a>)
</p>**

The following example illustrates how to specify multiple data types (parameters) to read,
in order to limit the number of time series that are read.

**<p style="text-align: center;">
![ReadStateModB-IncludeDataTypes](ReadStateModB-IncludeDataTypes.png)
</p>**

**<p style="text-align: center;">
`ReadStateModB-IncludeDataTypes` Command Editor when Matching Multiple Data Types (<a href="../ReadStateModB-IncludeDataTypes.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadStateModB(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`InputFile`<br>**required**|The name of the StateMod binary time series file to read, surrounded by double quotes.  The path to the file can be absolute or relative to the working directory.  Global property values can be inserted using the syntax `${PropertyName}`.|None – must be specified.|
|`TSID`|Time series identifier pattern to filter the read.  Use periods to indicate separate TSID parts and use * to match patterns within the parts. Can use `${Property}` syntax. |Read all time series.|
|`InputStart`|The starting date/time to read data, specified to Day or Month precision based on whether a daily or monthly model run.|Read all data.|
|`InputEnd`|The ending date/time to read data, specified to Day or Month precision based on whether a daily or monthly model run.|Read all data.|
|`IncludeDataTypes`| List of data types to incluce, separated by spaces.  This is checked after `TSID`. | Include all.|
|`ExcludeDataTypes`| List of data types to exclude, separated by spaces.  This is checked after `IncludeDataTypes`. | Exclude none. |
|`Version`|StateMod version number for the binary file using the form `NN.NN` (padded with leading zero for version 9) corresponding to the file, necessary because the file version number (and consequently parameters) cannot be automatically detected in older versions.  Changes in binary file format occurred with version 9.01 and 9.69, mainly to add new data types.  The StateMod file version for version 11+ is automatically detected.|Detect from the file if possible.|
| `OutputVersion` | StateMod version that should be used for output, used when reading an old binary file but want to appear as if the file were a newer version.  This is used to overcome issues in binary files and allow automated testing to match time series for comparison.  See the details in the following table.  The parameter value can be:<ul><li>`Latest` - try to transform the binary file time series into current format</li><li>`Original` - use the original binary file format without transformation</li></ul> | `Original` |
|`Alias`|The alias to assign to the time series that are read.  Use the format choices and other characters to define a unique alias.|No alias is assigned.|
|`IfFileNotFound`  | Indicate an action if the input file is not found:<ul><li>`Ignore` - ignore the missing file and do not warn</li><li>`Warn` - generate a warning message</li><li>`Fail` - generate a failure message</li></ul> | `Warn` |

### `OutputVersion` Parameter Details ###

The following transformations occur if `OutputVersion=Latest` is used.

**<p style="text-align: center;">
`OutputVersion` Transformations
</p>**

| **Original Content** | **TransformedContent** |
| -- | -- |
| Duplicate `Total_Release` parameter in Fortran parameter position 20. | Change to `River_Release`. |
| Duplicate `Total_Supply` parameter in Fortran parameter position 21. | Change to `River_Divert`. |

Additional transformations may be necessary (or possible) but have not been implemented pending clarification
of the technical approach.

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/ReadStateModB).

The following example command file illustrates how to read all `Available_Flow`
time series for identifiers starting with `44` (e.g., to extract all such time series for a water district):

```text
ReadStateModB(InputFile="..\StateMod\ym2002b.b43",TSID="44*.*.Available_Flow.*")
```

The following example illustrates how to read all time series from a binary file
that was created with StateMod version 9.53.
As shown in the example, debug can be turned on for the log file to evaluate issues with the file format.  

```text
StartLog(LogFile="commands.TSTool.log")
SetDebugLevel(0,1)
ReadStateModB(InputFile="COLOFB.B43",Version="09.53")
```

## Troubleshooting ##

## See Also ##

*   [`ReadStateMod`](../ReadStateMod/ReadStateMod.md) command
*   [`WriteStateMod`](../WriteStateMod/WriteStateMod.md) command
