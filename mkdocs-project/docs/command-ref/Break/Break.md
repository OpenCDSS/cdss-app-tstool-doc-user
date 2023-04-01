# TSTool / Command / Break #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `Break` command causes logic to jump out of the current [`For`](../For/For.md) loop block.
It is typically enclosed in an [`If`](../If/If.md) block.
Logic will continue with the command after the corresponding [`EndFor`](../EndFor/EndFor.md) command.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / General - Running and Properties***

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![Break command editor](Break.png)
</p>**

**<p style="text-align: center;">
`Break` Command Editor (<a href="../Break.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
Break()
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| None | Currently the command does not use any parameters. |  |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/Break).

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`Continue`](../Continue/Continue.md) command
*   [`EndFor`](../EndFor/EndFor.md) command
*   [`For`](../For/For.md) command
*   [`If`](../If/If.md) command
