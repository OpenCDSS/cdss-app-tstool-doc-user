# TSTool / Command / FillHistMonthAverage #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `FillHistMonthAverage` command fills missing data in monthly time series with the average monthly values.
The average values are computed using the available data period
(or specified averaging period – see the [`SetAveragePeriod`](../SetAveragePeriod/SetAveragePeriod.md) command)
immediately after the time series is read and are then applied when this command is encountered.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Fill Time Series Missing Data***

The following dialog is used to edit the command and illustrates the syntax of the command.

**<p style="text-align: center;">
![FillHistMonthAverage](FillHistMonthAverage.png)
</p>**

**<p style="text-align: center;">
`FillHistMonthAverage` Command Editor (<a href="../FillHistMonthAverage.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
FillHistMonthAverage(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSList`|Indicates the list of time series to be processed, one of:<br><ul><li>`AllMatchingTSID` – all time series that match the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`AllTS` – all time series before the command.</li><li>`EnsembleID` – all time series in the ensemble will be processed (see the EnsembleID parameter).</li><li>`FirstMatchingTSID` – the first time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`LastMatchingTSID` – the last time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`SelectedTS` – the time series are those selected with the [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command.</li></ul> | `AllTS` |
|`TSID`|The time series identifier or alias for the time series to be processed, using the `*` wildcard character to match multiple time series.  Can be specified using `${Property}`.|Required if `TSList=*TSID`|
|`EnsembleID`|The ensemble to be processed, if processing an ensemble. Can be specified using `${Property}`.|Required if `TSList=*EnsembleID`|
|`FillStart`|Date/time indicating the start of filling, using a precision appropriate for the time series, or `OutputStart`.  Can be specified using processor `${Property}`.|Fill the entire time series.|
|`FillEnd`|Date/time indicating the end of filling, using a precision appropriate for the time series, or `OutputEnd`.  Can be specified using processor `${Property}`.|Fill the entire time series.|
|`FillFlag`|If specified, data flags will be enabled for the time series and each filled value will be tagged with the specified string.  The flag can then be used later to label graphs, etc.  The flag will be appended to existing flags if necessary.  Use `Auto` to use a flag with the month abbreviation + `Avg`.  Can be specified using processor `${Property}`.|No flag is assigned.|
|`FillFlagDesc`|Description for the fill flag, used in reports.  Can be specified using processor `${Property}`.|Automatically generated.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/FillHistMonthAverage).

The following command files fill a time series from the State of Colorado’s
[State of Colorado’s HydroBase database](../../datastore-ref/CO-HydroBase/CO-HydroBase.md).

```
# 0125 - ALAMOSA
0125.NOAA.Precip.Month~HydroBase
FillHistMonthAverage(TSList=AllMatchingTSID,TSID=”0125.NOAA.Precip.Month”,FillFlag=”H”)
0125.NOAA.Precip.Month~HydroBase
FillHistMonthAverage(TSList=AllMatchingTSID,TSID=”019*”,FillFlag=”H”)
```

Time series data limits for the averages are printed to the log file,
similar to the following examples (note that the period for averaging is always shown and may be different than the output period).

```
Status: Historic averages for time series follow...
Time series:  0125.NOAA.Precip.Month (IN)
Monthly limits for period 1948-08 to 1949-12 are:
                                                       #      %      # Not  % Not 
Month    Min    MinDate     Max    MaxDate     Sum     Miss.  Miss.  Miss.  Miss.     Mean
--------------------------------------------------------------------------------------------
Jan         0.2 1949-01        0.2 1949-01        0.2      0   0.00      1 100.00        0.2
Feb         0.1 1949-02        0.1 1949-02        0.1      0   0.00      1 100.00        0.1
Mar         0.1 1949-03        0.1 1949-03        0.1      0   0.00      1 100.00        0.1
Apr      -999.0             -999.0             -999.0      1 100.00      0   0.00     -999.0
May      -999.0             -999.0             -999.0      1 100.00      0   0.00     -999.0
Jun         0.7 1949-06        0.7 1949-06        0.7      0   0.00      1 100.00        0.7
Jul         1.5 1949-07        1.5 1949-07        1.5      0   0.00      1 100.00        1.5
Aug         0.7 1949-08        0.8 1948-08        1.5      0   0.00      2 100.00        0.8
Sep         0.1 1948-09        1.1 1949-09        1.2      0   0.00      2 100.00        0.6
Oct         0.1 1949-10        0.5 1948-10        0.7      0   0.00      2 100.00        0.3
Nov         0.0 1949-11        0.8 1948-11        0.8      0   0.00      2 100.00        0.4
Dec         0.0 1949-12        0.2 1948-12        0.2      0   0.00      2 100.00        0.1
--------------------------------------------------------------------------------------------
```

## Troubleshooting ##

## See Also ##

*   [`FillHistYearAverage`](../FillHistYearAverage/FillHistYearAverage.md) command
*   [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command
*   [`SetAveragePeriod`](../SetAveragePeriod/SetAveragePeriod.md) command
