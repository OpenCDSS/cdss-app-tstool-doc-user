# TSTool / Datastore Reference / NWSRFS FS5Files #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)

--------------

## Overview ##

**NWSRFS FS5Files TSTool features were used with the legacy National Weather Service River Forecat System (NWSRFS).
However, the NWS has migrated to newer technologies.
This documentation is retained for reference and may be removed in the future.  Obsolete NWSRFS features are being removed from TSTool.
The use of present tense has been retained even though the technology is legacy.**

The NWSRFS FS5Files time series input type refers to time series read from the binary
FORTRAN database files used with the National Weather Service River Forecast System (NWSRFS).
This system typically runs on Linux workstations.
Time series within the NWSRFS consist of the following:

* **Preprocessor database time series**.  Raw observation data (e.g., in SHEF format – see the
[SHEF input type](../SHEF/SHEF.md) documentation) are processed by the `shefpars` and `shefpost`
software with the results being stored in the preprocessor database as 1, 3, 6, 12, or 24-hour values.
* **Processed database time series**.  Time series from the preprocessor database,
and other input, are processed to create regular-interval 1, 3, 6, 12, or 24-hour time series in the processed database.
The `DATATYPE` file indicates a PP if a preprocessor routine is the only component to write the processed database time series.
For example, the MAP preprocessor uses point precipitation time series in the preprocessor
database to compute mean areal precipitation (`MAP`) in the processed database.
Processed database time series are referenced using “external” identifiers,
which correspond to time series identifiers in the NWSRFS operations tables.
Although NWSRFS models may use numerous time series,
only those identified as “output” time series are written to the processed database and are therefore available after simulation.
Output time series can have the same location identifier and data type, but must have different intervals.
* **Calibration database time series**.
Historical time series, which are used in model calibration, are typically stored in NWS Card format files.
These time series are not discussed here – see the [NWSCard Input Type Appendix](../NWSCard/NWSCard.md).
* **Ensemble streamflow prediction (ESP) time series**.
ESP trace ensemble time series are produced by the ESP software,
which uses current conditions in the forecast system,
and historical input from the calibration database, to generate probabilistic forecasts.
These time series are not discussed here – see the [NWSRFS ESP Trace Ensemble Input Type Appendix](../NWSRFSEspTraceEnsemble/NWSRFSEspTraceEnsemble.md).
* **Other time series**, including time-stamped gridded data are not considered in this documentation.

The remainder of this documentation focuses on the preprocessor and processed database time series.

Important comments about the NWSRFS FS5Files input type are:

* Because the NWSRFS is a real-time forecasting system that is used for large regions, recognition of time zone is important.
Therefore, the NWSRFS database uses Z time (Zulu, or GMT) to store data.
Consequently, the dates associated with time series returned from the NWSRFS FS5Files
database will by default have a time zone of Z.
Features of some applications may allow the time zone to be shifted to local time for viewing and analysis.
* Most NWSRFS string data are uppercase.
* The missing data value is `-999` in most cases.

## Standard Time Series Properties ##

The standard time series identifier for NWSRFS time series read from the operational forecast system (OFS) is one of the forms shown below.

To use ofs_files Apps_Defaults variable to find files:

```
Location.NWSRFS.DataType[-PPDB].Interval[.OBS|FUT]~NWSRFS_FS5Files
```

To specify the directory where files are located:

```
Location.NWSRFS.DataType[-PPDB].Interval[.OBS|FUT]~NWSRFS_FS5Files~Directory
```

The NWSRFS Interactive Forecast Program (IFP) copies the operational forecast system FS5Files to a working directory.
To specify a time series from the IFP files, use the second form above, where the directory is that of the IFP FS5Files.
In the above examples, the scenario,
if omitted, indicates that the entire time series is to be read (impacted by run-time start and end date/times).
If the scenario is specified as OBS, then only observed data will be read.
If the scenario is FUT, then only future (forecasted) data will be read.
Because the preprocessor database does not contain an indicator for future data,
the scenario only applies to processed database time series.

The MAP data type indicates mean areal precipitation and FMAP indicates future mean areal precipitation.
All other data types are handled as “merged” data.  Special considerations are as follows:

* To retrieve only future mean areal precipitation data, the `MAP` data type with the `FUT` scenario can be used or the `FMAP` data type can be used.
* To retrieve only observed mean areal precipitation, use the `MAP` data type with scenario `OBS`.
* To retrieve both observed and future mean areal precipitation, use the MAP data type and no scenario.
* For all other data types, use the normal time series identifier conventions described above.

The NWSRFS FS5Files input type is designed to handle both preprocessor and processed database time series, for the following reasons:

* To remove the need for users to know the difference between databases;
therefore, they can concentrate on data types, not files.
* To allow future enhancements to NWSRFS, in which a common database is used,
to be supported – in the future, this will allow time series identifiers to be specified
for the legacy FS5Files and the new system (with a new input type, to be determined);
consequently the same time series could be read from both databases, in order to compare results.

In order to allow data to be read from the preprocessor and processed database without distinction,
the data types must be unique because software will use
the data type to determine which database file needs to be read.
The following data types occur in both the preprocessor and processed database and are used by the
RRS preprocessor:  `DQIN`, `DQME`, `PELV`, `QIN`, `QME`, `RQIM`, `RQIN`, `RQME`, `RQOT`, `RSTO`, `SNOG`, `SNWE`, `TWEL`, `ZELV`.
To differentiate the preprocessor and processed database time series,
preprocessor database time series have a sub-datatype of `PPDB`.
To have consistency, all preprocessor database time series have the data-subtype of `PPDB`.

Specific conventions for NWSRFS FS5Files are as follows:

* The location is set to the station identifier (preprocessor database) or output time series identifier (processed database).
To avoid confusion, it is recommended that NWSRFS systems be defined
such that the time series identifier for the segment/operation is the same as the identifier on the processed database.
* The data source is set to NWSRFS, indicating that the time series are processed,
created, or otherwise managed by NWSRFS.
At this time, it is not possible to assign the data source to the originating provider (e.g., `USGS`, `NOAA`),
in particular for the preprocessor database.
* The data type is set to the data type defined for the time series in the preprocessor or processed databases.
Processed database time series are listed in the NWSRFS DATATYPE system file, for data types available in the FDB (forecast database).

Preprocessor database data types are as follows (see NWSRFS documentation IX.4.2B-PDBINDEX note 1 and IX.3.4B-RPDDLY-2;
RRS data types are apparently not documented).  In the following table, a sub-datatype of `PPDB`
is added to identify the data as being in the preprocessor database,
simply to avoid confusion with the same data type that may be defined elsewhere in the system.

| **Preprocessor Database Data Type** | **Available Interval(s)** | **Description** |
| ----------------------------------- | ------------------------- | --------------- |
| `APIG-PPDB` | 24Hour, Day? | Grid point API values. |
| `DQIN-PPDB` | ? | Diversion instantaneous flow. |
| `DQME-PPDB` | ? | Diversion mean flow. |
| `EA24-PPDB` | 24Hour, Day? | Potential evaporation. |
| `MDR6-PPDB` | 6Hour | 6-hour manually digitized radar. |
| `PELV-PPDB` | ? | Reservoir pool. |
| `PG24-PPDB` | 24Hour, Day? | Grid point 24-hour precipitation. |
| `PP01-PPDB` | 1Hour? | 1-hour precipitation accumulations? |
| `PP03-PPDB` | 3Hour? | 3-hour precipitation accumulations? |
| `PP06-PPDB` | 6Hour? | 6-hour precipitation accumulations? |
| `PP24-PPDB` | 24Hour | 24-hour precipitation accumulations. |
| `PPSR-PPDB` | 24Hour? Day? | Stranger precipitation reports. |
| `PPST-PPDB` | 24Hour? Day? | Satellite precipitation estimates. |
| `PPVR-PPDB` | 24Hour? Day? | Less than 24-hour precipitation, one value per day. |
| `QIN-PPDB` | ? | River discharge. |
| `QME-PPDB` | ? | River discharge, mean. |
| `RC24-PPDB`, `RP24-PPDB`, `RI24-PPDB` | ? | Reservoir release, capacity, pool, inflow? |
| `RQIM-PPDB` | ? | Reservoir inflow, mean. |
| `RQIN-PPDB` | ? | Reservoir inflow. |
| `RQME-PPDB` | ? | Reservoir outflow, mean. |
| `RQOT-PPDB` | ? | Reservoir outflow. |
| `RSTO-PPDB` | ? | Reservoir storage. |
| `SNOG-PPDB` | ? | Snow cover depth. |
| `SNWE-PPDB` | ? | Observed snow water equivalent. |
| `STG-PPDB` | ? | River stage. |
| `TA01-PPDB` | 1Hour? | 1-hour instantaneous air temperature? |
| `TA03-PPDB` | 3Hour? | 3-hour instantaneous air temperature? |
| `TA06-PPDB` | 6Hour? | 6-hour instantaneous air temperature? |
| `TA24-PPDB` | 24Hour? Day? | Instantaneous air temperature (when recorded?). |
| `TAVR-PPDB` | 24Hour? Day? | Less than 24-hour instantaneous temperature. |
| `TD24-PPDB` | ? | ? |
| `TF24-PPDB` | 24Hour?  Day? | Forecast maximum/minimum temperature. |
| `TFMN-PPDB` | 24Hour?  Day? | Forecast minimum temperature? |
| `TFMX-PPDB` | 24Hour?  Day? | Forecast maximum temperature? |
| `TM24-PPDB` | 24Hour?  Day? | 24-hour maximum/minimum temperature. |
| `TN24-PPDB` | 24Hour?  Day? | Minimum temperature in the previous 24-hour period? |
| `TWEL-PPDB` | ? | Tailwater stage. |
| `TX24-PPDB` | 24Hour?  Day? | Maximum temperature in the previous 24-hour period? |
| `US24-PPDB` | ? | ? |
| `ZELV-PPDB` | ? | Freezing level. |

* The interval is set to a multiple of the hour interval defined in database files (e.g., `6Hour`).
Most time series will be regular, even those in the preprocessor database.
The only irregular data will be in `SHEF` files (see the [SHEF Input Type Appendix](../SHEF/SHEF.md)),
and preprocessor database time series that have variable duration.
Capabilities to read preprocessor database time series are being enabled over time and additional
information about available intervals will be documented as features are enabled.
* The scenario is blank if reading observed and future data,
`OBS` if only observed data are requested, and `FUT` if only future data are requested.
* The input type is `NWSRFS_FS5Files`.
* The input name is blank to use the current `Apps_Defaults` settings to locate the files,
or a directory name, indicating the location of FS5Files.
The latter allows FS5Files to be read directly by software outside of a full NWSRFS implementation (including on PCs if necessary).
* The data units are determined from the database files.

## Limitations ##

The NWSRFS FS5Files input type has the following limitations:

* The NWSRFS software is typically only installed at National Weather Service River Forecast Centers
or large entities that have staff to support the system.
Outside of these systems, the NWS Card, SHEF, and ESP trace ensemble formats may be distributed as data products.
* Useful information like the NWSRFS carryover group,
forecast group, segment, and operation are not currently passed back with the time series data,
other than in time series comments.
This is due to the fact that the time series are read directly from the processed database
rather than determine which system components use the time series.
Consequently, applications like TSTool cannot display this information when time series are listed (other than in comments).
Some information is indicated in the time series comments and may eventually be made available as a property list.
* Currently, software has been enabled to read only time series from the NWSRFS processed database,
and the RRS data types from the preprocessor database.
Discussion in this appendix also includes the remaining preprocessor database data types,
in order to define conventions for time series identifiers, to allow for future enhancements.
* Full support for the `-998` missing data value (accumulated value) has not been added.
