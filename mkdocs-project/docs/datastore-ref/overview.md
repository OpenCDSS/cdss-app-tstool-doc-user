# TSTool / Datastore Reference / Overview #

* [Introduction](#introduction)
* [Datastore List](#datastore-list)
* [Datastore Configuration](#datastore-configuration)

-----

## Introduction ##

This reference section of the documentation provides information about datastores:

* databases - must be accessible via [ODBC](https://en.wikipedia.org/wiki/Open_Database_Connectivity)/[JDBC](https://en.wikipedia.org/wiki/Java_Database_Connectivity) connection,
typically through database driver software distributed with TSTool
(support for additional database software can be added)
* file databases - typically optimized for a use, such as HEC-DSS used with Army Corps and other software
* files - simple files, including model files such as the State of Colorado's StateMod model
* web services - SOAP and REST web services

A "datastore" is a data management component that
saves time series and other data.
TSTool originally used the term "input type" for some formats such as data files and HydroBase database.
However, the newer "datastore" design has since been implemented to provide more flexibility in configuring data access.
Newer databases and web services are treated as "datastores",
whereas older files are treated as "input types".
The "input type" notation is retained in the software, pending a full migration to datastores.
Datastores and input types can be selected in the TSTool interface when browsing data.
A software design goal is to move all input types to "file datastores" so that terminology is consistent.

Time series, tables, and other data objects can be read from datastores using `Read` commands.
Some datastores can also be written to, using `Write` commands.
Datastores containing time series have general characteristics that can be handled with general software features.
For example time series identifier commands (TSIDs) are used to uniquely identify time series in
a datastore and result in an automatic data read from the datastore.
However, some datastores have specific characteristics that are difficult to support in a general way,
in which case `Read` command parameters or datastore configuration properties are used to control software behavior.

## Datastore List ##

The following datastores (and input types) are listed in alphabetical order by datastore name.
Any datastores or other features that are obsolete may have already been removed from TSTool or may be removed in the future.
If necessary, such features can be reimplemented as a plugin datastore and used on specific installations of TSTool.

| **Datastore (link to documentation)**                                        | **Technology**         | **Spatial Extent** | **Contents**                                   | **Documentation Status** |
|--|--|--|--|--|
| [ColoradoHydroBaseRest](ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)      | Web service (REST)     | Colorado           | Historical and real-time data                  | Migrated |
| Colorado SMS (legacy)<br>**OBSOLETE - replaced with ColoradoHydroBaseRest web services**                                        | Database (SQL Server)  | Colorado           | Real-time data                                 | **not yet migrated** - no longer used |
| [ColoradoWaterHBGuest](ColoradoWaterHBGuest/ColoradoWaterHBGuest.md)<br>**OBSOLETE - replaced with ColoradoHydroBaseRest web services**| Web service (SOAP)     | Colorado           | Historical data                         | Migrated - for reference |
| [ColoradoWaterSMS](ColoradoWaterSMS/ColoradoWaterSMS.md)<br>**OBSOLETE - replaced with ColoradoHydroBaseRest web services**     | Web service (SOAP)     | Colorado           | Real-time data                                 | Migrated - for reference |
| [DateValue](DateValue/DateValue.md)                                          | File (text)            | No limit           | General time series format                     | Migrated |
| [Delft FEWS PI XML](Delft-FEWS-PI-XML/Delft-FEWS-PI-XML.md)                  | File (text)            | No limit           | Delft FEWS software file                       | Migrated |
| [GenericDatabase](GenericDatabase/GenericDatabase.md)                        | Database (any ODBC)    | No limit           | Any SQL database                               | Migrated |
| [HEC-DSS File](HEC-DSS/HEC-DSS.md)                                           | File database (binary) | No limit           | General time series database                   | Migrated |
| [HydroBase](CO-HydroBase/CO-HydroBase.md)                                    | Database (SQL Server)  | Colorado           | Colorado water resources (datastore version)   | Migrated |
| [HydroBase (legacy, input type version)](CO-HydroBase-legacy/CO-HydroBase-legacy.md)             | Database (SQL Server)  | Colorado           | Colorado water resources (input type version)  | Use [HydroBase datastore](CO-HydroBase/CO-HydroBase.md) documentation. |
| [HydroJSON](HydroJSON/HydroJSON.md)                                          | File (text)            | No limit           | HydroJSON time series format                   | Migrated |
| [MODSIM](MODSIM/MODSIM.md)                                                   | File (text)            | No limit           | MODSIM modeling software data file             | Migrated |
| [NRCS AWDB](NRCS-AWDB/NRCS-AWDB.md)                                          | Web service (SOAP)     | USA                | Snow, reservoir, climate, other                | Migrated |
| [NDFD](NDFD/NDFD.md)<br>**OBSOLETE - need new equivalent**                   | File (text)            | No limit           | National Digital Forecast Database             | Migrated |
| [NWS Card](NWSCard/NWSCard.md)<br>**OBSOLETE - NWS uses other formats**      | File (text)            | No limit           | General time series format (hour interval)     | Migrated |
| [NWSRFS ESP Trace Ensemble](NWSRFSEspTraceEnsemble/NWSRFSEspTraceEnsemble.md)<br>**OBSOLETE**        | File (binary)          | No limit           | Ensembles of time series (hour interval)       | Migrated |
| [NWSRFS FS5Files](NWSRFS-FS5Files/NWSRFS-FS5Files.md)<br>**OBSOLETE**        | File database (binary) | No limit           | National Weather Service River Forecast System | Migrated |
| [RCC ACIS](RCC-ACIS/RCC-ACIS.md)                                             | Web service (REST)     | USA                | Precipitation, temperature, other climate      | Migrated |
| [Reclamation HDB](ReclamationHDB/ReclamationHDB.md)                          | Database (Oracle)      | USA                | Water resources                                | Migrated |
| [Reclamation Pisces](ReclamationPisces/ReclamationPisces.md)                 | Database (MySQL)       | USA                | Water resources                                | Migrated |
| [RiversideDB](RiversideDB/RiversideDB.md)<br>**OBSOLETE**                    | Database (SQL Server)  | No limit           | Hydrologic modeling database.                  | **Has been removed from TSTool as of version 13**     |
| [RiverWare](RiverWare/RiverWare.md)                                          | File (text)            | No limit           | RiverWare modeling software data file          | Migrated |
| [StateCU](StateCU/StateCU.md)                                                | File (text)            | No limit           | StateCU modeling software data file            | Migrated |
| [StateCUB - StateCU Output](StateCUB/StateCUB.md)                            | File (binary)          | No limit           | StateCU modeling software data file            | Migrated |
| [StateMod](StateMod/StateMod.md)                                             | File (text)            | No limit           | StateMod modeling software data file           | Migrated |
| [StateModB - StateMod Output](StateModB/StateModB.md)                        | File (binary)          | No limit           | StateMod modeling software data file           | Migrated |
| [USGS NWIS Daily](USGS-NWIS-Daily/USGS-NWIS-Daily.md)                        | Web service (REST)     | No limit           | Water and other data (day interval)            | Migrated |
| [USGS NWIS Groundwater](USGS-NWIS-Groundwater/USGS-NWIS-Groundwater.md)      | Web service (REST)     | No limit           | Groundwater and other data                     | Migrated |
| [USGS NWIS Instantaneous](USGS-NWIS-Instantaneous/USGS-NWIS-Instantaneous.md)| Web service (REST)     | No limit           | Water and other data (instantaneous interval)  | Migrated |
| [USGS NWIS RDB](USGS-NWIS-RDB/USGS-NWIS-RDB.md)                              | File (text)            | No limit           | RDB format for USGS data (see USGS above)      | Migrated |
| [WaterML](WaterML/WaterML.md)                                                | File (text)            | No limit           | WaterML format for USGS data (see USGS above)  | Migrated |
| [WaterML2](WaterML2/WaterML2.md)                                             | File (text)            | No limit           | WaterML format for USGS data (see USGS above)  | Migrated |
| [WaterOneFlow](WaterOneFlow/WaterOneFlow.md)<br>**prototype**                | Web service (SOAP)     | No limit           | Web service for CUAHSI                         | Migrated |

## Datastore Configuration ##

Datastores are configured using datastore configuration files, which are described in the specific appendix.
The `system/TSTool.cfg` file located in the software installation folder provides properties to enable/disable
datastores globally, which turns off software features (such as ***Commands*** menu for commands
related to the datastore).
A similar file can be created in users's files (`.tstool/NN/system/TSTool.cfg`) to configure TSTool for each major version.

Built-in (installation) datastore configuration files are located in the software installation `system/datastores` folder.
User datastore configuration files are located in the `.tstool/NN/datastores` folder.
The user configuration files override the installation configuration files.
For example, the State of Colorado HydroBase datastore configuration file `.tstool/13/datastores/HydroBase.cfg`
defining a datastore named `HydroBase` will override a similarly-named datastore in
configuration file `C:\Users\user\CDSS\TSTool-13.00.00\datastores\HydroBase.cfg`.
Note that the `Name` property in the datastore configuration file defines the name, not the file name.
User datastore configuration files allow providing a more specific configuration for:

* database version for [HydroBase datastore](CO-HydroBase/CO-HydroBase.md) database installed on user's computer
* API key for [ColoradoHydroBaseRest](ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) web services for
the specific user
* user-specific datastore files used by software developers

Use the ***View / Datastores*** menu in TSTool to view datastores that are enabled, in particular to review
configuration errors and to see which configuration file was used for a datastore.

Use the ***Tools / Options*** menu in TSTool to change TSTool configuration properties.
If necessary, edit configuration files with a text editor.
