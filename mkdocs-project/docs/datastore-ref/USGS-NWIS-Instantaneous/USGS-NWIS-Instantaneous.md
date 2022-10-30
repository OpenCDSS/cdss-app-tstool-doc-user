# TSTool / Datastore Reference / USGS-NWIS-Instantaneous #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)
* [Datastore Configuration File](#datastore-configuration-file)

------------

## Overview ##
The UsgsNwisInstantaneous datastore corresponds to the
[United States Geological Survey (USGS) National Water Information System (NWIS) instantaneous values web service](https://waterservices.usgs.gov/rest/IV-Service.html).

The following online query page is available for interactive queries:

* [USGS Instantaneous Values Web Service](https://waterservices.usgs.gov/rest/IV-Service.html)

The following online query page is available for interactive queries:

* [USGS Instantaneous Values REST Web Service URL Generation Tool](https://waterservices.usgs.gov/rest/IV-Test-Tool.html)

Although the USGS NWIS services are largely compatible with TSTool conventions,
there are a number of limitations, which are discussed below.

The NWIS instantaneous web service allows data to be retrieved as JavaScript Object Notation (JSON),
tab-delimited (RDB), or WaterML 1.1 (with USGS extensions, called WaterML 1.2).
Each of these formats has features and limitations that are discussed in more detail in other documentation.
The UsgsNwisInstantaneous datastore is used with the
[`ReadUsgsNwisInstantaneous`](../../command-ref/ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous.md)
command and the data files saved by the command are used with the
[`ReadUsgsNwisRdb`](../../command-ref/ReadUsgsNwisRdb/ReadUsgsNwisRdb.md) and
[`ReadWaterML`](../../command-ref/ReadWaterML/ReadWaterML.md) commands.h

## Standard Time Series Properties ##

The standard time series identifier for USGS NWIS instantaneous time series in TSTool is of the form:

```
Location.DataSource.DataType.Interval~DataStoreName
```

More specifically, the identifier adheres to the following convention:

```
SiteNum.AgencyCode.ParameterCode.15Min~DataStoreName
```

where identifier parts are described as follows:

*   The `SiteNum` corresponds to a USGS site.  [The NWIS Mapper](https://maps.waterdata.usgs.gov/mapper/index.html),
    [USGS Site Inventory](https://waterdata.usgs.gov/nwis/inventory) and other
    published information from the USGS can be used to determine site numbers.
*   `AgencyCode` can be blank for USGS sites or is specified from the following list (for example, use `USGS` for the code):
    [agency code list](https://nwis.waterdata.usgs.gov/nwis/help/?read_file=nwis_agency_codes&format=table)
*   `ParameterCode` is taken from the parameter list available from the
    following list:  [parameter code](https://nwis.waterdata.usgs.gov/usa/nwis/pmcodes).
    Ideally a parameter name could be used; however, the list of parameters is extensive,
    descriptions may change, and special characters like the period are used in
    descriptions and would interfere with the TSID convention.
    Consequently, a concise unique parameter name is not readily apparent,
    and the initial implementation uses the numerical parameter code.
    In the future, the text name may be allowed and a prefix may be used to indicate whether a code or name is used.
*   `Interval` defaults to `15Min`.  Date/times that do not align with 15-minute offsets (0, 15, 30, 45)
    are truncated to the nearest 15 minutes and warnings will be generated.
    In the future the datastore may be enhanced to allow the option to return time series in other intervals, including irregular.
*   `DataStoreName` is the user-defined datastore name from the configuration information.
*   Data units are taken from the following:
    +   WaterML `unitCode` in variable element
*   Missing numerical values are internally represented as NaN and are assigned to any date/times in the period that do not have values.
    +   WaterML `noDataValue` in variable element is checked and matching data values are handled as missing
*   Data value flags, if encountered, are retained in the time series.
    However, because the USGS uses `A` for approved, it may be necessary to ignore this flag so that other flags stand out more when visualized.
*   Data value qualifiers definitions are saved with time series and are
    available to use in time series visualization as flag definitions.
*   Properties are extracted from the XML and saved as time series properties.
    For example, the time series property `siteName` is set from the following XML:

```
<ns1:sourceInfo xsi:type="ns1:SiteInfoType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <ns1:siteName>CACHE LA POUDRE RIV AT MO OF CN, NR FT COLLINS, CO</ns1:siteName>
```

## Limitations ##

USGS NWIS datastore limitations relative to TSTool standard features are as follows:

*   Interpretation of USGS data is limited by WaterML limitations, as follows:
    +   WaterML files from NWIS do not indicate the interval of the data.
        A 15-minute interval is assumed for the instantaneous values web service;
        however, trying to read the WaterML file later with
        [`ReadWaterML`](../../command-ref/ReadWaterML/ReadWaterML) will require that the interval is specified.
    +   Some of the descriptions contain units, which may lead to confusion if time series are processed into different units.
*   The USGS web service does not allow for all archived instantaneous values data to be returned.
    Specifying no period returns only the most recent value.
    Start and end dates must be specified to retrieve a longer period; however,
    there is no way to request the entire available period.  Consequently,
    users must request a period of interest for their analysis and the browsing
    features of TSTool cannot list the available period (because doing so would
    require querying all data, which would be very slow).
    The USGS NWIS site web service may be utilized in the future to improve data browsing.

## Datastore Configuration File ##

A datastore is configured by enabling UsgsNwisInstantaneous datastores in the main `TSTool.cfg` configuration file,
and creating a datastore configuration file for each datastore.
Configurations are processed at software startup.
An example of the TSTool configuration file is shown below.
Multiple datastores can be defined.
For NWIS, this would allow, for example, accessing different versions of the web services.

```
# Configuration file for TSTool

[TSTool]

UsgsNwisInstantaneousEnabled = true
```

**<p style="text-align: center;">
TSTool Configuration File with UsgsNwisInstantaneous Datastore Properties
</p>**

Properties for each datastore are specified in an accompanying datastore configuration file (see below).
TSTool installation files include a datastore configuration file for USGS instantaneous data located in the
`datastores` folder, which configures a datastore named “UsgsNwisInstantaneous”.

```
# Configuration information for "UsgsNwisInstantaneous" datastore,
# for instantaneous values.
#
# Properties are:
#
# The user will see the following when interacting with the datastore:
#
# Type - UsgsNwisInstantaneousDataStore (required as indicated)
# Name - datastore identifier used in applications, for example as the
#     input type information for time series identifiers (usually a short string)
# Description - datastore description for reports and user interfaces (short phrase)
# Enabled - whether the datastore is enabled (default=True)
#
# The following are specific to the USGS NWIS instantaneous value datastore:
#
# ServiceRootURI - web service root URI, including the server name and root path
# ServiceAPIDocumentationURI - web service API documentation URI, describing
#     the syntax, input, and output
# ServiceOnlineURI - web service interactive page to query data, typically
#     "drill down" or form based

Type = "UsgsNwisInstantaneousDataStore"
Name = "UsgsNwisInstantaneous"
Description = "USGS NWIS Instantaneous Values Web Service"
Enabled = True
ServiceRootURI = "https://waterservices.usgs.gov/nwis/iv"
ServiceAPIDocumentationURI = "https://waterservices.usgs.gov/rest/IV-Service.html"
ServiceOnlineURI = "https://waterservices.usgs.gov/rest/IV-Test-Tool.html"
```

**<p style="text-align: center;">
UsgsNwisInstantaneous Datastore Configuration File
</p>**
