# TSTool / Command / CompareFiles #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#See Also)

-------------------------

## Overview ##

The `CompareFiles` command compares text files to determine differences.
For example, the command can be used to compare old and new files produced by a software process.
This command is suitable for comparing files that are similar,
but is not suitable for comparing files that are very different,
although it may be enhanced in the future to provide more sophisticated comparison features.

Each line in the file is compared.
By default, lines beginning with `#` are treated as comment lines and are ignored
(see the `CommentLineChar` parameter to specify the comment indicator).
Therefore, only non-comment lines are compared.
Comment lines in the middle of the file are simply discarded.
Differences and simple statistics are printed to the log file.
A warning can be generated if a difference is detected or if no differences are detected
(see also the [`CompareTimeSeries`](../CompareTimeSeries/CompareTimeSeries.md) and [`CompareTables`](../CompareTables/CompareTables.md) commands).

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax for the command.
If the `DiffProgram` property has been defined in the TSTool configuration file and both files exist,
the ***View Diff*** button will be enabled to display a visual difference.
The KDiff3 software is one option for a visual difference program.

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![CompareFiles](CompareFiles.png)
</p>**

**<p style="text-align: center;">
`CompareFiles` Command Editor for Comparing Contents (<a href="../CompareFiles.png">see also the full-size image</a>)
</p>**

**<p style="text-align: center;">
![CompareFiles-Properties](CompareFiles-Properties.png)
</p>**

**<p style="text-align: center;">
`CompareFiles` Command Editor for Comparing File Properties (<a href="../CompareFiles-Properties.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CompareFiles(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Tab** | **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- | -- |
| | `InputFile1`<br>**required** | The name of the first file to read for comparison.  Can be specified using `${Property}`. | None - must be specified. |
| | `InputFile2`<br>**required** | The name of the second file to read for comparison.  Can be specified using `${Property}`. | None - must be specified. |
| ***Compare File Contents*** | `InputFile1`<br>**required** | The name of the first file to read for comparison.  Can be specified using `${Property}`. | None - must be specified. |
| | `CommentLineChar` | The character(s) that if found at the start of a line indicate comment lines. Comment lines are ignored in the comparison because they typically may include information such as date/time that changes even if the remainder of the file contents is the same. | `#` |
| | `MatchCase` | If `True`, lines must match exactly.  If `False`, case is ignored for the comparison. | `True` |
| | `ExcludeText` | Specify one or more patterns using `*` for wildcard and separated by commas.  The syntax `*abc*|*xyz*` is also supported for or'ed patterns. If any patterns are matched, exclude the text line from the comparison. | Include all lines. |
| | `IgnoreWhitespace` | If `True`, then each line is trimmed to remove leading and trailing whitespace characters (spaces, tabs, etc.) before doing the comparison.  If `False`, then whitespace is retained for the comparison. | `False` |
| | `AllowedDiff` | The number of lines allowed to be different, when checking for differences.  This is useful, for example, when a non-comment line contains the date/time when the file was generated, and other dynamic data. | `0` |
| | `IfDifferent` | Indicate the action if the source files are different:  `Ignore` (ignore differences and do not warn), `Warn` (generate a warning message), `Fail` (generate a failure message) | `Ignore` |
| | `IfSame` | Indicate the action if the source files are the same:  `Ignore` (ignore if same and do not warn), `Warn` (generate a warning message), `Fail` (generate a failure message) | `Ignore` |
| ***Compare File Properties*** | `FileProperty` | File property to compare:<ul><li>`ModificationTime` - file modification time</li><li>`Size` - file size in bytes</li></ul> | |
| | `FilePropertyOperator` | Operator for comparison, such as Property (for file 1) > Property (for file 2). | |
| | `FilePropertyAction` | Action to take if the file property check is true:<ul><li>`Warn` - create a warning message</li><li>`Fail` - create a failure message</li></ul> | |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/CompareFiles).

## Troubleshooting ##

## See Also ##

* [`CompareTables`](../CompareTables/CompareTables.md) command
* [`CompareTimeSeries`](../CompareTimeSeries/CompareTimeSeries.md) command
