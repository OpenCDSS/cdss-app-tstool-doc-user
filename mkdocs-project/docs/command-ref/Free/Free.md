# Learn GeoProcessor / Command / FreeGeoLayers #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `FreeGeoLayers` command removes one or more [GeoLayers](../../introduction#geolayer) from the GeoProcessor. 

* This command is used to save processing time and memory. 

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
FreeGeoLayers(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `GeoLayerIDs` <br>  **_required_**| A comma-separated list of the IDs of the GeoLayers to free. <br><br> Can also be `*` where all GeoLayers registered within the GeoProcessor are removed.| None - must be specified. |


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/FreeGeoLayers).

The following GeoLayer data are used in the example[^1]. 
[^1]: The example assume that the GeoLayers have *already* been read into the GeoProcessor with the [ReadGeoLayerFromGeoJSON](../ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) command.

**<p style="text-align: left;">
Example GeoLayer Data
</p>**

|GeoLayer ID|
| ---- | 
| ExampleGeoLayer1  |
| ExampleGeoLayer2	| 
| ExampleGeoLayer3 	|

### Example 1: Free GeoLayers###

```
FreeGeoLayers(GeoLayerIDs = "ExampleGeoLayer2, ExampleGeoLayer3")
```

After running the command, the following GeoLayer IDs are registered within the GeoProcessor. 

|GeoLayer ID|
| ---- |
| ExampleGeoLayer1  |


## Troubleshooting ##

## See Also ##
