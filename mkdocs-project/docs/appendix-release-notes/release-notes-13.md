# TSTool / Release Notes / Version 13 #

* [Changes in Version 13.03.00](#changes-in-version-130300)
* [Changes in Version 13.02.00](#changes-in-version-130200)
* [Changes in Version 13.00.00 - 13.01.00](#changes-in-version-130000-130100)
* [Release notes for all versions](release-notes.md)

----------

## Changes in Versions 13.03.00 ##

* ![bug](bug.png) [13.03.00] Change so that user's `.tstool/NN/system/TSTool.cfg` file
properties are recognized whether or not `[TSTool]` is at the top of the file.
* ![bug](bug.png) [13.03.00] Change the [`RunProgram`](../command-ref/CompareFiles/CompareFiles.md) command
***Visual Diff*** feature to work when files use property in the name.
* ![bug](bug.png) [13.03.00] Update the [`RunProgram`](../command-ref/RunProgram/RunProgram.md) command to work on Linux.
Also add the `EnvVars`, `IfNonZeroExitCode`, `StderrFile`, and `StdoutFile` parameters.
* ![change](change.png) [13.03.00] Lowercase command file extension `tstool` is now included in file selectors and is the default
enforced when saving.  Mixed case `TSTool` extension is still supported.
* ![change](change.png) [13.03.00] Fix a number of issues where table arrays were not cleanly supported.
* ![change](change.png) [13.03.00] Update the [`CompareFiles`](../command-ref/CompareFiles/CompareFiles.md) command to
check the full length of each file when computing the number of different lines.
* ![change](change.png) [13.03.00] Update the [`CompareTimeSeries`](../command-ref/CompareTimeSeries/CompareTimeSeries.md)
command to better support comparing irregular time series,
add `CompareFlags` to control whether data flags are also compared.
* ![change](change.png) [13.03.00] Update the
[`CreateRegressionTestCommandFile`](../command-ref/CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md)
command to support multiple patterns to match files.
* ![change](change.png) [13.03.00] Update the [`NewTable`](../command-ref/NewTable/NewTable.md) command to support arrays.
* ![change](change.png) [13.03.00] Update the [`SetProperty`](../command-ref/SetProperty/SetProperty.md) command to allow math parameters to be specified as properties.
* ![change](change.png) [13.03.00] Update the [`SetTableValues`](../command-ref/SetTableValues/SetTableValues.md) command to
add `Column` and `Value` parameters to set a single column value, useful for complex values such as arrays
* ![change](change.png) [13.03.00] Update the [`Wait`](../command-ref/Wait/Wait.md) command to allow parameters to be specified as properties.
* ![change](change.png) [13.03.00] Update the [`WriteTableToDelimitedFile`](../command-ref/WriteTableToDelimitedFile/WriteTableToDelimitedFile.md)
command parameters to provide more flexibility in controlling the file format and support array columns.
Also enhance performance of the command.
* ![new](new.png) [13.03.00] Add the [`RunR`](../command-ref/RunR/RunR.md) command to run `R` scripts.

## Changes in Versions 13.02.00 ##

* ![change](change.png) [13.02.00] Most menu items now have tooltips that provide additional information to users.
The tooltips will be modified as feedback on their interpretation is received.
* ![change](change.png) [13.02.00] The table command menu ***Manipulate Table Values*** has been resorted to facilitate use,
with commands grouped by column, row, and other manipulation functionality.
* ![change](change.png) [13.02.00] The [`AppendTable`](../command-ref/AppendTable/AppendTable.md) command
has been updated with new `ColumnData` parameter to set constant data on appended rows.
* ![change](change.png) [13.02.00] The [`DeleteTableColumns`](../command-ref/DeleteTableColumns/DeleteTableColumns.md) command
has been updated with new `KeepColumns` parameter to streamline indicating which columns should be deleted.
* ![change](change.png) [13.02.00] The [`DeleteTableRows`](../command-ref/DeleteTableRows/DeleteTableRows.md) command
has been updated with new `Condition` parameter to filter which rows are deleted.
* ![change](change.png) [13.02.00] The [`ReadColoradoHydroBaseRest`](../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md)
command now reads `DivComment` time series, to facilitate troubleshooting diversion records.
The data value is set to zero if no water was taken in a year.
* ![change](change.png) [13.02.00] The [`ReadHydroBase`](../command-ref/ReadHydroBase/ReadHydroBase.md) and
[`ReadColoradoHydroBaseRest`](../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md)
commands have been updated to provide `FillDivRecordsCarryForward` parameter to allow control (rather than default).
The behavior of both commands is consistent in terms of default parameter values.
The `WaterClass` parameter has been added to allow matching a specific water class.
A number of usability issues have also been fixed.
* ![change](change.png) [13.02.00] The [`ReadTableFromDataStore`](../command-ref/ReadTableFromDataStore/ReadTableFromDataStore.md) and
[`RunSql`](../command-ref/RunSql/RunSql.md) commands have been updated to run procedures that have parameters and
set the return status as a property.
Procedures that have the same name with different parameters are not yet handled.
* ![change](change.png) [13.02.00] The [`StartLog`](../command-ref/StartLog/StartLog.md) command
has been updated to write log messages to clarify the hand-off between closed and newly opened log file.
* ![new](new.png) [13.02.00] Add [`RenameTableColumns`](../command-ref/RenameTableColumns/RenameTableColumns.md) command.
* ![new](new.png) [13.02.00] Dialogs related to saving command files have been updated to provide an option to
compare the in-memory (unsaved) command file with latest command file saved to disk.
The ***View / Command File Diff*** tool has been implemented to show differences.
This is useful when deciding whether to save or discard command file edits.

## Changes in Versions 13.00.00 - 13.01.00 ##

* ![remove](remove.png) [13.00.00] Remove RiversideDB datastore built-in features.
The features can be added later as a plugin if necessary.
* ![bug](bug.png) [13.01.01] Fix bug where ***Find Command(s)*** popup menu was not working.
* ![bug](bug.png) [13.01.00] Fix bug where highlighting line on graph by clicking on legend was not working.
* ![bug](bug.png) [13.00.00] Fix bug where StateMod binary files over 2GB could not be read.
* ![bug](bug.png) [13.00.00] Fix bug to allow StateMod time series to have up to 1500 years
in `*.xop` time series files, to support climate change modeling.
* ![change](change.png) [13.01.00] Improve datastore information for HydroBase to facilitate troubleshooting.
* ![change](change.png) [13.01.00] Finish converting Word documentation to online format for remaining commands and datastores.
* ![change](change.png) [13.00.00] Enable open source licenses for software and documentation.
* ![change](change.png) [13.00.00] Migrate to new configuration folders:
	+ Installation files now include `datastores` and `plugins` folders, consistent with user files.
	+ User files are located in under `.tstool/N` folder with `datastores`, `logs`, `plugins`, and `system` folder,
where `N` is the major TSTool version.
	+ Also automatically copy the `command-file-history.txt` file to new major version folder if a new installation.
* ![change](change.png) [13.00.00] Ignore ColoradoWaterHBGuest and ColoradoWaterSMS web service
datastores because the services are no longer available from the State of Colorado.
* ![change](change.png) [13.00.00] Improve the ***Tools / Options*** information to explain TSTool configuration.
* ![change](change.png) [13.00.00] Improve
[`ColoradoHydroBaseRest` web services](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) features:
	+ Display additional information in the time series list.
	+ The query period has been enabled for all supported time series data types.
	+ Time series properties are set for station, structure, and other object data.
	+ The `dataUrl` property is set to allow accessing data on the website.
* ![change](change.png) [13.00.00] Enhance the
[`ManipulateTableString`](../command-ref/ManipulateTableString/ManipulateTableString.md) command
to allow `$` for replace and remove actions using `\$`.
The `$` without escape alone represents end of line, as previously implemented.
* ![change](change.png) [13.00.00] Enhance the
[`WriteTableToGeoJSON`](../command-ref/WriteTableToGeoJSON/WriteTableToGeoJSON.md) command
to specify the GeoJSON version (default is RFC7946) via new `Version` parameter.
Also add the `CoordinatePrecision` parameter to control precision on coordinates and bounding box.
* ![change](change.png) [13.00.00] Enhance the
[`WriteTimeSeriesToGeoJSON`](../command-ref/WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON.md) command
by adding the `CoordinatePrecision` parameter to control precision on coordinates and bounding box.
* ![new](new.png) [13.01.00] Add scripts to streamline creating Linux installer from Windows install.
