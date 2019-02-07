# TSTool / Command / ReadColoradoHydroBaseRest #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadColoradoHydroBaseRest` command reads one or more time series from the Colorado HydroBase REST web services
(see the [ColoradoHydroBaseRest Datastore Appendix](../../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)).
It is designed to utilize query criteria to process large numbers of time series,
for example for a specific water district and data type.

The ***Data type***, ***Data interval***, and ***Where*** command parameters and input fields
are similar to those from the main TSTool interface.
However, whereas the main TSTool interface first requires a query to find the
matching time series list and then an interactive select for specific time series identifiers,
the `ReadColoradoHydroBaseRest` command reads the time series list and the corresponding data for the time series.
This can greatly shorten command files and simplify command logic, especially when processing many time series.
However, because the command can process many time series and web services are impacted by network speed,
running the command can take awhile to complete.

Data for the location (station, structure, well, etc.) and time series metadata,
as shown in the main TSTool interface, are set as time series properties, using web service data values.
These properties can be transferred to a table with the
[`CopyTimeSeriesPropertiesToTable`](../CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md)
command and processed further with other table commands.

Time series corresponding to diversion records,
which also include observations for reservoirs and wells, are handled as follows:

1. Daily diversion (`DivTotal` and `WaterClass`) and reservoir release (`RelTotal` and `WaterClass`)
time series have their values automatically carried forward to fill
data within irrigation years (November to October).
Web services only return daily diversion record data when non-zero
observations or non-zero filled values occur in a month.
Therefore, this filling action should only provide additional zero values
in an irrigation year where a diversion or release was recorded.
Irrigation years with no observations remain as missing after the read.
2. Daily, monthly, and yearly diversion and reservoir release time series
optionally can be filled by the `ReadColoradoHydroBaseRest` command using diversion comments,
which indicate when irritation years should be treated as missing.
See the `FillUsingDivComments` parameter below.
Note that diversion comments should not conflict with more detailed records and provide additional information.
3. It also may be appropriate to use infrequent data types.
However, because such values typically are annual values,
additional decisions must be made for how to distribute the values to monthly and daily time series.
These data, if available, are not automatically folded into the diversion records by TSTool.
4. See the [`FillHistMonthAverage`](../FillHistMonthAverage/FillHistMonthAverage.md),
[`FillPattern`](../FillPattern/FillPattern.md), and other commands,
which can be used to fill (estimate) values in data gaps after the initial time series are read.  

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax for the command.
Two options are available for matching time series, based on historical software requirements.
The following example illustrates how to read a single time series by specifying the time series identifier.
This approach is essentially equivalent to using the
[`ReadTimeSeries`](../ReadTimeSeries/ReadTimeSeries.md) command but offers parameters specific to HydroBase web services.

![ReadColoradoHydroBaseRest TSID](ReadColoradoHydroBaseRest_TSID.png)

**<p style="text-align: center;">
`ReadColoradoHydroBaseRest` Command Editor to Read a Single Time Series (<a href="../ReadColoradoHydroBaseRest_TSID.png">see also the full-size image)</a>
</p>**

The following figure illustrates how to query multiple time series.

![ReadColoradoHydroBase Multiple](ReadColoradoHydroBaseRest_Multiple.png)

**<p style="text-align: center;">
`ReadColoradoHydroBaseRest` Command Editor to Read Multiple Time Series (<a href="../ReadColoradoHydroBaseRest_Multiple.png">see also the full-size image)</a>
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadColoradoHydroBaseRest(Parameter="Value",...)
```

**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`DataStore`|The ColoradoHydroBaseRest datastore name to use for the database connection, as per datastore configuration files (see the [ColoradoHydroBaseRest Datastore appendix](../../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest)).  When using this approach the TSID will end in `~ColoradoHydroBaseRest`.|
|`DataType`<br>**required**|The data type to be queried, as documented in the [ColoradoHydroBaseRest Datastore appendix](../../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md).|None – must be specified.|
|`Interval`<br>**required**|The data interval for the time series, as documented in the [ColoradoHydroBaseRest Datastore appendix](../../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) (e.g. `Day`, `Month`, `Year`), consistent with the `DataType` selection.|None – must be specified.|
|`TSID`|When reading a single time series, the time series identifier to read.  If specified, this parameter will override the `WhereN` parameters.|Use `WhereN` parameters to read multiple time series.|
|`WhereN`|When reading 1+ time series, the “where” clauses to be applied.  The filters match the values in the Where fields in the command editor dialog and the TSTool main interface.  The parameters should be named `Where1`, `Where2`, etc., with a gap resulting in the remaining items being ignored.  The format of each value is:<br>`Item;Operator;Value`<br>Where `Item` indicates a data field to be filtered on, `Operator` is the type of constraint, and `Value` is the value to be checked when querying.|If not specified, the query will not be limited and very large numbers of time series may be queried.|
|`Alias`<br>|The alias to assign to the time series, as a literal string or using the special formatting characters listed by the command editor.  The alias is a short identifier used by other commands to locate time series for processing, as an alternative to the time series identifier (`TSID`).|None – alias not assigned.|
|`InputStart`|Start of the period to query, specified as a date/time with a precision that matches the requested data interval.|Read all available data.|
|`InputEnd`|End of the period to query, specified as a date/time with a precision that matches the requested data interval.|Read all available data.|
|`FillUsingDivComments`|Indicate whether to fill diversion and reservoir release time series using diversion comments.|`True`|
|`FillUsingDivCommentsFlag`|Data flag set when values are filled using diversion comments.  The flag can then be used later to label graphs, etc.  The flag will be appended to existing flags if necessary.|Value from "not in use" flag in data.|
|`IfMissing`|Indicate the action to be taken if the requested time series is missing, one of:<ul><li>`Ignore` – ignore the time series (do not warn and the time series will not be available)</li><li>`Warn` – generate a failure for the command</li></ul>|`Warn`|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/regression/commands/general/ReadColoradoHydroBaseRest).

A sample command file is as follows (read all water class time series for structure 0300905):

```text
ReadColoradoHydroBaseRest(DataType="WaterClass",Interval="Month",Where1="StructureWDID;Matches;0300905")
```

## Troubleshooting ##

## See Also ##

* [`CopyTimeSeriesPropertiesToTable`](../CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md) command
* [`ReadTimeSeries`](../ReadTimeSeries/ReadTimeSeries.md) command
