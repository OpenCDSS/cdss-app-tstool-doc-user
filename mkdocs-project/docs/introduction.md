# Learn GeoProcessor / Introduction #

This section of the documentation provides background information about the GeoProcessor and
concepts that are used throughout the documentation.

The current GeoProcessor software only runs in batch mode from the command line.
However, an interactive user interface is planned.
Currently, GeoProcessor command files must be edited with a text editor.


* [Need for the GeoProcessor](#need-for-the-geoprocessor)
* [Concepts](#concepts)
	+ [GeoProcessor Commands and Workflows](#geoprocessor-commands-and-workflows)
	+ [GeoProcessor Properties - `${Property}`](#geoprocessor-properties-property)
	+ [Spatial Data Sources and Formats](#spatial-data-sources-and-formats)
	+ [GeoLayer](#geolayer)
* [Alternatives to the GeoProcessor](#alternatives-to-the-geoprocessor)
* [Next Steps](#next-steps)

--------------

## Need for the GeoProcessor ##

The GeoProcessor has been created to meet several needs within the Geographic Information System sector,
and in particular focusing on natural resources and more specifically water resources.

* There is often a need to automate processing of spatial data, ranging from simple to complex tasks.
Existing tools can be complex to understand and may not provide needed functionality.

* There is a need to support "programming" without having to learn a programming language.
The GeoProcessor allows people to program a workflow using pre-built commands that do not
require programming Python or another language.
The GeoProcessor workflow language is "programming by convention" that relies on using
unique identifiers for data objects, and common processing commands.

* There is often a need to share and version control workflows.
GeoProcessor workflows are simple text files that can be shared, for example by email or zip file.
Because workflows are text files, they can also be version-controlled in software such as Git,
and easily viewed on GitHub or other version control cloud platforms.

* There is a need to easily scale processing.
The GeoProcessor is designed to handle large datasets and workflows,
with features to evaluate and troubleshoot performance.

* The cost of commercial software may be a major barrier,
in particular for organizations that use the software on a limited basis.
The GeoProcessor is intended as a production tool for those who use free open source QGIS software.
OWF is also developing an ArcGIS version of the GeoProcessor.

* There is a need for tools that can automate spatial data processing without requiring extensive GIS skills.
The GeoProcessor is designed to present geoprocessing workflows using terminology
that make sense even without extensive GIS experience.

* There is also a need to "normalize" geospatial data processing,
meaning do the same task whether or not QGIS or ArcGIS are used.
The QGIS and ArcGIS versions of the GeoProcessor are being developed to provide the same (or very similar)
functionality using a common command language that can be used with either GIS product.

* There is a need to facilitate testing and validation of workflows.
The GeoProcessor has a built-in functional test feature that allows
workflows used by developers to be the same as for users.
Consequently, testing in different environments is simplified.
This allows the software and workflows to be tested.

## Concepts ##

### GeoProcessor Commands and Workflows ###

The GeoProcessor provides access to spatial data processing tools via processing commands.
The commands are saved in a text command file, which can be edited and resaved.
A command file can be run multiple times to perform the same task on new data.

Each command performs a unit of work and by design the functionality of each command is limited.
This allows commands to be used in various sequences to achieve maximum flexibility.
The commands are documented in the [Command Reference](command-ref/overview)
(see also the list of commands under the Command Reference in the page navigation on the left).

A typical workflow is as follows:

1. Read GeoLayers from one or more sources.
2. Perform geospatial processing and/or analysis on the GeoLayers.
3. Output modified versions of the GeoLayers, and/or other representations of data such as analysis results.

The above simple workflow can be scaled to process large amounts of data.

For example, the following workflow, taken from a
[GeoProcessor test](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/blob/master/test/commands/ClipGeoLayer/test-ClipGeoLayer-linesAsInput.gp),
illustrates how to clip a spatial data layer (GeoLayer) to a boundary:

```
# Read the lines geojson (input GeoLayer) and the polygon geojson (clipping GeoLayer)
ReadGeoLayerFromGeoJSON(SpatialDataFile="data/input_lines.geojson")
ReadGeoLayerFromGeoJSON(SpatialDataFile="data/clipping_polygon.geojson")
# Clip the lines GeoLayerID by the clippling polygon 
ClipGeoLayer(InputGeoLayerID="input_lines", ClippingGeoLayerID="clipping_polygon")
WriteGeoLayerToGeoJSON(GeoLayerID="input_lines_clippedBy_clipping_polygon", OutputFile="results/test-ClipGeoLayer-linesAsInput-out")
```

The syntax of commands is simple and flexible, which allows new commands to be added,
and new parameters to be added to existing commands.

### GeoProcessor Properties - `${Property}` ###

The GeoProcessor maintains a list of general properties that provide useful data such
as the working directory, date/time when processing started, and properties assigned
by commands such as [`SetProperty`](command-ref/SetProperty/SetProperty). 
Some properties are automatically assigned at the start of processing
and others are assigned as commands are run.

GeoProcessor properties can be specified in some command parameters using `${Property}`.
Command documentation will indicate if `${Property}` is supported for a parameter.
The following example illustrates the use of processor properties:

```text
# Simple command file to illustrate processor properties
SetProperty(PropertyName="OutputFolder",PropertyType="str",PropertyValue="C:\SomeDir\SomeOtherDir")
SomeCommand(OutputFile="${OutputFolder}\someFile")
```

Processor properties provide additional flexibility in controlling workflows.
Properties are fundamental to workflow logic commands such as 
by commands such as [`For`](command-ref/For/For) and [`If`](command-ref/If/If). 

### Spatial Data Sources and Formats ###

The GeoProcessor reads spatial data from multiple sources (e.g., files, geodatabases, web services) and
converts the spatial data into in-memory representations.
See the [Spatial Data Format Reference](spatial-format-ref/overview) for more information.

### GeoLayer ###

An important GeoProcessor data object is the GeoLayer, which corresponds to a spatial data layer containing
"features" (geometry or shape data), "attributes" (properties associated with each feature), built-in
layer properties such as coordinate reference system (projection),
and additional properties assigned during processing.
A GeoLayer has the following characteristics:

* The GeoProcessor commands assign unique identifiers to GeoLayers as they are read so that
commands can use the identifiers to access GeoLayers.
See [best practices for GeoLayer identifiers](best-practices/geolayer-identifiers).
* The features in a GeoLayer must be of a single type (e.g., point, line, polygon).
* The GeoLayer has a coordinate reference system corresponding to the units of coordinates
in the features.
* Currently the GeoProcessor only handles vector layers.
The ability to process rasters (grids) may be added in the future.
Much of the existing documentation will apply to the ArcGIS version of the GeoProcessor.

#### GeoLayer Property Format Specifiers ####

Some commands that process GeoLayers allow the parameter values to contain format specifiers
that will be expanded to GeoLayer property values.
This is initially being used to provide functionality to use spatial data layer filename parts in parameter values.
In the future, additional specifiers may be added to process GeoLayer properties.
The following table summarizes format specifiers.
Command documentation will indicate whether format specifiers are supported by the command.

|**Format Specifier**|**Description**|**Example**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|---------------| ------------------|-------|
|`%F`| Filename without leading path.| `example.geojson`|
|`%f`| Filename without leading path and without file extension.| `example`|
|`%P`| Filename with leading path and with file extension.| `C:/Users/user/Desktop/example.geojson`|
|`%p`| Leading path without filename and without file extension.| `C:/Users/user/Desktop`|

## Alternatives to the GeoProcessor ##

Alternatives to the GeoProcessor should be considered where the GeoProcessor does not satisfy requirements.
The goal of the GeoProcessor is to provide significant automated geoprocessing functionality that scales to large workflows. 

* ArcGIS GeoProcessor - OWF is developing an ArcGIS version of the GeoProcessor,
which is envisioned to be very similar to the QGIS version of the GeoProcessor.
More information will be provided in the future.
* [QGIS processing framework](https://docs.qgis.org/2.8/en/docs/user_manual/processing/index.html) - the built-in QGIS workflow environment
* [Esri ArcGIS Model Builder](http://pro.arcgis.com/en/pro-app/help/analysis/geoprocessing/modelbuilder/modelbuilder-tutorial.htm) - the
built-in ArcGIS workflow environment

## Next Steps

The remainder of this documentation describes how to install and use the GeoProcessor software.
