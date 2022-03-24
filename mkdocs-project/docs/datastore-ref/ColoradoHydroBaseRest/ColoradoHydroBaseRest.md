# TSTool / Datastore Reference / ColoradoHydroBaseRest #

* [Overview](#overview)
    + [Web Service to Time Series Mapping](#web-service-to-time-series-mapping)
    + [ColoradoHydroBaseRest Time Series Data Types](#coloradohydrobaserest-time-series-data-types)
    + [Diversion Record Coding](#diversion-record-coding)
    + [Calculation of Statistics for Interval Data](#calculation-of-statistics-for-interval-data)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)
* [Datastore Configuration File](#datastore-configuration-file)
* [See Also](#see-also)

--------------------

## Overview ##

The State of Colorado’s HydroBase database is the primary database for water data in Colorado.
However, using the HydroBase database datastore or database input type in TSTool
(see the [HydroBase Datastore appendix](../CO-HydroBase/CO-HydroBase.md))
requires a direct connection to a Microsoft SQL Server HydroBase database,
and a local installation of the database may not be available.
A local database is typically used by State of Colorado staff and
consultants or others that need the higher performance of a local database.

---

**IMPORTANT: Data available from web services originate from a wide variety of sources and formats
Data collection and processing methods vary.
Consequently, it is difficult in some cases to confirm data contents without
researching the full data workflow.
For example, `SnowDepth.Day` could be a mean of snow depth measurements in the day,
the last value in a day, a manually measured value taken at any point in the day,
or other value.
This documentation is general and the documentation for original data sources should be consulted to answer questions.**

---

The ColoradoHydroBaseRest datastore provides access to HydroBase using internet REST web services
and is automatically enabled in TSTool as the `HydroBaseWeb` datastore.
REST web services use URLs to uniquely identify data resources,
typically in JSON, comma-separated-value, or other format.
The resulting data are converted into time series and other data in TSTool for use with commands.

See the [Wikipedia REST](https://en.wikipedia.org/wiki/Representational_state_transfer)
article for background on REST web services.
Web services allow data to be retrieved and processed locally in tables and time series.
Because access to the database is through web services,
there is no ability to use Structured Query Language (SQL) to control web service queries.
Instead, available web service URL query parameters can be used to control the request.

See the following page for HydroBase web service documentation.
TSTool integrates with web services by specifying appropriate web service request query parameters.
The TSTool log file and the time series `dataUrl` property after reading
includes the URL that is used to request data.

* [Colorado Division of Water Resources REST Web Services Help](https://dwr.state.co.us/rest/get/help)

See also the following documentation that is helpful when trying to understand
similarity and differences between database and web service datastores,
in particular data types and corresponding intervals used in time series.
The ColoradoHydroBaseRest web services and datastore provide access to real-time and historical data,
which requires using data type and interval to define unique time series identifiers.
This is different than legacy datastores where multiple web services each provided access to some of the HydroBase data
and uniqueness was within the specific datastore.

* [HydroBase Database Datastore](../CO-HydroBase/CO-HydroBase.md) - **current software for historical data**
* [ColoradoWaterHBGuest Datastore](../ColoradoWaterHBGuest/ColoradoWaterHBGuest.md) - **legacy (obsolete) datastore for historical data replaced by ColoradoHydroBaseRest web services**
* [ColoradoWaterSMS Datastore](../ColoradoWaterSMS/ColoradoWaterSMS.md) - **legacy (obsolete) data datastore for real-time data replaced by ColoradoHydroBaseRest web services**

The ColoradoHydroBaseRest datastore uses new DWR HydroBase web services.
The following sections list data types and intervals that are available in this datastore.

### Web Service to Time Series Mapping ###

Time series data objects in TSTool consist of various properties such as location identifier, data type and units,
and data arrays for data values and flags.
To populate data in a time series typically requires joining the following:

* station or structure data (for location identifier)
* parameter or data type (for data type, data source, and units)
* time series data records as original measurement or calculated interval value

The TSTool main interface browsing tool requires a join of information in order to list time series for selection,
typically using one of the "datatypes" services.
Once the data type and interval are selected, specific time series are listed.
Similar functionality is provided in the
[`ReadColoradoHydroBaseRest`](../../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) command
to allow automated processing of many time series with a few commands.
Time series that are returned include built-in properties and also a list of properties from web services.
Use the TSTool time series results area ***Time Series Properties*** menu item to view time series properties.

The following table summarizes DWR HydroBase REST web services, corresponding to data types in the datastore.
This table may not agree with the latest available web services.
Web services, once implemented, tend not to be modified so that existing data applications will continue to function.
However, new data may be added to web services without impacting existing applications.
If a web service is not directly supported by this datastore,
the TSTool [`WebGet`](../../command-ref/WebGet/WebGet.md) command can be used to request data and then
other TSTool commands can read and process the data, typically as tables,
including the
[`ReadTableFromJSON`](../../command-ref/ReadTableFromJSON/ReadTableFromJSON.md) and
[`ReadTableFromDelimitedFile`](../../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md)
commands, which are used for JSON and comma-separated-value files, respectively.

See also more detailed information in the [ColoradoHydroBaseRest Time Series Data Types](#coloradohydrobaserest-time-series-data-types)
section, which provides a map of all data types and intervals.

**<p style="text-align: center;">
Summary of Web Services Implemented in ColoradoHydroBaseRest Datastore
</p>**

| **Web Service**              |**Time Series Data Types**|**Comments, including HydroBase Datastore Examples** |
|--|--|--|
| Administrative Calls         | Currently none.            | Could treat historical calls as time series. |
| Analysis Services            | Currently none.            | Not currently integrated into TSTool. |
| Climate Stations             | See ***Climate Station - Evap*** and similar data type below. | The TSTool HydroBase database datastore uses ***Climate*** data types and TSIDs similar to `USC00298284.NOAA.Precip.Day~HydroBase`.  Climate station data types are `MixedCase`. |
| Dam Safety                   | Currently none.            | Not currently integrated into TSTool. |
| Diversion Records            | See<br><ul><li>***Structure - DivComment***</li><li>***Structure - DivTotal***</li><li>***Structure - RelTotal***</li><li>***Structure - Stage***</li><li>***Structure - WaterClass***</li><li>***Structure - Volume***</li></ul> data type below.| The TSTool HydroBase database datastore uses TSIDs similar to:<ul><li>`0300905.DWR.DivComment.Year~HydroBase`</li><li>`0300905.DWR.DivTotal.Month~HydroBase`</li><li>`0300503.DWR.DivClass-S:6 F:0300934 U:Q T:0 G:.Month~HydroBase`</li><li>`0303732.DWR.ResMeasElev.Day~HydroBase`</li><li>`0303732.DWR.ResMeasStorage.Day~HydroBase`</li>**Note that web services support new water classes with account and `To` coding.  Any water class that includes periods is enclosed in single quotes to protect within normal TSID format.** |
| Groundwater Geophysical Logs | Currently none.            | Not currently integrated into TSTool. |
| Groundwater Levels           | See<br><ul><li>***Well - WaterLevelDepth***</li><li>***Well - WaterLevelElev***</li></ul> data type below. | The TSTool HydroBase database datastore uses TSIDs similar to `402930104414301.DWR.WellLevelDepth.Day~HydroBase` and `402930104414301.DWR.WellLevelElev.Day~HydroBase`.<br>**Must use point graph to see data points since sparce.**|
| Parcel Use TS                | Currently incomplete.      | Not currently integrated into TSTool, may be implemented in StateDMI software first. |
| Reference Tables             | As needed.                 | Used to display choices and perform checks. |
| Structures                   | See Diversion Records.     | Structure data is processed with Diversion Records. Time series query structure data and save as time series properties. |
| Surface Water                | See:<ul><li>***Surface Water Station - Streamflow-Avg***</li><li>***Surface Water Station - Streamflow-Max***</li><li>***Surface Water Station - Streamflow-Min***</li><li>***Surface Water Station - Streamflow-Total***</li></ul> and similar data types below. | See the TSTool HydroBase database datastore ***Stream - Streamflow*** data types, which uses TSIDs similar to `09306395.USGS.Streamflow.Month~HydroBase`. |
| Telemetry Stations           | See<br>***Telemetry Station - Parameter*** data type below. | The TSTool HydroBase database datastore does not provide access to real-time data because web services now provides this functionality.  The telemetry station data types are `UPPERCASE`, which allows differentiation from climate station data types that overlap, for example `EVAP` and `Evap`. |
| Water Rights                 | Currently none.            | Not currently integrated into TSTool.  Could treat water rights as time series to allow accumulation.  The [`ReadStateMod`](../../command-ref/ReadStateMod/ReadStateMod.md) command reads water rights time series from model files. |
| Well Permits                 | Currently none.            | Not currently integrated into TSTool. |

### ColoradoHydroBaseRest Time Series Data Types

The following table lists the data types that have been implemented in the ColoradoHydroBaseRest datastore.
Time series identifiers can be requested for valid combinations of location identifier, data type, data source, and interval.

Data indicated as "historical data" undergo review by the State in order to produce a data archive,
and third party data are also ingested for some data types,
to simplify access to useful data types and allow creation of HydroBase database snapshots
that can be used by modelers who do not want data to change during modeling work.
Month and year interval data are often based on daily time series
and daily time series often use common statistic, such as mean daily flow.
Information from the original data sources should be consulted to better understand data details.

Data indicated as "real-time data" include current and recent measurements and may also have a long period.
Real-time data are typically processed into historical data using a process that includes review and quality control,
but may also remain as "real-time" only because the data are used for real-time decisions
rather than historical analysis.
As these datasets grow in length, they become more useful for historical analysis.

Data from third parties may be available using other TSTool datastores.
It is generally recommended to use the data from the original data provider if possible
in order to access the data from its primary and authoritative source.

**<p style="text-align: center;">
ColoradoHydroBaseRest Time Series Data Types
</p>**

|**Group**|**Data Type**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|
|--|--|--|
| ***Climate Station***<br>(historical data)|`Evap`| Evaporation from free water surface for intervals:<ul><li>`Evap.Day` - daily total evaporation</li><li>`Evap-Avg.Month` - average of daily evaporation for month</li><li>`Evap-Max.Month` - maximum of daily evaporation for month</li><li>`Evap-Min.Month` - minimum of daily evaporation for month</li><li>`Evap-Total.Month` - total of daily evaporation for month</li></ul><br>Climate station data use mixed case `Evap` whereas telemetry station data for real-time stations use upper case `EVAP`.|
|  |`FrostDate`| Day of year (1-366) for first/last frost date temperature:<ul><li>`FrostDateF28F.Year` - day of year in fall when temperature is first <= 28 F</li><li>`FrostDateF32F` - day of year in fall when temperature is first <= 32 F</li><li>`FrostDateL28S` - day of year in spring for temperature is last <= 29F</li><li>`FrostDateL32S` - day of year in spring when temperature is last <= 32 F</li></ul><br>The day of year can be converted to a date. The [`WriteStateCU`](../../command-ref/WriteStateCU/WriteStateCU.md) command outputs the time series for consumptive use modeling. |
| |`MaxTemp`| Maximum daily temperature for intervals:<ul><li>`MaxTemp.Day` - maximum daily temperature</li><li>`MaxTemp-Avg.Month` - average of daily maximum temperature for month</li><li>`MaxTemp-Max.Month` - maximum of daily maximum temperature month</li><li>`MaxTemp-Min.Month` - minimum of daily minimum temperature for month</li><li>`MaxTemp-Total.Month` - not currently provided (could be used for degree days if enabled)</li></ul>|
| |`MeanTemp`| Mean daily temperature (**mean of minimum and maximum?**) for intervals:<ul><li>`MeanTemp.Day` - mean daily temperature</li><li>`MeanTemp-Avg.Month` - average of daily mean temperature for month</li><li>`MeanTemp-Max.Month` - maximum of daily mean temperature month</li><li>`MeanTemp-Min.Month` - average of daily mean temperature for month</li><li>`MeanTemp-Total.Month` - not currently provided (could be used for degree days if enabled)</li></ul>|
| |`MinTemp`| Minimum daily temperature for intervals:<ul><li>`MinTemp.Day` - minimum daily temperature</li><li>`MinTemp-Avg.Month` - average of daily minimum temperature for month</li><li>`MinTemp-Max.Month` - maximum of daily minimum temperature month</li><li>`MinTemp-Min.Month` - minimum of daily minimum temperature for month</li><li>`MinTemp-Total.Month` - not currently provided (could be used for degree days if enabled)</li></ul>|
| |`Precip`| Precipitation for intervals:<ul><li>`Precip.Day` - daily total precipitation</li><li>`Precip-Avg.Month` - average of daily precipitation for month</li><li>`Precip-Max.Month` - maximum of daily precipitation for month</li><li>`Precip-Min.Month` - minimum of daily precipitation for month</li><li>`Precip-Total.Month` - total of daily precipitation for month</li></ul><br>Climate station data use mixed case `Precip` whereas telemetry station data for real-time stations use upper case `PRECIP`.|
| |`Snow`| Snow accumulation for intervals:<ul><li>`Snow.Day` - daily total snow accumulation</li><li>`Snow-Avg.Month` - average of daily snow accumulation for month</li><li>`Snow-Max.Month` - maximum of daily snow accumulation for month</li><li>`Snow-Min.Month` - minimum of daily snow accumulation for month</li><li>`Snow-Total.Month` - total of daily snow accumulation for month</li></ul> |
| |`SnowDepth`| Snow depth for intervals:<ul><li>`Snow.Day` - daily snow depth</li><li>`Snow-Avg.Month` - average of daily snow depth for month</li><li>`Snow-Max.Month` - maximum of daily snow depth for month</li><li>`Snow-Min.Month` - minimum of daily snow depth for month</li><li>`Snow-Total.Month` - total of daily snow depth for month</li></ul> |
| |`SnowSWE`| Snow water equivalent (SWE) depth for intervals:<ul><li>`SnowSWE.Day` - daily SWE depth</li><li>`SnowSWE-Avg.Month` - average of daily SWE for month</li><li>`SnowSWE-Max.Month` - maximum of daily SWE for month</li><li>`SnowSWE-Min.Month` - minimum of daily SWE for month</li></ul> |
| |`Solar`| Solar radiation rate for intervals:<ul><li>`Solar.Day` - daily rate</li><li>`Solar-Avg.Month` - average of daily rate for month</li><li>`Solar-Max.Month` - maximum of daily rate for month</li><li>`Solar-Min.Month` - minimum of daily rate for month</li></ul><br>Climate station data used mixed case `Solar` whereas telemetry station data for real-time stations use upper case `SOLAR`. |
| |`VP`| Vapor pressure for intervals:<ul><li>`VP.Day` - daily vapor pressure</li><li>`VP-Avg.Month` - average of daily mean vapor pressure for month</li><li>`VP-Max.Month` - maximum of daily mean vapor pressure for month</li><li>`VP-Min.Month` - minimum of daily mean vapor pressure for month</li></ul> |
| |`Wind`| Wind run (distance traveled, KM) for intervals:<ul><li>`Wind.Day` - daily total wind run</li><li>`Wind-Avg.Month` - average of daily total wind run for month</li><li>`Wind-Max.Month` - maximum of daily total wind run for month</li><li>`Wind-Min.Month` - minimum of daily total wind run for month</li></ul> |
| ***Structure***<br>(historical data)|`DivComment`| Diversion comment for intervals:<ul><li>`DivComment.Year` - acres irrigated, with corresponding diversion comment flag, used when detailed diversion records are unavailable</li></ul><br>See also the [Diversion Record Coding](#diversion-record-coding) section.  |
| |`DivTotal`| Diversion total through structure for intervals:<ul><li>`DivTotal.Day` - average daily diversion rate, cfs</li><li>`DivTotal.Month` - total monthly diversion volume, af</li><li>`DivTotal.Year` - total annual diversion volume for irrigation year (November to October), af</ul><br>See also the [Diversion Record Coding](#diversion-record-coding) section. |
| |`RelTotal`| Release from structure for intervals:<ul><li>`RelTotal.Day` - average daily release rate, cfs</li><li>`RelTotal.Month` - total monthly release, af</li><li>`RelTotal.Year` - total annual release for irrigation year (November to October), af</ul><br>See also the [Diversion Record Coding](#diversion-record-coding) section. |
| |`Stage`| Reservoir stage (elevation) for intervals:<ul><li>`Stage.Day` - daily stage</li></ul>|
| |`Volume`| Reservoir volume for intervals:<ul><li>`Volume.Day` - daily volume</li></ul>|
| |`WaterClass`| Diversion records that use water class ("water color" reflecting use, type, etc.) for intervals:<ul><li>`WaterClass.Day` - average daily water class rate, cfs</li><li>`WaterClass.Month` - total monthly water class volume, af</li><li>`WaterClass.Year` - total water class volume for irrigation year (November to October), af</ul><br>See the [Diversion Record Coding](#diversion-record-coding) section.|
| ***Surface Water Station***<br>(historical data)|`Streamflow`| Streamflow (discharge) for intervals:<ul><li>`Streamflow-Avg.Day` - daily mean streamflow</li><li>`Streamflow-Avg.Month` - average of daily mean streamflow for month</li><li>`Streamflow-Max.Month` - maximum of daily mean streamflow for month</li><li>`Streamflow-Min.Month` - minimum of daily mean streamflow for month</li><li>`Streamflow-Total.Month` - total of daily mean streamflow as volume (af)</li></ul> The statistic `Avg` is used for daily data in anticipation that other statistics such as `Max` and `Min` may be added for daily interval data. |
| ***Telemetry Station***<br>(real-time data)| Many parameters, including<ul><li>`DISCHRG` - discharge (streamflow)</li><li>`GAGE_HT`</li> - stage (elevation)</li></ul><br>Use a data type of `*` in TSTool to list all available data. | Real-time stations from stations maintained by Division of Water Resources and contributors.  The data are used for real-time administration and operations.  The data may be processed into historical data.  Data may be collected on multiple tributaries at one station (e.g., `DISCHRG1`, `DISCHRG2`).  Timestamp indicates the interval-ending statistic, such as mean discharge during the interval ending on the timestamp.  Midnight value is the last value for the previous day, for interval ending at midnight.  Intervals include:<ul><li>`15Min`</li><li>`Hour`</li><li>`Day`</li></ul><br>Telemetry stations use upper case data type (e.g., `EVAP`, `PRECIP`, and `SOLAR`) whereas climate stations used mixed case data type (e.g., `Evap`, `Precip`, `Solar`) to ensure unique time series identifiers. |
| ***Well***<br>(historical data)|`WaterLevelDepth`| Water level depth for intervals:<ul><li>`WaterLevelDepth.Day` - treated as a daily time series with many gaps. |
| |`WaterLevelElev` | Water level elevation for intervals:<ul><li>`WaterLevelElev.Day` - treated as a daily time series with many gaps. |

### Diversion Record Coding ###

State of Colorado diversion records that are represented in `WaterClass` data adhere to the
[Diversion Records Standard](https://dnrweblink.state.co.us/dwr/ElectronicFile.aspx?docid=3600965&dbid=0).
Note that the HydroBase database datastore uses `DivClass` rather than `WaterClass` due to previous naming conventions.

This datastore relies on the diversion coding "SFUT2" (source, from, use, type, to) database data to provide unique identification for diversion record data.
The main time series identifier data type is `WaterClass`, followed by the SFUT code, for example:

```
0300503.DWR.WaterClass-S:6 F:0300934 U:Q T:0 G:~HydroBaseWeb
0300773.DWR.WaterClass-0300773 S:1 F: U:Q T: G:0103397 To:0302035.Month~HydroBaseWeb
0302317.DWR.'WaterClass-0302317 S:1 F:0300934.001 U:Q T:7 G:0303330 To:'.Month~HydroBaseWeb
```

Because TSTool uses a period to separate parts of the TSID,
SFUT2 codes that include a period are surrounded by single quotes, as in the third example above.
The single quotes are added automatically by TSTool when necessary.

For structure diversion records, additional zero values are added to facilitate data use, as follows:

1. The diversion records for the appropriate interval are queried and set in time series.
2. The diversion comments for the structure are queried.
   Any irrigation year (November to October) where diversion comments are available and have `notUsed` values of `A`, `B`, `C`, or `D` 
   will cause any missing values in the time series for the year to be set to zero and the flag will be set to the `notUsed` value.
   See also the [`FillUsingDiversionComments`](../../command-ref/FillUsingDiversionComments/FillUsingDiversionComments.md) command.
3. Additionally, any daily and monthly diversion records for start of year (November 1) until the end of the year (October 1) will be set to
   zero if missing because the State does not fill in zeros at the start of the year.

**It is a [known issue](https://github.com/OpenCDSS/cdss-lib-dmi-hydrobase-rest-java/issues/29)
that monthly diversion records read from the HydroBase database and web services handle
missing values and zeros differently.**

## Calculation of Statistics for Interval Data ##

This section provides background on how statistics are used to calculate interval data values.
However, the details for each data type vary and the documentation provided for
original data sources should be consulted.

Raw data measurements are collected using various methods, including:

* manual observations reported using "instantaneous" time such as to second,
  or a less precise time such as day, depending on the data type,
* "continuous monitoring" stations that measure data relatively frequently,
  such as every minute or 15 minutes
* "polled" stations that may be contacted less frequently, such as once a day
* values that are estimated from operations, such as no diversions in a year

The raw values may or may not be provided in web services.
For example `Telemetry Station` 15 minute data are considered "raw" data and for most purposes can be considered as
instantaneous or mean over 15 minutes.

Interval data are calculated from a sample taken from the original raw data or the data for a base interval.
For example, the daily maximum streamflow will be different if calculated from instantaneous
1 minute values or mean 15 minute values.
This distinction may or may not be important based on the use of the data.

For ColoradoHydroBaseRest web services, daily data are often used as the base interval to compute
month and year interval data values.
The base interval data may have been loaded from a third party.

The data processing and quality control procedures vary depending on the original data source, data type, and expected data use.
Refer to the original data providers' documentation (if available) for more information about specific datasets.

## Standard Time Series Properties ##

The general form of time series identifier used by TSTool is:

```
Location.DataSource.DataType.Interval~DataStoreName
LocType:Location.DataSource.DataType.Interval~DataStoreName
```

The standard time series identifier format for ColoradoHydroBaseRest time series is of the following form,
where `HydroBaseWeb` is the default datastore name for HydroBase web services:

```
Location.DataSource.DataType.Interval~HydroBaseWeb
Location.DataSource.DataType-Statistic.Interval~HydroBaseWeb
LocType:Location.DataSource.DataType.Interval~HydroBaseWeb
```

The meaning of the parts is as follows:

* The `LocationType` is used where necessary to clarify which location identifier
  is used and avoid ambiguity in interpreting identifiers, for example:
    + `wellid` for internal database well identifiers
    + `abbrev` for telemetry stations
    + `usgs` for USGS site identifiers for surface water stations, used when `abbrev` is also available
* The `Location` is set to one of the following depending on the measurement location type:
    + the State of Colorado’s water district identifier (WDID) for structures.
    + the State of Colorado’s abbreviation for telemetry stations
    + the State of Colorado's numerical identifier for wells (for water level and depth)
    + a third party data provider's identifier, such as USGS site identifier
    + if the database contains more than one identifier, the `LocationType` (see above)
      may be used to differentiate which identifier is used
* The `DataSource` is set to the primary data provider agency:
    + for example, `DWR` for diversion data
    + for example, `USGS` for USGS stream gages
* The `DataType` is set to:
    + The water class `divrectype` for structure time series
    + `parameter` for telemetry stations
    + `WaterLevelDepth` and `WaterLevelElev` for groundwater levels
    + `Stage` and `Volume` for `structures/divrec/stagevolume` web services
    + climate station `measType` (see statistic below)
    + surface water station `measType` (see statistic below)
    + Interval time series such as climate station and surface water station time series may require a statistic to
      accurately describe the data and uniquely identify the time series.
      For example, historical monthly streamflow can be the average value (full data type is `Streamflow-Avg`, statistic is `Avg`),
      minimum value (statistic is `Min`), maximum value (statistic is `Max`), and total (statistic is `Total`).
      Statistics also require an appropriate data unit.
    + Refer to the [HydroBase datastore appendix](../CO-HydroBase/CO-HydroBase.md)
      for a full list of time series data available in the HydroBase database,
      which are published in web services.
      In some cases, the data type used by TSTool will not exactly match HydroBase.
      For example, TSTool uses `ResMeasStorage` and HydroBase uses `ResMeas` to indicate reservoir measurements,
      which can contain several observations.
      The additional “Storage” is needed in TSTool to uniquely identify the time series for the specific data type.
      Because web services are a newer generation of data access tools,
      it has been possible to improve the consistency of data types used in web services and TSTool software.
* `Interval` is `Hour`, `Day`, `Month`, or `Year`, as requested, and `15Min` for raw telemetry data.
    + The `Day` interval is used for telemetry station and climate station data;
      consequently, case-specific data type is needed to ensure unique time series identifiers
      for data types such as `Evap`/`EVAP`.
    + the meaning of the `Year` interval varies:
        - calendar year for climate station data and as a general default
        - water year (October to September) for `Streamflow`, in particular when read from third party sources that use water year
        - irrigation year (November to October) for State of Colorado diversion records
        - if necessary, monthly data can be processed into alternative `Year` intervals
* The datastore name (`HydroBaseWeb` by default) indicates that the data
  are being read from the ColoradoHydroBaseRest web service.

## Limitations ##

The following limitations of the web service may impact users of the data.

* The REST web services are enhanced as services are integrated with CDSS software tools.
  See the [repository issues](https://github.com/OpenCDSS/cdss-lib-dmi-hydrobase-rest-java/issues) for more information.
* Data type – The goal of the datastore is to provide access to all time series that are available in HydroBase.
  However, data access is limited by features of the web services and funding to integrate with TSTool and other software.
  The legacy [ColoradoWaterHBGuest web services](../ColoradoWaterHBGuest/ColoradoWaterHBGuest.md) and
  [HydroBase Datastore](../CO-HydroBase/CO-HydroBase.md) documentation
  indicate a complete list of available data types that may ultimately be supported.
  Note that creating a complete diversion time series,
  in particular for structures that are not frequently measured,
  may require considering several data types, including `DivTotal` (total through headgate),
  `IDivTotal` (infrequent measurement, not currently implemented in this datastore), and `DivComment` (implemented as default).
  The following table lists HydroBase database data and corresponding web service data types.
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


## Datastore Configuration File ##

This datastore is automatically configured in a new TSTool installation,
has the name `HydroBaseWeb` and uses the installation configuration file named `datastores/HydroBaseWeb.cfg`.
The configuration can be overruled by adding a similarly-named configuration file
in the user's datastore files, as discussed below.

A datastore is typically configured by one or both of the following options:

1. Enable ColoradoHydroBaseRest datastores in the installation `system/TSTool.cfg` configuration file
   and create a datastore configuration file `datastores/HydroBaseWeb.cfg` to configure the datastore.
   TSTool is distributed with a default file that does not define the `ApiKey` property.
2. Create a user datastore configuration `.tstool/NN/datastores/HydroBaseWeb.cfg`,
   for example by copying and modifying the installation datastore configuration file.
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
* [`ReadStateMod`](../../command-ref/ReadStateMod/ReadStateMod.md) command
* [`ReadTableFromDelimitedFile`](../../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md) command
* [`ReadTableFromJSON`](../../command-ref/ReadTableFromJSON/ReadTableFromJSON.md) command
* [`WebGet`](../../command-ref/WebGet/WebGet.md) command
* [`WriteStateCU`](../../command-ref/WriteStateCU/WriteStateCU.md) command
