# TSTool / Command / CreateFolder #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `CreateFolder` command creates a folder (directory).

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![CreateFolder](CreateFolder.png)
</p>**

**<p style="text-align: center;">
`CreateFolder` Command Editor (<a href="../CreateFolder.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CreateFolder(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `Folder`<br>**required** | The name of the folder to create, typically a path relative to the command file.  Can be specified using `${Property}`. | None - must be specified. |
| `CreateParentFolders` | Indicate whether to create parent folders if they do not exist:<ul><li>`False` - do not create parent folders, generate a warning</li><li>`True` - create parent folders if they do not exist</li></ul> | `False` |
| `IfFolderExists` | Indicate an action if the folder exists:<ul><li>`Ignore` - ignore and do not warn</li><li>`Warn` - generate a warning message</li><li>`Fail` - generate a failure message</li></ul> | `Warn` |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/regression/commands/general/CreateFolder).

## Troubleshooting ##

## See Also ##

* [`CopyFile`](../CopyFile/CopyFile.md) command
* [`RemoveFile`](../RemoveFile/RemoveFile.md) command
