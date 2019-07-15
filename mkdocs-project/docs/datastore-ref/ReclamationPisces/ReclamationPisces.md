# TSTool / Datastore Reference / ReclamationPisces #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)
* [Datastore Configuration File](#datastore-configuration-file)

------------

## Overview ##

The ReclamationPisces datastore corresponds to the
[US Bureau of Reclamation’s Pisces database and visualization software](https://github.com/usbr/Pisces),
which stores site and corresponding time series data.
Sites are locations where data are collected,
such as stream gage stations, reservoirs, and weather stations.

The Pisces database is being used to store Reclamation data
extracted from enterprise databases (e.g., HDB and Hydromet) for use with public-facing websites and web services
such as [Reclamation Water Information Service](https://water.usbr.gov/).
This allows the public to access a portion of Reclamation data
without accessing internal Reclamation databases.
Pisces uses SQLite for its default stand-alone database with the
Pisces software and PostgreSQL or MySQL for the server versions.
The TSTool software is able to read from the Pisces database to provide data access, visualization, and processing functionality.
 
## Standard Time Series Properties ##

The standard time series identifier for ReclamationPisces time series is of the form:

```
LocationID.DataSource.DataType.Interval.Scenario[EnsembleTrace]~DataStoreName
```

More specifically, the identifier follows the following convention for Pisces data:

```
SiteID.Server.Parameter.TimeInterval~DataStoreName
```

Time series identifier parts and other time series metadata are described below:

* The TSID location identifier is set to the `seriescatalog.siteid` column value.
`SiteID` is a short unique name for each location in a Pisces database.
* The TSID data source is set to the `view_seriescatalog.server` column value,
which indicates the data collection network.
* The TSID data type is set to the `view_seriescatalog.parameter` column value,
which is a short parameter type matching values in the `ref_parameter table`.
* Interval is the data interval using TSTool standards (e.g., `Hour`, `Day`, `Month`, `Year`, `Irregular`).
Weekly data were used with MODSIM model data sets.
Irregular interval in Pisces is typically used for real-time data or
multiples of a base interval (e.g., `10-minute`, `15-minute` data).
Within TSTool, the precision of date/times for irregular data is typically set when the
time series is read and the period of record end dates assigned.
The following conversion is made between TSTool and Pisces interval:

|**Pisces Time Interval**|**TSTool Interval**|
|--|--|
|`Hourly`|`Hour`|
|`Daily`|`Day`|
|`Weekly`|Not implemented|
|`Monthly`|`Month`|
|`Yearly`|`Year`|
|`Irregular`|`Irregular`|

* The TSID scenario (the optional 5th part of the TSID) currently is not used with Pisces.
* The ensemble trace identifier (optional [identifier] at end of TSID) currently is not used with Pisces.
* `DataStoreName` is the user-defined datastore name from the configuration information.
* The time zone for hourly time series is set to the `sitecatalog.timezone` column value.
This is not fully implemented because TSTool only fully supports daily Pisces time series.
The `sitecatalog.tz_offset` indicates the offset from UTC.
* Missing numerical values in Pisces may be null or are indicated by a special
numerical value that is specific to the original data provider and the flag will include `m`.
Once read, missing values are indicated by `NaN` and the missing data flag will be retained.
The following table lists possible flag values,
which may be present singularly or concatenated if more than one flag applies.

|**Pisces Data Flag**|**Description**|
|--|--|--|
||No flag|
|Single space|OK|
|`C`|Computed|
|`e`|Edited|
|`E`|Estimated|
|`I`|Inserted|
|`L`|Locked|
|`m`|Missing|
|`N`|Interpolated|
|`+`|Quality high|
|`-`|Quality low|
|`^`|Quality rate of change|

* Time series data units are set using seriescatalog.units.
* All other column data from sitecatalog and seriescatalog are set as time series
properties and can be accessed in TSTool using `${ts:Property}` notation.

## Limitations ##

ReclamationPisces datastore limitations relative to TSTool standard features are as follows:

* Only daily time interval is currently fully supported.
`Hour`, `Month`, `Year` and `Irregular` intervals are enabled similar to `Day`;
however, additional intricacies are not handled (such as time zone for `Hour` interval,
other than calendar year for `Year` data).

## Datastore Configuration File ##

A datastore is configured by enabling ReclamationPisces datastores in the main `TSTool.cfg` configuration file,
and creating a datastore configuration file for each datastore connection.
Configurations are processed at software startup.
An example of the TSTool configuration file is shown below.
Multiple datastores can be defined.
Properties for each datastore are specified in an accompanying configuration file described below.

```
[TSTool]

ReclamationPiscesEnabled = true
```
**<p style="text-align: center;">
TSTool Configuration File with ReclamationPisces Datastore Properties
</p>**

The following illustrates the ReclamationPisces datastore configuration file format,
which in this example is located in the user files `datastores/ReclamationPisces.cfg` file
and configures the `ReclamationPisces` datastore.
Authentication for writing data to the database is checked based on the account login and password –
typically a read-only account should be used for web access to Pisces.

```
# Configuration properties for Reclamation Pisces database datastore.
#
# Properties are as follows.
# The user will see the following when interacting with the data store:
#
# Name - database identifier for use in applications, for example as the
#     input type/name information for time series identifiers (usually a short string)
# Description - database description for reports and user interfaces (a sentence)
#
# The following are needed to make the low-level data connection:
#
# Enabled - use to enable/disable datastore (default=True)
# Type - must be ReclamationPiscesDataStore
# DatabaseEngine - the database software (MySQL is default)
# DatabaseServer - IP or string address for database server (can be localhost)
# DatabaseName - database name used by the server
# SystemLogin - service account login used for database connection
# SystemPassword - service account password used for database connection
#
# The SystemLogin and SystemPassword can be specified as a literal string or:
# Env:EnvVariable (to specify that environment variable should be used)
# SysProp:JavaRuntimeProperty (to specify that Java runtime property should be used)
#

Enabled = True
Type = "ReclamationPiscesDataStore"
Name = "ReclamationPisces"
Description = "Reclamation Pisces Development database for testing"
DatabaseServer = "localhost"
DatabaseName = "timeseries"
SystemLogin = "XXXX"
SystemPassword = "XXXXXXX"
```

**<p style="text-align: center;">
ReclamationPisces Datastore Configuration File
</p>**

The following table describes the datastore properties.

**<p style="text-align: center;">
ReclamationPisces Datastore Configuration Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--|--|--|
|`Enabled`|Specify whether the datastore should be enabled (`True`) or disabled (`False`).  Disabled datastores will not be initialized for use in TSTool.|`True`|
|`Type`|Must be ReclamationPiscesDataStore.|None – must be specified.|
|`DatabaseEngine`|Indicates database software.  For Pisces, it should be MySQL. (support for SQLite may be added in the future – this will require packaging a Java JDBC driver with TSTool – currently not enabled).|`MySQL`|
|`Name`|The name to use for the datastore, which will be displayed in user interfaces and commands.|None – must be specified.|
|`Description`|A longer description for the datastore, used in interfaces.|None – must be specified.|
|`DatabaseServer`|The computer name or IP address for the database server.|None – must be specified.|
|`DatabaseName`|The database name.|None – must be specified.|
|`DatabasePort`|The port to use for the database connection.|`3306` for MySQL.|
|`SystemLogin`|The database user account login, which can be one of:<ul><li>literal string</li><li>`Env:EnvVariable` – specify using an environment variable named `EnvVariable`</li><li>`SysProp:JavaRuntimeProperty` – specify using a Java Runtime Environment property named `JavaRuntimeProperty`</li></ul>|None – must be specified.|
|`SystemPassword`|The database user account password.  Specify similar to `SystemLogin`.|None – must be specified.|
