# TSTool / Command / ReadWaterOneFlow #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

**The `ReadWaterOneFLow` command was experimental and is not currently available in TSTool.**

The `ReadWaterOneFlow` command reads one or more time series from WaterOneFlow web service
(see the [WaterOneFlow Data Store Appendix](../../datastore-ref/WaterOneFlow/WaterOneFlow.md)) and optionally assigns an alias to the time series.
WaterML version 1.0 is supported for time series transfer;
however, the WaterML response currently cannot be saved to a file
(and therefore output cannot be used with the
[`ReadWaterML`](../ReadWaterML/ReadWaterML.md) command).

## Command Editor ##

## Command Syntax ##

The command syntax is as follows:

```text
ReadWaterOneFlow(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
| `Alias` | The alias to assign to the time series, as a literal string or using the special formatting characters listed by the command editor.  The alias is a short identifier used by other commands to locate time series for processing, as an alternative to the time series identifier (TSID). | No alias is assigned. |
| `InputStart` | The start of the period to read data – specify if the period should be different from the global query period. | Use the global query period. |
| `InputEnd` | The end of the period to read data – specify if the period should be different from the global query period. | Use the global query period. |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/regression/commands/general/ReadWaterOneFlow).

## Troubleshooting ##

## See Also ##

* [`ReadWaterML`](../ReadWaterML/ReadWaterML.md) command
* [`ReadWaterML2`](../ReadWaterML2/ReadWaterML2.md) command
