# TSTool / Datastore Reference / WaterOneFlow #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)

--------------

## Overview ##

**Support for WaterOneFlow was developed as a prototype but is not used in production.
The datastore needs to be updated to support WaterML 1.1 (or later) services.
This documentation is retained for reference purposes.**

The WaterOneFlow data store corresponds to the web service specification
developed by the Consortium of Universities for the Advancement of Hydrologic Science, Inc.
(CUAHSI) as part of the Hydrologic Information System (HIS).
Access to web service documentation, registry,
and other information are available at the following link:

[https://his.cuahsi.org/wofws.html](https://his.cuahsi.org/wofws.html)

The WaterOneFlow web services are implemented using SOAP technologies.
A Java API has been generated using the Web Services Description Language (WSDL) file:

[http://river.sdsc.edu/waterOneFlow/NWIS/DailyValues.asmx?WSDL](http://river.sdsc.edu/waterOneFlow/NWIS/DailyValues.asmx?WSDL)

This Java API is used for all interactions with version 1.0 WaterOneFlow web services.
WaterOneFlow/HIS 1.0 uses WaterML 1.0 to return time series data in the SOAP response.
The Java API reads the data elements from the WaterML content in order
to allow transfer of the data to internal time series properties and data values.
Other web services supported by TSTool, such as the [UsgsNwisDaily datastore](../USGS-NWIS-Daily/USGS-NWIS-Daily.md),
use WaterML as the transport format.

The version of WaterOneFlow and the corresponding WaterML are important
because the internal API used to read the web services must be compatible.
See the [`ReadWaterML`](../../command-ref/ReadWaterML/ReadWaterML.md) and
[`ReadWaterML2`](../../command-ref/ReadWaterML2/ReadWaterML2.md) commands,
which read different versions of WaterML.

A WaterOneFlow data store is configured by specifying the location of
a web service root URL (see section on configuration below).
A registry of WaterOneFlow WaterML services can be found at the following location:

[https://hiscentral.cuahsi.org/pub_services.aspx](https://hiscentral.cuahsi.org/pub_services.aspx)

To select a version 1.0 WSDL, review the URL for the WSDL (e.g.,
[http://river.sdsc.edu/wateroneflow/EPA/cuahsi_1_0.asmx?WSDL)](http://river.sdsc.edu/wateroneflow/EPA/cuahsi_1_0.asmx?WSDL))
and look for `cuahsi_1_0` in the URL.  Alternatively, view the WSDL file and look for
`his/1.0` in the `targetNamespace`, as in the following (this information ultimately is checked by the software to determine the version):

```
<wsdl:definitions targetNamespace="http://www.cuahsi.org/his/1.0/ws/">
```

WaterOneFlow/WaterML 1.1 appears to have been a development version and introduces changes that are not supported in TSTool.
WaterML 2.0 is being reviewed as an Open Geospatial Consortium (OGC) standard, but is not yet supported in TSTool:

[https://www.opengeospatial.org/projects/groups/waterml2.0swg](https://www.opengeospatial.org/projects/groups/waterml2.0swg)

It is expected that organizations that currently publish data in WaterML
will update their services to version 2.0 and support for version 2.0
will be added in TSTool when sites become available for testing and production use.

The following discussion focuses on WaterOneFlow and WaterML 1.0.

## Standard Time Series Properties ##

The standard time series identifier (TSID) for WaterOneFlow time series in TSTool corresponds
to information that can be retrieved from the WaterOneFlow web service SOAP API.  The general form of a TSID is as follows:

```
Location.DataSource.DataType.Interval~DataStoreName
```

More specifically, the identifier adheres to the following convention for WaterOneFlow:

```
Network:SiteID.Vocabulary.VariableID-DataType.Interval~DataStoreName
```

where identifier parts are described as

*   `Location` - The `Network` and `SiteID` corresponds to the site information.
*   `DataSource` - The `Vocabulary` corresponds to the vocabulary attribute of the `variableCode` element,
    found in the variable element.
    For example, the `Vocabulary` is used for NWIS for USGS NWIS data.
    Variable data are retrieved using the `getVariableInfoObject` SOAP request
    (one cached query and then mine the data as necessary).
*   `DataType` - The `VariableID` corresponds to the `variableID` attribute of the `variableCode` element, found in the variable element.
    The `DataType` is a modifier on the variable and corresponds to the `dataType` element found in the variable element.
    For example `00060-Average` is used for USGS NWIS daily value average streamflow.
    Variable data are retrieved using the `getVariableInfoObject` SOAP request (one cached query and then mine the data as necessary).
*   `Interval` – The `Interval` corresponds to the `UnitAbbrevation` element of the unit element, found in the `timeSupport` element,
    found in the variable element.  For example, `d` would be used to indicate daily values in the USGS NWIS daily value data.
    Variable data are retrieved using the `getVariableInfoObject` SOAP request (one cached query and then mine the data as necessary).
*   `DataStoreName` is the user-defined data store name from the configuration information.

Additional time series information is set as follows:

*   Data units are taken from the following:
    +   WaterML `unitCode` in variable element
*   Missing numerical values are internally represented as `NaN` and are assigned to any date/times in the period that do not have values.
    +   WaterML `noDataValue` in variable element is checked and matching data values are handled as missing
*   Data value flags, if encountered, are retained in the time series.
    However, because the USGS uses `A` for approved, it may be necessary to ignore this flag so that other flags stand out more when visualized.
*   Data value qualifiers definitions are saved with time series and are available to use in time series visualization as flag definitions

## Limitations ##

This section will be updated to apply to WaterOneFlow.  Currently it focuses on UsgsNwisDaily.

USGS NWIS data store limitations relative to TSTool standard features are as follows:

*   Interpretation of USGS data is limited by WaterML limitations, as follows:
    +   WaterML files from NWIS do not indicate the interval of the data.
        Day can be assumed for the daily values web service; however, trying to read the WaterML file later will require that the interval is specified.
    +   Some of the descriptions contain units, which may lead to confusion if time series are processed into different units.
*   The USGS web services does not allow for all historical data to be returned.
    Specifying no period returns only the most recent value.
    Start and end dates must be specified to retrieve a longer period; however,
    there is no way to request the entire available period.
    Consequently, users must request a period of interest for their analysis and the
    browsing features of TSTool cannot list the available period
    (because doing so would require querying all data, which would be very slow).

## Datastore Configuration File ##

A data store is configured by enabling WaterOneFlow data stores in the main `TSTool.cfg` configuration file
and creating a data store configuration file in the `datastores` folder for each data store.
Configurations are processed at software startup.
An example of the TSTool configuration file is shown below.
Multiple data stores can be defined.  This allows, for example, accessing web services for different organizations that publish WaterOneFlow web services.

# Configuration file for TSTool

```
[TSTool]

WaterOneFlowEnabled = true
```

**<p style="text-align: center;">
TSTool Configuration File with WaterOneFlow Data Store Properties
</p>**

Properties for each data store are specified in an accompanying data store configuration file (see below),
located in installation files `datastore` folder or user `.tstool/NN/datastores` folder.
In the following example the datastore configuration file is named “WaterOneFlow-NWISDV”.

```
# Configuration information for "WaterOneFlow-NWISDV" data store,
# which corresponds to the NWISDV registered network in WaterOneFlow.
# Properties are:
#
# The user will see the following when interacting with the data store:
#
# Type - WaterOneFlowDataStore (required as indicated)
# Name - data store identifier used in applications, for example as the
#     input type information for time series identifiers (usually a short string)
# Description - data store description for reports and user interfaces (short phrase)
# Enabled - whether the data store is enabled (default=True)
#
# The following are specific to the USGS NWIS daily data store:
#
# ServiceRootURI - web service root URI for WSDL
# Version - WaterOneFlow/WaterML version (may be removed in the future)

Type = "WaterOneFlowDataStore"
Name = "WaterOneFlow-NWISDV"
Description = "WaterOneFlow USGS NWIS Daily Value Web Service (1.0)"
ServiceRootURI = "http://river.sdsc.edu/waterOneFlow/NWIS/DailyValues.asmx?WSDL"
Version = "1.0"
```

**<p style="text-align: center;">
WaterOneFlow Data Store Configuration File
</p>**
