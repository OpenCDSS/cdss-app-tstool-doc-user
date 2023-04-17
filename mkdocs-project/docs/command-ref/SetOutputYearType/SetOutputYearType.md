# TSTool / Command / SetOutputYearType #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `SetOutputYearType` command sets the global output year type for output reports and files.
The default for most operations is calendar year (January through December);
however, alternate year definitions may be useful.

The global output year type is recognized by some common tools and commands that create output.
Some write commands also allow the year type to be specified for the command.
Output year type choices are not consistently enabled for all commands due to the effort to
create automated tests, and functionality is being phased in over time.
Some commands support more output year types than this command.
Refer to specific command documentation to see how the output year type is handled for those commands.

Internally, all data are managed using calendar years and are converted to different year types during output or display.
The [`ChangeInterval`](../ChangeInterval/ChangeInterval.md) command also allows
time series to be converted to annual values where the value corresponds to a year type.
See also the [Statistic Examples](../../examples/examples.md#statistic-examples) documentation
for commands that create time series with different year types.

The year type for output and analysis can be defined differently than calendar year.
Internally, TSTool allows the start and end year to have offsets from the calendar year.
This allows the output year type to have a starting year previous to the calendar year or the same as the calendar year.

TSTool originally supported only `Calendar` and `WaterYear` (October 1 to September 30) year types
because of conventions used with hydrologic data.
However, over time, additional year types have been added.
To generically handle year types going forward, the following convention is being phased in:

*   Year types where the ending date is the year:
    +   For example, `OctToSepYear` means that the year starts October 1 and ends September 30
        and that the year corresponds to the ending date.
*   Year types where the starting date is the year:
    +   For example, `YearOctToSep` means that the year starts October 1 and ends September 30
        and that the year corresponds to the starting date.
*   Custom year types:
    +   Some analyses may require even more granular definition of year type,
        for example April 15 to August 15.
    +   Currently this is not supported in a year type definition but can be handled
        by using a time series with year interval and analysis window within the year,
        for example as created by the [`NewStatisticYearTS`](../NewStatisticYearTS/NewStatisticYearTS.md) command.
    +   The time series identifier data type or scenario and/or alias can reflect the special year type, if necessary.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Output Time Series***

The following dialog is used to edit this command and illustrates the syntax of the command.
Note that the output period should always use calendar month and year,
even if other than calendar year are used for output (see [`SetOutputYearType`](../SetOutputYearType/SetOutputYearType.md)).

**<p style="text-align: center;">
![SetOutputYearType command editor](SetOutputYearType.png)
</p>**

**<p style="text-align: center;">
`SetOutputYearType` Command Editor (<a href="../SetOutputYearType.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
SetOutputYearType(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`OutputYearType`|The output year type, one of:<ul><li>`Calendar` – January through December.</li><li>`NovToOct` – November of the previous calendar year to October of the current calendar year.  For example, year 1970 spans Nov 1969 to Oct 1970.</li><li>`Water` – October of the previous calendar year through September of the current calendar year (and water year).  For example, water year 1970 spans Oct 1969 to Sep 1970.</li></ul><br>In the future, more generic types like `NovToOctYear` may be implemented.|If this command is not specified, `Calendar` is the default.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/SetOutputYearType).

A sample command file example is as follows:

```
SetOutputYearType(OutputYearType=Calendar)
```

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`ChangeInterval`](../ChangeInterval/ChangeInterval.md) command
*   [`SetInputPeriod`](../SetInputPeriod/SetInputPeriod.md) command
*   [`SetOutputPeriod`](../SetOutputPeriod/SetOutputPeriod.md) command
