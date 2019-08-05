# TSTool / Datastore Reference / ColoradoHydroBaseRest #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)
* [Datastore Configuration File](#datastore-configuration-file)
* [See Also](#see-also)

--------------------

## Overview ##

The State of Colorado’s HydroBase database is the primary database for water data in Colorado.
However, using the HydroBase datastore or input type in TSTool (see the [HydroBase Datastore appendix](../CO-HydroBase/CO-HydroBase.md))
requires a direct connection to the database,
and a local installation of the database may not be available.
The ColoradoHydroBaseRest datastore provides internet REST web service access to historical and real-time data and is described on the following page:

* [Colorado Division of Water Resources REST Web Services Help](https://dnrweb.state.co.us/DWR/DwrApiService/Help)

See also the following useful information for legacy web services that are being replaced by new REST web services:

* Legacy TSTool datastore documentation:
	+ [ColoradoWaterHBGuest Datastore appendix](../ColoradoWaterHBGuest/ColoradoWaterHBGuest.md) - historical data
	+ [ColoradoWaterSMS Datastore appendix](../ColoradoWaterSMS/ColoradoWaterSMS.md) - real-time data

The ColoradoHydroBaseRest datastore uses new DWR HydroBase web services.
It is expected that a number of iterations will be needed to fully implement web services and corresponding
features in TSTool for all HydroBase time series data.
The following time series data types have been enabled in TSTool:

* stations:
	+ real-time (see telemetry stations below)
	+ historical (not yet implemented)
* structures:
	+ diversion total (`DivTotal`)
	+ parcel use time series (not yet implemented)
	+ release total (`RelTotal`)
	+ stage (`Stage`)
	+ water classes (`WaterClass`)
	+ volume (`Volume`)
* telemetry (real-time) stations:
	+ many parameters
+ wells:
	+ well levels (`WaterLevelDepth` and `WaterLevelElev`)

## Web Service to Time Series Mapping ##

Time series data objects in TSTool consist of various properties such as location identifier, and units,
and data arrays for data values and flags.
To populate this data typically requires joining a station's or structure's data with the time series for that location.
The TSTool main interface browsing tool requires a join of information in order to list time series for selection.
Once the data type and interval are picked, specific time series are listed.
The following table summarizes DWR web services, corresponding data types in the datastore,
and equivalent in local HydroBase database datastore direct connection.

| **Web Service**              |**Time Series Data Types**|**TSTool HydroBase Data Type or Comment** |
|--|--|--|
| Administrative Calls         | Currently none.            | Could potentially treat historical calls as time series, but would need special handling.|
| Analysis Services            | Currently none.            | Not currently integrated into TSTool. |
| Dam Safety                   | Currently none.            | Not currently integrated into TSTool. |
| Groundwater Geophysical Logs | Currently none.            | Not currently integrated into TSTool. |
| Groundwater Levels           | See<br><ul><li>***Well - WaterLevelDepth***</li><li>***Well - WaterLevelElev***</li></ul> data type below. | Comparable HydroBase TSIDs are `402930104414301.DWR.WellLevelDepth.Day~ColoradoWaterHBGuest` and `402930104414301.DWR.WellLevelElev.Day~ColoradoWaterHBGuest`.  **Must use point graph to see data points since sparce.**|
| Parcel Use TS                | Need to review.            | Not currently integrated into TSTool, may be implemented in StateDMI software first. |
| Structures                   | See<br><ul><li>***Structure - DivTotal***</li><li>***Structure - RelTotal***</li><li>***Structure - Stage***</li><li>***Structure - WaterClass***</li><li>***Structure - Volume***</li></ul> data type below.| Comparable HydroBase TSIDs are<ul><li>`0300905.DWR.DivTotal.Month~ColoradoWaterHBGuest`</li><li>`0300503.DWR.DivClass-S:6 F:0300934 U:Q T:0 G:.Month~HydroBase`</li><li>`0303732.DWR.ResMeasElev.Day~HydroBase`</li><li>`0303732.DWR.ResMeasStorage.Day~HydroBase`</li>**Note that web services support new water classes with account and `To` coding.  Any water class that includes periods is enclosed in single quotes.** |
| Telemetry Stations           | See<br>***Telemetry Station - Parameter*** data type below. | Real-time stations (satellite monitoring stations). |
| Water Rights                 | Currently none.            | Not currently integrated into TSTool.  Could treat water rights as time series to allow accumulation. |
| Well Permits                 | Currently none.            | Not currently integrated into TSTool. |

Any of the web services can be called using TSTool `WebGet` command, which retrieves the result of a URL and saves to a local file.
If the web service supports CSV, the resulting file can be read using commands such as
[`ReadTableFromDelimitedFile`](../../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md) (table) and
[`ReadDelimitedFile`](../../command-ref/ReadDelimitedFile/ReadDelimitedFile.md) (time series).
Consequently, there is always a way to use the web services, but it is not as tightly integrated into TSTool.

## Standard Time Series Properties ##

The general form of time series identifier used by TSTool is:

```
Location.DataSource.DataType.Interval~DataStoreName
LocType:Location.DataSource.DataType.Interval~DataStoreName
```

The standard time series identifier format for ColoradoHydroBaseRest time series is of the form:

```
Location.DataSource.DataType.Interval~ColoradoHydroBaseRest
LocType:Location.DataSource.DataType.Interval~ColoradoHydroBaseRest
```

The meaning of the parts is as follows:

* The `LoccationType` is used where needed to clarify which location identifier is used,
for example `wellid` for internal database well identifiers and `abbrev` for telemetry stations.
This avoids ambiguity in interpreting identifiers.
* The `Location` is set to one of the following depending on the measurement location type:
	+ the State of Colorado’s water district identifier (WDID) for structures.
	+ the State of Colorado’s abbreviation for telemetered stations
	+ the State of Colorado's numerical identifier for wells (for water level and depth)
* The `DataSource` is set to the providing agency:
	+ For example, `DWR` for diversion data
	+ For example, `USGS` for USGS stream gages
* The `DataType` is set to:
	+ The water class `divrectype` for structure time series
	+ `parameter` for telemetry stations
	+ `WaterLevelDepth` and `WaterLevelElev` for groundwater levels
	+ `Stage` and `Volume` for `structures/divrec/stagevolume` web services
	+ Refer to the [HydroBase datastore appendix](../CO-HydroBase/CO-HydroBase.md) for a full list of time series data available in HydroBase.
	In some cases, the data type used by TSTool will not exactly match HydroBase.
	For example, TSTool uses `ResMeasStorage` and HydroBase uses `ResMeas` to indicate reservoir measurements,
	which can contain several observations.
	The additional “Storage” is needed in TSTool to uniquely identify the time series for the specific data type.
* `Interval` is `Day`, `Month`, or `Year`, as requested, and `15Min` for raw telemetry data.
* The datastore name (`ColoradoHydroBaseRest` by default) indicates that the data
are being read from the ColoradoHydroBaseRest web service.
* For structure diversion records, additional zero values are added to facilitate data use, as follows:
	+ First, the diversion records for the appropriate interval are queried and set in time series
	+ The diversion comments for the structure are queried.
	Any irrigation year (Nov to Oct) where diversion comments are available and have `notUsed` values of `A`, `B`, `C`, or `D` 
	will cause any missing values in the time series for the year to be set to zero and the flag will be set to the `notUsed` value.
	See also the [`FillUsingDiversionComments`](../../command-ref/FillUsingDiversionComments/FillUsingDiversionComments.md) command.
	+ Additionally, any daily and monthly diversion records for start of year (Nov 1) until the end of the year (Oct 1) will be set to
	zero if missing because the State does not fill in zeros at the start of the year.

## Limitations ##

The following limitations of the web service may impact users of the data.

* The REST web services are under development and enhancements continue to be made
as services are integrated with CDSS software tools.
See the [repository issues](https://github.com/OpenCDSS/cdss-lib-dmi-hydrobase-rest-java/issues) for more information,
although additional issues may exist.
* Data type – The goal of the datastore is to provide access to all time series
that are available in HydroBase.  However, data access is limited by features of the
web services.
The legacy [ColoradoWaterHBGuest web services](../ColoradoWaterHBGuest/ColoradoWaterHBGuest.md) and
[HydroBase Datastore](../CO-HydroBase/CO-HydroBase.md) documentation
indicate a complete list of available data types that may ultimately be supported.
Note that creating a complete diversion time series,
in particular for structures that are not frequently measured,
may require considering several data types, including `DivTotal` (total through headgate),
`IDivTotal` (infrequent measurement, not currently implemented in this datastore), and `DivComment` (implemented as default).
The following list of data types does not completely match data that are available in HydroBase,
but additional data types will be enabled when they become available in the web services.
* Time series metadata – some metadata such as units, measurement counts, and location data
currently may not available from the web service.
This information will be displayed as blank in the time series listing.
Additional data will be added as web services are enhanced.
* Water Classes - The REST web services provide water classes using new diversion coding.
The same functionality is not yet implemented in HydroBase direct database connection.
* Roundoff – a comparison of data values read directly from HydroBase and from the web
service may show very slight differences when values are rounded.
This is due to numbers being read and formatted during processing.  The differences should not be large enough to significantly impact final results.
* Performance – time series metadata (lists of location/data type/interval combinations)
are retrievable from the web service by water district, water division, and single entry.
In order for TSTool to provide the user with “drill down”
capability starting with a full list of available data,
it is necessary to request blocks of data from the web service.
However, requesting too large a block results in performance problems
due to the bandwidth necessary to transmit data across the network.
TSTool is designed to utilize caching to store lists of time series metadata,
grouped by water district, data type, and interval. The cache can be populated based on user requests.
Caching will be phased in over time as resources are made available to enhance software.

**<p style="text-align: center;">
List of ColoradoHydroBaseRest Time Series Compared to Previous ColoradoWaterHBGuest Web Services
</p>**

|**ColoradoWaterHBGuest web service data type**|**Available in ColoradoHydroBaseRest web service?**|**Comments**|
|--|--|--|
|`AdminFlow – AdminFlow`|Not yet||
|`Agriculture/GIS – CropAreaAllIrrigation`|Not yet||
|`Agriculture/GIS – CropAreaDrip`|Not yet||
|`Agriculture/GIS – CropAreaFlood`|Not yet||
|`Agriculture/GIS – CropAreaFurrow`|Not yet||
|`Agriculture/GIS – CropAreaSprinkler`|Not yet||
|`Climate – EvapPan`|Not yet||
|`Climate – FrostDate`|Not yet||
|`Climate – Precip`|Not yet||
|`Climate – Snow`|Not yet||
|`Climate – SnowCourseDepth`|Not yet||
|`Climate - SnowCourseSWE`|Not yet||
|`Climate - Solar`|Not yet||
|`Climate – TempMax`|Not yet||
|`Climate – TempMean`|Not yet||
|`Climate - TempMin`|Not yet||
|`Climate – VaporPressure`|Not yet||
|`Climate - Wind`|Not yet||
|`Structure - DivClass`| Yes | Implemented as `WaterClass`|
|`Structure - DivTotal`|Yes| Implemented|
|`Structure - IDivTotal`|Not yet||
|`Structure - RelTotal`|Yes| Implemented|
|`Structure - IRelTotal`|Not yet||
|`Reservoir - ResEOM` – however, no data are returned from the service|Not yet||
|`Reservoir - ResEOY` – however, no data are returned from the service|Not yet||
|`Reservoir - ResMeasElev` – treated as a daily time series with many gaps|Yes||Implemented as `Stage`|
|`Reservoir - ResMeasEvap` – treated as a daily time series with many gaps, not sure if daily is appropriate|Not yet||
|`Reservoir - ResMeasFill` – treated as a daily time series with many gaps, not sure if daily is appropriate|Not yet||
|`Reservoir - ResMeasRelease` – treated as a daily time series with many gaps, not sure if daily is appropriate|Not yet||
|`Reservoir - ResMeasStorage` – treated as a daily time series with many gaps|Yes|Implemented as `Volume`|
|`Stream - Streamflow`|Not yet||
|`Well - WellLevelElev` – treated as a daily time series with many gaps|Yes|Implemented|
|`Well - WellLevelDepth` – treated as a daily time series with many gaps|Yes|Implemented|

**<p style="text-align: center;">
List of ColoradoHydroBaseRest Time Series Compared to Previous ColoradoWaterSMS Web Services
</p>**

|**ColoradoWaterSMS web service data type**|**Available in ColoradoHydroBaseREST web service?**|**Comments**|
|--|--|--|
|Any (for example `DISCHRG`)|Yes|Implemented using telemetry station web services.|

## Datastore Configuration File ##

A datastore is typically configured by one or both of the following options:

1. Enable ColoradoHydroBaseRest datastores in the installation `system/TSTool.cfg` configuration file
and create a datastore configuration file `datastores/HydroBaseWeb.cfg` to configure the datastore.
TSTool is distributed with a default file that does not define the `ApiKey` property.
2. Create a user datastore configuration `.tstool/NN/datastores/HydroBaseWeb.cfg`,
for example by copying and modifying the installation datastore configuation file.
The installation configuration file can be copied and modified.
Typically, the `ApiKey` can be specified to increase the amount of data that can be queried.
If found, this configuration file will override the configuration in option 1.

Configurations are processed at software startup.
An example of the TSTool configuration file is shown below.

```
# Configuration file for TSTool

[TSTool]

ColoradoHydroBaseRestEnabled = true
```

**<p style="text-align: center;">
TSTool Configuration File with ColoradHydroBaseRest Datastore Properties
</p>**

Properties for each datastore are specified in an accompanying configuration file described below.

The following illustrates the ColoradoHydroBaseRest datastore configuration file format
and configures a datastore named `HydroBaseWeb`.
This file is typically copied from installation files to `.tstool/NN/datastores/HydroBaseWeb.cfg`
and edited to provide user-specific API key.
The API Key can be requested from Colorado DWR web services page to increase web service query limits.

```
# Configuration information for "ColoradoHydroBaseRest" web service datastore.
# The user will see the following when interacting with the datastore:
#
# Enabled - True to enable and False to disable the datastore
# Type - must be ColoradoHydroBaseRestDataStore
# Name - datastore identifier used in applications, for example as the
#     input type information for time series identifiers (usually a short string)
# Description - datastore description for reports and user interfaces (short phrase)
# ServiceRootURI - web service root URI, including the server name and root path
# ApiKey - used to control access limits
# ServiceApiDocumentationUri - used to provide access to web service documentation

Enabled = True
Type = "ColoradoHydroBaseRestDataStore"
Name = "HydroBaseWeb"
Description = "Colorado HydroBase REST Web Service"
ServiceRootURI = "https://dwr.state.co.us/rest/get/api/v2"
ApiKey = "thekey..."
ServiceApiDocumentationUri = "https://dwr.state.co.us/rest/get/help"
```

**<p style="text-align: center;">
ColoradoHydroBaseRest Datastore Configuration File
</p>**

## See Also 

* [`FillUsingDiversionComments`](../../command-ref/FillUsingDiversionComments/FillUsingDiversionComments.md) command
* [`ReadColoradoHydroBaseRest`](../../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) command
