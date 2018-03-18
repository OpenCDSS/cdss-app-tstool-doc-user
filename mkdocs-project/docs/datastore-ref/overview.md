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

| **Datastore (link to documentation)**                             | **Technology**         | **Spatial Extent** | **Contents**                                   | **Documentation Status** |
| [Colorado SMS (legacy)](ColoradoSMSDatabase/ColoradoSMSDatabase)  | Database (SQL Server)  | Colorado           | Real-time data                                 | **not yet migrated**     |
| [ColoradoWaterHBGuest](ColoradoWaterHBGuest/ColoradoWaterHBGuest) | Web service (SOAP)     | Colorado           | Historical data                                | **not yet migrated**     |
| [ColoradoWaterSMS](ColoradoWaterSMS/ColoradoWaterSMS)             | Web service (SOAP)     | Colorado           | Real-time data                                 | **not yet migrated**     |
| [DateValue](DateValue/DateValue)                                  | File (text)            | No limit           | General time series format                     | **not yet migrated**     |
| [Delft FEWS PI XML](DelftFewsPiXML/DelftFewsPiXml)                | File (text)            | No limit           | Delft FEWS software file                       | **not yet migrated**     |
| [GenericDatabase](GenericDatabase/GenericDatabase)                | Database (any ODBC)    | No limit           | Any SQL database                               | **not yet migrated**     |
| [HEC-DSS File](HECDSS/HECDSS)                                     | File database (binary) | No limit           | General time series database                   | **not yet migrated**     |
| [HydroBase](HydroBase/HydroBase)                                  | Database (SQL Server)  | Colorado           | Colorado water resources (datastore version)   | **not yet migrated**     |
| [HydroBase (legacy)](HydroBase/HydroBase-legacy)                  | Database (SQL Server)  | Colorado           | Colorado water resources (input type version)  | **not yet migrated**     |
| [MODSIM](MODSIM/MODSIM)                                           | File (text)            | No limit           | MODSIM modeling software data file             | **not yet migrated**     |
| [NRCS AWDB](NrcsAwdb/NrcsAwdb)                                    | Web service (SOAP)     | USA                | Snow, reservoir, climate, other                | **not yet migrated**     |
| [NWS Card](NwsCard/NwsCard)                                       | File (text)            | No limit           | General time series format (hour interval)     | **not yet migrated**     |
| [NWSRFS ESP Ensemble](NwsrfsEspEnsemble/NwsrfsEspEnsemble)        | File (binary)          | No limit           | Ensembles of time series (hour interval)       | **not yet migrated**     |
| [NWSRFS FS5Files](NwsrfsFs5files/NwsrfsFs5files)                  | File database (binary) | No limit           | National Weather Service River Forecast System | **not yet migrated**     |
| [RCC ACIS](NwsrfsFs5files/NwsrfsFs5files)                         | Web service (REST)     | USA                | Precipitation, temperature, other climate      | **not yet migrated**     |
| [Reclamation HDB](ReclamationHdb/ReclamationHdb)                  | Database (Oracle)      | USA                | Water resources                                | **not yet migrated**     |
| [Reclamation Pisces](ReclamationPisces/ReclamationPisces)         | Database (MySQL)       | USA                | Water resources                                | **not yet migrated**     |
| [RiverWare](RiverWare/RiverWare)                                  | File (text)            | No limit           | RiverWare modeling software data file          | **not yet migrated**     |
| [StateCU](StateCU/StateCU)                                        | File (text)            | No limit           | StateCU modeling software data file            | **not yet migrated**     |
| [StateCU Output](StateCUB/StateCUB)                               | File (binary)          | No limit           | StateCU modeling software data file            | **not yet migrated**     |
| [StateMod](StateMod/StateMod)                                     | File (text)            | No limit           | StateMod modeling software data file           | **not yet migrated**     |
| [StateMod Output](StateModB/StateModB)                            | File (binary)          | No limit           | StateMod modeling software data file           | **not yet migrated**     |
| [USGS Daily](UsgsDaily/UsgsDaily)                                 | Web service (REST)     | No limit           | Water and other data (day interval)            | **not yet migrated**     |
| [USGS Instantaneous](UsgsInstantaneous/UsgsInstantaneous)         | Web service (REST)     | No limit           | Water and other data (instantaneous interval)  | **not yet migrated**     |
| [USGS Grondwater](UsgsGroundwater/UsgsGroundwater)                | Web service (REST)     | No limit           | Groundwater and other data                     | **not yet migrated**     |
| [USGS RDB](UsgsRdb/UsgsRdb)                                       | File (text)            | No limit           | RDB format for USGS data (see USGS above)      | **not yet migrated**     |
| [WaterML](WaterML/WaterML)                                        | File (text)            | No limit           | WaterML format for USGS data (see USGS above)  | **not yet migrated**     |
| [WaterOneFlow](WaterOneFlow/WaterOneFlow)                         | Web service (SOAP)     | No limit           | Web service for CUAHSI                         | **not yet migrated**     |
