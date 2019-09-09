# TSTool / Command / ReadColoradoHydroBaseRest #

* [Overview](#overview)
	+ [Diversion Records](#diversion-records)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadColoradoHydroBaseRest` command reads one or more time series from the Colorado HydroBase REST web services
(see the [ColoradoHydroBaseRest Datastore Appendix](../../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)).
It is designed to utilize web service query criteria to process large numbers of time series,
for example for a specific water district and data type.
The default parameter values match the results of TSID for the datastore.
Web service queries have slower performance than local database queries used with
[HydroBase database](../../datastore-ref/CO-HydroBase/CO-HydroBase.md),
but do not require local database installation and configuration.

The ***Data type***, ***Data interval***, and ***Where*** command parameters and input fields
are similar to those in the main TSTool interface.
However, whereas the main TSTool interface first requires a query to find the
matching time series list and interactive select to copy specific time series identifiers into the ***Commands*** area,
the `ReadColoradoHydroBaseRest` command reads the time series list and the corresponding data for the time series.
This can greatly shorten command files and simplify command logic, especially when processing many time series.
However, because the command can process many time series and web services are impacted by network speed,
running the command can take awhile to complete.

Data for the location (station, structure, well, etc.) and time series metadata,
as shown in the main TSTool interface, are set as time series properties, using web service data values.
These properties can be transferred to a table with the
[`CopyTimeSeriesPropertiesToTable`](../CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md)
command and processed further with other table commands.

### Diversion Records ###

Time series corresponding to diversion records,
which include observations for ditches, reservoirs, wells, and other "structures", are handled as described below.
Note that reading diversion records with TSTool will provide additional zero data values compared
to directly querying web services on the State of Colorado's website,
due to TSTool's default value for `FillDivRecordsCarryForward` command parameter.
TSTool's behavior is consistent with traditional engineering use of the data.

**Note also that daily diversion records read from HydroBase database
may have more zeros than data read from web services.
This is because the HydroBase `vw_CDSS_DailyAmt` and `vw_CDSS_DailyWC` views often provide
zero values where data may have been missing, due to how the view is created.
These values typically are zero and have no observation code (obseration code is used for the data value flag in TSTool).
This design approach is being evaluated and in the future HydroBase may be distributed with fewer zero values,
in which case the fill carry forward default algorithm in TSTool should fill many of those zeros,
especially at the start of the irrigation year.**

1. In general, diversion record values correspond to observations and estimates determined by
the State of Colorado and other entities.
The accuracy of values is higher for well-maintained measuring devices and
lower (less accurate and possibly unverified) for third-party data submission.
Diversion records are stored in various forms including daily diversion records and infrequent measurements.
For example, long-term daily records may be available at large diversion structures
whereas other structures may have infrequent data records and/or annual diversion comments.
Records for smaller interval (e.g., day) are accumulated to larger interval (month and year).
The HydroBase observations available in diversion records can be further processed to provide additional
data values, as described below.
The WaterClass web service indicates `availableIntervals` for diversion records and
those with only monthly or annual measurements indicate "infrequent" measurements.
Diversion record observations have `measInterval` that indicates whether the value was
derived from daily, monthly, or annual data,
with monthly and annual indicating infrequent measurements.
Diversion records consist of date, value, and flag (observation code), which can be viewed in TSTool.
2. If `FillDivRecordsCarryForward=True` (the default),
daily total diversion (`DivTotal`), daily total reservoir release (`RelTotal`),
and daily `WaterClass` time series have their values carried forward to fill additional zero
data values within irrigation years (November to October).
The Division of Water Resources does implement some data filling by carrying forward non-zero daily values,
indicated with corresponding data flags.
In practice, it is common to interpret diversion records by filling in additional zeros and TSTool automates this approach.
This technique has been used when processing data for CDSS modeling.
Web services by default only return HydroBase diversion record data for observations without additional zero-filling.
Therefore, this filling action should only provide additional zero values
in an irrigation year where a diversion or release was recorded sometime in the year.
Irrigation years with no observations remain as missing after the read.
**The default behavior is the same as the [`ReadHydroBase`](../ReadHydroBase/ReadHydroBase.md) command.**
3.  If `FillUsingDivComments=True`, daily, monthly, and yearly `DivTotal`, `RelTotal`, and `WaterClass` time series
are filled using annual irrigation year (November-October) diversion comments,
which indicate when irritation years should be treated as additional zero values.
Diversion comments provide additional information but may not always be consistent with diversion records.
For example, diversion comments may indicate that a structure did not divert water in a year whereas
daily and monthly records show diversions in all or some months.
The separate [`FillUsingDiversionComments`](../FillUsingDiversionComments/FillUsingDiversionComments.md) command also
is available for filling but may be phased out in the future.
4. See the [`FillHistMonthAverage`](../FillHistMonthAverage/FillHistMonthAverage.md),
[`FillPattern`](../FillPattern/FillPattern.md), and other commands,
which can be used to fill (estimate) values in data gaps after the initial time series are read.  

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax for the command.
Two options are available for matching time series, based on historical software requirements.
The following example illustrates how to read a single time series by specifying the time series identifier.
This approach is essentially equivalent to using the
[`ReadTimeSeries`](../ReadTimeSeries/ReadTimeSeries.md) command but offers parameters specific to HydroBase web services.
Specifying a TSID can be used for simple data types such as `DivTotal` where the data type matches one time series.
The `WaterClass` data type can match multiple time series and therefore requires that the `WaterClass`
parameter is specified if a single time series should be matched.

**<p style="text-align: center;">
![ReadColoradoHydroBaseRest TSID](ReadColoradoHydroBaseRest_TSID.png)
</p>**

**<p style="text-align: center;">
`ReadColoradoHydroBaseRest` Command Editor to Read a Single Time Series (<a href="../ReadColoradoHydroBaseRest_TSID.png">see also the full-size image)</a>
</p>**

The following figure illustrates how to query multiple time series,
in this case all available water class time series for the specified structure WDID.

**<p style="text-align: center;">
![ReadColoradoHydroBase Multiple](ReadColoradoHydroBaseRest_Multiple.png)
</p>**

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

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`DataStore`<br>**required**|The ColoradoHydroBaseRest datastore name to use for the database connection, as per datastore configuration files (see the [ColoradoHydroBaseRest Datastore appendix](../../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)).  When using this approach the TSID will end in `~ColoradoHydroBaseRest`.| None - must be specified. |
|`DataType`<br>**required**|The data type to be queried, as documented in the [ColoradoHydroBaseRest Datastore appendix](../../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md).|None – must be specified.|
|`WaterClass`|The water class if only a single water class should be returned, used when `DataType=WaterClass`.  Specify as the full string including leading WDID as returned when querying all water classes, for example:  `0300909 S:2 F:0303732 U:Q T:7 G: To:`. | All matching water classes. |
|`Interval`<br>**required**|The data interval for the time series, as documented in the [ColoradoHydroBaseRest Datastore appendix](../../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) (e.g. `Day`, `Month`, `Year`), consistent with the `DataType` selection.|None – must be specified.|
|`TSID`|When reading a single time series, the time series identifier to read.  If specified, this parameter will override the `WhereN` parameters.|Use `WhereN` parameters to read multiple time series.|
|`WhereN`|When reading 1+ time series, the “where” clauses to be applied.  The filters match the values in the Where fields in the command editor dialog and the TSTool main interface.  The parameters should be named `Where1`, `Where2`, etc., with a gap resulting in the remaining items being ignored.  The format of each value is:<br>`Item;Operator;Value`<br>Where `Item` indicates a data field to be filtered on, `Operator` is the type of constraint, and `Value` is the value to be checked when querying.|If not specified, the query will not be limited and very large numbers of time series may be queried.|
|`Alias`<br>|The alias to assign to the time series, as a literal string or using the special formatting characters listed by the command editor.  The alias is a short identifier used by other commands to locate time series for processing, as an alternative to the time series identifier (`TSID`).|None – alias not assigned.|
|`InputStart`|Start of the period to query, specified as a date/time with a precision that matches the requested data interval.|Read all available data.|
|`InputEnd`|End of the period to query, specified as a date/time with a precision that matches the requested data interval.|Read all available data.|
|`FillDivRecordsCarryForward`|Indicate whether to fill daily `DivTotal`, `RelTotal`, and `WaterClass` time series using carry forward approach:<ul><li>Irrigation years (November to October) to fill must have at least one value.</li><li>Missing values at the beginning of the irrigation year (November-October) will be filled with zero until the first value is encountered.</li><li>Missing values within the year are filled by carrying forward the last observation - **only zero value is carried forward.**.</li><li>Missing values at the end of the year are carried forward, using the last observed value - **only zero value is carried forward.**.</li><li>Filled values are flagged with the `FillDivRecordsCarryForwardFlag` value.|`True`|
|`FillDivRecordsCarryForwardFlag`|Data flag set when values are filled if `FillDivRecordsCarryForward=True` .  The flag can then be used later to label graphs, etc.| `c` |
|`FillUsingDivComments`|Indicate whether to fill `DivTotal`, `RelTotal`, and `WaterClass` time series using diversion comments.  The parameter can be used for day, month, and year interval data.  Additional zeros will result for irrigation years (November-October) where the diversion comment indicates that water was not taken. |`False`|
|`FillUsingDivCommentsFlag`|Data flag set when values are filled if `FillUsingDivComments=True`.  The flag can then be used later to label graphs, etc.  The flag will be appended to existing flags if necessary.|Value from `notUsed` flag in data.|
|`IfMissing`|Indicate the action to be taken if the requested time series is missing, one of:<ul><li>`Ignore` – ignore the time series (do not warn and the time series will not be available)</li><li>`Warn` – generate a failure for the command</li></ul>|`Warn`|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/regression/commands/general/ReadColoradoHydroBaseRest).

## Troubleshooting ##

## See Also ##

* [`CopyTimeSeriesPropertiesToTable`](../CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md) command
* [`FillUsingDiversionComments`](../FillUsingDiversionComments/FillUsingDiversionComments.md) command
* [`ReadHydroBase`](../ReadHydroBase/ReadHydroBase.md) command
* [`ReadTimeSeries`](../ReadTimeSeries/ReadTimeSeries.md) command
