# Learn TSTool / Command / Subtract #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `Subtract` command subtracts time series of the same interval.
The receiving time series will have data values set to its original
values minus the data values in the indicated time series.
If an ensemble is being processed, another ensemble can be subtracted,
a single time series can be subtracted from all time series in the ensemble,
or a list of time series can be subtracted from the ensemble
(the number in the list must match the number of time series in the ensemble).
	
This command will generate an error if the time series do not have compatible units.
If the units are compatible but are not the same (e.g., IN and FT),
then the units of the part will be converted to the units of the result before subtraction.
Missing data in the parts can be ignored (do not set the result to missing)
or can set missing values in the result.
The user should consider the implications of ignoring missing data.
Time series being subtracted must have the same data interval.

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax of the command.
<a href="../Subtract.png">See also the full-size image.</a>

![Subtract](Subtract.png)

**<p style="text-align: center;">
`Subtract` Command Editor
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
Subtract(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSID`|The time series identifier or alias for the time series to receive the result.  Can be specified using processor `${Property}`.|`TSID` or `EnsembleID` must be specified.|
|`EnsembleID`|The ensemble to receive the result, if processing an ensemble.  Can be specified using processor `${Property}`.|`TSID` or `EnsembleID` must be specified.|
|`SubtractTSList`|Indicates the list of time series to be processed, one of:<br><ul><li>`AllMatchingTSID` – all time series that match the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`AllTS` – all time series before the command.</li><li>`EnsembleID` – all time series in the ensemble will be processed (see the EnsembleID parameter).</li><li>`FirstMatchingTSID` – the first time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`LastMatchingTSID` – the last time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`SelectedTS` – the time series are those selected with the [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries) command.</li><li>`SpecifiedTSID` – the specified list of time series given by the `SubtractTSID` parameter.  **If using version 8.02.00 or earlier, use `SpecifiedTS`**.</li></ul> | `AllTS` (the time series receiving the result will not be subtracted from itself). |
|`SubtractTSID`|The time series identifier or alias for the time series to be processed, using the `*` wildcard character to match multiple time series.  Can be specified using `${Property}`.|Required if `SubtractTSList=*TSID`|
|`SubtractEnsembleID`|The ensemble to be processed, if processing an ensemble. Can be specified using `${Property}`.|Required if `SubtractTSList=*EnsembleID`.  Use if an ensemble is being subtracted from another ensemble.|
|`HandleMissingHow`|Indicates how to handle missing data in a time series:<ul><li>`IgnoreMissing` – create a result even if missing data are encountered in one or more time series – this option is not as rigorous as the others</li><li>`SetMissingIfOtherMissing` – set the result missing if any of the other time series values is missing</li><li>`SetMissingIfAnyMissing` – set the result missing if any time series value involved is missing	IgnoreMissing</li></ul>|`IgnoreMissing`|
|`AnalysisStart`|The date/time to start analyzing data.  Can be specified using processor `${Property}`.|Full period is analyzed.|
|`AnalysisEnd`|The date/time to end analyzing data.  Can be specified using processor `${Property}`.|Full period is analyzed.|

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/Subtract).

A sample command file to process a time series from the [State of Colorado’s HydroBase database](../../datastore-ref/CO-HydroBase/CO-HydroBase)
is as follows:

```text
# 0100501 - EMPIRE DITCH
0100501.DWR.DivTotal.Month~HydroBase
# 0100503 - RIVERSIDE CANAL
0100503.DWR.DivTotal.Month~HydroBase
Subtract(TSID="0100501.DWR.DivTotal.Month",SubtractTSList=SpecifiedTSID,SubtractTSID="0100503.DWR.DivTotal.Month",HandleMissingHow="IgnoreMissing")
```

## Troubleshooting ##

## See Also ##

* [`Add`](../Add/Add) command
* [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries) command
