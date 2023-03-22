# TSTool / Command / CreateEnsembleFromOneTimeSeries #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `CreateEnsembleFromOneTimeSeries` command creates an ensemble
by splitting up a single time series into traces.
For example, a historical time series can be split into 1-year
overlapping traces that are shifted to start at the beginning of the current year.
The sequence number part of the time series identifier for each trace
is set to the starting year consistent with the year type and will be shown as `[Year]`
at the end of the time series identifier.
For example, if the year type is `WaterYear` (October - September),
the sequence number identifier for water year October 2005 to September 2006 will be `[2006]`.

The data transfer necessary to create the traces is impacted by leap years for data interval of day or smaller.
The `TransferDataHow` parameter controls how leap years are handled,
with the default being `Sequentially`, which results in a continuous record,
suitable for hydrologic data.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Ensemble Processing***

The following dialog is used to edit the command and illustrates the syntax of the command.

**<p style="text-align: center;">
![CreateEnsembleFromOneTimeSeries](CreateEnsembleFromOneTimeSeries.png)
</p>**

**<p style="text-align: center;">
`CreateEnsembleFromOneTimeSeries` Command Editor (<a href="../CreateEnsembleFromOneTimeSeries.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CreateEnsembleFromOneTimeSeries(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSID`<br>**required**|The time series identifier or alias for the time series used to create the ensemble.  Can be specified using `${Property}`.|None – must be specified.|
|`InputStart`|The date/time to start transferring data from the time series.  Can be specified using `${Property}`.|Use all data.|
|`InputEnd`|The date/time to end transferring data from the time series.  Can be specified using `${Property}`.|Use all data.|
|`EnsembleID`<br>**required**|The new ensemble identifier.  Can be specified using `${Property}`.|None – must be specified.|
|`EnsembleName`|The name for the new ensemble.  Can be specified using `${Property}`.|Blank.|
|`Alias`|The alias to assign to the time series, as a literal string or using the special formatting characters listed by the command editor.  The alias is a short identifier used by other commands to locate time series for processing, as an alternative to the time series identifier (TSID).  Can be specified using `${Property}`.|`%L_%z` (location\_sequence number)|
|`TraceLength`|An interval for the trace length (e.g., `1Year`, `1Month` or, `7Day`).|1Year|
|`TraceDescription`|Specify the description to be used for the output traces, using the time series property specifiers `%z`, etc.|`%z trace: %D`|
|`ReferenceDate`|The reference date indicates the starting date for each trace.  Each trace optionally can be shifted (see `ShiftDataHow`), in which case the year in the `ReferenceDate` is used for the common starting date.  The reference date can be one of:<ul><li>Blank, indicating that January 1 of the current year will be used.</li><li>A date/time string (use the format `01/01/YYYY` or `YYYY-MM-DD`).</li><li>`CurrentToYear`, `CurrentToMonth`, `CurrentToDay`, `CurrentToHour`, `CurrentToMinute`, indicating the current date/time to the specified precision.</li><li>A `Current*` value +- an interval, for example: `CurrentToMinute – 7Day`|January 1 of the first year in the source time series.|
|`OutputYearType`|The output year type for the ensemble traces.  The only impact from this parameter is that sequence number for the time series will be set to the start of the output year.  This is useful because legends on graphs that use the sequence number (`%z` format specifier) will use the appropriate year type.  The `ReferenceDate` should normally be specified as the first day of the output year (e.g., `ReferenceDate=2012-10-01` for `OutputYearType=Water`). |`Calendar`|
|`ShiftDataHow`|Indicates whether the traces should be shifted.  Possible values are:<ul><li>`ShiftToReference` – each trace will be shifted to the reference date, resulting in overlapping time series.</li><li>`NoShift` – plotting the traces will result in a total line that matches the original time series, except that each trace can be manipulated individually.</li></ul>|`NoShift`|
|`TransferDataHow`|Indicates how to transfer data from the input time series to ensemble traces.  Possible values are:<ul><li>`ByDateTime` – date/time in the trace is ensured to match the input (**currently only enabled for day interval data**, and only relevant for data interval of day or smaller):<ul><li>if the output trace time series position is February 29 (leap year) when the input time series position is March 1 (not leap year), set the output trace data values for February 29 to missing and ensure that March 1 and subsequent date/times align</li><li>if the output time series position is March 1 (not leap year) when the input time series is February 29 (leap year), skip setting the February 29 value in the output trace since the input time series does not have a leap year value, and ensure that March 1 and subsequent date/times align</li></ul></li><li>`Sequentially` – data values are transferred by incrementing time sequentially in the input and trace time series, which causes date/times to shift when input and trace time series do not have same number of days due to leap year.  For example, daily time series for years will have 366 days whereas daily time series for non-leap-year will have 365 days.</li></ul>|`Sequentially`|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/CreateEnsembleFromOneTimeSeries).

A sample command file to read a time series from the [State of Colorado’s HydroBase database](../../datastore-ref/CO-HydroBase/CO-HydroBase.md)
and create an ensemble from the time series using sequential data transfer is as follows:

```text
# 09019500 - COLORADO RIVER NEAR GRANBY
09019500.USGS.Streamflow.Day~HydroBase
CreateEnsembleFromOneTimeSeries(TSID="09019500.USGS.Streamflow.Day",TraceLength=1Year,EnsembleID="Ensemble_1",EnsembleName="Test Ensemble",ReferenceDate="2008-01-01",ShiftDataHow=ShiftToReference)
```

The following figure illustrates a graph of the resulting ensemble:

**<p style="text-align: center;">
![CreateEnsembleFromOneTimeSeries Graph](CreateEnsembleFromOneTimeSeries_Graph.png)
</p>**

**<p style="text-align: center;">
`CreateEnsembleFromOneTimeSeries` Example Graph (<a href="../CreateEnsembleFromOneTimeSeries_Graph.png">see also the full-size image</a>)
</p>**

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`InsertTimeSeriesIntoEnsemble`](../InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble.md) command
*   [`NewEnsemble`](../NewEnsemble/NewEnsemble.md) command
