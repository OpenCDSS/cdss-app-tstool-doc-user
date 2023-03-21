# TSTool / Command / ReadTableFromDBF #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `ReadTableFromDBF` command reads a table from a dBASE file,
such as the files used with Esri GIS shapefiles.
dBASE files are self-contained binary database files.

Handling of dBASE files is limited and support for newer features may not be included.
An attempt is made to properly convert dBASE internal data representations to appropriate equivalents.
Use available command parameters to convert default column data types to other types.
For example, integers may be represented in the DBF file as a number with zero precision (digits after decimal)
and may need to be converted to integer type.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands(Table) / Read Table***

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![ReadTableFromDBF](ReadTableFromDBF.png)
</p>**

**<p style="text-align: center;">
`ReadTableFromDBF` Command Editor (<a href="../ReadTableFromDBF.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadTableFromDBF(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`TableID`<br>**required**|Identifier to assign to the table that is read, which allows the table data to be used with other commands.  Can be specified with `${Property}.`|None – must be specified.|
|`InputFile`<br>**required**|The name of the file to read, as an absolute path or relative to the command file location.  Can be specified with `${Property}`.|None – must be specified.|
|`DoubleColumns`|Name(s) of columns that should be converted to double data type, separated by commas.  Column names can contain `*` as a wildcard and can be specified with `${Property}`.||
|`IntegerColumns`|Name(s) of columns that should be converted to integer data type, separated by commas.  Column names can contain `*` as a wildcard and can be specified with `${Property}`.||
|`TextColumns`|Name(s) of columns that should be converted to text data type, separated by commas.  Column names can contain `*` as a wildcard and can be specified with `${Property}`.||
|`Top`|If specified, the top number of rows specified by the parameter will be read.|Return all data.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/ReadTableFromDBF).

## Troubleshooting ##

## See Also ##

*   [`WriteTableToDelimitedFile`](../WriteTableToDelimitedFile/WriteTableToDelimitedFile.md) command
