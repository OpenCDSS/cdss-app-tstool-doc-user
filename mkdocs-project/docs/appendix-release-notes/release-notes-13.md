# TSTool / Release Notes / Version 13 #

* [Changes in Version 13.00.00](#changes-in-version-130000)

----------

## Changes in Version 13.00.00 ##

* ![change](remove.png) [13.00.00] Remove RiversideDB datastore built-in features.
The features can be added later as a plugin if necessary.
* ![change](change.png) [13.00.00] Enable open source licenses for software and documentation.
* ![change](change.png) [13.00.00] Migrate to new user configuration folders under `.tstool` folder:  `datastores`, `logs`, `plugins`, `system`.
Also automatically copy the `command-file-history.txt` file to new version folder if a new installation.
* ![change](change.png) [13.00.00] Ignore ColoradoWaterHBGuest and ColoradoWaterSMS web service
datastores because the services are no longer available from the State of Colorado.
* ![change](change.png) [13.00.00] Enhance StateMod time series to allow up to 1500 years
in `*.xop` time series files.
* ![change](change.png) [13.00.00] Improve the ***Tools / Options*** information to explain TSTool configuration.
* ![change](change.png) [13.00.00] Improve
[`ColoradoHydroBaseRest` web services](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)
to display additional information in the time series list.
The query period has been enabled for all time series.
Time series properties are set for station, structure, and other object data.
The `dataUrl` property is set to allow accessing data on the website.
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
