# TSTool / Command / EndIf #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `EndIf` command ends a block of commands that start with an
[`If`](../If/If) command.
The [`If`](../If/If) and
`EndIf` commands must have the same value for the `Name` parameter to allow the command processor to determine the
start and end of the block.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.
<a href="../EndIf.png">See also the full-size image.</a>

![EndIf](EndIf.png)

**<p style="text-align: center;">
`EndIf` Command Editor
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
EndIf(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `Name`<br>**required** | The name that will be matched with the name of an [`If`](../If/If) command to indicate the block of commands in the if condition. | None - must be specified. |


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/EndIf).


## Troubleshooting ##

## See Also ##

* [`If`](../If/If) command
