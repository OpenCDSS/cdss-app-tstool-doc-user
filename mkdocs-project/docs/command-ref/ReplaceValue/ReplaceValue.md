# TSTool / Command / ReplaceValue #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `ReplaceValue` command replaces a range of values in a time series with a constant value,
sets the values to missing, or removes the values (if an irregular time series).
If the missing value indicator is a number in the range, missing values also will be replaced.
The time series data flag can be checked in place of or addition to checking the numerical values.
This command is useful for filtering out erroneous data values.
See also the [`CheckTimeSeries`](../CheckTimeSeries/CheckTimeSeries.md) command,
which provides for a variety of checks and also allows values to be set to missing or removed.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Set Time Series Contents***

The following dialog is used to edit the command and illustrates the syntax of the command.

**<p style="text-align: center;">
![ReplaceValue command editor](ReplaceValue.png)
</p>**

**<p style="text-align: center;">
`ReplaceValue` Command Editor (<a href="../ReplaceValue.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReplaceValue(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSList`|Indicates the list of time series to be processed, one of:<br><ul><li>`AllMatchingTSID` – all time series that match the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`AllTS` – all time series before the command.</li><li>`EnsembleID` – all time series in the ensemble will be processed (see the EnsembleID parameter).</li><li>`FirstMatchingTSID` – the first time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`LastMatchingTSID` – the last time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`SelectedTS` – the time series are those selected with the [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command.</li></ul> | `AllTS` |
|`TSID`|The time series identifier or alias for the time series to be processed, using the `*` wildcard character to match multiple time series.  Can be specified using `${Property}`.|Required if `TSList=*TSID`|
|`EnsembleID`|The ensemble to be processed, if processing an ensemble. Can be specified using `${Property}`.|Required if `TSList=*EnsembleID`|
|`MinValue`|The minimum value to replace.|The minimum value and/or `MatchFlag` must be specified.|
|`MaxValue`|The maximum value to replace.|If not specified, only data values that exactly match the minimum value will be replaced.|
|`MatchFlag`|The flag to match.  If specified in addition to `MinValue`, then the value and flag must be matched in order to perform the replacement.  A case-sensitive comparison is made and the data value flag must exactly match MatchFlag.  In the future additional flexibility may be added to match a substring, etc. If `Action=SetMissing`, the original data flag value will remain.  Specifying `SetFlag` will result in the original data flag being modified.|`MinValue` and/or `MatchFlag` must be specified.|
|`NewValue`|The new data value.|Required, unless the Action parameter is specified.|
|`Action`|An additional action to take with values that are matched:<ul><li>`Remove` – remove the data points.  This can only be specified for irregular interval time series and will be interpreted as SetMissing for regular interval time series.</li><li>`SetMissing` – set values to missing.</li></ul>|No additional action is taken and the `NewValue` parameter must be specified.|
|`SetStart`|The date/time to start filling, if other than the full time series period.  Can be specified with processor `${Property}`.|Check the full period.|
|`SetEnd`|The date/time to end filling, if other than the full time series period.  Can be specified with processor `${Property}`.|Check the full period.|
|`AnalysisWindowStart`|The starting date/time within the calendar year to replace data.  The window CANNOT cross calendar year boundaries (this may be allowed in the future).  Use multiple commands if necessary.|Process each full year.|
|`AnalysisWindowEnd`|The ending date/time within the calendar year to replace data.|Process each full year.|
|`SetFlag`|A string to assign to data values that are replaced.|Do not assign a string flag.|
|`SetFlagDesc`|Description for SetFlag, used for data products.|Auto-generate.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/ReplaceValue).

A sample command file to process a time series from the [State of Colorado’s HydroBase database](../../datastore-ref/CO-HydroBase/CO-HydroBase.md)
is as follows:

```text
# 08235700 - ALAMOSA RIVER BELOW CASTLEMAN GULCH NEAR JASPER
08235700.DWR.Streamflow.Month~HydroBase
ReplaceValue(TSList=AllTS,MinValue=-100000,MaxValue=0,NewValue=0)
```

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`CheckTimeSeries`](../CheckTimeSeries/CheckTimeSeries.md) command
*   [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command
*   [`SetConstant`](../SetConstant/SetConstant.md) command
