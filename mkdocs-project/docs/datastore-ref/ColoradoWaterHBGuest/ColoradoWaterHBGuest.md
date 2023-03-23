# TSTool / Datastore Reference / ColoradoWaterHBGuest #

*   [Overview](#overview)
*   [Standard Time Series Properties](#standard-time-series-properties)
*   [Limitations](#limitations)
*   [Datastore Configuration File](#datastore-configuration-file)

--------------------

## Overview ##

**These web services are obsolete and are no longer publicly available.
This documentation will be retained during the transition to new web services.
Instead, use the [Colorado HydroBase REST web services](../ColoradoHydroBaseRest/ColoradoHydroBaseRest.md).
Associated links may be broken.**

The State of Colorado’s HydroBase database is the primary database for water data in Colorado.
However, using the HydroBase datastore or input type in TSTool (see the [HydroBase Datastore appendix](../CO-HydroBase/CO-HydroBase.md)
requires a direct connection to the database,
and a local installation of the database may not be available.
The ColoradoWaterHBGuest datastore provides internet web service access to historical data and is described here:

*   [Colorado HBGuest Web Service Documentation](http://www.dwr.state.co.us/HBGuest/Documents/ColoradoHBGuestWebService.pdf)
*   [HBGuest Web Service Data Dictionary](http://www.dwr.state.co.us/HBGuest/Documents/HBGuestWebService Objects.pdf)
*   [HBGuest Web Services landing page](http://www.dwr.state.co.us/HBGuest/default.aspx)

The ColoradoWaterHBGuest datastore provides access to many HydroBase time series
that are available via the web service, but currently there are some limitations (see below).

The ColoradoWaterSMS datastore (see the [Colorado Water SMS Datastore appendix](../ColoradoWaterSMS/ColoradoWaterSMS.md)
provides access to real-time data using a web service.

## Standard Time Series Properties ##

The standard time series identifier format for ColoradoWaterHBGuest time series is of the form:

```
Location.DataSource.DataType.Interval~DataStoreName
```

The meaning of the parts is as follows:

*   The `Location` is set to the State of Colorado’s water district identifier (WDID) for structures.
*   The `DataSource` is set to the providing agency (e.g., `DWR` for diversion data).
*   The `DataType` is set to the “measurement type” described in the State’s web service
    documentation (e.g., `DivTotal` for total diversions through a structure).
    Refer to the HydroBase Input Type appendix for a full list of time series data available in HydroBase.
    In some cases, the data type used by TSTool will not exactly match HydroBase.
    For example, TSTool uses `ResMeasStorage` and HydroBase uses `ResMeas` to indicate reservoir measurements,
    which can contain several observations.
    The additional “Storage” is needed in TSTool to uniquely identify the time series for the specific data type.
*   `Interval` is `Day`, `Month`, or `Year`, as requested.
    The interval string is converted from HydroBase conventions of `Daily`, `Monthly`, `Annual`,
    and `Random` (monthly and annual diversion data are stored together in HydroBase and are identified as Annual data).
    Real-time data can be retrieved using the [ColoradoWaterSMS datastore](../ColoradoWaterSMS/ColoradoWaterSMS.md).
*   The datastore name (`ColoradoWaterHBGuest` by default) indicates that the data
    are being read from the ColoradoWaterHBGuest web service.

## Limitations ##

The following limitations of the web service may impact users of the data.

*   Data type – the following data types have been implemented, for all available intervals.
    Additional data types will be supported in the future (see the
    [HydroBase Datastore appendix](../CO-HydroBase/CO-HydroBase.md)
    for a complete list of available data types).
    Note that creating a complete diversion time series,
    in particular for structures that are not frequently measured,
    may require considering several data types, including `DivTotal` (total through headgate),
    `IDivTotal` (infrequent measurement), and `DivComment` (indicates when ditches are out of service,
    not currently implemented in this datastore).
    The following list of data types does not completely match data that are available in HydroBase,
    but additional data types will be enabled when they become available in the web services.
    +   `AdminFlow – AdminFlow`
    +   `Agriculture/GIS – CropAreaAllIrrigation`
    +   `Agriculture/GIS – CropAreaDrip`
    +   `Agriculture/GIS – CropAreaFlood`
    +   `Agriculture/GIS – CropAreaFurrow`
    +   `Agriculture/GIS – CropAreaSprinkler`
    +   `Climate – EvapPan`
    +   `Climate – FrostDate`
    +   `Climate – Precip`
    +   `Climate – Snow`
    +   `Climate – SnowCourseDepth`
    +   `Climate - SnowCourseSWE`
    +   `Climate - Solar`
    +   `Climate – TempMax`
    +   `Climate – TempMean`
    +   `Climate - TempMin`
    +   `Climate – VaporPressure`
    +   `Climate - Wind`
    +   `Diversion - DivTotal`
    +   `Diversion - IDivTotal`
    +   `Reservoir - RelTotal`
    +   `Reservoir - IRelTotal`
    +   `Reservoir - ResEOM` – however, no data are returned from the service
    +   `Reservoir - ResEOY` – however, no data are returned from the service
    +   `Reservoir - ResMeasElev` – treated as a daily time series with many gaps
    +   `Reservoir - ResMeasEvap` – treated as a daily time series with many gaps, not sure if daily is appropriate
    +   `Reservoir - ResMeasFill` – treated as a daily time series with many gaps, not sure if daily is appropriate
    +   `Reservoir - ResMeasRelease` – treated as a daily time series with many gaps, not sure if daily is appropriate
    +   `Reservoir - ResMeasStorage` – treated as a daily time series with many gaps
    +   `Stream - Streamflow`
    +   `Well - WellLevelElev` – treated as a daily time series with many gaps
    +     `Well - WellLevelDepth` – treated as a daily time series with many gaps
*   Time series metadata – some metadata such as units and measurement counts
    currently may not available from the web service.
    This information will be displayed as blank in the time series listing.
*   Roundoff – a comparison of data values read directly from HydroBase and from the web
    service may show very slight differences when values are rounded.
    This is due to numbers being read and formatted during processing.  The differences should not be large enough to significantly impact final results.
*   Performance – time series metadata (lists of location/data type/interval combinations)
    are retrievable from the web service by water district, water division, and single entry.
    In order for TSTool to provide the user with “drill down”
    capability starting with a full list of available data,
    it is necessary to request blocks of data from the web service.
    However, requesting too large a block results in performance problems
    due to the bandwidth necessary to transmit data across the network.
    Consequently, TSTool utilizes caching to store lists of time series metadata,
    grouped by water district, data type, and interval. The cache is populated based on user requests.
    Consequently, the first time that data are requested for a district,
    performance will be slower while the data are retrieved.
    Subsequent listing of the time series should be fast.
    Time series data are not currently cached and therefore there may be noticeable slowing for large queries.
    Additional optimization of data transfer will be evaluated as web service use increases.

## Datastore Configuration File ##

A datastore is configured by enabling ColoradoWaterHBGuest datastores in the main `TSTool.cfg` configuration file,
and creating a datastore configuration file for each datastore connection.
Configurations are processed at software startup.
An example of the TSTool configuration file is shown below.
Multiple datastores can be defined using the `[DataStore:DataStoreName]` syntax.
For ColoradoWaterHBGuest, this would allow, for example, accessing different versions of the web services.

```
# Configuration file for TSTool

[TSTool]
ColoradoWaterHBGuestEnabled = true

# Datastore for Colorado Water SMS web service (active if ColoradoWaterHBGuestEnabled=true above)
[DataStore:ColoradoWaterHBGuest]
ConfigFile = "ColoradoWaterHBGuest.cfg"
```

**<p style="text-align: center;">
TSTool Configuration File with ColoradWaterHBGuest Datastore Properties
</p>**

Properties for each datastore are specified in an accompanying configuration file described below.

The following illustrates the ColoradoWaterHBGuest datastore configuration file format,
which in this example is located in the same folder as the TSTool
configuration file and configures a datastore named `ColoradoWaterHBGuest`.

```
# Configuration information for "ColoradoWaterHBGuest" web service datastore.
# Properties are:
#
# The user will see the following when interacting with the datastore:
#
# Name - datastore identifier used in applications, for example as the
#     input type information for time series identifiers (usually a short string)
# Description - datastore description for reports and user interfaces (short phrase)
# ServiceRootURI - web service root URI, including the server name and root path

Type = "ColoradoWaterHBGuestDataStore"
Name = "ColoradoWaterHBGuest"
Description = "Colorado HydroBase Guest Web Service"
ServiceRootURI = "http://www.dwr.state.co.us/HBGuest/HBGuestWebService.asmx?WSDL"
```

**<p style="text-align: center;">
ColoradoWaterHBGuest Datastore Configuration File
</p>**
