# TSTool / Command / CheckFile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `CheckFile` command checks a file's statistic against criteria, for example:

* check that a file has non-zero size as output from a process
* check for lines matching a pattern as part of automated testing

Use the [`CompareFiles`](../CompareFiles/CompareFiles.md) command
if it is necessary to compare two files, for example size or modification time.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax
for statistic parameters.

**<p style="text-align: center;">
![CheckFile-Statistic](CheckFile-Statistic.png)
</p>**

**<p style="text-align: center;">
`CheckFile` Command Editor for Statistic Parameters (<a href="../CheckFile-Statistic.png">see also the full-size image</a>)
</p>**

The following parameters will output the check results to a table,
which can be further manipulated.

**<p style="text-align: center;">
![CheckFile-Output](CheckFile-Output.png)
</p>**

**<p style="text-align: center;">
`CheckFile` Command Editor for Output Parameters (<a href="../CheckFile-Output.png">see also the full-size image</a>)
</p>**

The following parameters indicate the check criteria.

**<p style="text-align: center;">
![CheckFile-Criteria](CheckFile-Criteria.png)
</p>**

**<p style="text-align: center;">
`CheckFile` Command Editor for Criteria and Action Parameters (<a href="../CheckFile-Criteria.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CheckFile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Tab** |**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------| -- |
| |`InputFile`<br>**required**|Name of the input file to process. | None - must be specified. |
| |`IfNotFound`  | Indicate an action if the input file is not found:<ul><li>`Ignore` - ignore the missing file and do not warn</li><li>`Warn` - generate a warning message</li><li>`Fail` - generate a failure message</li></ul>| `Warn` |
| ***Statistic***<br>**required** |`Statistic`|Statistic to compute.  See the table below. | None - must be specified. |
| |`SearchPattern`| A string to match if `Statistic` `=PatternMatchLineCount`.  Use `*` for wildcard.  Multiple patterns can be or'ed using syntax `*pattern1*|*pattern2*`. | |
| ***Output*** |`TableID`|Identifier for table that receives the statistic.|Optional – table output is not required.|
| |`TableFilenameColumn`|Table column name that is used to look up the file.  If a matching filename is not found, a row will be added to the table.  If a filenme is found, the statistic cell value for the file is modified.|Optional – table output is not required.|
| | `TableStatisticColumn`|Table column name to receive the statistic value.  If not found in the table, a new column is added automatically.|Optional – table output is not required.|
| ***Check Criteria and Actions*** |`CheckCriteria`|The criteria that is checked, one of:<ul><li>`InRange` – check for value >= `Value1` and <= `Value2`.</li><li>`OutOfRange` – check for value < `Value1` or > `Value2`.</li><li>`<` – check for values < `CheckValue1`.</li><li>`<=` – check for values <= `CheckValue1`.</li><li>`>` – check for values > `CheckValue1`.</li><li>`>=` – check for values >= `CheckValue1`.</li><li>`==` – check for values equal to `CheckValue1`.</li></ul>|None – must be specified.|
| |`CheckValue1`|A parameter that is used for specific `CheckCriteria` values.||
| |`CheckValue2`|A parameter that is used for specific `CheckCriteria` values, currently only needed for `InRange` and `OutOfRange` criteria.||
| |`ProblemType`|The problem type that will be shown in warning messages. |`Statistic-CheckCriteria`|
| |`IfCriteriaMet`|Indicate whether to set the command status if the statistic meets the criteria, one of:</li><li>`Ignore` – do not set the command status</li><li>`Warn` – set the command status to Warning</li><li>`Fail` – set the command status to `Failure`</li></ul>|The command status will not be changed.|
| |`PropertyName`|If the statistic meets the criteria, set the property identified by `PropertyName` to `PropertyValue`.|No property is set.|
| |`PropertyValue`|If the statistic meets the criteria, set the property identified by `PropertyName` to `PropertyValue`.|No property is set.|

The following statistics can be used for the `Statistic` command parameter.

**<p style="text-align: center;">
File Statitics
</p>**

| **Statistic** | **Description** |
| -- | -- |
| `FileSizeBytes` | File size in bytes. |
| `FileSizeLines` | File size as number of lines. |
| `PatternMatchLineCount` | The number of lines that contain a matching text pattern. |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/CheckFile).

## Troubleshooting ##

## See Also ##

* [`CheckTimeSeries`](../CheckTimeSeries/CheckTimeSeries.md) command
* [`CheckTimeSeriesStatistic`](../CheckTimeSeriesStatistic/CheckTimeSeriesStatistic.md) command
* [`CompareFiles`](../CompareFiles/CompareFiles.md) command
* [`CompareTables`](../CompareTables/CompareTables.md) command
