# TSTool / Command / SetConstant #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `SetConstant` command sets the values of a time series to a single or monthly constant values.

An optional flag can also be set to indicate which values have been modified.
If no numerical single or monthly values are set,
the flag can still be set.
Currently, only a single flag value can be specified (not monthly flags).

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Set Time Series Contents***

The following dialog is used to edit the command and illustrates the syntax of the command.

**<p style="text-align: center;">
![SetConstant command editor](SetConstant.png)
</p>**

**<p style="text-align: center;">
`SetConstant` Command Editor (<a href="../SetConstant.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
SetConstant(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSList`|Indicates the list of time series to be processed, one of:<br><ul><li>`AllMatchingTSID` – all time series that match the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`AllTS` – all time series before the command.</li><li>`EnsembleID` – all time series in the ensemble will be processed (see the EnsembleID parameter).</li><li>`FirstMatchingTSID` – the first time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`LastMatchingTSID` – the last time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`SelectedTS` – the time series are those selected with the [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command.</li></ul> | `AllTS` |
|`TSID`|The time series identifier or alias for the time series to be processed, using the `*` wildcard character to match multiple time series.  Can be specified using `${Property}`.|Required if `TSList=*TSID`|
|`EnsembleID`|The ensemble to be processed, if processing an ensemble. Can be specified using `${Property}`.|Required if `TSList=*EnsembleID`|
|`ConstantValue`|The constant value to use as the data value.| Sepecify `ConstantValue` or `MonthValues`.|
|`MonthValues`|Monthly values to use as the data values:<ul><li>twelve values for January – December must be specified:<ul><li>separate the 12 values by commas</li><li> `*` indicates to keep the original value</li><li>blank or `NaN` indicates to set the value to missing</li></ul></li><li>if the time series data interval is less than monthly, each date/time will be set for a specific month</li><li>if `SetFlag` is specified, it will only be set for months that have a value specified (there is currently no way to set only the flag for months)</li></ul> | Specify `ConstantValue` or `MonthValues`.|
|`SetFlag`| The string to use for the data flag for each value in the set period. Can be specified without `ConstantValue` or `MonthValues` to only set the flag (e.g., for testing). | No flag is set. |
|`SetFlagDescription`| The description for `SetFlag`, which will be used in output products. | No description is set. |
|`SetStart`|The starting date/time for the data set.  Can set using processor `${Property}`.|Set data for the full period.|
|`SetEnd`|The ending date/time for the data set.  Can set using processor `${Property}`.|Set data for the full period.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/SetConstant).

A sample command file to process a time series from the [State of Colorado’s HydroBase database](../../datastore-ref/CO-HydroBase/CO-HydroBase.md)
is as follows (only the early period is set to zero):

```text
# 08235700 - ALAMOSA RIVER BELOW CASTLEMAN GULCH NEAR JASPER
08235700.DWR.Streamflow.Month~HydroBase
SetConstant(TSList=AllMatchingTSID,TSID="08235700.DWR.Streamflow.Month",ConstantValue=0,SetEnd="1950-01")
```

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

* [`AddConstant`](../AddConstant/AddConstant.md) command
* [`FillConstant`](../FillConstant/FillConstant.md) command
* [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command
