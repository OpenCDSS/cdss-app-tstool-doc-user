# Learn GeoProcessor / Command / UnknownCommand #

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

**Need to implement UI.**

## Command Syntax ##

Unrecognized commands in command files are converted to `UnknownCommand` commands.

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/UnknownCommand).

## Troubleshooting ##

## See Also ##

* [BlankCommand](../BlankCommand/BlankCommand) command - used for commands that only contain whitespace
