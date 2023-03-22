# TSTool / Command / Delta #

*   [Overview](#overview)
    +   [Cumulative Time Series with Reset](#cumulative-time-series-with-reset)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
    +   [Example for `ResetType=Auto`](#example-for-resettypeauto)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `Delta` command creates a new time series from an input time series.
The resulting values are computed as the difference between each value and the previous value.
The [`CheckTimeSeries`](../CheckTimeSeries/CheckTimeSeries.md) command can be used to check time series
for changes that exceed a threshold; however,
the `Delta` command handles the complexity of time series
that reset to a new starting value.
The output from `Delta` can then be used in conjunction with the
[`CheckTimeSeries`](../CheckTimeSeries/CheckTimeSeries.md) command to check for changes above a criteria.
The `Delta` command will create as many output time series as there are input time series.

The output value in the simplest case with default command parameters is
the current value minus the previous value.
The result is set to missing if this value cannot be computed due to missing values.

Irregular-interval time series that result in differences not being computed will have
missing values inserted in output at appropriate locations to maintain consistent
timeline with the original data. 

### Cumulative Time Series with Reset ###

This command can be used to create increments from a cumulative time series (e.g., cumulative precipitation).
If the cumulative time series resets periodically (e.g., each year),
then the expected trend (`ExpectedTrend` parameter) allows the command to detect resets.

#### Automatic Reset ####

If the cumulative time series is allowed to increase (or decrease) without bound before reset,
the `ResetType=Auto` parameter can be used to automatically detect resets.
By default, the reset is assumed to be relative to a zero value baseline.

#### Reset at Maximum Value ####

If the cumulative time series is allowed to increase (or decrease) with a known bounding value,
use `RestType=ResetValue` and specify the `ResetMin` and `ResetMax` parameters to bound the values.
This is appropriate, for example, where the cumulative value correspond to sensor counts such as
precipitation sensor bucket tips.

For example, if `Trend=Increasing` and a decrease is detected,
it is assumed that the values have circled past the reset values.
In this case the command will attempt to compute the change across the reset values.
If this is not possible, then warnings will be generated and the result will be set to missing.
Specific cases that are handled are:

*   The previous value is out of range – in this case the contribution from the out of
    range previous value is added to the delta and default flag value is assigned
    (see the `Flag` parameter description).
    A warning will be generated.
*   The current value is out of range – in this case the difference will be
    decreased because the reset value has not be achieved.  A warning will be generated.

**The above special cases result in somewhat arbitrary difference values because
the inputs do not conform to expected values.
Out of range values indicate erroneous data that should be corrected before being used in further analysis.**

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Create Time Series***

The following dialog is used to edit the command and illustrates the syntax of the command.

**<p style="text-align: center;">
![Delta](Delta.png)
</p>**

**<p style="text-align: center;">
`Delta` Command Editor (<a href="../Delta.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
Delta(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSList`|Indicates the list of time series to be processed, one of:<br><ul><li>`AllMatchingTSID` – all time series that match the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`AllTS` – all time series before the command.</li><li>`EnsembleID` – all time series in the ensemble will be processed (see the EnsembleID parameter).</li><li>`FirstMatchingTSID` – the first time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`LastMatchingTSID` – the last time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`SelectedTS` – the time series are those selected with the [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command.</li></ul> | `AllTS` |
|`TSID`|The time series identifier or alias for the time series to be processed, using the `*` wildcard character to match multiple time series.  Can be specified using `${Property}`.|Required if `TSList=*TSID`|
|`EnsembleID`|The ensemble to be processed, if processing an ensemble. Can be specified using `${Property}`.|Required if `TSList=*EnsembleID`|
|`ResetType`| The reset type:<ul><li>`Auto` - automatically reset with zero as the baseline when values change in the opposite direction of the `ExpectedTrend` (delta will always have the same sign)</li><li>`ResetValue` - use the `ResetMin` and `ResetMax` to handle resets.</li><li>`Unknown` - reset behavior is unknown (delta is simple calculation of current minus previous)</li></ul> | `Unknown` |
|`ResetMin`| When `ResetType=ResetValue`, the minimum expected data value, used when data are expected to increase (or decrease) to a threshold and then reset, for example raw precipitation values that reset to zero when an accumulation sensor reaches its maximum value and resets.|Data are not expected to reset.|
|`ResetMax`| When `ResetType=ResetValue`, the maximum expected data value, used when data are expected to increase (or decrease) to a threshold and then reset, for example raw precipitation values that reset to zero when an accumulation sensor reaches its maximum value and resets.|Data are not expected to reset.|
|`ExpectedTrend`|Indicates trend of data, used when values can reset:<ul><li>`Decreasing` – values should decrease and then reset</li><li>`Increasing` – values should increase and then reset</li><li>`Variable` – variable pattern increasing and decreasing and don’t reset at fixed thresholds|`Variable`|
|`AnalysisStart`|The date/time to start analyzing data.  Can be specified using `${Property}`.|Full period is analyzed.|
|`AnalysisEnd`|The date/time to end analyzing data.  Can be specified using `${Property}`.|Full period is analyzed.|
|`Flag`|A string to flag problem values, or `Auto` for default flags:</li><li>`R` – indicates reset transition out of range > `ResetMax`</li><li>`r` – indicates reset transition out of range < `ResetMin`</li><li>`V` – indicates value out of range > `ResetMax`</li><li>`v` – indicates value out of range < `ResetMin`</li><ul><br>Can be specified using `${Property}`.|Do not flag problem values.|
|`Alias`|Alias to assign to created time series.  A literal string can be specified or use %-specifiers to set the alias dynamically (e.g., `%L`) to use the location part of the identifier.|None (but is highly recommended).|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/Delta).

### Example for `ResetType=Auto` ###

The following example illustrates using `ResetType=Auto` and `ExpectedTrend=Increasing`,
in this case for cumulative precipitation that resets at minute 53 of each hour.

**<p style="text-align: center;">
![Delta graph for ResetType of Auto](Delta-auto-graph.png)
</p>**

**<p style="text-align: center;">
`Delta` Graph for `ResetType=Auto` (<a href="../Delta-auto-graph.png">see also the full-size image</a>)
</p>**

**<p style="text-align: center;">
![Delta table for ResetType of Auto](Delta-auto-table.png)
</p>**

**<p style="text-align: center;">
`Delta` Table for `ResetType=Auto` (<a href="../Delta-auto-table.png">see also the full-size image</a>)
</p>**

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`CheckTimeSeries`](../CheckTimeSeries/CheckTimeSeries.md) command
*   [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command
