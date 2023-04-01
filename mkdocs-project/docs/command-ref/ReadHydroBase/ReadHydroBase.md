# TSTool / Command / ReadHydroBase #

*   [Overview](#overview)
    +   [Diversion Records](#diversion-records)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `ReadHydroBase` command reads one or more time series from the HydroBase database
(see the [HydroBase Datastore Appendix](../../datastore-ref/CO-HydroBase/CO-HydroBase.md).
It is designed to utilize query criteria to process large numbers of time series,
for example for a specific water district and data type.
The default parameter values match the results of TSID for HydroBase.

The ***Data type***, ***Data interval***, and ***Where*** command parameters and input fields
are similar to those from the main TSTool interface.
However, whereas the main TSTool interface first requires a query to find the
matching time series list and then an interactive select for specific time series identifiers,
the `ReadHydroBase` command reads the time series list and the corresponding data for the time series.
This can greatly shorten command files and simplify command logic, especially when processing many time series.

The command supports the old-style input name selection (which corresponds to selecting
HydroBase via the TSTool login dialog) and the new-style datastore convention
(which corresponds to datastore configuration files).
In the future, support for the input name may be phased out; however,
this will require resolving how the HydroBase selection dialog is migrated to support datastores.
Consequently, both approaches are currently supported during the transition.

Data for the location (station, structure, well, etc.) and time series metadata,
as shown in the main TSTool interface, are set as time series properties.
For example, the `latdecdeg` and `longdecdeg` values from the `HydroBase vw_CDSS_StationMeasType` view
are available as time series properties of the same name.
These properties can be transferred to a table with the
[`CopyTimeSeriesPropertiesToTable`](../CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md)
command and processed further with other table commands.

### Diversion Records ###

Time series corresponding to diversion records,
which include observations for ditches, reservoirs, wells, and other "structures", are handled as follows.
See also the [`ReadColoradoHydroBaseRest`](../ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) command
documentation, which provides a comparison of web services and database.

1.  In general, diversion record values correspond to observations and estimates determined by
    the State of Colorado and other entities.
    The accuracy of values is higher for well-maintained measuring devices and
    lower (or less certain) for third-party data submission.
    Diversion records are stored in various forms, based on historical approach and to facilitate
    data collection with limited resources.
    For example, long-term daily records may be available at large diversion structures
    whereas other structures may have infrequent data records and/or annual diversion comments.
    Records for smaller interval (e.g., day) are accumulated to larger interval (month and year).
    The observations available in diversion records can be further processed to provide additional
    data values, as described below.
    Diversion records consist of date, value, and flag (observation code), which can be viewed in TSTool.
2.  If `FillDivRecordsCarryForward=True` (the default),
    daily total diversion (`DivTotal`), daily total reservoir release (`RelTotal`),
    and daily water class (`DivClass` and `RelClass`) time series have their values carried forward to fill additional zero
    data values within irrigation years (November to October).
    The Division of Water Resources does implement some data filling by carrying forward non-zero daily values,
    indicated with corresponding data flags.
    In practice, it is common to interpret diversion records by filling in additional zeros and TSTool automates this approach.
    This technique has been used when processing data for CDSS modeling.
    Web services by default only return HydroBase diversion record data for observations without additional zero-filling.
    Therefore, this filling action should only provide additional zero values
    in an irrigation year where a diversion or release was recorded sometime in the year.
    Irrigation years with no observations remain as missing after the read.
    Because the logic requires full irrigation years,
    the read period and time series period is internally set to span full irrigation years
    and is then set to the requested period after filling with the carry forward algorithm.
    **The default behavior is the same as the [`ReadColoradoHydroBaseRest`](../ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) command.**
3.  If `FillUsingDivComments=True` (default is `False`), daily, monthly, and yearly `DivTotal`, `RelTotal`, and `DivClass` time series
    are filled using annual irrigation year (November-October) diversion comments,
    which indicate when irritation years should be treated as additional zero values.
    Diversion comments provide additional information but may not always be consistent with diversion records.
    For example, diversion comments may indicate that a structure did not divert water in a year whereas
    daily and monthly records show diversions in all or some months.
    The separate [`FillUsingDiversionComments`](../FillUsingDiversionComments/FillUsingDiversionComments.md) command also
    is available for filling but may be phased out in the future.
4.  It also may be appropriate to use infrequent data types (`IDivTotal`, `IDivClass`, `IRelTotal`, and `IRelClass`) to supply data;
    however, because such values may be annual values,
    additional decisions must be made for how to distribute the values to monthly and daily time series.
    HydroBase diversion record processing automatically integrates such data into larger-interval diversion records;
    however, it may not be obvious.  The HydroBase web services provide additional data to indicate when
    infrequent data are included.
5.  See the [`FillHistMonthAverage`](../FillHistMonthAverage/FillHistMonthAverage.md),
    [`FillPattern`](../FillPattern/FillPattern.md), and other commands,
    which can be used to fill (estimate) values in data gaps after the initial time series are read.  

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Read Time Series***

The following dialog is used to edit the command and illustrates the syntax for the command.
Two options are available for matching time series, based on historical software requirements.
The following example illustrates how to read a single time series by specifying the time series identifier.
This approach is essentially equivalent to using the
[`ReadTimeSeries`](../ReadTimeSeries/ReadTimeSeries.md) command but offers HydroBase-specific parameters such as
[`FillUsingDiversionComments`](../FillUsingDiversionComments/FillUsingDiversionComments.md),
which are not available in the more general
[`ReadTimeSeries`](../ReadTimeSeries/ReadTimeSeries.md) command.
Specifying a TSID can be used for simple data types such as `DivTotal` where the data type matches one time series.
The `DivClass` and `RelClass` data type can match multiple time series and therefore requires that the `WaterClass`
parameter is specified if a single time series should be matched.

**<p style="text-align: center;">
![ReadHydroBase command editor to read a single time series](ReadHydroBase_TSID.png)
</p>**

**<p style="text-align: center;">
`ReadHydroBase` Command Editor to Read a Single Time Series (<a href="../ReadHydroBase_TSID.png">see full-size image</a>)
</p>**

The following figure illustrates how to query multiple time series.

**<p style="text-align: center;">
![ReadHydroBase command editor to read multiple time series](ReadHydroBase_Multiple.png)
</p>**

**<p style="text-align: center;">
`ReadHydroBase` Command Editor to Read Multiple Time Series (<a href="../ReadHydroBase_Multiple.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadHydroBase(Parameter="Value",...)
```
The following older command syntax is updated to the above syntax when a command file is read:

```text
TS Alias = ReadHydroBase(Parameter=Value,...)
```

**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`InputName`|The HydroBase database connection input name to use for the database connection, as initialized by the HydroBase login dialog shown when TSTool starts.  When using this approach the TSID will end in `~HydroBase~InputName`.  The input name approach for specifying a HydroBase database connection may be phased out in the future in favor of the datastore approach.|Use the default HydroBase connection.|
|`DataStore`|The HydroBase datastore name to use for the database connection, as per datastore configuration files (see the [HydroBase Datastore appendix](../../datastore-ref/CO-HydroBase/CO-HydroBase.md).  When using this approach the TSID will end in `~DataStore`.  The datastore approach is being phased in as a more flexible design.  Configuring a datastore with name HydroBase will take precedence over `InputName=HydroBase`.|Use the default (legacy `InputName`) HydroBase connection, if available.|
|`DataType`<br>**required**|The data type to be queried, as documented in the [HydroBase Datastore appendix](../../datastore-ref/CO-HydroBase/CO-HydroBase.md).|None – must be specified.|
|`WaterClass`|**Note:  This uses the old SFUTG syntax, not new water class syntax used by web services.**  The water class if only a single water class should be returned, used when `DataType=DivClass` or `DataType=RelClass`.  Specify as the full string including leading WDID as returned when querying all water classes, for example:  `S:2 F:0303732 U:Q T:7 G:`. | All matching water classes. |
|`Interval`<br>**required**|The data interval for the time series, as documented in the [HydroBase Datastore appendix](../../datastore-ref/CO-HydroBase/CO-HydroBase.md) (e.g. `Day`, `Month`, `Year`), consistent with the `DataType` selection.|None – must be specified.|
|`TSID`|When reading a single time series, the time series identifier to read.  If specified, this parameter will override the `WhereN` parameters.|Use `WhereN` parameters to read multiple time series.|
|`WhereN`|When reading 1+ time series, the “where” clauses to be applied.  The filters match the values in the Where fields in the command editor dialog and the TSTool main interface.  The parameters should be named `Where1`, `Where2`, etc., with a gap resulting in the remaining items being ignored.  The format of each value is:<br>`Item;Operator;Value`<br>Where `Item` indicates a data field to be filtered on, `Operator` is the type of constraint, and `Value` is the value to be checked when querying.|If not specified, the query will not be limited and very large numbers of time series may be queried.|
|`Alias`<br>**required**|The alias to assign to the time series, as a literal string or using the special formatting characters listed by the command editor.  The alias is a short identifier used by other commands to locate time series for processing, as an alternative to the time series identifier (`TSID`).|None – must be specified.|
|`InputStart`|Start of the period to query, specified as a date/time with a precision that matches the requested data interval.|Read all available data.|
|`InputEnd`|End of the period to query, specified as a date/time with a precision that matches the requested data interval.|Read all available data.|
|`FillDivRecordsCarryForward`|Indicate whether to fill daily `DivTotal`, `DivClass`, `RelTotal`, and `RelClass` time series using carry forward approach:<ul><li>Irrigation years (November to October) to fill must have at least one value.</li><li>Missing values at the beginning of the irrigation year (November-October) will be filled with zero until the first value is encountered.</li><li>Missing values within the year are filled by carrying forward the last observation - **only zero value is carried forward.**.</li><li>Missing values at the end of the year are carried forward, using the last observed value - **only zero value is carried forward.**.</li><li>Filled values are flagged with the `FillDivRecordsCarryForwardFlag` value.|`True`|
|`FillDivRecordsCarryForwardFlag`|Data flag set when values are filled if `FillDivRecordsCarryForward=True` .  The flag can then be used later to label graphs, etc.| `c` |
|`FillUsingDivComments`|Indicate whether to fill diversion and reservoir release time series using diversion comments.|`False`|
|`FillUsingDivCommentsFlag`|If specified as a single character, data flags will be enabled for the time series and each filled value will be tagged with the specified character.  The flag can then be used later to label graphs, etc.  The flag will be appended to existing flags if necessary.|"not used" value from diversion comment.|
|`IfMissing`|Indicate the action to be taken if the requested time series is missing, one of:<ul><li>`Ignore` – ignore the time series (do not warn and the time series will not be available)</li><li>`Warn` – generate a failure for the command</li></ul>|`Warn`|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/ReadHydroBase).

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`CopyTimeSeriesPropertiesToTable`](../CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md) command
*   [`FillHistMonthAverage`](../FillHistMonthAverage/FillHistMonthAverage.md) command
*   [`FillPattern`](../FillPattern/FillPattern.md) command
*   [`FillUsingDiversionComments`](../FillUsingDiversionComments/FillUsingDiversionComments.md) command
*   [`ReadColoradoHydroBaseRest`](../ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) command
*   [`ReadTimeSeries`](../ReadTimeSeries/ReadTimeSeries.md) command
