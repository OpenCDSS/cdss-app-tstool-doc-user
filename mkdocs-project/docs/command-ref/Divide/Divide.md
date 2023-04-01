# TSTool / Command / Divide #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `Divide` command divides one time series by another.
This is useful for comparing the relative size of time series values (see also
[`RelativeDiff`](../RelativeDiff/RelativeDiff.md)).
If the divisor is zero or missing, the result is set to missing.
Use the [`Scale`](../Scale/Scale.md) command to divide by a numerical value.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Manipulate Time Series***

The following dialog is used to edit the command and illustrates the syntax of the command.

**<p style="text-align: center;">
![Divide command editor](Divide.png)
</p>**

**<p style="text-align: center;">
`Divide` Command Editor (<a href="../Divide.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
Divide(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSID`<br>**required**|The time series identifier or alias for the time series to be modified.  Can specify using `${Property}`.|None – must be specified.|
|`DivisorTSID`<br>**required**|The time series identifier or alias for the time series that is the divisor.  Can specify using `${Property}`.|None – must be specified.|
|`NewUnits`|New units to assign to the output time series.  Can specify using `${Property}`.|Original units will remain.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/Divide).

A sample command file to process time series from the [State of Colorado’s HydroBase database](../../datastore-ref/CO-HydroBase/CO-HydroBase.md)
is as follows:

```text
# 2184 - DEL NORTE 2 E
2184.NOAA.TempMean.Month~HydroBase
# 5706 - MONTE VISTA 2 W
5706.NOAA.TempMean.Month~HydroBase
Divide(TSID="2184.NOAA.TempMean.Month",DivisorTSID="5706.NOAA.TempMean.Month")
```
The resulting graph is as follows:

**<p style="text-align: center;">
![Divide command results Graph](Divide_Graph.png)
</p>**

**<p style="text-align: center;">
Results from `Divide` Command (<a href="../Divide_Graph.png">see full-size image</a>)
</p>**

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`RelativeDiff`](../RelativeDiff/RelativeDiff.md) command
*   [`Scale`](../Scale/Scale.md) command
*   [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command
