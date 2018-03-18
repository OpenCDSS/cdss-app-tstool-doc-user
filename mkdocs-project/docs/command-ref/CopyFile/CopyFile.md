# Learn TSTool / Command / CopyFile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `CopyFile` command copies a source file to a destination.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.
<a href="../CopyFile.png">See also the full-size image.</a>

![CopyFile](CopyFile.png)

**<p style="text-align: center;">
`CopyFile` Command Editor
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CopyFile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `InputFile` | The name of the source file to copy.  Can be specified using `${Property}`. | None - must be specified. |
| `OutputFile` | The name of the output file.  Can be specified using `${Property}`. | None - must be specified. |
| `IfInputNotFound` | Indicate an action if the source file is not found:  `Ignore` (ignore the missing file and do not warn), `Warn` (generate a warning message), `Fail` (generate a failure message) | `Warn` |

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/CopyFile).

## Troubleshooting ##

## See Also ##

* [RemoveFile](../RemoveFile/RemoveFile) command
