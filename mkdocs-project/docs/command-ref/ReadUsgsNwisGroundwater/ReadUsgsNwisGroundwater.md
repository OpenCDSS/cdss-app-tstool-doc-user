# TSTool / Command / ReadUsgsNwisGroundwater #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `ReadUsgsNwisGroundwater` command reads one or more time series from the
United States Geological Survey (USGS) National Water Information System (NWIS) groundwater web service.
See the [UsgsNwisGroundwater Datastore Appendix](../../datastore-ref/USGS-NWIS-Groundwater/USGS-NWIS-Groundwater.md)).
The USGS data are historical manually recorded values and data may be sparse over the full period.
The command provides parameters to constrain the web service query and also
allows the result to be saved as an output file.
For example, if WaterML is chosen as the time series format,
a WaterML file can be saved and can be read later using the
[`ReadWaterML`](../ReadWaterML/ReadWaterML.md) command.
See also the [`WebGet`](../WebGet/WebGet.md) command,
which can be used to retrieve data files from the USGS website.

The USGS NWIS web service allows well and time series data type information to be filtered,
both as a convenience and to ensure reasonable web service performance.
Many of the choices that are available for limiting queries allow 0+ values to be provided.
For example, specifying no requested parameter will return all available parameters for a location.
Specifying a list of parameters (separated by commas) will return only the requested parameters.

USGS codes are used in order to generate a unique time series identifier (TSID).
For example, the TSID data type is formed from the parameter code.
The numerical codes currently are used to ensure uniqueness but in the future the string name may be allowed as an option.
In order to have more human-friendly identifiers for time series,
one strategy is to request only a specific parameter and then use the alias to specify a text equivalent to the numeric codes.
For example, specify `Parameters=72019` (for depth to water level) and assign the alias with `Alias=%L.WaterLevel`.

Although the NWIS groundwater web service may return date/times with precision to minute,
this command treats all data as daily values and returns a daily time series.
The daily interval time series therefore may have many missing values,
but often is easier to process with other TSTool commands.
In the future, the command may be updated to allow the option of returning other data intervals,
including irregular (which would have only non-missing values
but typically must be converted to a regular interval to use with other commands). 

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Read Time Series***

The following dialog is used to edit the command and illustrates the syntax.
Some choices are provided as a convenience.
However, full listing of choices (such as all the thousands of wells that are available)
is not provided due to performance issues.
Additional query features will be enabled as web service integration is enhanced.

**<p style="text-align: center;">
![ReadUsgsNwisGroundwater command editor](ReadUsgsNwisGroundwater.png)
</p>**

**<p style="text-align: center;">
`ReadUsgsNwisGroundwater` Command Editor (<a href="../ReadUsgsNwisGroundwater.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadUsgsNwisGroundwater(Parameter="Value",...)
```

**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`Sites`|A list of site numbers to read, separated by commas.  Can be specified using `${Property}` syntax.|None – one of the locational parameters must be provided to constrain the query.|
|`States`|A list of state codes (e.g., AL), separated by commas.  Can be specified using `${Property}` syntax.|None – see above.|
|`HUCs`|A list of hydrologic unit codes, separated by commas.  See the limitations on the NWIS site for more information.  Can be specified using `${Property}` syntax.|None – see above.|
|`BoundingBox`|A bounding box consisting of west longitude, south latitude, east longitude, and north latitude, separated by spaces.  Longitudes in the western hemisphere are negative.  Can be specified using `${Property}` syntax.|None – see above.|
|`Counties`|A list of Federal Information Processing Standards (FIPS) county codes, separated by commas.  Can be specified using `${Property}` syntax.|None – see above.|
|`Parameters`|Data parameter codes for the stations (e.g., `00060` for stream discharge), separated by commas.  Can be specified using `${Property}` syntax.|All available parameters are returned.|
|`Statistics`|Statistic codes (e.g., `00003` for mean), separated by commas.  Can be specified using `${Property}` syntax.|All available statistics are returned.|
|`SiteStatus`|Filter for stations, one of:<ul><li>`All` – all stations are returned</li><li>`Active` – only active stations are returned</li><li>`Inactive` – only inactive stations are returned</li></ul>|`All`|
|`SiteTypes`|Site types to return, separated by commas.  Can be specified using `${Property}` syntax.|All available site types are returned.|
|`Agency`|Agency code to return (e.g., USGS).  Can be specified using `${Property}` syntax.|All available agencies are returned.|
|`Interval`|The interval to use for the created time series.  Groundwater measurements in NWIS may be recorded for the day or may have more precise date/time.  Using an interval of Day results in a regular interval time series that is easier to process by other commands, but may not be suitable when values change significantly within a day.|None – must be specified.|
|`InputStart`|The start of the period to read data – specify if the period should be different from the global query period.  Can be specified using `${Property}` syntax.|Use the global query period.|
|`InputEnd`|The end of the period to read data – specify if the period should be different from the global query period.  Can be specified using `${Property}` syntax.|Use the global query period.|
|`Alias`|The alias to assign to the time series, as a literal string or using the special formatting characters listed by the command editor.  The alias is a short identifier used by other commands to locate time series for processing, as an alternative to the time series identifier (`TSID`).|None – must be specified.|
|`Format`|The data format for output, one of:<ul><li>`JSON` – JavaScript Object Notation (currently used only for downloads but will not result in time series in TSTool)</li><li>`RDB` – tab-delimited format (also see [`ReadUsgsNwisRdb`](../ReadUsgsNwisRdb/ReadUsgsNwisRdb.md) command; currently used only for downloads but will not result in time series in TSTool).</li><li>`WaterML` – XML format (also see the [`ReadWaterML`](../ReadWaterML/ReadWaterML.md) command).</li></ul>|`WaterML`|
|`OutputFile`|The name of the output file to create.  The path to the file can be absolute or relative to the working directory.  Can be specified using `${Property}` syntax.|No output file will be created.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/ReadUsgsNwisGroundwater).

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`ReadUsgsNwisDaily`](../ReadUsgsNwisDaily/ReadUsgsNwisDaily.md) command
*   [`ReadUsgsNwisInstantaneous`](../ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous.md) command
*   [`ReadUsgsNwisRdb`](../ReadUsgsNwisRdb/ReadUsgsNwisRdb.md) command
*   [`ReadWaterML`](../ReadWaterML/ReadWaterML.md) command
*   [`WebGet`](../WebGet/WebGet.md) command
