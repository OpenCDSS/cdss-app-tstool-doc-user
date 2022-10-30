# TSTool / Datastore Reference / NRCS AWDB #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)
* [Datastore Configuration File](#datastore-configuration-file)

-----------

## Overview ##

The NRCS AWDB datastore corresponds to the
[Natural Resources Conservation Service (NRCS) Air and Water Database (AWDB) web service](https://www.nrcs.usda.gov/wps/portal/wcc/home/dataAccessHelp/webService/webServiceReference).

Although the NRCS AWDB web services are largely compatible with TSTool conventions,
there are a number of limitations, which are discussed below.
The web services are implemented using the SOAP protocol and can the tested using the
[web service test tool](https://wcc.sc.egov.usda.gov/awdbWebService/webservice/testwebservice.jsf?webserviceName=/awdbWebService).

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
*   `ElementCode` is assigned from the `StationElement.elementCd` value returned by the `getStationElements` web service method.
*   The interval is assigned from the `StationElement.duration` value returned by the `getStationElements` web service method, as follows:
    +   For hour interval data, the `getHourlyData` web service method is called:
        -   TSID interval is set to `Hour`
    +   For irregular interval data, the `getInstantaneousData` web service method is called:
        -   `Duration.INSTANTANEOUS` translates to TSID Irregular 
        -   The `getInstantaneousData` method is slated to be phased out so hourly data should be used instead.
    +   For day, month, and year interval data, the `getData` web service method is called:
        -   `Duration.DAILY` translates to TSID `Day`
        -   `Duration.MONTHLY` translates to TSID `Month`
        -   `Duration.SEMIMONTHLY` is not supported (could treat as irregular)
        -   `Duration.ANNUAL` translates to TSID `Year`
        -   `Duration.SEASONAL` is not supported (could treat as irregular)
*   `DataStoreName` is the user-defined data store name from the configuration information.
*   Data units are assigned from the `StationElement.storedUnitsCd` value returned by the `getStationElements` web service method.
*   Missing numerical values are internally represented as `NaN` and are assigned to any date/times in the period that do not have values.
*   Data value flags, if encountered, are retained in the time series. 
*   Time series properties are extracted from the `StationMetaData` and `StationElement` (and `ReservoirMetadata` if a reservoir)
    objects and are saved as time series properties.  For example, the station longitude and latitude are assigned from station metadata.
*   The time zone for the data is specified in `StationDataTimeZone` and the station in `StationTimeZone`
    (web service documentation says it is set to same value as station data time zone).
    TSTool does not set the time zone on the time series.  This is being evaluated pending information being provided by the NRCS.

## Limitations ##

NRCS AWDB data store limitations relative to TSTool standard features are as follows:

*   Although the `getStations` web service request allows element codes to be specified for the query,
    the returned list provides only the station triplet, but not the accompanying element.
    Consequently, it is not possible to cross-reference the original request with the returned information.
    Instead, an additional `getStationElements` request must occur using the triplet in order to find matching elements,
    which adds to the query time.  The requested interval also is checked against the available durations.
*   Instantaneous data are handled using the Irregular interval because it is not possible to
    determine from the web service whether returned values are spaced regularly (e.g., `15Min`).
*   All values are returned for instantaneous data,
    even though the web service allows first of day or midnight values to be requested.
*   The `getStationElements` method does not appear to return combinations that include
    `duration=INSTANTANEOUS`, hourly data are not supported, and sometimes null is returned for the duration.
    The work-around that has been implemented detects daily duration data and assumes that
    instantaneous and hourly data are also available in that case.
    This may lead to warnings when instantaneous data are actually not available.
 
## Datastore Configuration File ##

A datastore is configured by enabling NRCS AWDB datastores in the main `TSTool.cfg` configuration file,
and creating a datastore configuration file the datastore.
A configured datastore is distributed with TSTool installation files and should not require additional configuration.
Configurations are processed at software startup.  An example of the TSTool configuration file is shown below.

```
# Configuration file for TSTool

[TSTool]

NrcsAwdbEnabled = true
```
**<p style="text-align: center;">
TSTool Configuration File with NRCS AWDB Datastore Properties
</p>**

Properties for each datastore are specified in an accompanying data store configuration file in the installation files `datastores` folder,
which in the following example configures a data store named `NrcsAwdb`.

```
# Configuration information for NRCS AWDB web service data store.
# Properties are:
#
# Type - must be NrcsAwdbDataStore
# Name - datastore identifier used in applications
# Description - datastore description for reports and user interfaces (short phrase)
# ServiceRootURI - web service root URI, including the server name path to WSDL
# ServiceAPIDocumentationURI - documentation for web service
# ServiceOnlineURI - on-line test tool

Type = "NrcsAwdbDataStore"
Name = "NrcsAwdb"
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
NRCS AWDB Datastore Configuration File
</p>**
