# TSTool / Datastore Reference / Overview #

This reference section of the documentation provides information about datastores:

* databases - must be accessible via ODBC/JDBC connection
* file databases - typically optimized for a use, such as HEC-DSS
* files - simple files, including model files
* web services - SOAP and REST web services

A "datastore" is where time series and other data are saved and can be accessed.
TSTool originally used the term "input type" for some formats,
For example, newer databases and web services are treated as "datastores",
whereas older files are treated as "input types".
The "input type" notation is retained in the software,
pending migration to datastores - datastores and input types
can be selected in the TSTool interface when browsing data.
A software design goal is to move all input types to "file datastores" so that terminology is consistent.

Time series, tables, and other data objects can be read from datastores using `Read` commands.
Some datastores can also be written to, using `Write` commands.
Datastores containing time series have general characteristics that can be handled with general software features.
For example time series identifier commands (TSIDs) are used to uniquely identify time series in
a datastore and result in an automatic data read from the datastore.
However, some datastores have specific characteristics that are difficult to support in a general way,
in which case `Read` command parameters or datastore configuration properties are used to control software behavior.

The following datastores (and input types) are listed in alphabetical order by datastore name, with the following explanation:

| **Datastore (link to documentation)**                                        | **Technology**         | **Spatial Extent** | **Contents**                                   | **Documentation Status** |
|--|--|--|--|--|
| [ColoradoHydroBaseRest](ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)      | Web service (REST)     | Colorado           | Historical and real-time data                  | New - in process |
| Colorado SMS (legacy)<br>**OBSOLETE**                                        | Database (SQL Server)  | Colorado           | Real-time data                                 | **not yet migrated** - no longer used |
| [ColoradoWaterHBGuest](ColoradoWaterHBGuest/ColoradoWaterHBGuest.md)<br>**OBSOLETE**| Web service (SOAP)     | Colorado           | Historical data                         | Migrated |
| [ColoradoWaterSMS](ColoradoWaterSMS/ColoradoWaterSMS.md)<br>**OBSOLETE**     | Web service (SOAP)     | Colorado           | Real-time data                                 | Migrated |
| [DateValue](DateValue/DateValue.md)                                          | File (text)            | No limit           | General time series format                     | Migrated |
| [Delft FEWS PI XML](Delft-FEWS-PI-XML/Delft-FEWS-PI-XML.md)                  | File (text)            | No limit           | Delft FEWS software file                       | Migrated |
| [GenericDatabase](GenericDatabase/GenericDatabase.md)                        | Database (any ODBC)    | No limit           | Any SQL database                               | Migrated |
| [HEC-DSS File](HEC-DSS/HEC-DSS.md)                                           | File database (binary) | No limit           | General time series database                   | Migrated |
| [HydroBase](CO-HydroBase/CO-HydroBase.md)                                    | Database (SQL Server)  | Colorado           | Colorado water resources (datastore version)   | Migrated |
| [HydroBase (legacy)](CO-HydroBase-legacy/CO-HydroBase-legacy.md)             | Database (SQL Server)  | Colorado           | Colorado water resources (input type version)  | Use [HydroBase datastore](CO-HydroBase/CO-HydroBase.md) documentation. |
| [HydroJSON](HydroJSON/HydroJSON.md)                                          | File (text)            | No limit           | HydroJSON time series format                   | Migrated |
| [MODSIM](MODSIM/MODSIM.md)                                                   | File (text)            | No limit           | MODSIM modeling software data file             | Migrated |
| [NRCS AWDB](NRCS-AWDB/NRCS-AWDB.md)                                          | Web service (SOAP)     | USA                | Snow, reservoir, climate, other                | Migrated |
| [NDFD](NDFD/NDFD.md)                                                         | File (text)            | No limit           | National Digital Forecast Database.            | **not yet migrated (placeholder)**|
| [NWS Card](NWS-NWSRFS/NWS-NWSRFS.md)<br>**OBSOLETE**                         | File (text)            | No limit           | General time series format (hour interval)     | **not yet migrated - being phased out**     |
| [NWSRFS ESP Ensemble](NWS-NWSRFS/NWS-NWSRFS.md)<br>**OBSOLETE**              | File (binary)          | No limit           | Ensembles of time series (hour interval)       | **not yet migrated - being phased out**     |
| [NWSRFS FS5Files](NWS-NWSRFS/NWS-NWSRFS.md)<br>**OBSOLETE**                  | File database (binary) | No limit           | National Weather Service River Forecast System | **not yet migrated - being phased out**     |
| [RCC ACIS](RCC-ACIS/RCC-ACIS.md)                                             | Web service (REST)     | USA                | Precipitation, temperature, other climate      | Migrated |
| [Reclamation HDB](ReclamationHDB/ReclamationHDB.md)                          | Database (Oracle)      | USA                | Water resources                                | Migrated |
| [Reclamation Pisces](ReclamationPisces/ReclamationPisces.md)                 | Database (MySQL)       | USA                | Water resources                                | Migrated |
| [RiversideDB](RiversideDB/RiversideDB.md)                                    | Database (SQL Server)  | No limit           | Hydrologic modeling database.                  | **not yet migrated (placeholder)**     |
| [RiverWare](RiverWare/RiverWare.md)                                          | File (text)            | No limit           | RiverWare modeling software data file          | Migrated |
| [StateCU](StateCU/StateCU.md)                                                | File (text)            | No limit           | StateCU modeling software data file            | Migrated |
| [StateCUB - StateCU Output](StateCUB/StateCUB.md)                            | File (binary)          | No limit           | StateCU modeling software data file            | Migrated |
| [StateMod](StateMod/StateMod.md)                                             | File (text)            | No limit           | StateMod modeling software data file           | Migrated |
| [StateModB - StateMod Output](StateModB/StateModB.md)                        | File (binary)          | No limit           | StateMod modeling software data file           | Migrated |
| [USGS NWIS Daily](USGS-NWIS-Daily/USGS-NWIS-Daily.md)                        | Web service (REST)     | No limit           | Water and other data (day interval)            | Migrated |
| [USGS NWIS Groundwater](USGS-NWIS-Groundwater/USGS-NWIS-Groundwater.md)      | Web service (REST)     | No limit           | Groundwater and other data                     | Migrated |
| [USGS NWIS Instantaneous](USGS-NWIS-Instantaneous/USGS-NWIS-Instantaneous.md)| Web service (REST)     | No limit           | Water and other data (instantaneous interval)  | Migrated |
| [USGS NWIS RDB](USGS-NWIS-RDB/USGS-NWIS-RDB.md)                              | File (text)            | No limit           | RDB format for USGS data (see USGS above)      | Migrated |
| [WaterML](WaterML/WaterML.md)                                                | File (text)            | No limit           | WaterML format for USGS data (see USGS above)  | **not yet migrated (placeholder)**     |
| [WaterML2](WaterML2/WaterML2.md)                                              | File (text)            | No limit           | WaterML format for USGS data (see USGS above)  | **not yet migrated (placeholder)**     |
| [WaterOneFlow](WaterOneFlow/WaterOneFlow.md)                                 | Web service (SOAP)     | No limit           | Web service for CUAHSI                         | **not yet migrated**     |
