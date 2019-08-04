# TSTool / Command / WriteNwsrfsEspTraceEnsemble #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `WriteNwsrfsEspTraceEnsemble` command writes time series traces to the specified
National Weather Service River Forecast System (NWSRFS) ESP trace ensemble file.
See the [NWSRFS ESP Trace Ensemble Input Type Appendix](../../datastore-ref/NWSRFSEspTraceEnsemble/NWSRFSEspTraceEnsemble.md) for more information about the file format.
The time series should have the same header information, with the sequence number indicating the trace years.
For example use time series that are managed as an ensemble in TSTool.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![WriteNwsrfsEspTraceEnsemble](WriteNwsrfsEspTraceEnsemble.png)
</p>**

**<p style="text-align: center;">
`WriteNwsrfsEspTraceEnsemble` Command Editor (<a href="../WriteNwsrfsEspTraceEnsemble.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
WriteNwsrfsEspTraceEnsemble(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
| `OutputFile` | The NWSRFS ESP trace ensemble output file.  The path to the file can be absolute or relative to the working directory. | None – must be specified. |
| `CarryoverGroup` | The carryover group to use in the trace file header information | Blank. |
| `ForecastGroup` | The forecast group to use in the trace file header information. | Blank. |
| `Segment` | The segment identifier to use in the trace file header information. | Location part of the time series identifier, from the first time series. |
| `SegmentDescription` | The segment description to use in the trace file header information. | Blank. |
| `Latitude` | The latitude for the station to use in the trace file header information, decimal degrees. | Missing. |
| `Longitude` | The longitude for the station to use in the trace file header information, decimal degrees. | Missing. |
| `RFC` | The river forecast center to use in the trace file header information. | Blank. |
| `TSList` | Indicates the time series to be output, one of:<ul><li> `AllTS` – all available time series will be output.</li><li> `SelectedTS` – time series that have been selected with the [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command will be output.</li><li> `EnsembleID` – time series in the ensemble specified by Blank. | `AllTS` |
| `EnsembleID` | The ensemble to write, if `TSList=EnsembleID`. | Required if `TSList=EnsembleID`. |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/regression/commands/general/WriteNWSRFSESPTraceEnsemble).

A sample commands file to convert an ensemble from a DateValue file to NWS ESP format is as follows:

```
ReadDateValue(InputFile="Data/FRANH.ESP.SQME.1HOUR.QPF1.TRACE2001")
WriteNwsrfsEspTraceEnsemble(OutputFile="Results/FRANH.FRANH.SQME.01.CS",CarryoverGroup="FRANH",ForecastGroup="FRANH",SegmentDescription="FRANH",Latitude="43",Longitude="-72",RFC="NH",TSList="AllTS")
```

## Troubleshooting ##

## See Also ##

* [`ReadNwsrfsEspTraceEnsemble`](../ReadNwsrfsEspTraceEnsemble/ReadNwsrfsEspTraceEnsemble.md) command
