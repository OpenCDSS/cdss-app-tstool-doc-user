# Learn TSTool / Command / DeleteTableColumns #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `DeleteTableColumns` deletes specified columns from a table.

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax of the command.
<a href="../DeleteTableColumns.png">See also the full-size image.</a>

![DeleteTableColumns](DeleteTableColumns.png)

**<p style="text-align: center;">
`DeleteTableColumns` Command Editor
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
DeleteTableColumns(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`TableID`<br>**required**|The table identifier for the table to process. Can specify with `${Property}`.|None - must be specified.|
|`DeleteRowNumbers`<br>**required**|The names of columns to delete, separated by commas. Can use `${Property}` to specify column names.|None - must be specified.|

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/DeleteTableColumns).

A simple comma-separated-value data as follows can be read with [`ReadTableFromDelimitedFile`](../ReadTableFromDelimitedFile/ReadTableFromDelimitedFile):

```
# Simple table for testing
"string1","double1","integer1"
"String1",1.0,1
"String2",2.0,2
"String3",3.0,3
```

The command file to read the above file and remove the first and last two columns is as follows:

```
ReadTableFromDelimitedFile(TableID="Table1",InputFile="testtable.csv")
DeleteTableColumns(TableID="Table1",DeleteColumns="double1,integer1")

```

## Troubleshooting ##

## See Also ##

* [DeleteTableRows](../DeleteTableRows/DeleteTableRows) command
* [ReadTableFromDelimitedFile](../ReadTableFromDelimitedFile/ReadTableFromDelimitedFile) command
