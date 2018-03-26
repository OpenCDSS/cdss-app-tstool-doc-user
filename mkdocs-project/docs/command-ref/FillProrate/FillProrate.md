# Learn TSTool / Command / FillProrate #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The [`FillProrate`](../FillProrate/FillProrate) command fills missing
data in time series by prorating values from another time series.
This fill technique is useful, for example, where two time series are likely
to have the same general trend and ratio of data values.
The ratio can be computed two ways, as specified by the `FactorMethod` parameter:
	
* `NearestPoint` – causes the ratio to be recomputed each time that a non-missing
value is found in both time series.
The ratio computed from the nearest points in each time series is used for filling until another value can be computed.
* `AnalyzeAverage` – computes the ratio as the average ratio of the time
series (numerator) and the independent time series (divisor).
This was implemented to match an existing fill procedure but can lead to some bias in the results.
A different overall average will be obtained depending on whether
ratios are computed first and then averaged than if the sum of the
numerators are added and divided by the sum of the denominators.
In the former, the choice of which time series is in the denominator could impact results.
More parameters may need to be added in the future to implement an analysis different from the current defaults.

The initial computation of the ratio may require specifying an initial value
due to missing data on the end-points of the time series (see the `InitialValue` parameter).
Alternatively, the time series can be filled in one direction first and then filled in the other direction with a second command.

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax of the command.
<a href="../FillProrate.png">See also the full-size image.</a>

![FillProrate](FillProrate.png)

**<p style="text-align: center;">
`FillProrate` Command Editor
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
FillProrate(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSList`|Indicates the list of time series to be processed, one of:<br><ul><li>`AllMatchingTSID` – all time series that match the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`AllTS` – all time series before the command.</li><li>`EnsembleID` – all time series in the ensemble will be processed (see the EnsembleID parameter).</li><li>`FirstMatchingTSID` – the first time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`LastMatchingTSID` – the last time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`SelectedTS` – the time series are those selected with the [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries) command.</li></ul> | `AllTS` |
|`TSID`|The time series identifier or alias for the time series to be processed, using the `*` wildcard character to match multiple time series.  Can be specified using `${Property}`.|Required if `TSList=*TSID`|
|`EnsembleID`|The ensemble to be processed, if processing an ensemble. Can be specified using `${Property}`.|Required if `TSList=*EnsembleID`|
|`IndependentTSID`|The time series identifier or alias for the independent time series.|None – must be specified.|
|`FillStart`|The starting date/time for the fill.|Available period.|
|`FillEnd`|The ending date/time for the fill.|Available period.|
|`FillFlag`|A one-character flag to tag data values that are filled.|Do not flag filled data.|
|`FillDirection`|Specify the direction of the fill as Forward or Backward.|Forward|
|`FactorMethod`|Specify how to calculate the factor to use in proration, one of:<ul><li>`AnalyzeAverage` – calculate the factor of the average of the time series divided by the independent time series, using the analysis period.</li><li>`NearestPoint` – calculate the factor at the nearest point where both time series have non-missing values.|NearestPoint|
|`AnalysisStart`|The starting date/time for the analysis, used when `FactorMethod=AnalyzeAverage`.|Analyze the full period.|
|`AnalysisEnd`|The ending date/time for the analysis, used when `FactorMethod=AnalyzeAverage`.|Analyze the full period.|
|`InitialValue`|The initial value to use for the filled time series, for cases where a value may not be available on the ends of the fill period, one of:<ul><li>`NearestBackward` – search the time series backward for the nearest non-missing value.</li><li>`NearestForward` – search the time series forward for the nearest non-missing value.</li><li>Specify a number to use for the initial value.|None – filling will not occur at the end.|

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/FillProrate).

A sample command file to fill a time series from the [State of Colorado’s HydroBase database](../../datastore-ref/CO-HydroBase/CO-HydroBase)
is as follows:

```text
# 06754000 - SOUTH PLATTE RIVER NEAR KERSEY
06754000.DWR.Streamflow.Month~HydroBase
# 06694700 - FOURMILE CREEK NEAR FAIRPLAY, CO.
06694700.USGS.Streamflow.Month~HydroBase
FillProrate(TSList=AllMatchingTSID,TSID="06754000.DWR.Streamflow.Month",IndependentTSID="06694700.USGS.Streamflow.Month",FillDirection=Forward,InitialValue=0)
06754000.DWR.Streamflow.Month~HydroBase
```

## Troubleshooting ##

## See Also ##

* [FillConstant](../FillConstant/FillConstant) command
* [SelectTimeSeries](../SelectTimeSeries/SelectTimeSeries) command
