# TSTool / Command / UnknownCommand #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `UnknownCommand` is used to store commands that are not recognized as valid commands.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.
<a href="../UnknownCommand.png">See also the full-size image.</a>

![UnknownCommand](UnknownCommand.png)

**<p style="text-align: center;">
`UnknownCommand` Command Editor
</p>**

## Command Syntax ##

Unrecognized commands in command files are converted to `UnknownCommand` commands.

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/UnknownCommand).

## Troubleshooting ##

## See Also ##

* [`Empty`](../Empty/Empty) command - used for commands that only contain an empty line
