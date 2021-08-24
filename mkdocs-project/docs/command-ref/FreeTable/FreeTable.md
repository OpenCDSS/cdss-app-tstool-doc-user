# TSTool / Command / FreeTable #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `FreeTable` command frees a table.
The table will not be available for subsequent commands,
although a new table with the same name can be created and used with subsequent commands.
This command is useful, for example, when looping through blocks of commands where logic is repeated and the table contents are recreated.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![FreeTable](FreeTable.png)
</p>**

**<p style="text-align: center;">
`FreeTable` Command Editor (<a href="../FreeTable.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
FreeTable(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`TableID`<br>**required**|The identifier for the original table.  Can be specified using ${Property} syntax.|None – must be specified.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/FreeTable).

## Troubleshooting ##

## See Also ##

* [`NewTable`](../NewTable/NewTable.md) command
