
# TSTool / Command / SetPropertyFromEnsemble #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `SetPropertyFromEnsemble` command sets the value of a processor property,
using time series ensemble properties as input.
The property will be available to subsequent commands that support using `${Property}` notation in parameters,
for example to specify filenames more dynamically or use with [`If`](../If/If.md) commands.
This command should not be confused with the [`SetEnsembleProperty`](../SetEnsembleProperty/SetEnsembleProperty.md) command,
which sets a property on an ensemble.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / General - Running and Properties***

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![SetPropertyFromEnsemble command editor](SetPropertyFromEnsemble.png)
</p>**

**<p style="text-align: center;">
`SetPropertyFromEnsemble` Command Editor (<a href="../SetPropertyFromEnsemble.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
SetPropertyFromEnsemble(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`EnsembleID`<br>**required**|The ensemble to be processed.  Can be specified using processor `${Property}.`  The `*` wildcard can be used to match an ensemble, useful for when one ensemble is being processed in a graph template command file.|None - must be specified.|
|`PropertyName`<br>**required**|The property name to set.|None – must be specified.|
|`PropertyValue`<br>**required**|The value of the property, set using a combination of text, the time series `%` specifiers, `${tsensemble:Property}` for custom time series ensemble properties, and `${Property}`.|None – must be specified.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/SetPropertyFromEnsemble).

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`For`](../For/For.md) command
*   [`If`](../If/If.md) command
*   [`SetProperty`](../SetProperty/SetProperty.md) command
*   [`SetPropertyFromTimeSeries`](../SetPropertyFromTimeSeries/SetPropertyFromTimeSeries.md) command
*   [`SetTimeSeriesProperty`](../SetTimeSeriesProperty/SetTimeSeriesProperty.md) command
*   [`WritePropertiesToFile`](../WritePropertiesToFile/WritePropertiesToFile.md) command
