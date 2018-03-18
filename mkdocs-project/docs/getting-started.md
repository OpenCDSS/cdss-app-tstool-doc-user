# Learn GeoProcessor / Getting Started #

This page explains how to get started using the GeoProcessor.
It is assumed that the software has been installed as per the [Install GeoProcessor](install) documentation.

The following are basic tasks to use the GeoProcessor:

* [Conceptualize a Workflow](#conceptualize-a-workflow)
* [Create a Command File](#create-a-command-file)
	+ [Best Practices for Command Files](#best-practices-for-command-files)
* [Run the Command File using the GeoProcessor](#run-the-command-file-using-the-geoprocessor)
* [Use the Test Framework Version of the GeoProcessor](#use-the-test-framework-version-of-the-geoprocessor)
* [GeoProcessor Program Options](#geoprocessor-program-options)

---------------

## Conceptualize a Workflow ##

The GeoProcessor is fundamentally a tool for automating spatial data workflows.
Therefore, to define a workflow, it is necessary to first define what work is to be done.
This effort should result in a conceptual workflow.
It is best to conceptualize the workflow without thinking about software limitations.
For example, the following workflow describes a common task:

1. Read in a GeoLayer from a shapefile.
2. Define a region for clipping (for example, state boundary extent).
3. Clip the layer to the region.
4. Write the clipped GeoLayer to a new format, for example GeoJSON.

## Create a Command File ##

Once the conceptual workflow has been determined, corresponding GeoProcessor
commands can be used to do the work by creating a "command file" that can be run by the GeoProcessor.
Refer to the [Command Reference](../command-ref/overview) to learn which
commands to use for specific work tasks.  For example, the following commands
are suitable to perform the above conceptual work tasks:

1. [ReadGeoLayerFromShapefile](http://learn.openwaterfoundation.org/owf-app-geoprocessor-python-doc-user/command-ref/ReadGeoLayerFromShapefile/ReadGeoLayerFromShapefile/)
2. [CreateGeoLayerFromGeometry](http://learn.openwaterfoundation.org/owf-app-geoprocessor-python-doc-user/command-ref/CreateGeoLayerFromGeometry/CreateGeoLayerFromGeometry/)
3. [ClipGeoLayer](http://learn.openwaterfoundation.org/owf-app-geoprocessor-python-doc-user/command-ref/ClipGeoLayer/ClipGeoLayer/)
4. [WriteGeoLayerToGeoJSON](http://learn.openwaterfoundation.org/owf-app-geoprocessor-python-doc-user/command-ref/WriteGeoLayerToGeoJSON/WriteGeoLayerToGeoJSON/)

The GeoProcessor will continue to be enhanced to add new commands as necessary.

The command file can be created with a text editor, with contents similar to those shown below.
In the future, a graphical user interface will be available to edit and run commands.
The following workflow is a simplified version of a
[GeoProcessor test](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/blob/master/test/commands/ClipGeoLayer/test-ClipGeoLayer-linesAsInput.gp).

```
# Read the lines geojson (input GeoLayer) and the polygon geojson (clipping GeoLayer)
ReadGeoLayerFromGeoJSON(SpatialDataFile="data/input_lines.geojson")
ReadGeoLayerFromGeoJSON(SpatialDataFile="data/clipping_polygon.geojson")
# Clip the lines GeoLayerID by the clippling polygon 
ClipGeoLayer(InputGeoLayerID="input_lines", ClippingGeoLayerID="clipping_polygon")
WriteGeoLayerToGeoJSON(GeoLayerID="input_lines_clippedBy_clipping_polygon", OutputFile="results/test-ClipGeoLayer-linesAsInput-out")
```

### Best Practices for Command Files ###

Best practices for command files are:

1. Document command files with sufficient comments.
2. Consider using version control, such as GitHub to track changes to command files.
3. Organize data files logically, for example, put data into a `data` folder.
4. Organize process files logically, for example, if multiple command files are used,
consider creating multiple folders, with numbers to cause the folders to sort in sequential order.
5. Use relative paths for file references, for example `data/somefile` and `../data/somefile`.
The command file folder will be set as the working folder (working directory) when the command file is read.
All other file locations should be specified relative to that folder.
This allows the files to be shared with others without having to change file paths.
6. Name GeoProcessor command files with `.gp` file extension.
7. Use the [`StartLog`](command-ref/StartLog/StartLog) command to troubleshoot.
This creates a local log file that is managed with command file and related files.
The command can be commented out if it significantly slows down processing or creates a large log file.

## Run the Command File Using the GeoProcessor ##

The GeoProcessor is run by using `gp.bat` (Windows) or `gp.sh` (Linux, Cygwin, Git/MinGW Bash).
Run from a command shell.
The `gp` program allows running the GeoProcessor in one of the following modes:

* Batch/automated mode: `gp --commands command-file.gp`
	+ The folder for the command file is set as the working directory (working folder),
	from which relative paths in command files refer.
* Interactive command shell: `gp`
	+ Then use the command `run command-file.gp` to run a command file.
	+ Specify the location of the command file as an absolute path or relative to the folder
	where the program was started.
	+ Use the `printenv` command to print information including the working folder.
* Interactive user interface (UI):  `gp --ui`
	+ **under development**

After running successfully, the output files should have been created.
Errors will be indicated:

* in the command shell window
* the log file created by the [`StartLog`](command-ref/StartLog/StartLog) command, if the command is used
* the default log file found in the `.owf-gp/log` folder in the user's files
	+ `C:\Users\user\.owf-gp\log` on Windows
	+ `/home/user/.owf-gp/log` on Linux
	+ this file is closed when the [`StartLog`](command-ref/StartLog/StartLog) command is run

## Use the Test Framework Version of the GeoProcessor ##

The GeoProcessor includes a test framework, which is used to test the GeoProcessor itself
(see the [Developer Documentation](http://learn.openwaterfoundation.org/owf-app-geoprocessor-python-doc-dev/dev-tasks/#functional-tests)).
The test framework can be used to automate tests for command file workflows.

The normal GeoProcessor run programs (`gp.bat` on Windows and `gp.sh` on Linux) assume that the QGIS software is installed,
and provide full access to geoprocessing commands.
However, the testing framework included in the GeoProcessor is also useful in stand-alone mode without relying on QGIS.
The [installation instructions](install) explain how to install the test framework version
(`gptest.bat` on Windows and `gptest.sh` on Linux)

## GeoProcessor Program Options ##

The GeoProcessor programs recognize the following command line parameters that control how the software runs:

**<p style="text-align: center;">
GeoProcessor Program Options
</p>**

| **Option**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `--commands command-file` | The command file to run. A path relative to current folder can specified or specify an absolute path. | Start the interactive command shell. |
| `-http` | Start the GeoProcessor in HTTP mode. **Under development.**| Start the interactive command shell. |
| `-p PropName=PropVal` | Specify environment property values to be passed to the geoprocessor.  These properties will always be defined when the processor runs. | No environment properties are defined. |
| `-ui` | Start the GeoProcessor user interface. **Under development.**| Start the interactive command shell. |
