# TSTool / Datastore Reference / RCC ACIS #

*   [Overview](#overview)
*   [Standard Time Series Properties](#standard-time-series-properties)
*   [Limitations](#limitations)
*   [Datastore Configuration File](#datastore-configuration-file)

-------------------

## OverView ##

The RCC ACIS datastore corresponds to the
[Regional Climate Center (RCC) Applied Climate Information System (ACIS)](https://www.rcc-acis.org/),
which stores real-time and historical climate data.
ACIS data values are the “best available” and may include values merged from multiple sources.
Data are accessed via a [REST web service application programmer interface (API)](https://en.wikipedia.org/wiki/Representational_State_Transfer).
In addition to providing access to observations,
the ACIS web services provide access to computed statistics such as historical maximum, minimum, and mean.
TSTool does not provide commands to access all of the ACIS features; however, additional data types and features will be enabled over time.

The ACIS web services are described on the Documentation page at the following website: [https://data.rcc-acis.org](https://data.rcc-acis.org).

Support of ACIS in TSTool is being enhanced over time.
The basic functionality is in place; however,
additional effort is needed due to the large number of data types and data reductions that are offered.
The initial effort has focused on basic data access for daily data and integration with TSTool;
however, technical issues remain, as described below.

## Standard Time Series Properties ##

The standard time series identifier for RCC ACIS time series is of the form:

```text
LacationType:Location.DataSource.DataType.Interval~DataStoreName
```

More specifically, the identifier follows the following convention:

```text
IDType:StaID.ACIS.Elem.Interval~DataStoreName
```
 
where identifier parts are described as follows:

1.  The location is indicated by station ID type and the station identifier.
    Because ACIS cross-references identifiers used in multiple data systems,
    the identifier cannot be guaranteed to be unique without knowing the identifier type.
    For the above identifier, the identifier type is selected in the following order
    (these abbreviations are taken from the ACIS REST API documentation):
    `COOP`, `ICAO`, `NWSLI`, `FAA`, `WMO`, `WBAN`, `ThreadEx`, `AWDN`, `GHCN`, `CoCoRaHS,` `ACIS`.
    This order may in the future be configurable as an RCC ACIS datastore configuration property, or command parameter.
2.  The data source is set to `ACIS`.
3.  The data type is set to the element name (`elem` in ACIS documentation).
4.  Interval is determined from the ACIS variable list (e.g., `daily` is translated to `Day`) for consistency with TSTool conventions.
    Intervals that are not explicitly specified (e.g., `sub-hrly`) are not directly
    supported by TSTool (e.g., `weekly`) are converted to “Irregular”.
    TSTool currently only supports daily interval.
5. `DataStoreName` is the user-defined datastore name from the configuration information.
6.  Data units are assigned based on the element name (version 1 assigns using the variable list).
7.  ACIS data flags are handled as follows:
    1.  Missing numerical values from ACIS are indicated by a data value
        of `M` and are converted to `NaN` internally, with an `M` flag on the data value.
    2.  Trace numerical values for precipitation and snow from ACIS are indicated by a
        data value of `T` and are converted to `0.0` internally, with a `T` flag on the data value.
    3.  No value with a flag is set to missing and the flag is set.
    4.  Value with flag is set to the value and the flag is set.
8.  Time series retrieved by the `MultiStn` and `StnMeta` requests sometime come back with empty
    `valid_daterange` – these time series are omitted from the time series list when displayed in TSTool.
9.  Time series with `valid_daterange` having dates with year `9999` have the year replaced with the current year.
10. Data values with unexpected values and/or flags (e.g., `12.2A, S`) are handled as follows:
    if a numerical value is at the start of data, it is used to set the data value.
    Remaining text is used to set the data flag for the value.

## Limitations ##

RCC ACIS data store limitations relative to TSTool standard features are as follows.
Some of these issues may have been resolved with ACIS version 2 and
will be reviewed as version 2 documentation is made available.

1.  Limited testing of combinations of query parameters has been implemented.
    Some technical issues have been identified, as documented below,
    and if resolved, may clarify other issues.
    Some of the variable types are only supported in limited fashion and may be eliminated or changed
2.  The ACIS API currently does not provide the variable list but may do so in the
    future – currently the variable list is hard-coded to core data types.
    A complete list of element types has not yet been published as of TSTool ACIS
    software feature development and consequently not all variables are available in TSTool.
3.  The ACIS general web services provide area information that can be presented as choices.
    However, choices have been implemented only for criteria where lists have been published and are reasonably short.
4.  Although a variety of query parameters can be specified (e.g., for location),
    not all of the information is returned as metadata in results.
    Consequently, when displaying lists of station-time series in TSTool,
    some attributes are omitted or would need to be determined from
    the query criteria (but this is not as robust).
    A requested design change is therefore to allow returned metadata for all query parameters (such as `climdiv`, `cwa`).
5.  Area parameters can include multiple values (e.g, `postal=CO,WY`);
    however, this is not documented in version 1 text (only in an example).
    Some clarification may be appropriate, in particular if this behavior only applies to postal.
6.  It appears that multiple location parameters can be specified to limit the query
    (e.g., `county` that intersects a climate division)?   However, this feature is not documented.
    TSTool will allow multiple location criteria to be specified.
7.  The interpretation of start and end years equal to `9999` needs to be documented.
8.  Requesting a data type may return a full list of stations,
    even if that data type is not collected at the stations.
    The start and end dates for the data can be consulted to determine whether data actually are available.
    A cleaner way to omit missing time series needs to be implemented.
    Perhaps this is addressed in the version 2 StnMeta request.
9.  No attempt has been made to use reduced (calculated) data available using JSON input.
    For example, reduced data include monthly values computed from daily values.  Some anticipated issues are:
    1.  Would it be possible to implement the reductions via a
        URI rather than having to provide data behind the scenes?
        This would make the API more transparent for troubleshooting.
    2.  Need to understand how to map the reduced data time series
        identifiers to TSTool time series identifiers?
    3.  Does the reduction result in a time series or a statistic (table of 1+ numbers)?
        TSTool has some conventions for dealing with time series and statistics and additional evaluation is needed.
    4.  Should the API for reduced data fundamentally be the same as getting other
        time series (e.g., specify an interval of monthly instead of daily) or should
        the user need to specify additional input parameters to control the reduction.
        This depends on how acceptable the defaults are.
        It would seem that some standard reductions could simply result in
        more time series choices… but how does the major/variable name change?

## Datastore Configuration File ##

A datastore is configured by enabling RCC ACIS datastores in the main `TSTool.cfg` configuration file,
and creating a datastore configuration file for each datastore connection.
Configurations are processed at software startup.
An example of the TSTool configuration file is shown below.
Multiple datastores can be defined.
For ACIS, this would allow, for example, accessing systems at different regional climate centers or
different versions of the web services.

```text
# Configuration file for TSTool

[TSTool]

RCCACISEnabled = true
```
**<p style="text-align: center;">
TSTool Configuration File with RCC ACIS Datastore Properties
</p>**

Properties for each datastore are specified in an accompanying configuration file described below.
TSTool is distributed with a configuration file for RCC-ACIS datatstore.

The following illustrates the RCC ACIS datastore configuration file format,
which in this example is located in the TSTool installation files `daastores` folder and configures a datastore named “RCC-ACIS”.

```text
# Configuration information for "RCC-ACIS" datastore.
# Properties are:
#
# The user will see the following when interacting with the datastore:
#
# Type – RccAcisDataStore (required as indicated)
# Name - datastore name used in applications, for example as the
#     input type information for time series identifiers (usually a short string)
# Description - datastore description for reports and user interfaces (short phrase)
# Enabled – whether the datastore is enabled (default=True)
#
# The following are specific to the RCC ACIS datastore:
#
# ServiceRootURI - web service root URI, including the server name and root path
#                  additional information will be appended to make specific requests

Type = "RccAcisDataStore"
Name = "RCC-ACIS"
Description = "RCC ACIS Web Services"
ServiceRootURI = https://data.rcc-acis.org
```

**<p style="text-align: center;">
RCC ACIS Datastore Configuration File
</p>**
