# TSTool / Command / SetPropertyFromTable #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `SetPropertyFromTable` command sets the value of properties used by the command processor,
using table data:

*   **Table cell value:**
    Filters are used to match one or more rows.  The first matched row is used to set the property.
*   **Number of rows:** Useful to check that results are as expected.
*   **Number of columns:** Useful to check that results are as expected.

The properties will be available to subsequent
commands that support using `${Property}` notation in parameters,
for example to dynamically specify time series identifiers or input to commands.
This command is useful in cases where iteration is processing data from a table using a
[`For`](../For/For.md) command, in which case the property can be used in other commands.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands(Table) / Running and Properties***

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![SetPropertyFromTable_cell](SetPropertyFromTable_cell.png)
</p>**

**<p style="text-align: center;">
`SetPropertyFromTable` Command Editor for Cell Parameters (<a href="../SetPropertyFromTable_cell.png">see also the full-size image</a>)
</p>**

**<p style="text-align: center;">
![SetPropertyFromTable_table](SetPropertyFromTable_table.png)
</p>**

**<p style="text-align: center;">
`SetPropertyFromTable` Command Editor for Table Row and Column Count  Parameters (<a href="../SetPropertyFromTable_table.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
SetPropertyFromTable(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Tab** | **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --| --------------|-----------------|----------------- |
|***All*** | `TableID`|The identifier for the table.  Can be specified using `${Property}`.|None – must be specified.|
|***Cell Property*** | `Column`|The name of the column containing the value that will be used to set the processor property.   Can be specified using `${Property}`.|None – must be specified.|
||`ColumnIncludeFilters`|Filters that include rows being matched, by matching column values:<br>`ColumnIncludeFilter1:FilterPattern1,ColumnIncludeFilter2:FilterPattern2`<br>Patterns can use `*` to indicate wildcards for matches.  Only string values can be checked (other data types are converted to strings for comparison).  All patterns must be matched to exclude the row.  Can be specified using `${Property}`.|All rows are matched.|
||`ColumnExcludeFilters`|Filters that exclude rows being copied, by matching column values:<br>`ColumnExcludeFilter1:FilterPattern1,ColumnExcludeFilter2:FilterPattern2`<br>Patterns can use `*` to indicate wildcards for matches.  Only string values can be checked (other data types are converted to strings for comparison).  All patterns must be matched to exclude the row.  Can be specified using `${Property}`.|All rows are matched.|
||`PropertyName`|The property name to be set.  Can be specified using `${Property}`.|None – must be specified.|
||`DefaultValue`|The default value to use if no table cell is matched:<br><ul><li>`Blank` – to use a blank string</li><li>`Null` – to use a null value</li><li>Specified value to set to a string value.</li></ul><br>Can be specified using `${Property}`.|Property is set to null.|
|***Table Property***|`RowCountProperty`| The name of the property to set to the table row count. | |
| |`ColumnCountProperty`| The name of the property to set to the table column count. | |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/SetPropertyFromTable).

The command shown in the editor dialog, used with the following table, will set `StringProp=“Abba”`

**<p style="text-align: center;">
![SetPropertyFromTable example](SetPropertyFromTable_example.png)
</p>**

**<p style="text-align: center;">
`SetPropertyFromTable` Example Table (<a href="../SetPropertyFromTable_example.png">see also the full-size image</a>)
</p>**

## Troubleshooting ##

## See Also ##

*   [`For`](../For/For.md) command
*   [`If`](../If/If.md) command
*   [`SetPropertyFromTimeSeries`](../SetPropertyFromTimeSeries/SetPropertyFromTimeSeries.md) command
*   [`SetTimeSeriesProperty`](../SetTimeSeriesProperty/SetTimeSeriesProperty.md) command
*   [`WritePropertiesToFile`](../WritePropertiesToFile/WritePropertiesToFile.md) command
