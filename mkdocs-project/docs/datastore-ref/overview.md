# TSTool / Datastore Reference / Overview #

*   [Introduction](#introduction)
*   [Datastore List](#datastore-list)
*   [Datastore Configuration](#datastore-configuration)

-----

## Introduction ##

This reference section of the documentation provides information about datastores.

The legacy “input type” terminology continues to be used but in the
future may be replaced with “file datastore” or similar.
See the input type appendices for information about how time series identifiers are formatted for specific input types.
TSTool features for a specific input type may only be available if the input type is enabled in the TSTool configuration file.
Input types may utilize an “input name”,
for example when a time series identifier needs to include the input type and the name of a file being read.
Reading time series from a single file using this approach makes sense because
there is no need to configure a datastore with a configuration file for every data file.
Most legacy input types that could be migrated to datastores have been migrated. 

Data sources that are associated with datastores and input types include:

*   databases:
    +   must be accessible via [ODBC](https://en.wikipedia.org/wiki/Open_Database_Connectivity)/[JDBC](https://en.wikipedia.org/wiki/Java_Database_Connectivity) connection,
        using a database driver software distributed with TSTool
    +   a datastore corresponding to a database is can be queried using Structured Query Language (SQL),
        such as with the [`ReadTableFromDataStore`](../command-ref/ReadTableFromDataStore/ReadTableFromDataStore.md) command
    +   general support for additional database software can be added relatively easily if an ODBC/JDBC driver is available for the database
    +   requires additional software development and integration with TSTool for time series identifier and read/write commands
*   web services:
    +   typically REST web services using a published API
    +   SOAP web services can also be supported
    +   requires software development and integration with TSTool
*   file databases:
    +   ideally uses an open specification
    +   typically optimized for a use, such as
        [HEC-DSS used with Army Corps](HEC-DSS/HEC-DSS.md) software
    +   adding a new file database requires implementing software that is able to read the file format
    +   currently are handled as ***Input Type*** in the TSTool software but in the future will
        be migrated to a "file datastore" design
*   files:
    +   ideally uses an open specification
    +   simple files, including general [DateValue](DateValue/DateValue.md) time series file and
        model files such as the
        [State of Colorado's StateMod model](StateMod/StateMod.md)
    +   currently are handled as ***Input Type*** in the TSTool software but in the future will
        be migrated to a "file datastore" design

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
See also the [Plugin Reference](../plugin-ref/overview.md) for a list of plugins that may provide datastore integration.

**<p style="text-align: center;">
Available TSTool Datastores
</p>**

| **Datastore or Input Type (link to documentation)**                                   | **Technology**         | **Spatial Extent** | **Contents**                                   |
|--|--|--|--|
| [ColoradoHydroBaseRest](ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) datastore     | Web service (REST)     | Colorado           | Historical and real-time data                  |
| Colorado SMS (legacy)<br>**OBSOLETE - replaced with [ColoradoHydroBaseRest](ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) web services**                                        | Database (SQL Server)  | Colorado           | Real-time data                                 |
| [ColoradoWaterHBGuest](ColoradoWaterHBGuest/ColoradoWaterHBGuest.md)<br>**OBSOLETE - replaced with [ColoradoHydroBaseRest](ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) web services** datastore | Web service (SOAP)     | Colorado           | Historical data                         |
| [ColoradoWaterSMS](ColoradoWaterSMS/ColoradoWaterSMS.md)<br>**OBSOLETE - replaced with [ColoradoHydroBaseRest](ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) web services** datastore    | Web service (SOAP)     | Colorado           | Real-time data                                 |
| [DateValue](DateValue/DateValue.md) input type                               | File (text)            | No limit           | General delimited date/value time series file with extended header information, able to store one or more time series. |
| Delimited File input type                                                                   | File (text)            | No limit           | Use the [`ReadDelimitedFile`](../command-ref/ReadDelimitedFile/ReadDelimitedFile.md)  to read delimited files such as comma-separated-value (csv) files. |
| [Delft FEWS PI XML](Delft-FEWS-PI-XML/Delft-FEWS-PI-XML.md) input type       | File (text)            | No limit           | Delft FEWS software file                       |
| [GenericDatabase](GenericDatabase/GenericDatabase.md) datastore              | Database (any ODBC)    | No limit           | Any SQL database                               |
| [HEC-DSS File](HEC-DSS/HEC-DSS.md) input type                                | File database (binary) | No limit           | Army Corps of Engineers binary time series database file used with Hydrologic Engineering Center (HEC) software. |
| [HydroBase](CO-HydroBase/CO-HydroBase.md) datastore                          | Database (SQL Server)  | Colorado           | Colorado water resources (datastore version)   |
| [HydroBase (legacy input type version)](CO-HydroBase-legacy/CO-HydroBase-legacy.md) input type| Database (SQL Server)  | Colorado           | Colorado water resources (input type version). See the [HydroBase datastore](CO-HydroBase/CO-HydroBase.md) documentation for latest documentation. |
| [HydroJSON](HydroJSON/HydroJSON.md) input type                               | File (text)            | No limit           | HydroJSON time series format                   |
| [MODSIM](MODSIM/MODSIM.md) input type                                        | File (text)            | No limit           | [Colorado State University MODSIM model](http://modsim.engr.colostate.edu/), version 7.  MODSIM version 8+ uses a database but full support has not been added (see Generic Database datastore as one option). |
| [NDFD](NDFD/NDFD.md)<br>**OBSOLETE - need new equivalent**                   | File (text)            | No limit           | National Digital Forecast Database             |
| [NRCS AWDB](NRCS-AWDB/NRCS-AWDB.md) datastore                                | Web service (SOAP)     | USA                | Snow, reservoir, climate, other                |
| [NWS Card](NWSCard/NWSCard.md)<br>**OBSOLETE - NWS uses other formats** input type | File (text)            | No limit           | National Weather Service River Forecast System (NWSRFS) card file format for hour interval data. |
| [NWSRFS ESP Trace Ensemble](NWSRFSEspTraceEnsemble/NWSRFSEspTraceEnsemble.md)<br>**OBSOLETE** input type | File (binary)          | No limit           | NWSRFS time series ensemble (hour interval). |
| [NWSRFS FS5Files](NWSRFS-FS5Files/NWSRFS-FS5Files.md)<br>**OBSOLETE** input type | File database (binary) | No limit           | National Weather Service River Forecast System |
| [RCC ACIS](RCC-ACIS/RCC-ACIS.md) datastore                                   | Web service (REST)     | USA                | Precipitation, temperature, other climate      |
| [Reclamation Pisces](ReclamationPisces/ReclamationPisces.md) datastore       | Database (MySQL)       | USA                | Water resources                                |
| [RiversideDB](RiversideDB/RiversideDB.md)<br>**OBSOLETE** input type         | Database (SQL Server)  | No limit           | Hydrologic modeling database.  Has been removed from TSTool as of version 13. |
| [RiverWare](RiverWare/RiverWare.md) input type                               | File (text)            | No limit           | University of Colorado Center for Advanced Decision Support for Water and Environmental Systems (CADSWES) RiverWare modeling software data file          |
| [SHEF](SHEF/SHEF.md) input type                                              | File (text)            | No limit           | National Weather Service (NWS) Standard Hydrologic Exchange Format, which is a common format used by US government agencies. |
| [StateCU](StateCU/StateCU.md) input type                                     | File (text)            | No limit           | StateCU modeling software data file            |
| [StateCUB - StateCU Output](StateCUB/StateCUB.md) input type                 | File (binary)          | No limit           | StateCU modeling software data file            |
| [StateMod](StateMod/StateMod.md) input type                                  | File (text)            | No limit           | StateMod modeling software data file           |
| [StateModB - StateMod Output](StateModB/StateModB.md) input type             | File (binary)          | No limit           | StateMod modeling software data file           |
| [USGS NWIS Daily](USGS-NWIS-Daily/USGS-NWIS-Daily.md) datastore              | Web service (REST)     | No limit           | Water and other data (day interval)            |
| [USGS NWIS Groundwater](USGS-NWIS-Groundwater/USGS-NWIS-Groundwater.md) datastore | Web service (REST)     | No limit           | Groundwater and other data                     |
| [USGS NWIS Instantaneous](USGS-NWIS-Instantaneous/USGS-NWIS-Instantaneous.md) datastore | Web service (REST)     | No limit           | Water and other data (instantaneous interval)  |
| [USGS NWIS RDB](USGS-NWIS-RDB/USGS-NWIS-RDB.md) input type                   | File (text)            | No limit           | RDB format for USGS data (see USGS above)      |
| [WaterML](WaterML/WaterML.md) input type                                     | File (text)            | No limit           | WaterML format for USGS data (see USGS above)  |
| [WaterML2](WaterML2/WaterML2.md) input type                                  | File (text)            | No limit           | WaterML format for USGS data (see USGS above)  |
| [WaterOneFlow](WaterOneFlow/WaterOneFlow.md)<br>**prototype** datastore      | Web service (SOAP)     | No limit           | Web service for CUAHSI                         |

## Datastore Configuration ##

Datastores are configured using datastore configuration files, which are described in the specific appendix.
The `system/TSTool.cfg` file located in the software installation folder provides properties to enable/disable
datastores globally, which turns off software features (such as ***Commands*** menu for commands related to the datastore).
A similar file can be created in users's files (`.tstool/NN/system/TSTool.cfg`) to configure TSTool for each major version.

Built-in (installation) datastore configuration files are located in the software installation `system/datastores` folder.
User datastore configuration files are located in the `.tstool/NN/datastores` folder.
The user configuration files override the installation configuration files.
For example, the State of Colorado HydroBase datastore configuration file `.tstool/13/datastores/HydroBase.cfg`
defining a datastore named `HydroBase` will override a similarly-named datastore in
configuration file `C:\Users\user\CDSS\TSTool-13.00.00\datastores\HydroBase.cfg`.
Note that the `Name` property in the datastore configuration file defines the name, not the file name.
User datastore configuration files allow providing a more specific configuration for:

*   database version for [HydroBase datastore](CO-HydroBase/CO-HydroBase.md) database installed on user's computer
*   API key for [ColoradoHydroBaseRest](ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) web services for
    the specific user
*   user-specific datastore files used by software developers

Use the ***View / Datastores*** menu in TSTool to view datastores that are enabled, in particular to review
configuration errors and to see which configuration file was used for a datastore.

Use the ***Tools / Options*** menu in TSTool to change TSTool configuration properties.
If necessary, edit configuration files with a text editor.
