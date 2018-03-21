# Learn TSTool / Command / Wait #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `Wait` command waits a specified time before continuing.  Examples of use include:

* Testing to simulate slow datastores or long processes.
* Waiting for an external process to finish.  Functionality will be added in the future to wait for a file to exist or not exist.

The TSTool ***Run / Cancel Command Processing (interrupt processing)*** menu will initiate an interrupt on the processor.
Because the `Wait` command uses an internal wait,
such interrupts are treated differently than interrupting other commands and may generate warnings that have obscure wording.
This case will be evaluated and enhanced over time.
In most cases users will not need to interrupt command workflows that are using `Wait`.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.
<a href="../Wait.png">See also the full-size image.</a>

![Wait](Wait.png)

**<p style="text-align: center;">
`Wait` Command Editor Showing Conditions Test
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
Wait(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`WaitTime`<br>**required**|The number of seconds to wait.|None – must be specified.|
|`ProgressIncrement`|The number of seconds between progress updates in the main TSTool progress indicator.|`WaitTime` divided by ten.|

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/Wait).

## Troubleshooting ##

## See Also ##

* [Exit](../Exit/Exit) command
