# Learn TSTool / Command / ReadPatternFile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ReadPatternFile` command reads pattern time series to be used with
[`FillPattern`](../FillPattern/FillPattern) command.
The patterns indicate whether a month is wet, dry, or average, although any number of characterizations can be used.
One or more patterns can be included in each pattern file, similar to StateMod time series files
(see the [StateMod Input Type appendix](../../datastore-ref/StateMod/StateMod)).
Multiple pattern files can be used, if appropriate.
The following example illustrates the file format.
See also the [`AnalyzePattern`](../AnalyzePattern/AnalyzePattern) command, which can be used to generate the file.

```	
#  Years Shown = Water Years
#  Missing monthly data filled by the Mixed Station Method, USGS 1989
#  Time series identifier         = 09034500.CRDSS_USGS.QME.MONTH.1
#  Description                    = COLORADO RIVER AT HOT SULPHUR SPRINGS, CO.
# -e-b----------eb------eb------eb------eb------eb------eb------eb------eb------eb------eb------eb------eb------eb--------e
   10/1908  -      9/1996 ACFT  WYR
1909 09034500         AVG     AVG     AVG     WET     WET     AVG     AVG     AVG     WET     WET     WET     WET
1910 09034500         WET     WET     WET     WET     WET     WET     AVG     AVG     AVG     AVG     AVG     AVG
1911 09034500         AVG     AVG     WET     AVG     AVG     AVG     AVG     WET     WET     WET     AVG     WET
1912 09034500         WET     WET     WET     WET     WET     AVG     AVG     WET     WET     WET     WET     WET
...ommitted...
```

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax of the command.
<a href="../ReadPatternFile.png">See also the full-size image.</a>

![ReadPatternFile](ReadPatternFile.png)

**<p style="text-align: center;">
`ReadPatternFile` Command Editor
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadPatternFile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`PatternFile`<br>**required**|The path to the pattern file, which can be absolute or relative to the working directory.|None – must be specified.|

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/ReadPatternFile).

## Troubleshooting ##

## See Also ##

* [`FillPattern`](../FillPattern/FillPattern) command
* [`AnalyzePattern`](../AnalyzePattern/AnalyzePattern) command
