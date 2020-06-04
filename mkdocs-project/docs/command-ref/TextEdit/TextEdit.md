# TSTool / Command / TextEdit #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `TextEdit` command edits a text file,
currently providing simple search and replace for literal strings.

In the future this command may be enhanced to add the following features:

* edit a property
* allow multiple operations in one command

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![TextEdit](TextEdit.png)
</p>**

**<p style="text-align: center;">
`TextEdit` Command Editor (<a href="../TextEdit.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
TextEdit(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `InputFile`<br>**required** | The name of the input file.  Can be specified using `${Property}`. | None - must be specified. |
| `SearchFor`<br>**required** | The literal string to search for in the input file.  Can be specified using `${Property}`. | None - must be specified. |
| `ReplaceWith`<br>**required** | The literal string to use for the replacement string in the output file.  Can be specified using `${Property}`.<br>Use the syntax `\$\{Property}` to insert property notation in the output file. | None - must be specified. |
| `OutputFile`<br>**required** | The name of the output file.  Can be specified using `${Property}`. | None - must be specified. |
| `IfInputNotFound` | Indicate an action if the source file is not found:  `Ignore` (ignore the missing file and do not warn), `Warn` (generate a warning message), `Fail` (generate a failure message) | `Warn` |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/regression/commands/general/TextEdit).

## Troubleshooting ##

## See Also ##

* [`AppendFile`](../AppendFile/AppendFile.md) command
* [`CopyFile`](../CopyFile/CopyFile.md) command
* [`RemoveFile`](../RemoveFile/RemoveFile.md) command
