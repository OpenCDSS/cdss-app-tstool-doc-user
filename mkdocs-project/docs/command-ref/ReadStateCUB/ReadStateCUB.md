# TSTool / Command / ReadStateCUB #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `ReadStateCUB` command reads time series from a StateCU binary output time series file.
See the [StateCUB Input Type Appendix](../../datastore-ref/StateCUB/StateCUB.md).
The actual reading occurs as the commands are being processed.
For this reason and because the number of time series in the binary file is usually large,
if any other commands reference the StateCU binary file time series,
the time series identifiers must be specified manually or use wildcards in identifiers
(identifiers are not available to list in dialogs).
Only data types that contain floating point numbers are read.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Read Time Series***

The following dialog is used to edit the command and illustrates the syntax of the command.

**<p style="text-align: center;">
![ReadStateCUB command editor](ReadStateCUB.png)
</p>**

**<p style="text-align: center;">
`ReadStateCUB` Command Editor (<a href="../ReadStateCUB.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadStateCUB(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`InputFile`<br>**required**|The name of the StateCU binary time series file to read.  The path to the file can be absolute or relative to the working directory.  Can use `${Property}` notation. |None – must be specified.|
|`TSID`|Time series identifier pattern to filter the read.  Can use `${Property}` notation. |Read all time series. |
|`InputStart`|The starting date/time to read data, specified to Month precision.  Can use `${Property}` notation. |Read all data.|
|`InputEnd`|The ending date/time to read data, specified to Month precision.  Can use `${Property}` notation. |Read all data.|
|`OutputVersion`| The file format version to be used for output:<ul><li>`Original` - use the original format without translation</li><li>`Latest` - use the latest format (same as `14`)</li><li>`14` - use StateCU version 14 format</li></ul>  This allows translating one binary file's contents to a different version, which is useful for automated testing and ensuring that processes work the same regardless of the input format.  See the table below for details. | No translation occurs. |

The following table lists translations that occur if `OutputVersion` is used.

**<p style="text-align: center;">
`OutputVersion` Parameter Data Translations
</p>**

| **`OutputVersion`** | **Translations** |
| -- | -- |
| `14`<br>`Latest` | <ul><li>Location identifier `TO` is changed to `TOTAL`.</li></ul> |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/ReadStateCUB).

The following example command file illustrates how to read all CU Shortage time series:

```text
ReadStateCUB(InputFile="Data\farmers.BD1",TSID="*.*.CU Shortage.*.*")
```

The following example illustrates how to read all time series from a binary file with debug turned on to echo all information that is read.  

```text
StartLog(LogFile="commands.TSTool.log")
SetDebugLevel(LogFileLevel=1)
ReadStateCUB(InputFile="Data\farmers.BD1")
```

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`ReadStateCU`](../ReadStateCU/ReadStateCU.md) command
*   [`WriteStateCU`](../WriteStateCU/WriteStateCU.md) command
