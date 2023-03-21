# TSTool / Command / SortTable #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `SortTable` command sorts rows in a table by sorting the values in one or more columns.
The column(s) to be sorted can be of type string, integer, double, float, or date/time.
Strings are sorted by ignoring case.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands(Table) / Manipulate Table Values***

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![SortTable](SortTable.png)
</p>**

**<p style="text-align: center;">
`SortTable` Command Editor (<a href="../SortTable.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
SortTable(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`TableID`|The identifier for the table.  Can be specified using processor `${Property}`.|None – must be specified.|
|`SortColumns`|The names of columns to sort, separated by commas.  One or more columns can be sorted.|None – must be specified.|
|`SortOrder`|The sort order for columns specified by `SortColumns`, using the syntax:<br>`SortColumn1:Ascending,SortColumn2:Descending`<br>As indicated in the above example, the sort order must be specified as one of the following:<ul><li>`Ascending`</li><li>`Descending`</li></ul>|`Ascending`|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/SortTable).

## Troubleshooting ##

## See Also ##

*   [`NewTable`](../NewTable/NewTable.md) command
