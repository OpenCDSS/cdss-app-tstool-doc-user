# TSTool / Datastore Reference / NRCS AWDB #

*   [Overview](#overview)
    +   [General Data Handling](#general-data-handling)
    +   [SNOTEL Data Handling](#snotel-data-handling)
    +   [Other Network Data Handling](#other-network-data-handling)
*   [Standard Time Series Properties](#standard-time-series-properties)
*   [Limitations](#limitations)
*   [Datastore Configuration File](#datastore-configuration-file)
    +   [REST API Datastore Configuration File](#rest-api-datastore-configuration-file)
    +   [SOAP API Datastore Configuration File](#soap-api-datastore-configuration-file)

-----------

## Overview ##

The NRCS AWDB datastore corresponds to the Natural Resources Conservation Service (NRCS) Air and Water Database (AWDB) web services.

As of TSTool 15.3.0, support has been added for the REST API.
Prior to this version, only the SOAP API was supported.
Support for the SOAP API will be phased out once the REST API is verified in production use.
See the following resources:

*   [NRCS Snow Survey and Water Supply Forecasting Program](https://www.nrcs.usda.gov/programs-initiatives/sswsf-snow-survey-and-water-supply-forecasting-program?utm_source=chatgpt.com)
*   REST API (latest API):
    +   Air and Water Database Report Generator:
        -   [Report Generator Website](https://wcc.sc.egov.usda.gov/reportGenerator/)
        -   Report Generator Help Guide ([online](https://www.nrcs.usda.gov/sites/default/files/2023-03/Report%20Generator%20Help%20Guide.pdf) | [archived copy](Report-Generator-Help-Guide.pdf))
    +   [Swagger/OpenAPI User interface](https://wcc.sc.egov.usda.gov/awdbRestApi/swagger-ui/index.html)
*   SOAP API (will be phased out):
    +   AWDB Web Service User Guide ([online](https://www.nrcs.usda.gov/sites/default/files/2023-03/AWDB%20Web%20Service%20User%20Guide.pdf) |
        [archived copy](AWDB-Web-Service-User-Guide.pdf))
    +   [Web service test tool](https://wcc.sc.egov.usda.gov/awdbWebService/webservice/testwebservice.jsf?webserviceName=/awdbWebService)

Although the NRCS AWDB web services are largely compatible with TSTool conventions,
there are a number of limitations, which are discussed below.

The following sections provide notes on data handling, based on experience and communications with NRCS AWDB support.

### General Data Handling ###

The following are considerations for general data handling:

*  The period reference (`periodRef`) should generally be specified as `END`.
   The value of `START` was implemented years ago to handle precipitation data but can be confusing.

### SNOTEL Data Handling ###

One of the main uses of the NRCS AWDB API is to provide access to the NRCS SNOTEL dataset, via the `SNTL` network,
which has the following characteristics:

*   SNOTEL station measurements occur hourly, except for a small number of SNOLite (SNOwpack TELemetry-lite) stations,
    which report every four to six hours.
*   SNOTEL hourly station measurements are recorded in Pacific Standard Time (PST) time zone and
    consequently any derived values (e.g., daily) reflect a day spanning midnight to midnight for PST.
    The time zone is indicated by the station data time zone, which is -8 for PST.
    A few stations in Alaska and elsewhere are recorded in station local time zones.
*   The daily snow water equivalent (SWE, WTEQ element) is the midnight value (PST).
    If `periodRef=END` (the default), then, for example, the hourly SWE value measured at `2026-04-28 00:00` is assigned to `2026-04-27`.
    In other words, the midnight-ending value for `2026-04-27` is used for the day,
    consistent with many systems that use interval-ending values.
*   Hourly data are not quality controlled in real-time and may experience fluctuations.
*   The air temperature data is used to estimate if precipitation is snow.
    Issues with the sensor have historically resulted in bias and the `C` quality control flag is used to indicate bias-corrected data.

### Other Network Data Handling ###

The following are notes on data handling for other networks:

*   Datasets from third-party providers typically include only daily and larger interval (duration).
    NRCS datasets may include hourly (e.g., SNOTEL) and instantaneous data.
*   Datasets from third parties use the time zone from the original providers,
    which is often the station local time.
    The time zone may not be indicated in the NRCS AWDB station data time zone.

## Standard Time Series Properties ##

The standard time series identifier for NRCS AWDB time series in TSTool is of the form:

```
Location.DataSource.DataType.Interval~DataStoreName
```

More specifically, the identifier adheres to the following convention:

```
State-StationID.NetworkCode.ElementCode.Hour~DataStoreName 
State-StationID.NetworkCode.ElementCode.Day~DataStoreName
State-StationID.NetworkCode.ElementCode.Month~DataStoreName
State-StationID.NetworkCode.ElementCode.Year~DataStoreName
State-StationID.NetworkCode.ElementCode.Irregular~DataStoreName
```

NRCS water supply forecasts are available as values for a forecast period (e.g., `APR`-`SEP`)
and consequently are returned as a table and not a time series.

Identifier parts and other time series properties are described as follows,
using terms described in the NRCS AWDB web service documentation):

*   The NRCS AWDB uses a “station triplet” to uniquely identify stations,
    using the convention `StationID:State:NetworkCode` (e.g., `471:ID:SNTL`).
    This information is mapped to TSTool conventions as follows:
    +   The state abbreviation forms the first part of the TSID location.
    +   The `StationID` forms the second part of the TSID location, separated from the state with a dash (e.g., `CO-668`).
    +   The `NetworkCode` corresponds to the TSID data source.
*   `ElementCode` is assigned from:
    +   REST API:  station element's element code value returned by the `stations` web service.
    +   SOAP API:  the `StationElement.elementCd` value returned by the `getStationElements` web service method.
*   The interval is assigned from:
    +   REST API: the station element duration value returned by the `stations` web service method, as follows:
        +   For hour, day, month, and year interval data, the `data` web service method is called:
            -   `HOURLY` duration translates to TSID `Hour`
            -   `DAILY` duration translates to TSID `Day`
            -   `MONTHLY` duration translates to TSID `Month`
            -   `SEMIMONTHLY` duration is not supported (could treat as irregular)
            -   `CALENDAR_YEAR` duration translates to TSID `Year` (used by default for time series identifiers or the
                [`ReadNrcsAwdb(OutputYearType="Calendar",...)`](../../command-ref/ReadNrcsAwdb/ReadNrcsAwdb.md) command)
            -   `WATER_YEAR` duration translates to TSID `Year`
                (use the [`ReadNrcsAwdb(OutputYearType="Water",...)`](../../command-ref/ReadNrcsAwdb/ReadNrcsAwdb.md) command)
    +   SOAP API: the `StationElement.duration` value returned by the `getStationElements` web service method, as follows:
        +   For hour interval data, the `getHourlyData` web service method is called:
            -   TSID interval is set to `Hour`
        +   For irregular interval data, the `getInstantaneousData` web service method is called:
            -   `Duration.INSTANTANEOUS` translates to TSID Irregular 
            -   The `getInstantaneousData` method is slated to be phased out so hourly data should be used instead.
        +   For day, month, and year interval data, the `getData` web service method is called:
            -   `Duration.DAILY` duration translates to TSID `Day`
            -   `Duration.MONTHLY` duration translates to TSID `Month`
            -   `Duration.SEMIMONTHLY` duration is not supported (could treat as irregular)
            -   `Duration.ANNUAL` duration translates to TSID `Year` (calendar by default but may implicitly use water year for some data)
            -   `Duration.SEASONAL` duration is not supported (could treat as irregular)
*   `DataStoreName` is the user-defined datastore name from the configuration information.
*   Data units are assigned from:
    +   REST API:  the station element `storedUnitCode` value returned by the `stations` web service
    +   SOAP API:  the `StationElement.storedUnitsCd` value returned by the `getStationElements` web service method
*   Missing numerical values are internally represented as `NaN` and are assigned to any date/times in the period that do not have values.
*   Data value flags, if encountered, are retained in the time series:
    +   REST API:  concatenate `qcFlag` and `qaFlag` with a separating comma
    +   SOAP API:  use the flag returned for the value
*   Time series properties are extracted from:
    +   REST API: the station metadata from `stationElement`, `reservoirMetadata` (if a reservoir), and `forecastPoint` (if a forecast point station)
        objects and are saved as time series properties.  For example, the station longitude and latitude are assigned from station metadata.
    +   SOAP API: the `StationMetaData` and `StationElement` (and `ReservoirMetadata` if a reservoir)
        objects and are saved as time series properties.  For example, the station longitude and latitude are assigned from station metadata.
*   The time zone for the period from:
    +   REST API:
        -   see the [SNOTEL Data Handling](#snotel-data-handling) for information
        -   TSTool by default does not set the time zone in returned data,
            but can use the [`ReadNrcsAwdb(TimeZoneMap=...)`](../../command-ref/ReadNrcsAwdb/ReadNrcsAwdb.md) command parameter to assign the output time zone
    +   SOAP API:
        -   specified in `StationDataTimeZone` and the station in `StationTimeZone`
            (web service documentation says it is set to same value as station data time zone).
        -   TSTool sets the time zone using format `GMT-8.0`

## Limitations ##

NRCS AWDB data store limitations relative to TSTool standard features are as follows:

*   REST API:
    +   The API now allows queries for a duration of `CALENDAR_YEAR` and `WATER_YEAR`.
        The latter spans October 1 of the previous year to September 30 of the data year.
        This provides more control than the SOAP API, which provided only the `ANNUAL` duration with implied output year type.
        TSID commands default to `CALENDAR_YEAR` for interval of `Year`.
        Use the [`ReadNrcsAwdb(OutputYearType=...)`](../../command-ref/ReadNrcsAwdb/ReadNrcsAwdb.md) command to provide more control.
    +   The `data` service provides the `periodRef` query parameter to control whether the `date` for data
        represents the start or the end of the interval.
        For example, for monthly data, `periodRef=START` returns January 1 and
        `periodRef=END` returns January 31.
        For annual values, `periodRef=START` returns the date of the first day of the first month of the water year (in the previous year)
        and `periodRef=END` returns the date of the last day in the ending month of the water year).
        Consequently, TSTool uses `periodRef=END` for all requests by default.
    *   The `heightDepth` value in `stationElements` indicates the height of an atmospheric sensor or depth of a soil sensor to uniquely identify the sensor,
        and can be null if not used.
        If multiple sensors exist at a station that have the same element code,
        the `heightDepth` may be needed to uniquely identify the sensor.
        Additionally, the `ordinal` is used if there is no `heightDepth` value and multiple senors of the same element code are found.
        TSTool does not currently handle such cases and expects a single time series to be returned for a station triplet.
    *   More changes to support the REST API will be implemented in the future, as necessary.
    *   The forecasts have an "issue date" whereas for the SOAP API a "calculation date" was provided.
*   SOAP API:
    +   Although the `getStations` web service request allows element codes to be specified for the query,
        the returned list provides only the station triplet, but not the accompanying element.
        Consequently, it is not possible to cross-reference the original request with the returned information.
        Instead, an additional `getStationElements` request must occur using the triplet in order to find matching elements,
        which adds to the query time.  The requested interval also is checked against the available durations.
    +   Instantaneous data are handled using the Irregular interval because it is not possible to
        determine from the web service whether returned values are spaced regularly (e.g., `15Min`).
    +   All values are returned for instantaneous data,
        even though the web service allows first of day or midnight values to be requested.
    +   The `getStationElements` method does not appear to return combinations that include
        `duration=INSTANTANEOUS`, hourly data are not supported, and sometimes null is returned for the duration.
        The work-around that has been implemented detects daily duration data and assumes that
        instantaneous and hourly data are also available in that case.
        This may lead to warnings when instantaneous data are actually not available.
 
## Datastore Configuration File ##

A datastore is configured by enabling NRCS AWDB datastores in the `TSTool.cfg` configuration file (enabled by default),
and creating a datastore configuration file the datastore.
A configured datastore is distributed with TSTool installation files and should not require additional configuration.
Configurations are processed at software startup.  An example of the TSTool configuration file is shown below.

The following `TSTool.cfg` configuration file setting is used to enable NRCS AWDB REST and SOAP web services.

```
# Configuration file for TSTool

[TSTool]

NrcsAwdbEnabled = true
```
**<p style="text-align: center;">
TSTool Configuration File with NRCS AWDB Property
</p>**

### REST API Datastore Configuration File ###

Properties for each datastore are specified in an accompanying datastore configuration file
in the software installation files `datastores` folder,
which in the following example configures a datastore named `NrcsAwdb`.
A datastore file in the user's files will overwrite the built-in configuration,
for example if the datastore needs to be disabled.

```
# Configuration information for NRCS AWDB REST web service API datastore.
#
# Properties are:
#
# Type - must be NrcsAwdbRestApiDataStore
# Name - datastore identifier used in applications
# Description - datastore description for reports and user interfaces (short phrase)
# ServiceRootUrl - web service root URI
# ServiceApiDocumentationUrl - documentation for web service
# ServiceOnlineUrl - on-line test tool

#Enabled = False
Type = "NrcsAwdbRestApiDataStore"
Name = "NrcsAwdb"
Description = "NRCS AWDB REST API Web Service"
ServiceRootUrl = "https://wcc.sc.egov.usda.gov/awdbRestApi/services/v1/"
ServiceApiDocumentationUrl = "https://wcc.sc.egov.usda.gov/awdbRestApi/swagger-ui/index.html"
ServiceOnlineUrl = "https://wcc.sc.egov.usda.gov/awdbRestApi/swagger-ui/index.html"
```

**<p style="text-align: center;">
NRCS AWDB REST API Datastore Configuration File
</p>**

Configuration file properties are described in the following table.

**<p style="text-align: center;">
Datastore Configuration File Properties (alphabetized - see example for typical order)
</p>**

| **Property**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default** |
| -- | -- | -- |
| `Debug` | Whether debug should be enabled, `True` or `False`. | `False` |
| `Description` | Description for the datastore. | |
| `Enabled` | Whether the datastore is enabled for use, `True` or `False`. | `True` |
| `Name` <br>**required**| Datastore name, which should use letters, numbers, underscore, and dash, should not use spaces. The name will be used in commands that specify a datastore. | |
| `ServiceApiDocumentationUrl` | The URL for the online documentation. | |
| `ServiceOnlineUrl` | The URL for the online query builder tool. | |
| `ServiceRootUrl`<br>**required** | The root URL for the web service, to which specific service endpoints will be appended. | |
| `Type`<br>**required** | Must be `NrcsAwdbRestApiDataStore`. | None - must be specified. |

### SOAP API Datastore Configuration File ###

Properties for each datastore are specified in an accompanying data store configuration file in the software installation files `datastores` folder,
which in the following example configures a datastore named `NrcsAwdbSoap`.
A datastore file in the user's files will overwrite the built-in configuration,
for example if the datastore needs to be disabled.

```
# Configuration information for NRCS AWDB SOAP API web service datastore.
# Properties are:
#
# Type - must be NrcsAwdbDataStore
# Name - datastore identifier used in applications
# Description - datastore description for reports and user interfaces (short phrase)
# ServiceRootURI - web service root URI, including the server name path to WSDL
# ServiceAPIDocumentationURI - documentation for web service
# ServiceOnlineURI - on-line test tool

Type = "NrcsAwdbDataStore"
Name = "NrcsAwdbSoap"
Description = "NRCS AWDB Web Service"
ServiceRootURI = "https://wcc.sc.egov.usda.gov/awdbWebService/services?WSDL"
ServiceAPIDocumentationURI = "https://www.nrcs.usda.gov/wps/portal/wcc/home/dataAccessHelp/webService/webServiceReference"
ServiceOnlineURI = "https://www.wcc.nrcs.usda.gov/awdbWebService"
# Timeout in seconds for web service connections and receipt of read data.
# The default is no timeout, which may lead to TSTool hanging.
ConnectTimeout = 900
ReadTimeout = 900
```

**<p style="text-align: center;">
NRCS AWDB SOAP API Datastore Configuration File
</p>**
