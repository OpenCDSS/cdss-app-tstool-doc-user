# TSTool / Datastore Reference / ColoradoWaterSMS #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)
* [Datastore Configuration File](#datastore-configuration-file)

--------------------

## Overview ##

**These web services are obsolete and are no longer publicly available.
This documentation will be retained during the transition to new web services.
Instead, use the [Colorado HydroBase REST web services](../ColoradoHydroBaseRest/ColoradoHydroBaseRest.md).**

The State of Colorado’s Satellite Monitoring System (SMS) database stores observations,
configuration information, processed data, and alarms,
related to field observations collected from real-time stations throughout the State of Colorado.
This database has links to HydroBase and HydroBase also includes real-time data
(see the [HydroBase Input Type Appendix](../CO-HydroBase/CO-HydroBase.md)).
However, the HydroBase real-time time series are only available to
State of Colorado personnel that have access to the State’s internal servers.
The ColoradoWaterSMS datastore provides internet web service access to real-time data as described here:

* [Surface Water Website Help](http://www.dwr.state.co.us/SurfaceWater/help.aspx) - see "Data Automation" link

Raw observations as well as hourly and daily aggregations can be requested.
Because the data are considered provisional, time series data
collected from external providers are NOT available and must be retrieved from the original provider (e.g., USGS).
Time series with DataSource=DWR and several other data cooperators
that rely on the State for data access are available from this web service.

## Standard Time Series Properties ##

The standard time series identifier format for ColoradoWaterSMS time series is of the form:

```
Location.DataSource.DataType.Interval~DataStoreName
```

The meaning of the parts is as follows:

* The `Location` is set to the State of Colorado’s station abbreviation, `ABBREV` (e.g., `PLAKERCO`),
which typically is formed from the river/basin name (`PLA`=Platte River),
station location (`KER`=Kersey), and state (`CO`=Colorado).
Note that currently the web service does not provide the original
identifier and therefore the abbreviation is always used.
* The `DataSource` is set to the providing agency.
For example, although data are stored in the State’s database,
the data provider may be USGS or another agency.
If different from DWR, then the data also may be available directly from the provider
agency using the agency’s station identifier.
The State’s web services only provide DWR–managed data and do not pass
through provisional data from other agencies that are able to provide the data from their systems.
* The `DataType` is set to the “variable” described in the State’s web service documentation.
Streamflow is the primary data type, indicated by `DISCHRG`.
Reservoir/lake level is indicated by `ELEV`, and storage by `STORAGE`.
It is possible that a single gage collects data at more than one location,
for example at branches of a confluence.
Use TSTool to query the datastore with a data type of `*` to list available data types at a location.
* `Interval` is `Irregular` for raw data, which generally is evenly spaced but may
include more frequent observations during events.  Hour and Day interval are also available as aggregated values.
* The datastore name (`ColoradoWaterSMS` by default)
indicates that the data are being read from the ColoradoWaterSMS web service.

## Limitations ##

The following limitations of the web service may impact users of the data.

* Data type – a description of data types is not available from the
web service and therefore cannot automatically be displayed by software.
A query to determine a list of data types from time series is
performed once and will result in a noticeable delay when the
ColoradoWaterSMS input type is initially selected.
Subsequent listing of time series will be relatively fast.
* Interval – the interval for raw observations is not provided by the web service
and therefore real-time data interval is shown in TSTool as `Irregular`.
Stations generally report at regular N-minute intervals; however,
some also provide additional event-triggered values that result in more observations in a shorter timeframe.
The web service does allow requesting hour and day interval aggregations, which are computed from the raw data by DWR.
* Station – provider identifiers, spatial data (county, state, HUC, lat/long, UTM)
are not currently available for time series lists.
`ABBREV` may not be assigned for all stations, in particular for external providers.
* Data units – currently are not available from the web service.
Units are hard-coded for some data types, and are left blank for other data types,
pending clarification from the State.
* Data – web service requests must be made with a query period.
A default query period of the most recent 14 days is used to ensure that some data are returned.
Optionally, use the [`SetInputPeriod`](../../command-ref/SetInputPeriod/SetInputPeriod.md)
command in TSTool to specify a longer period.
Some stations may not report data in off-season periods.

## Datastore Configuration File ##

A datastore is configured by enabling ColoradoWaterSMS
datastores in the main `TSTool.cfg` configuration file and creating a
datastore configuration file for each datastore connection.
Configurations are processed at software startup.  An example of the TSTool configuration file is shown below.
Multiple datastores can be defined using the `[DataStore:DataStoreName]` syntax.
For ColoradoWaterSMS, this would allow, for example, accessing different versions of the web services.

```
# Configuration file for TSTool

[TSTool]

ColoradoWaterSMSEnabled = true

# Datastore for Colorado Water SMS web service (active if ColoradoWaterSMSEnabled=true above)
[DataStore:ColoradoWaterSMS]
ConfigFile = "ColoradoWaterSMS.cfg"
```
**<p style="text-align: center;">
TSTool Configuration File with ColoradoWaterSMS Datastore Properties
</p>**

Properties for each datastore are specified in an accompanying configuration file described below.

The following illustrates the ColoradoWaterSMS datastore configuration file format,
which in this example is located in the same folder as the TSTool configuration file
and configures a datastore named “ColoradoWaterSMS”.

```
# Configuration information for "ColoradoWaterSMS" web service datastore.
# Properties are:
#
# The user will see the following when interacting with the datastore:
#
# Name - datastore identifier used in applications, for example as the
#     input type information for time series identifiers (usually a short string)
# Description - datastore description for reports and user interfaces (short phrase)
# ServiceRootURI - web service root URI, including the server name and root path

Type = "ColoradoWaterSMSDataStore"
Name = "ColoradoWaterSMS"
Description = "Colorado Satellite Monitoring System Web Service"
ServiceRootURI = "http://www.dwr.state.co.us/SMS_WebService/ColoradoWaterSMS.asmx?WSDL"
```
**<p style="text-align: center;">
ColoradoWaterSMS Datastore Configuration File
</p>**
