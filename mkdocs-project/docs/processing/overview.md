# TSTool / Processing / Overview #

This documentation provides an overview of data that TSTool can process.

*   [Introduction](#introduction)

---------------------

## Introduction ##

TSTool provides a "command processor", which runs commands and manages the input and output for commands.
Data are represented in objects that have the following characteristics:

*   Objects have unique identifiers.
*   Object types manage data in basic forms that are the building blocks for datasets and analyses. 
*   Objects have properties that describe the data, for example units and description.
*   Data often can be represented by more than one data type.
    For example, time series can be converted to and from tables.

The following table lists the main object types that can be processed by TSTool,
with links to additional documentation.

**<p style="text-align: center;">
TSTool Object Types
</p>**

| **Object Type** | **Description** |
| -- | -- |
| [Datastore](datastores/datastores.md) | TSTool uses database and web service datastores to configure data sources.  Web service datastores allow reading time series, tables, and other object types.  Database datastores allow reading time series and tables, including allowing Structured Query Language (SQL) queries that create table output. |
| [Ensemble](ensembles/ensembles.md) | An ensemble is a group of related time series, for example time series that represent a model run scenario. |
| [File](files/files.md) | A file is a text or binary file containing time series, tabular data, text, or other data. |
| [Network](networks/networks.md) | A network is a linear or converging list of objects, for example rivers or river basins. |
| [Object](objects/objects.md) | An object is a hierarchical representation of data.  TSTool is able to read objects from JSON files and process into tables. |
| [Property](properties/properties.md) | A property is a "variable" that is is managed by the command processor. |
| [Spatial data](spatial-data/spatial-data.md) | Spatial data include layers consisting of geographic shapes and attributes. |
| [Spreadsheet](spreadsheets/spreadsheets.md) | TSTool is able to read and write time series and tables for Excel workbook files, which can contain one or more spreadsheets |
| [Table](tables/tables.md) | A table is a two-dimensional representation of dataset with columns and rows of data cells. |
| [Template](templates/templates.md) | A template is a file containing placeholder values that can be replaced by data when commands are processed to create a final representation, for example a time series information product. |
| [Time Series](time-series/time-series.md) | A time series is a sequence of date/times, each with corresponding value and optionally flags. |
| [Visualization](visualizations/visualizations.md) | Visualizations include graphs, tree views, and other visual data representations that can be created as static images, or interactive visualizations in TSTool or for the web. |
