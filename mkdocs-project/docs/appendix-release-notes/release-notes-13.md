# TSTool / Release Notes / Version 13 #

* [Changes in Version 13.02.00](#changes-in-version-130200)
* [Changes in Version 13.00.00 - 13.01.00](#changes-in-version-130000-130100)

----------

## Changes in Versions 13.02.00 ##

* ![change](change.png) [13.02.00] The table ***Manipulate Table Values*** command menu has been resorted to facilitate use,
with commands grouped by column, row, and other manipulation functionality.
* ![change](change.png) [13.02.00] The [`AppendTable`](../command-ref/AppendTable/AppendTable.md) command
has been updated with new `ColumnData` parameter to set constant data on appended rows.
* ![change](change.png) [13.02.00] The [`DeleteTableColumns`](../command-ref/DeleteTableColumns/DeleteTableColumns.md) command
has been updated with new `KeepColumns` parameter to streamline indicating which columns should be deleted.
* ![change](change.png) [13.02.00] The [`DeleteTableRows`](../command-ref/DeleteTableRows/DeleteTableRows.md) command
has been updated with new `Condition` parameter to filter which rows are deleted.
* ![new](new.png) [13.02.00] Add [`RenameTableColumns`](../command-ref/RenameTableColumns/RenameTableColumns.md) command.

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
