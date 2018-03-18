# Learn GeoProcessor / Command / SetPropertyFromGeoLayer #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `SetPropertyFromGeoLayer` command sets the value of a property used by the processor,
by using the value of a GeoLayer property.
The property will be available to subsequent commands that support using `${Property}` notation in
parameters, for example to specify filenames more dynamically or use with `If` commands. This
command should not be confused with the `SetGeoLayerProperty` command, which sets a
property on specific GeoLayer.

In the future, command parameters may be added to handle the case when a GeoLayer property is not found.
Currently, the command will fail in this case.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
SetPropertyFromGeoLayer(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| -----------------------|--------------------------------------------------------|-------------------------- |
| `GeoLayerID`           | The GeoLayer Identifier, can use `${Property}` syntax. | None - must be specified. |
| `GeoLayerPropertyName` | The name of the GeoLayer property.                     | None - must be specified. |
| `PropertyName`         | The GeoProcessor property name.                        | None - must be specified. |

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/SetPropertyFromGeoLayer).

## Troubleshooting ##

## See Also ##

* [SetProperty](../SetProperty/SetProperty) command
* [SetGeoLayerProperty](../SetGeoLayerProperty/SetGeoLayerProperty) command
