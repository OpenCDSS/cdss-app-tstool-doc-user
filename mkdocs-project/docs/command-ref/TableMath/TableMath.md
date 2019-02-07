# TSTool / Command / TableMath #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `TableMath` command performs a simple math operation on columns in a table.
Although the design of the command could support more advanced cell range addressing schemes,
it currently processes complete columns of data.
For example, a table that is populated by the [`CalculateTimeSeriesStatistic`](../CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic.md)
command can be manipulated to produce a new column of data.
This command and related table commands are not an attempt to replace full-feature spreadsheet
programs but are intended to help automate common data processing tasks.

The input is specified by a table column name (`Input1`) and either a second input
column name or a constant value (`Input2`), with the result being placed in the output column (`Output`).
The `ToInteger` operator requires only one input value.
Output that cannot be computed is set to the `NonValue` value.
Inputs can be any combination of double precision and integer values.

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax of the
command (in this case illustrating how values in a column named `ts1` are added to the number `.1111.`

![TableMath](TableMath.png)

**<p style="text-align: center;">
`TableMath` Command Editor (<a href="../TableMath.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
TableMath(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`TableID`|The identifier for the table to process.|None – must be specified.|
|`Input1`|First input column name.|None – must be specified.|
|`Operator`|The operator to be applied as follows:<br>`Input1 Operator Input2 = Output`<br>For example: `Input1 * Input2 = Output`|None – must be specified.|
|`Input2`|Second input column name, or a constant value to use as input.|Required for some operators.  Not required for `ToInteger`.|
|`Output`|Output column name.  If the column is not found it will be added to the table and will contain the results of processing.|None – must be specified.|
|`NonValue`|The value to use in cases where an output result could not be computed (missing input, division by zero).  Null will result in blanks in output whereas NaN may be shown in some output products, depending on the specifications for the format.|Null|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/regression/commands/general/TableMath).

## Troubleshooting ##

## See Also ##

* [`CalculateTimeSeriesStatistic`](../CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic.md) command
* [`FormatTableDateTime`](../FormatTableDateTime/FormatTableDateTime.md) command
* [`FormatTableString`](../FormatTableString/FormatTableString.md) command
* [`ManipulateTableString`](../ManipulateTableString/ManipulateTableString.md) command
