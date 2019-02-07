# TSTool / Command Reference / Overview #

This reference section of the documentation provides information about TSTool commands,
listed in groups consistent with the TSTool software menus.
If necessary, use the documentation ***Search*** tool or the ***Find*** tool for the
web browser to find a specific command or topic.

**Reference documentation for commands is being transferred from the original Word versions.
The current Word "Chapter 4 - Commmands" can likely merge into this page since content
is just screen shots of menus and overview comments about command groups.
Refer to the PDF documentation distributed with TSTool and available online if
documentation is not available below.
Commands that don't have a description after the name do not have documentation included here.**

* [Command Syntax Overview](#command-syntax-overview)
* [Command List](#command-list) - alphabetical list of commands (**is at the end of this section**)
* [Time Series Processing](#time-series-processing)
	+ [Select, Free, Sort Time Series](#select-free-sort-time-series) - basic handling of time series objects
	+ [Create Time Series](#create-time-series) - create new time series
	+ [Read Time Series](#read-time-series) - read time series from files, databases, and web services
	+ [Fill Time Series Missing Data](#fill-time-series-missing-data) - fill time series missing data values
	+ [Set Time Series Contents](#set-time-series-contents) - set time series data values and properties
	+ [Manipulate Time Series](#manipulate-time-series) - manipulate time series data values
	+ [Analyze Time Series](#analyze-time-series) - analyze time series
	+ [Models - Routing](#models-routing) - route time series through time
	+ [Output Time Series](#output-time-series) - output (write) time series to files and databases
	+ [Check Time Series](#check-time-series) - check time series against criteria
* [Topic Area Commands](#topic-area-commands)
	+ [Datastore Processing](#datastore-processing) - read/write database data
	+ [Ensemble Processing](#ensemble-processing) - process ensembles of time series
	+ [Network Processing](#network-processing) - process node/link networks
	+ [Spatial Processing](#spatial-processing) - read/write spatial data
	+ [Spreadsheet Processing](#spreadsheet-processing) - read/write spreadsheet files
	+ [Template Processing](#template-processing) - expand template files
	+ [visualization Processing](#visualization-processing) - visualize data
* [General Commands](#general-commands)
	+ [General - Comments](#general-comments) - insert comments
	+ [General - File Handling](#general-file-handling) - manipulate files
	+ [General - Logging and Messaging](#general-logging-and-messaging) - handle log files and other messages
	+ [General - Running and Properties](#general-running-and-properties) - run programs and control logic
	+ [General - Test Processings](#general-test-processing) - automated tests for quality control
* [Deprecated Commands](#deprecated-commands) - old commands
* [Table Commands](#table-commands)
	+ [Create, Copy, Free Table](#create-copy-free-table) - basic table object management
	+ [Read Table](#read-table) - read tables from files, databases, and web services
	+ [Append, Join Tables](#append-join-tables) - append and join tables
	+ [Table, Time Series Processing](#table-time-series-processing) - translate tables to/from time series
	+ [Manipulate Tables](#manipulate-tables) - manipulate table data
	+ [Analyze Table](#analyze-table) - analyze table data
	+ [Output Table](#output-table) - output (write) tables to files and databases
	+ [Running and Properties](#running-and-properties) - use table data to control logic
* [Plugin Commands](#plugin-commands) - commands developed by third parties

---------------------------

## Command Syntax Overview ##

TSTool command files contain a list of commands, one command per line.
These commands are processed in sequence from top to bottom.
[`For`](For/For.md) and [`If`](If/If.md) control commands, if present, will cause execution order to jump over commands.

Each command adheres to the syntax:

```text
CommandName(ParameterName1="ParameterValue1",ParameterName2="ParameterValue2",...)
```

The following are guidelines for commands:

1. Commands always follow the convention of command name at start with a list of named parameters in parentheses.
The only exceptions are:
	1. Comments starting with [`#`](Comment/Comment.md).
	2. Block comments [`/*`](CommentBlockStart/CommentBlockStart.md) and
	[`*/`](CommentBlockEnd/CommentBlockEnd.md) that surround one or more command lines.
	3. Command such as [`Exit`](Exit/Exit.md), which will always have empty list of parameters in the parentheses.
2. Commands are generally not case-specific although the TSTool software enforces standards.
3. Command and parameter names use mixed case where the first letter of each word is capitalized.
4. Parameter values may optionally be surrounded by double quotes, regardless of type.
Double quotes are required in some cases to protect spaces and other characters within quotes.
5. Each command must exist on a single line.
6. Spaces at the front of a command for indentation are currently not allowed.
This limitation is planned to be removed in the future.
Tabs used for indentation are discouraged and will likely be prohibited because tab width is ambiguous between different users and tools.
Spaces will be the preferred method of indentation.
7. Empty (blank) lines are allowed and will be handled as [`Empty`](Empty/Empty.md) commands.
8. Unknown commands are handled as [`UnknownCommand`](UnknownCommand/UnknownCommand.md) commands.

## Time Series Processing ##

Time series processing commands focus on time series,
although other outputs such as tables and files may result from processing.
Older commands assumed that only time series would be processed and have general names (e.g.,
[`Copy`](Copy/Copy.md)),
whereas newer commands recognize that other objects may be processed and have more specific names
(e.g., [`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries.md)).

### Select, Free, Sort Time Series ###

These commands select, free, and sort time series.

* [`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries.md) - select output time series for processing
* [`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries.md) - deselect output time series for processing
* [`Free`](Free/Free.md) - free memory used by time series
* [`SortTimeSeries`](SortTimeSeries/SortTimeSeries.md) - sort the output time series

### Create Time Series ###

These commands create new time series from other time series or data values.

* [`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries.md) - create a new time series with repeating pattern for data values
* [`NewTimeSeries`](NewTimeSeries/NewTimeSeries.md) - create a new time series
* [`ChangeInterval`](ChangeInterval/ChangeInterval.md)
* [`Copy`](Copy/Copy.md) - copy a time series
* [`Delta`](Delta/Delta.md) - create a new time series from delta between time series values
* [`Disaggregate`](Disaggregate/Disaggregate.md) - create a new time series by disaggregating a time series
* [`LookupTimeSeriesFromTable`](LookupTimeSeriesFromTable/LookupTimeSeriesFromTable.md) - create a time series by looking up data values from a table
* [`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS.md) - create a new daily time series by distributing a monthly time series using a daily pattern
* [`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS.md) - create a new end of month time series from daily time series
* [`Normalize`](Normalize/Normalize.md) - create a new time series by normalizing a time series
* [`RelativeDiff`](RelativeDiff/RelativeDiff.md) - create a new time series as relative difference of two time series
* [`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData.md) - resequence time series data values by year
* [`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries.md) - create a new time series having statistic repeated each year
* [`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries.md) - create a new time series with monthly statistics
* [`NewStatisticYearTS`](NewStatisticYearTS/NewStatisticYearTS.md) - create a new time series of annual statistics
* [`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries.md) - create time series containing statistic from moving "running" sample

### Read Time Series ###

These commands read time series from various sources.

* [`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS.md) - set the global property to include missing time series in output
* [`SetInputPeriod`](SetInputPeriod/SetInputPeriod.md) - set the global processor input period
* [`CreateFromList`](CreateFromList/CreateFromList.md) - create time series from a list in a file
* [`ReadColoradoHydroBaseRest`](ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) - read time series from [Colorado HydroBase REST web services](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)
* [`ReadDateValue`](ReadDateValue/ReadDateValue.md) - read time series from a [DateValue file](../datastore-ref/DateValue/DateValue.md)
* [`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml.md) - read time series from Delft [FEWS PI XML file](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML.md)
* [`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile.md) - read time series from delimited file
* [`ReadHecDss`](ReadHecDss/ReadHecDss.md) - read time series from [HEC-DSS file](../datastore-ref/HEC-DSS/HEC-DSS.md)
* [`ReadHydroBase`](ReadHydroBase/ReadHydroBase.md) - read time series from [State of Colorado HydroBase database](../datastore-ref/CO-HydroBase/CO-HydroBase.md)
* [`ReadMODSIM`](ReadMODSIM/ReadMODSIM.md) - read time series from [MODSIM model file](../datastore-ref/MODSIM/MODSIM.md)
* [`ReadNrcsAwdb`](ReadNrcsAwdb/ReadNrcsAwdb.md) - read time series from [NRCS AWDB web services](../datastore-ref/NRCS-AWDB/NRCS-AWDB.md)
* [`ReadNwsCard`](ReadNwsCard/ReadNwsCard.md)
* [`ReadNwsrfsEspTraceEnsemble`](ReadNwsrfsEspTraceEnsemble/ReadNwsrfsEspTraceEnsemble.md)
* [`ReadNwsrfsFS5Files`](ReadNwsrfsFS5Files/ReadNwsrfsFS5Files.md)
* [`ReadRccAcis`](ReadRccAcis/ReadRccAcis.md) - read time series from [RCC ACIS web service](../datastore-ref/RCC-ACIS/RCC-ACIS.md)
* [`ReadReclamationHDB`](ReadReclamationHDB/ReadReclamationHDB.md) - read time series from [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB.md)
* [`ReadReclamationPisces`](ReadReclamationPisces/ReadReclamationPisces.md) - read time series from [Reclamation Pisces database](../datastore-ref/ReclamationPisces/ReclamationPisces.md)
* [`ReadRiverWare`](ReadRiverWare/ReadRiverWare.md) - read time series from [RiverWare file](../datastore-ref/RiverWare/RiverWare.md)
* [`ReadStateCU`](ReadStateCU/ReadStateCU.md) - read time series from a [StateCU file](../datastore-ref/StateCU/StateCU.md)
* [`ReadStateCUB`](ReadStateCUB/ReadStateCUB.md) - read time series from a [StateCU binary file](../datastore-ref/StateCUB/StateCUB.md)
* [`ReadStateMod`](ReadStateMod/ReadStateMod.md) - read time series from a [StateMod file](../datastore-ref/StateMod/StateMod.md)
* [`ReadStateModB`](ReadStateModB/ReadStateModB.md) - read time series from a [StateMod binary file](../datastore-ref/StateModB/StateModB.md)
* [`ReadTimeSeries`](ReadTimeSeries/ReadTimeSeries.md) - read a single time series using TSID to determine data source
* [`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore.md) - read time series from a datastore
* [`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList.md) - read time series from a list in a table
* [`ReadUsgsNwisDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily.md) - read daily value time series from [USGS NWIS Daily web services](../datastore-ref/USGS-NWIS-Daily/USGS-NWIS-Daily.md)
* [`ReadUsgsNwisInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous.md) - read instantaneous value time series from [USGS NWIS Instantaneous web services](../datastore-ref/USGS-NWIS-Instantaneous/USGS-NWIS-Instantaneous.md)
* [`ReadUsgsNwisGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater.md) - read groundwater time series from [USGS NWIS Daily web services](../datastore-ref/USGS-NWIS-Daily/USGS-NWIS-Daily.md) 
* [`ReadUsgsNwisRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb.md) - read time series from a [USGS NWS RDB file](../datastore-ref/USGS-NWIS-RDB/USGS-NWIS-RDB.md)
* [`ReadWaterML`](ReadWaterML/ReadWaterML.md)
* [`ReadWaterML2`](ReadWaterML2/ReadWaterML2.md)
* [`StateModMax`](StateModMax/StateModMax.md) - create time series that are maximum of two [StateMod files](../datastore-ref/StateMod/StateMod.md)

### Fill Time Series Missing Data ###

These commands fill missing time series values.

* [`FillConstant`](FillConstant/FillConstant.md) - fill missing time series values with a constant
* [`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS.md) - fill a daily time series by prorating monthly volumes using a daily pattern
* [`FillFromTS`](FillFromTS/FillFromTS.md) - fill missing time series values from another time series
* [`FillHistMonthAverage`](FillHistMonthAverage/FillHistMonthAverage.md) - fill missing time series values with historical monthly average
* [`FillHistYearAverage`](FillHistYearAverage/FillHistYearAverage.md) - fill missing time series values with historical yearly average
* [`FillInterpolate`](FillInterpolate/FillInterpolate.md) - fill missing time series values using interpolation
* [`FillMixedStation`](FillMixedStation/FillMixedStation.md)
* [`FillMOVE2`](FillMOVE2/FillMOVE2.md)
* [`FillPattern`](FillPattern/FillPattern.md) - fill missing time series values using historical pattern average
	+ [`ReadPatternFile`](ReadPatternFile/ReadPatternFile.md) - read pattern time series used by [`FillPattern`](FillPattern/FillPattern.md)
* [`FillProrate`](FillProrate/FillProrate.md) - fill missing time series values by prorating another time series
* [`FillRegression`](FillRegression/FillRegression.md)
* [`FillRepeat`](FillRepeat/FillRepeat.md) - fill missing time series values by repeating values
* [`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments.md) - fill missing time series values using HydroBase diversion comments
* [`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod.md) - set global property to auto-extend time series to output period
* [`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod.md) - set the global period used to compute historical averages
* [`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero.md) - set global property to ignore time series values <= 0 in averages

### Set Time Series Contents ###

These commands set time series contents, including properties and data values.

* [`ReplaceValue`](ReplaceValue/ReplaceValue.md) - replace values in time series data
* [`SetConstant`](SetConstant/SetConstant.md) - set time series data values to a constant
* [`SetDataValue`](SetDataValue/SetDataValue.md) - set data values in time series
* [`SetFromTS`](SetFromTS/SetFromTS.md) - set time series data values from another time series
* [`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookupTable/SetTimeSeriesValuesFromLookupTable.md) - set time series values from a lookup table
* [`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable.md) - set time series values from a table
* [`SetToMax`](SetToMax/SetToMax.md) - set time series values to maximum of 1+ time series
* [`SetToMin`](SetToMin/SetToMin.md) - set time series values to minimum of 1+ time series
* [`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty.md) - set a time series property

### Manipulate Time Series ###

These commands perform basic time series manipulation.

* [`Add`](Add/Add.md) - add time series to time series
* [`AddConstant`](AddConstant/AddConstant.md) - add a constant to time series values
* [`AdjustExtremes`](AdjustExtremes/AdjustExtremes.md) - adjust extreme values in time series
* [`ARMA`](ARMA/ARMA.md)
* [`Blend`](Blend/Blend.md) - blend one time series into another
* [`ChangePeriod`](ChangePeriod/ChangePeriod.md) - change time series data period
* [`ChangeTimeZone`](ChangeTimeZone/ChangeTimeZone.md) - change the time zone for time series
* [`ConvertDataUnits`](ConvertDataUnits/ConvertDataUnits.md) - convert time series data units
* [`Cumulate`](Cumulate/Cumulate.md) - set time series values to cumulative values
* [`Divide`](Divide/Divide.md) - divide one time series by another
* [`Multiply`](Multiply/Multiply.md) - multiply one time series by another
* [`Scale`](Scale/Scale.md) - scale time series values
* [`ShiftTimeByInterval`](ShiftTimeByInterval/ShiftTimeByInterval.md) - shift time series data values by a time interval
* [`Subtract`](Subtract/Subtract.md) - subtract time series from time series

### Analyze Time Series ###

These commands analyze time series.

* [`AnalyzePattern`](AnalyzePattern/AnalyzePattern.md) - analyze pattern of time series data
* [`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic.md)
* [`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries.md) - compare time series to detect whether they are the same or different
* [`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/ComputeErrorTimeSeries.md) - compute the error between two time series

### Models - Routing ###

These commands route flow time series from one location to another.

* [`LagK`](LagK/LagK.md) - lag and attenuate flows
* [`VariableLagK`](VariableLagK/VariableLagK.md) - lag and attenuate flows

### Output Time Series ###

These commands output time series to different formats.

* [`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod.md) - set the global processor output period
* [`SetOutputYearType`](SetOutputYearType/SetOutputYearType.md) - set the global processor output year type
* [`WriteDateValue`](WriteDateValue/WriteDateValue.md) - write time series to [DateValue format file](../datastore-ref/DateValue/DateValue.md)
* [`WriteDelftFewsPiXml`](WriteDelftFewsPiXml/WriteDelftFewsPiXml.md) - write time series to [Delft FEWS PI XML format file](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML.md)
* [`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile.md) - write time series to a delimited file
* [`WriteHecDss`](WriteHecDss/WriteHecDss.md) - write time series to a [HEC-DSS file](../datastore-ref/HEC-DSS/HEC-DSS.md)
* [`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB.md) - write time series to [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB.md)
* [`WriteRiverWare`](WriteRiverWare/WriteRiverWare.md) write time series to a [RiverWare file](../datastore-ref/RiverWare/RiverWare.md)
* [`WriteStateCU`](WriteStateCU/WriteStateCU.md) - write time series to a [StateCU file](../datastore-ref/StateCU/StateCU.md)
* [`WriteStateMod`](WriteStateMod/WriteStateMod.md) - write time series to a [StateMod file](../datastore-ref/StateMod/StateMod.md)
* [`WriteSummary`](WriteSummary/WriteSummary.md) - write time series to a summary report file
* [`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore.md) - write time series to a datastore
* [`WriteTimeSeriesToDataStream`](WriteTimeSeriesToDataStream/WriteTimeSeriesToDataStream.md) - write time series to a stream of data lines
* [`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON.md) - write time series to a [HydroJSON file](../datastore-ref/HydroJSON/HydroJSON.md).
* [`WriteTimeSeriesToJson`](WriteTimeSeriesToJson/WriteTimeSeriesToJson.md) - write time series to a JSON file
* [`WriteWaterML`](WriteWaterML/WriteWaterML.md)
* [`WriteWaterML2`](WriteWaterML2/WriteWaterML2.md)
* [`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile.md) - write time series properties to a file

### Check Time Series ###

These commands are used to check time series, for example for quality control.

* [`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries.md) - check time series values against criteria
* [`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic.md) - check time series statistic against criteria
* [`WriteCheckFile`](WriteCheckFile/WriteCheckFile.md) - write command log to file

## Topic Area Commands ##

The following commands are grouped into specific topic areas.

### Datastore Processing ###

These commands handle reading and writing time series and other data from datastores, in particular databases.
Utility commands for executing SQL and creating a data dictionary are also provided.

* [`NewDerbyDatabase`](NewDerbyDatabase/NewDerbyDatabase.md) - **this command is under development**
* [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore.md) - read a table from a datastore
* [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore.md) - write a table to a datastore
* [`RunSql`](RunSql/RunSql.md) - run an SQL statement on a datastore
* [`DeleteDataStoreTableRows`](DeleteDataStoreTableRows/DeleteDataStoreTableRows.md) - delete datastore table rows
* [`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore.md) - read time series from a datastore
* [`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore.md) - write time series to a datastore
* [`CloseDataStore`](CloseDataStore/CloseDataStore.md) - close an open datastore
* [`CreateDataStoreDataDictionary`](CreateDataStoreDataDictionary/CreateDataStoreDataDictionary.md) - create a database data dictionary

### Ensemble Processing ###

* [`CreateEnsembleFromOneTimeSeries`](CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries.md) - create an ensemble from a time series
* [`CopyEnsemble`](CopyEnsemble/CopyEnsemble.md) - copy an ensemble to a new ensemble
* [`NewEnsemble`](NewEnsemble/NewEnsemble.md) - create a new time series ensemble
* [`InsertTimeSeriesIntoEnsemble`](InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble.md) - insert a time series into an ensemble
* [`SetEnsembleProperty`](SetEnsembleProperty/SetEnsembleProperty.md) - set an ensemble property
* [`NewStatisticEnsemble`](NewStatisticEnsemble/NewStatisticEnsemble.md) - create an ensemble of statistic time series
* [`NewStatisticTimeSeriesFromEnsemble`](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble.md)
* [`WeightTraces`](WeightTraces/WeightTraces.md) - create time series as weighted sum of ensemble traces

### Network Processing ###

* [`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow.md) - perform point flow analysis for a network
* [`CreateNetworkFromTable`](CreateNetworkFromTable/CreateNetworkFromTable.md) - create a network from a table

### Spatial Processing ###

* [`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON.md) - write a table to a GeoJSON file
* [`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile.md) - write a table to a shapefile
* [`WriteTableToKml`](WriteTableToKml/WriteTableToKml.md) - write a table to a KML file
* [`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON.md) - write time series to a GeoJSON file
* [`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml.md) - write time series to a KML file

### Spreadsheet Processing ###

* [`NewExcelWorkbook`](NewExcelWorkbook/NewExcelWorkbook.md) - create a new Excel workbook file
* [`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook.md) - read Excel workbook file
* [`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel.md) - read a table from an Excel workbook file
* [`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel.md) - read table cells from Excel worksheet
* [`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel.md) - read processor properties from Excel
* [`SetExcelCell`](SetExcelCell/SetExcelCell.md) - set data in an Excel cell
* [`SetExcelWorksheetViewProperties`](SetExcelWorksheetViewProperties/SetExcelWorksheetViewProperties.md) - set Excel worksheet view properties
* [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel.md) - write a table to an Excel workbook file
* [`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel.md) - write table row cells to an Excel worksheet
* [`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel.md) - write time series to an Excel workbook
* [`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock.md) - write time series to an Excel workbook using block format
* [`CloseExcelWorkbook`](CloseExcelWorkbook/CloseExcelWorkbook.md) - close Excel workbook that is open

### Template Processing ###

* [`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile.md) - expand template file into full file

### Visualization Processing ###

* [`ProcessTSProduct`](ProcessTSProduct/ProcessTSProduct.md) - process (create) time series data product
* [`ProcessRasterGraph`](ProcessRasterGraph/ProcessRasterGraph.md) - process (create) time series raster graph
* [`NewTreeView`](NewTreeView/NewTreeView.md) - create a tree view in the user interface

## General Commands ##

General commands perform tasks that are general in nature,
meaning they are not specific to processing time series, tables, or other specific data types.

### General - Comments ###

These commands are used to insert comments into command files.

* [`#` comment](Comment/Comment.md) - single line comment
* [`\*` comment block start](CommentBlockStart/CommentBlockStart.md) - start of multi-line comment block
* [`\*` comment block end](CommentBlockEnd/CommentBlockEnd.md) - end of multi-line comment block

### General - File Handling ###

These commands provide general file handling capabilities.

* [`AppendFile`](AppendFile/AppendFile.md) - append a file to another file
* [`CopyFile`](CopyFile/CopyFile.md) - copy a file to another name
* [`ListFiles`](ListFiles/ListFiles.md) - list files in a folder
* [`FTPGet`](FTPGet/FTPGet.md) - download a file from an FTP site
* [`WebGet`](WebGet/WebGet.md) - download a file from a URL
* [`RemoveFile`](RemoveFile/RemoveFile.md) - remove a file
* [`UnzipFile`](UnzipFile/UnzipFile.md) - unzip the contents of a zip file
* [`PrintTextFile`](PrintTextFile/PrintTextFile.md) - print a text file to printer

### General - Logging and Messaging ###

These commands handle run-time configuration of logging and sending messages.

* [`ConfigureLogging`](ConfigureLogging/ConfigureLogging.md) - configure logging
* [`Message`](Message/Message.md) - output a message to the log file
* [`SetDebugLevel`](SetDebugLevel/SetDebugLevel.md) - set the debug level for logging
* [`SetWarningLevel`](SetWarningLevel/SetWarningLevel.md) - set the warning level for logging
* [`StartLog`](StartLog/StartLog.md) - (re)start the log file
* [`SendEmailMessage`](SendEmailMessage/SendEmailMessage.md) - send an email message

### General - Running and Properties ###

These commands provide general capabilities to control running commands, including running programs external to TSTool,
handling processor properties (used with `${Property}`), and control commands such as [`For`](For/For.md) and [`If`](If/If.md).

* [`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile.md) - read processor properties from a file
* [`SetProperty`](SetProperty/SetProperty.md) - set a processor property value
* [`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble.md) - set a processor property from an ensemble
* [`SetPropertyFromNwsrfsAppDefault`](SetPropertyFromNwsrfsAppDefault/SetPropertyFromNwsrfsAppDefault.md)
* [`SetPropertyFromTimeSeries`](SetPropertyFromTimeSeries/SetPropertyFromTimeSeries.md) - set time series property from time series property
* [`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty.md) - format a date/time processor property
* [`FormatStringProperty`](FormatStringProperty/FormatStringProperty.md) - format a string processor property
* [`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile.md) - write processor properties to a file
* [`RunCommands`](RunCommands/RunCommands.md) - run a TSTool command file
* [`RunProgram`](RunProgram/RunProgram.md) - run a program
* [`RunPython`](RunPython/RunPython.md) - run a Python a program
* [`RunDSSUTL`](RunDSSUTL/RunDSSUTL.md) - run HEC-DSS DSSUTL program
* [`If`](If/If.md) - test a condition to control logic flow
* [`EndIf`](EndIf/EndIf.md) - end of an [`If`](If/If.md) block of commands
* [`For`](For/For.md) - iterate over items in a loop
* [`EndFor`](EndFor/EndFor.md) - end of a [`For`](For/For.md) loop block of commands
* [`Exit`](Exit/Exit.md) - stop processing commands
* [`Wait`](Wait/Wait.md) - wait for a time before continuing
* [`SetWorkingDir`](SetWorkingDir/SetWorkingDir.md) - set the working directory (folder) for following commands
* [`ProfileCommands`](ProfileCommands/ProfileCommands.md) - create summary table with containing performance data
* [`Empty`](Empty/Empty.md) - empty (blank) line
* [`UnknownCommand`](UnknownCommand/UnknownCommand.md) - unknown command

### General - Test Processing ###

These commands are used to run automated tests, in particular when running the full suite of tests.

* [`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile.md) - write time series properties to a file
* [`CompareFiles`](CompareFiles/CompareFiles.md) - compare files to detect whether they are the same or different
* [`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md) - create a regression test suite command file
* [`StartRegressionTestResultsReport`](StartRegressionTestResultsReport/StartRegressionTestResultsReport.md) - start the regression test results report file to record output of tests
* [`WriteCommandSummaryToFile`](WriteCommandSummaryToFile/WriteCommandSummaryToFile.md) - write summary of command log to a file

## Deprecated Commands ##

"Deprecated" commands are obsolete and have typically been replaced by other commands.
These commands are generally quite old and may be removed at some point.

## Table Commands ##

Table commands are used to process tabular data, for example:

* database tables
* Excel worksheets
* delimited and other data files

Tables are converted to an in-memory representation where each column stores a single data type.
Tables and time series can be converted back and forth, as needed.

### Create, Copy, Free Table ###

These commands create, copy, and free tables.

* [`NewTable`](NewTable/NewTable.md) - create a new table
* [`CopyTable`](CopyTable/CopyTable.md) - copy a table to a new table
* [`FreeTable`](FreeTable/FreeTable.md) - free memory resources for a table

### Read Table ###

These commands read tables from various sources.

* [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore.md) - read a table from a datastore
* [`ReadTableFromDBF`](ReadTableFromDBF/ReadTableFromDBF.md) - read a table from a DBF file
* [`ReadTableFromDelimitedFile`](ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md) - read a table from a delimited file
* [`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel.md) - read a table from an Excel workbook file
* [`ReadTableFromFixedFormatFile`](ReadTableFromFixedFormatFile/ReadTableFromFixedFormatFile.md) - read a table from a fixed-format file
* [`ReadTableFromJSON`](ReadTableFromJSON/ReadTableFromJSON.md) - read a table from a JSON file
* [`ReadTableFromXml`](ReadTableFromXml/ReadTableFromXml.md) - read a table from an XML file

### Append, Join Tables ###

These commands append and join tables.

* [`AppendTable`](AppendTable/AppendTable.md) - append a table to another table
* [`JoinTables`](JoinTables/JoinTables.md) - join two tables

### Table, Time Series Processing ###

These commands convert between tables and time series.

* [`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable.md) - copy a time series to a table
* [`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries.md) - create time series from a table
* [`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable.md) - create an event table associated with time series
* [`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable.md) - set time series properties from table values
* [`CopyTimeSeriesPropertiesToTable`](CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md) - copy time series properties to table

### Manipulate Tables ###

These commands manipulate tables.

* [`InsertTableColumn`](InsertTableColumn/InsertTableColumn.md) - insert a column in a table
* [`DeleteTableColumns`](DeleteTableColumns/DeleteTableColumns.md) - delete columns from a table
* [`DeleteTableRows`](DeleteTableRows/DeleteTableRows.md) - delete rows from a table
* [`FormatTableDateTime`](FormatTableDateTime/FormatTableDateTime.md) - format a date/time in a table
* [`FormatTableString`](FormatTableString/FormatTableString.md) - format a string in a table
* [`ManipulateTableString`](ManipulateTableString/ManipulateTableString.md) - manipulate a string in a table
* [`SetTableValues`](SetTableValues/SetTableValues.md) - set values in a table
* [`SplitTableColumn`](SplitTableColumn/SplitTableColumn.md) - split table column into multiple columns
* [`TableMath`](TableMath/TableMath.md) - perform simple math on table columns
* [`TableTimeSeriesMath`](TableTimeSeriesMath/TableTimeSeriesMath.md) - perform simple math on a table and time series
* [`InsertTableRow`](InsertTableRow/InsertTableRow.md) - insert a row in a table
* [`SortTable`](SortTable/SortTable.md) - sort table contents
* [`SplitTableRow`](SplitTableRow/SplitTableRow.md) - split a table row into multiple rows

### Analyze Table ###

These commands analyze tables.

* [`CompareTables`](CompareTables/CompareTables.md) - compare tables to detect whether they are the same or different

### Output Table ###

These commands write tables to various formats.

* [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore.md) - write a table to a datastore
* [`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile.md) - write a table to a delimited file
* [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel.md) - write a table to an Excel workbook file
* [`WriteTableToHTML`](WriteTableToHTML/WriteTableToHTML.md) - write a table to an HTML file

### Running and Properties ###

These commands handle table properties, which are used to control run logic.

* [`SetPropertyFromTable`](SetPropertyFromTable/SetPropertyFromTable.md) - set a processor property from a table
* [`CopyPropertiesToTable`](CopyPropertiesToTable/CopyPropertiesToTable.md) - **command is under development**

## Plugin Commands ##

Plugin commands are an experimental TSTool feature,
designed to allow commands to be added to TSTool independent of the main TSTool distribution.
This will allow third parties to add custom commands to TSTool.

## Command List ##

The following table contains every command and provides summary information that
is useful to software users and developers.
"Documentation Migrated" indicates whether the original Word version of documentation
have been migrated to the new online version (this documentation).

**This table needs to be completed for all commands.**

|**Command**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Doc. Status**|**Def. to Rel. Path**|
|-------------------------------------------------------------------------------------------------------------|---------------------------------|:----------------------:|----|
|[`#` comment](Comment/Comment.md)                                                                               |Single line comment.             |Migrated||
|[`\*` comment block start](CommentBlockStart/CommentBlockStart.md)                                              |Start of multi-line comment block.|Migrated||
|[`\*` comment block end](CommentBlockEnd/CommentBlockEnd.md)                                                    |End of multi-line comment block. |Migrated||
|[`Add`](Add/Add.md)                                                                                             |Add time series to time series.|Migrated||
|[`AddConstant`](AddConstant/AddConstant.md)                                                                     |Add a constant to time series values.|Migrated||
|[`AdjustExtremes`](AdjustExtremes/AdjustExtremes.md)                                                            |Adjust extreme values in time series.|Migrated||
|[`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow.md)                                 |Perform point flow analysis for a network.|Migrated||
|[`AnalyzePattern`](AnalyzePattern/AnalyzePattern.md)                                                            |Analyze pattern of time series data.|Migrated||
|[`AppendFile`](AppendFile/AppendFile.md)                                                                        |Append a file to another file.   |Migrated||
|[`AppendTable`](AppendTable/AppendTable.md)                                                                     |Append a table to another table. |Migrated||
|[`ARMA`](ARMA/ARMA.md)                                                                                          |                                 |Not yet migrated (placeholder)||
|[`Blend`](Blend/Blend.md)                                                                                       |Blend one time series into another.|Migrated||
|[`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic.md)                  |                                 |Not yet migrated (placeholder)||
|[`ChangeInterval`](ChangeInterval/ChangeInterval.md)                                                            |                                 |Not yet migrated (placeholder)||
|[`ChangePeriod`](ChangePeriod/ChangePeriod.md)                                                                  |Change time series data period.  |Migrated||
|[`ChangeTimeZone`](ChangeTimeZone/ChangeTimeZone.md)                                                            |Change the time zone for time series.|Migrated||
|[`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries.md)                                                         |Check time series values against criteria.|Migrated||
|[`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic.md)                              |Check time series statistic against criteria.|Migrated||
|[`CloseDataStore`](CloseDataStore/CloseDataStore.md)                                                            |Close an open datastore.         |Migrated||
|[`CloseExcelWorkbook`](CloseExcelWorkbook/CloseExcelWorkbook.md)                                                |Close Excel workbook that is open.|Migrated||
|[`CompareFiles`](CompareFiles/CompareFiles.md)                                                                  |Compare files to detect whether they are the same or different.|Migrated||
|[`CompareTables`](CompareTables/CompareTables.md)                                                               |Compare tables to detect whether they are the same or different.|Migrated||
|[`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries.md)                                                   |Compare time series to detect whether they are the same or different.|Migrated||
|[`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/ComputeErrorTimeSeries.md)                                    |Compute the error between two time series.|Migrated||
|[`ConfigureLogging`](ConfigureLogging/ConfigureLogging.md)                                                      |Configure logging.               |Migrated||
|[`ConvertDataUnits`](ConvertDataUnits/ConvertDataUnits.md)                                                      |Convert time series data units.  |Migrated||
|[`Copy`](Copy/Copy.md)                                                                                          |Copy a time series.              |Migrated||
|[`CopyEnsemble`](CopyEnsemble/CopyEnsemble.md)                                                                  |Copy an ensemble to a new ensemble.|Migrated||
|[`CopyFile`](CopyFile/CopyFile.md)                                                                              |Copy a file to another name.     |Migrated||
|[`CopyPropertiesToTable`](CopyPropertiesToTable/CopyPropertiesToTable.md)                                       |Command is under development.    |Not yet migrated||
|[`CopyTable`](CopyTable/CopyTable.md)                                                                           |Copy a table to a new table.     |Migrated||
|[`CopyTimeSeriesPropertiesToTable`](CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md)         |Copy time series properties to a table.|Migrated||
|[`CreateDataStoreDataDictionary`](CreateDataStoreDataDictionary/CreateDataStoreDataDictionary.md)               |Create a database data dictionary.|Migrated||
|[`CreateEnsembleFromOneTimeSeries`](CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries.md)         |Create an ensemble from a time series.|Migrated||
|[`CreateFromList`](CreateFromList/CreateFromList.md)                                                            |Create time series from a list in a file.|Migrated||
|[`CreateNetworkFromTable`](CreateNetworkFromTable/CreateNetworkFromTable.md)                                    |Create a network from a table.|Migrated||
|[`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md)         |Create regression test suite command file.|Migrated||
|[`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable.md)                        |Create an event table associated with time series.|Migrated||
|[`Cumulate`](Cumulate/Cumulate.md)                                                                              |Set time series values to cumulative values.|Migrated||
|[`DeleteDataStoreTableRows`](DeleteDataStoreTableRows/DeleteDataStoreTableRows.md)                              |Delete datastore table rows.     |Migrated||
|[`DeleteTableColumns`](DeleteTableColumns/DeleteTableColumns.md)                                                |Delete columns from a table.     |Migrated||
|[`DeleteTableRows`](DeleteTableRows/DeleteTableRows.md)                                                         |Delete rows from a table.        |Migrated||
|[`Delta`](Delta/Delta.md)                                                                                       |Create a new time series from delta between time series values.|Migrated||
|[`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries.md)                                                |Deselect output time series for processing.|Migrated||
|[`Disaggregate`](Disaggregate/Disaggregate.md)                                                                  |Create a new time series by disaggregating a time series.|Migrated||
|[`Divide`](Divide/Divide.md)                                                                                    |Divide one time series by another.|Migrated||
|[`Empty`](Empty/Empty.md)                                                                                       |Empty (blank) commands line.     |Migrated||
|[`EndFor`](EndFor/EndFor.md)                                                                                    |End of For loop.                 |Migrated||
|[`EndIf`](EndIf/EndIf.md)                                                                                       |End of If loop.                  |Migrated||
|[`Exit`](Exit/Exit.md)                                                                                          |Stop processing commands.        |Migrated||
|[`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile.md)                                                |Expand template file into full file.|Migrated||
|`FillCarryForward`                                                                                              |Replaced by [`FillRepeat`](FillRepeat/FillRepeat.md).|NA||
|[`FillConstant`](FillConstant/FillConstant.md)                                                                  |Fill missing time series values with a constant.|Migrated||
|[`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS.md)            |Fill a daily time series by prorating monthly volumes using a daily pattern.|Migrated||
|[`FillFromTS`](FillFromTS/FillFromTS.md)                                                                        |Fill missing time series values from another time series.|Migrated||
|[`FillHistMonthAverage`](FillHistMonthAverage/FillHistMonthAverage.md)                                          |Fill missing time series values with historical monthly average. |Migrated||
|[`FillHistYearAverage`](FillHistYearAverage/FillHistYearAverage.md)                                             |Fill missing time series values with historical yearly average.|Migrated||
|[`FillInterpolate`](FillInterpolate/FillInterpolate.md)                                                         |Fill missing time series values using interpolation. |Migrated||
|[`FillMixedStation`](FillMixedStation/FillMixedStation.md)                                                      |                                 |Not yet migrated (placeholder)||
|[`FillMOVE1`](FillMOVE1/FillMOVE1.md)                                                                           |                                 |Not yet migrated (placeholder)||
|[`FillMOVE2`](FillMOVE2/FillMOVE2.md)                                                                           |                                 |Not yet migrated (placeholder)||
|[`FillPattern`](FillPattern/FillPattern.md)                                                                     |Fill missing time series values using historical pattern average.|Migrated||
|[`FillPrincipalComponentAnalysis`](FillPrincipalComponentAnalysis/FillPrincipalComponentAnalysis.md)            |                                 |Not yet migrated (placeholder)||
|[`FillProrate`](FillProrate/FillProrate.md)                                                                     |Fill missing time series values by prorating another time series.|Migrated||
|[`FillRegression`](FillRegression/FillRegression.md)                                                            |                                 |Not yet migrated (placeholder)||
|[`FillRepeat`](FillRepeat/FillRepeat.md)                                                                        |Fill missing time series values by repeating values.|Migrated||
|[`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments.md)                        |Fill missing time series values using HydroBase diversion comments.|Migrated||
|[`For`](For/For.md)                                                                                             |Iterate over items in a loop.    |Migrated||
|[`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty.md)                                    |Format a date/time processor property.|Migrated||
|[`FormatStringProperty`](FormatStringProperty/FormatStringProperty.md)                                          |Format string processor property.|Migrated||
|[`FormatTableDateTime`](FormatTableDateTime/FormatTableDateTime.md)                                             |Format a date/time in a table.   |Migrated||
|[`FormatTableString`](FormatTableString/FormatTableString.md)                                                   |Format a string in a table.      |Migrated||
|[`Free`](Free/Free.md)                                                                                          |Free memory used by time series. |Migrated||
|[`FreeTable`](FreeTable/FreeTable.md)                                                                           |Free memory resources for a table.|Migrated||
|[`FTPGet`](FTPGet/FTPGet.md)                                                                                    |Download a file from an FTP site.|Migrated||
|[`If`](If/If.md)                                                                                                |Test a condition to control logic flow.|Migrated||
|[`InsertTableColumn`](InsertTableColumn/InsertTableColumn.md)                                                   |Insert a column in a table.      |Migrated||
|[`InsertTableRow`](InsertTableRow/InsertTableRow.md)                                                            |Insert a row in a table.         |Migrated||
|[`InsertTimeSeriesIntoEnsemble`](InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble.md)                  |Insert a time series into an ensemble.|Migrated||
|[`JoinTables`](JoinTables/JoinTables.md)                                                                        |Join two tables.                 |Migrated||
|[`LagK`](LagK/LagK.md)                                                                                          |Lag and attenuate flows.         |Migrated||
|[`ListFiles`](ListFiles/ListFiles.md)                                                                           |List files in a folder.          |Migrated||
|[`LookupTimeSeriesFromTable`](LookupTimeSeriesFromTable/LookupTimeSeriesFromTable.md)                           |Create a time series by looking up data values from a table.|Migrated||
|[`ManipulateTableString`](ManipulateTableString/ManipulateTableString.md)                                       |Manipulate a string in a table.  |Migrated||
|[`Message`](Message/Message.md)                                                                                 |Output a message to the log file.|Migrated||
|[`Multiply`](Multiply/Multiply.md)                                                                              |Multiply one time series by another.|Migrated||
|[`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS.md)                           |Create a new daily time series by distributing a monthly time series using a daily pattern.|Migrated||
|[`NewDerbyDatabase`](NewDerbyDatabase/NewDerbyDatabase.md)                                                      |                                 |**Command is under development**||
|[`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS.md)                              |Create a new end of month time series from daily time series.|Migrated||
|[`NewEnsemble`](NewEnsemble/NewEnsemble.md)                                                                     |Create a new time series ensemble.|Migrated||
|[`NewExcelWorkbook`](NewExcelWorkbook/NewExcelWorkbook.md)                                                      |Create a new Excel workbook file.|Migrated||
|[`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries.md)                                          |Create a new time series with repeating pattern for data values.|Migrated||
|[`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries.md)                     |Create a new time series with monthly statistics.|Migrated||
|[`NewStatisticEnsemble`](NewStatisticEnsemble/NewStatisticEnsemble.md)                                          |Create an ensemble of static time series.|Migrated||
|[`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries.md)                                    |Create a new time series having statistic repeated each year.|Migrated||
|[`NewStatisticTimeSeriesFromEnsemble`](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble.md)|                                 |Not yet migrated (placeholder)||
|[`NewStatisticYearTS`](NewStatisticYearTS/NewStatisticYearTS.md)                                                |Create a new time series of annual statistics.|Migrated||
|[`NewTable`](NewTable/NewTable.md)                                                                              |Create a new table.              |Migrated||
|[`NewTimeSeries`](NewTimeSeries/NewTimeSeries.md)                                                               |Create a new time series.        |Migrated||
|[`NewTreeView`](NewTreeView/NewTreeView.md)                                                                     |Create a tree view in the user interface.|Migrated||
|[`Normalize`](Normalize/Normalize.md)                                                                           |Create new time series by normalizing a time series.|Migrated||
|[`OpenCheckFile`](OpenCheckFile/OpenCheckFile.md)                                                               |                                 |Not yet migrated (placeholder)||
|[`OpenHydroBase`](OpenHydroBase/OpenHydroBase.md)                                                               |Open a HydroBase database connection.|Migrated||
|[`PrintTextFile`](PrintTextFile/PrintTextFile.md)                                                               |Print text file to a printer.    |Migrated||
|[`ProcessRasterGraph`](ProcessRasterGraph/ProcessRasterGraph.md)                                                |Process (create) time series raster graph.|Migrated||
|[`ProcessTSProduct`](ProcessTSProduct/ProcessTSProduct.md)                                                      |Process (create) time series data product.|Migrated||
|[`ProfileCommands`](ProfileCommands/ProfileCommands.md)                                                         |Create summary table with containing performance data|Migrated||
|[`ReadColoradoHydroBaseRest`](ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md)                           |Read time series from [State of Colorado HydroBase REST web services](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)|Migrated||
|[`ReadDateValue`](ReadDateValue/ReadDateValue.md)                                                               |Read time series from a [DateValue file](../datastore-ref/DateValue/DateValue.md).|Migrated||
|[`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml.md)                                                |Read time series from [Delft FEWS PI XML file](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML.md).|Migrated||
|[`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile.md)                                                   |Read time series from delimited file.|Migrated||
|[`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook.md)                                                   |Read Excel workbook file.        |Migrated||
|[`ReadHecDss`](ReadHecDss/ReadHecDss.md)                                                                        |Read time series from [HEC-DSS file](../datastore-ref/HEC-DSS/HEC-DSS.md)|Migrated||
|[`ReadHydroBase`](ReadHydroBase/ReadHydroBase.md)                                                               |Read time series from [State of Colorado HydroBase database](../datastore-ref/CO-HydroBase/CO-HydroBase.md)|Migrated||
|[`ReadMODSIM`](ReadMODSIM/ReadMODSIM.md)                                                                        |Read time series from [MODSIM model file](../datastore-ref/MODSIM/MODSIM.md).|Migrated||
|[`ReadNrcsAwdb`](ReadNrcsAwdb/ReadNrcsAwdb.md)                                                                  |Read time series from [NRCS AWDB web services](../datastore-ref/NRCS-AWDB/NRCS-AWDB.md)|Migrated||
|[`ReadNwsCard`](ReadNwsCard/ReadNwsCard.md)                                                                     |                                 |Not yet migrated (placeholder)||
|[`ReadNwsrfsEspTraceEnsemble`](ReadNwsrfsEspTraceEnsemble/ReadNwsrfsEspTraceEnsemble.md)                        |                                 |Not yet migrated (placeholder)||
|[`ReadNwsrfsFS5Files`](ReadNwsrfsFS5Files/ReadNwsrfsFS5Files.md)                                                |                                 |Not yet migrated (placeholder)||
|[`ReadPatternFile`](ReadPatternFile/ReadPatternFile.md)                                                         |Read time series used by [`ReadPatternFile`](ReadPatternFile/ReadPatternFile.md)|Migrated||
|[`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel.md)                                 |Read processor properties from Excel.|Migrated||
|[`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile.md)                                    |Read processor properties from a file.|Migrated||
|[`ReadRccAcis`](ReadRccAcis/ReadRccAcis.md)                                                                     |Read time series from [RCC ACIS web service](../datastore-ref/RCC-ACIS/RCC-ACIS.md).|Migrated||
|[`ReadReclamationHDB`](ReadReclamationHDB/ReadReclamationHDB.md)                                                |Read time series from [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB.md)|Migrated||
|[`ReadReclamationPisces`](ReadReclamationPisces/ReadReclamationPisces.md)                                       |Read time series from [Reclamation Pisces database](../datastore-ref/ReclamationPisces/ReclamationPisces.md)|Migrated||
|[`ReadRiversideDB`](ReadRiversideDB/ReadRiversideDB.md)                                                         |                                 |Not yet migrated (placeholder)||
|[`ReadRiverWare`](ReadRiverWare/ReadRiverWare.md)                                                               |Read time series from [RiverWare file](../datastore-ref/RiverWare/RiverWare.md)|Migrated||
|[`ReadStateCU`](ReadStateCU/ReadStateCU.md)                                                                     |Read time series from a [StateCU file](../datastore-ref/StateCU/StateCU.md).|Migrated||
|[`ReadStateCUB`](ReadStateCUB/ReadStateCUB.md)                                                                  |Read time series from a [StateCU binary file](../datastore-ref/StateCUB/StateCUB.md).|Migrated||
|[`ReadStateMod`](ReadStateMod/ReadStateMod.md)                                                                  |Read time series from a [StateMod file](../datastore-ref/StateMod/StateMod.md).|Migrated|yes|
|[`ReadStateModB`](ReadStateModB/ReadStateModB.md)                                                               |Read time series from a [StateMod binary file](../datastore-ref/StateModB/StateModB.md).|Migrated||
|[`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel.md)                                 |Read table cells from Excel worksheet.|Migrated||
|[`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore.md)                                    |Read a table from a datastore.   |Migrated||
|[`ReadTableFromDBF`](ReadTableFromDBF/ReadTableFromDBF.md)                                                      |Read a table from a DBF file.    |Migrated||
|[`ReadTableFromDelimitedFile`](ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md)                        |Read a table from a delimited file.|Migrated||
|[`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel.md)                                                |Read a table from an Excel workbook file.|Migrated||
|[`ReadTableFromFixedFormatFile`](ReadTableFromFixedFormatFile/ReadTableFromFixedFormatFile.md)                  |Read a table from a fixed-format file.|Migrated||
|[`ReadTableFromJSON`](ReadTableFromJSON/ReadTableFromJSON.md)                                                   |Read a table from a JSON file.   |Migrated||
|[`ReadTableFromXml`](ReadTableFromXml/ReadTableFromXml.md)                                                      |Read a table from an XML file.   |Migrated||
|[`ReadTimeSeries`](ReadTimeSeries/ReadTimeSeries.md)                                                            |Read a single time series using TSID to determine data source.|Migrated||
|[`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore.md)                     |Read time series from a datastore.|Migrated||
|[`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList.md)                                                |Read time series from a list in a table.|Migrated||
|[`ReadUsgsNwisDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily.md)                                                   |Read daily value time series from [USGS NWIS Daily web services](../datastore-ref/USGS-NWIS-Daily/USGS-NWIS-Daily.md)|Migrated||
|[`ReadUsgsNwisGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater.md)                                 |Read groundwater time series from [USGS NWIS Groundwater web services](../datastore-ref/USGS-NWIS-Groundwater/USGS-NWIS-Groundwater.md)|Migrated||
|[`ReadUsgsNwisInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous.md)                           |Read instantaneous value time series from [USGS NWIS Instantaneous web services](../datastore-ref/USGS-NWIS-Instantaneous/USGS-NWIS-Instantaneous.md)|Migrated||
|[`ReadWaterML`](ReadWaterML/ReadWaterML.md)                                                                     |                                 |Not yet migrated (placeholder)||
|[`ReadWaterML2`](ReadWaterML2/ReadWaterML2.md)                                                                  |                                 |Not yet migrated (placeholder)||
|[`ReadWaterOneFlow`](ReadWaterOneFlow/ReadWaterOneFlow.md)                                                      |                                 |Not yet migrated (placeholder)||
|[`ReadUsgsNwisRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb.md)                                                         |Read time series from a [USGS NWS RDB file](../datastore-ref/USGS-NWIS-RDB/USGS-NWIS-RDB.md)|Migrated||
|[`RelativeDiff`](RelativeDiff/RelativeDiff.md)                                                                  |Create a new time series as relative difference of two time series.|Migrated||
|[`RemoveFile`](RemoveFile/RemoveFile.md)                                                                        |Remove a file.                   |Migrated||
|[`ReplaceValue`](ReplaceValue/ReplaceValue.md)                                                                  |Replace values in time series data.|Migrated||
|[`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData.md)                              |Resequence time series data values by year.|Migrated||
|[`RunCommands`](RunCommands/RunCommands.md)                                                                     |Run a TSTool command file.       |Migrated||
|[`RunDSSUTL`](RunDSSUTL/RunDSSUTL.md)                                                                           |Run HEC-DSS DSSUTL program.      |Migrated||
|`RunningAverage`                                                                                                |Replaced by [`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries.md)|NA||
|[`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries.md)                        |Create time series containing statistic from moving "running" sample.|Not yet migrated (placeholder)||
|[`RunProgram`](RunProgram/RunProgram.md)                                                                        |Run a program.                   |Migrated||
|[`RunPython`](RunPython/RunPython.md)                                                                           |Run a python program.            |Migrated||
|[`RunSql`](RunSql/RunSql.md)                                                                                    |Run an SQL statement on a datastore.|Migrated||
|[`Scale`](Scale/Scale.md)                                                                                       |Scale time series values.        |Migrated||
|[`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries.md)                                                      |Select output time series for processing.|Migrated||
|[`SendEmailMessage`](SendEmailMessage/SendEmailMessage.md)                                                      |Send an email message.           |Migrated||
|[`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod.md)                                             |Set global property to auto-extend time series to output period.|Migrated||
|[`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod.md)                                                      |Set the global period used to compute historical averages.|Migrated||
|[`SetConstant`](SetConstant/SetConstant.md)                                                                     |Set time series data values to a constant.|Migrated||
|`SetConstantBefore`                                                                                             |Replaced by [`SetConstant`](SetConstant/SetConstant.md)|NA||
|[`SetDataValue`](SetDataValue/SetDataValue.md)                                                                  |Set data values in time series.  |Migrated||
|[`SetDebugLevel`](SetDebugLevel/SetDebugLevel.md)                                                               |Set the debug level for logging. |Migrated||
|[`SetEnsembleProperty`](SetEnsembleProperty/SetEnsembleProperty.md)                                             |Set an ensemble property.        |Migrated||
|[`SetExcelCell`](SetExcelCell/SetExcelCell.md)                                                                  |Set data in an Excel cell.       |Migrated||
|[`SetExcelWorksheetViewProperties`](SetExcelWorksheetViewProperties/SetExcelWorksheetViewProperties.md)         |Set Excel worksheet view properties.|Migrated||
|[`SetFromTS`](SetFromTS/SetFromTS.md)                                                                           |Set time series data values from another time series.|Migrated||
|[`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero.md)                                                         |Set global property to ignore time series values <=0 in averages.|Migrated||
|[`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS.md)                                             |Set the global property to include missing time series in output.|Migrated||
|[`SetInputPeriod`](SetInputPeriod/SetInputPeriod.md)                                                            |Set the global processor input period.|Migrated||
|[`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod.md)                                                         |Set the global processor output period.|Migrated||
|[`SetOutputYearType`](SetOutputYearType/SetOutputYearType.md)                                                   |Set the global processor output year type. |Migrated||
|`SetPatternFile`                                                                                                |Replaced by [`ReadPatternFile`](ReadPatternFile/ReadPatternFile.md) command|NA||
|[`SetProperty`](SetProperty/SetProperty.md)                                                                     |Set processor property value.    |Migrated||
|[`SetPropertyFromNwsrfsAppDefault`](SetPropertyFromNwsrfsAppDefault/SetPropertyFromNwsrfsAppDefault.md)         |                                 |Not yet migrated (placeholder)||
|[`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble.md)                                 |Set processor property from ensemble.|Migrated||
|[`SetPropertyFromTable`](SetPropertyFromTable/SetPropertyFromTable.md)                                          |Set processor property from a table.|Migrated||
|[`SetPropertyFromTimeSeries`](SetPropertyFromTimeSeries/SetPropertyFromTimeSeries.md)                           |Set processor property from time series property.|Migrated||
|[`SetTableValues`](SetTableValues/SetTableValues.md)                                                            |Set values in a table.           |Migrated||
|[`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable.md)      |Set time series properties from table values.|Migrated||
|[`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty.md)                                       |Set a time series property.      |Migrated||
|[`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookupTable/SetTimeSeriesValuesFromLookupTable.md)|Set time series values from a lookup table.|Migrated||
|[`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable.md)                  |Set time series values from a table.|Migrated||
|[`SetToMax`](SetToMax/SetToMax.md)                                                                              |Set time series values to maximum of 1+ time series.|Migrated||
|[`SetToMin`](SetToMin/SetToMin.md)                                                                              |Set time series values to minimum of 1+ time series.|Migrated||
|[`SetWarningLevel`](SetWarningLevel/SetWarningLevel.md)                                                         |Set the warning level for logging.|Migrated||
|[`SetWorkingDir`](SetWorkingDir/SetWorkingDir.md)                                                               |Set the working directory (folder) for following commands.|Migrated||
|[`ShiftTimeByInterval`](ShiftTimeByInterval/ShiftTimeByInterval.md)                                             |Shift time series data values by a time interval.|Migrated||
|[`SortTable`](SortTable/SortTable.md)                                                                           |Sort table contents.             |Migrated||
|[`SortTimeSeries`](SortTimeSeries/SortTimeSeries.md)                                                            |Sort the output time series.     |Migrated||
|[`SplitTableColumn`](SplitTableColumn/SplitTableColumn.md)                                                      |Split a table column into multiple columns.|Migrated||
|[`SplitTableRow`](SplitTableRow/SplitTableRow.md)                                                               |Split a table row into multiple rows. |Migrated||
|[`StartLog`](StartLog/StartLog.md)                                                                              |(Re)start the log file.          |Migrated||
|[`StartRegressionTestResultsReport`](StartRegressionTestResultsReport/StartRegressionTestResultsReport.md)      |Start the regression test results report file to record output of tests.|Migrated ||
|[`StateModMax`](StateModMax/StateModMax.md)                                                                     |Create time series that are maximum of two [StateMod files](../datastore-ref/StateMod/StateMod.md).|Migrated||
|[`Subtract`](Subtract/Subtract.md)                                                                              |Subtract time series from time series.|Migrated||
|[`TableMath`](TableMath/TableMath.md)                                                                           |Perform simple math on table columns.|Migrated||
|[`TableTimeSeriesMath`](TableTimeSeriesMath/TableTimeSeriesMath.md)                                             |Perform simple math on a table and time series.|Migrated||
|[`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries.md)                                                   |Create time series from a table. |Migrated||
|[`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable.md)                                                   |Copy time series to a table.     |Migrated||
|[`TSID`](TSID/TSID.md)                                                                                          |Time series identifier (TSID), causes time series to be read. |Migrated||
|[`UnknownCommand`](UnknownCommand/UnknownCommand.md)                                                            |Unknown command.                 |Migrated||
|[`UnzipFile`](UnzipFile/UnzipFile.md)                                                                           |Unzip the contents of a zip file.|Migrated||
|[`VariableLagK`](VariableLagK/VariableLagK.md)                                                                  |Lag and attenuate flows.         |Migrated||
|[`Wait`](Wait/Wait.md)                                                                                          |Wait for at time before continuing.|Migrated||
|[`WebGet`](WebGet/WebGet.md)                                                                                    |Download a file from a URL.      |Migrated||
|[`WeightTraces`](WeightTraces/WeightTraces.md)                                                                  |Create time series as weighted sum of ensemble traces.|Migrated||
|[`WriteCheckFile`](WriteCheckFile/WriteCheckFile.md)                                                            |Write command log to file.       |Migrated||
|[`WriteCommandSummaryToFile`](WriteCommandSummaryToFile/WriteCommandSummaryToFile.md)                           |Write summary of command log to a file. | Migrated ||
|[`WriteDateValue`](WriteDateValue/WriteDateValue.md)                                                            |Write time series to [DateValue format file](../datastore-ref/DateValue/DateValue.md).|Migrated||
|[`WriteDelftFewsPiXml`](WriteDelftFewsPiXml/WriteDelftFewsPiXml.md)                                             |Write time series to a [Delft FEWS PI XML file](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML.md).|Migrated||
|[`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile.md)                                                |Write time series from delimited file.|Migrated||
|[`WriteHecDss`](WriteHecDss/WriteHecDss.md)                                                                     |Write time series to a [HEC-DSS file](../datastore-ref/HEC-DSS/HEC-DSS.md).|Migrated||
|[`WriteNwsCard`](WriteNwsCard/WriteNwsCard.md)                                                                  |                                 |Not yet migrated (placeholder)||
|[`WriteNWSRFSESPTraceEnsemble`](WriteNWSRFSESPTraceEnsemble/WriteNWSRFSESPTraceEnsemble.md)                     |                                 |Not yet migrated (placeholder)||
|[`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile.md)                                       |Write processor properties to a file.|Migrated||
|[`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB.md)                                             |Write time series to [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB.md)|Migrated||
|[`WriteRiversideDB`](WriteRiversideDB/WriteRiversideDB.md)                                                      |                                 |Not yet migrated (placeholder)||
|[`WriteRiverWare`](WriteRiverWare/WriteRiverWare.md)                                                            |Write time series to a [RiverWare file](../datastore-ref/RiverWare/RiverWare.md).|Migrated||
|[`WriteSHEF`](WriteSHEF/WriteSHEF.md)                                                                           |Write time series to [SHEF file](../datastore-ref/SHEF/SHEF.md).|Migrated||
|[`WriteStateCU`](WriteStateCU/WriteStateCU.md)                                                                  |Write time series to a [StateCU file](../datastore-ref/StateCU/StateCU.md).|Migrated||
|[`WriteStateMod`](WriteStateMod/WriteStateMod.md)                                                               |Write time series to a [StateMod file](../datastore-ref/StateMod/StateMod.md).|Migrated||
|[`WriteSummary`](WriteSummary/WriteSummary.md)                                                                  |Write time series to a summary report file.|Migrated||
|[`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel.md)                                    |Write table row cells to an Excel worksheet.|Migrated||
|[`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore.md)                                       |Write a table to a datastore.    |Migrated||
|[`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile.md)                           |Write a table to delimited file. |Migrated||
|[`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel.md)                                                   |Write a table to an Excel workbook file.|Migrated||
|[`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON.md)                                             |Write a table to a GeoJSON file.|Migrated||
|[`WriteTableToHTML`](WriteTableToHTML/WriteTableToHTML.md)                                                      |Write a table to an HTML file.   |Migrated||
|[`WriteTableToKml`](WriteTableToKml/WriteTableToKml.md)                                                         |Write a table to a KML file.|Migrated||
|[`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile.md)                                       |Write a table to a shapefile.|Migrated||
|[`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile.md)         |Write time series properties to a file.|Migrated||
|[`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore.md)                        |Write time series to a datastore.|Migrated||
|[`WriteTimeSeriesToDataStream`](WriteTimeSeriesToDataStream/WriteTimeSeriesToDataStream.md)                     |Write time series to a stream of data lines.|Migrated||
|[`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel.md)                                    |Write time series to an Excel workbook.|Migrated||
|[`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock.md)                     |Write time series to an Excel workbook using block format.|Migrated||
|[`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON.md)                              |Write time series to a GeoJSON file.|Migrated||
|[`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON.md)                        |Write time series to a [HydroJSON file](../datastore-ref/HydroJSON/HydroJSON.md).|Migrated||
|[`WriteTimeSeriesToJson`](WriteTimeSeriesToJson/WriteTimeSeriesToJson.md)                                       |Write time series to a JSON file.|Migrated||
|[`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml.md)                                          |Write time esries to a KML file. |Migrated||
|[`WriteWaterML`](WriteWaterML/WriteWaterML.md)                                                                  |                                 |Not yet migrated (placeholder)||
|[`WriteWaterML2`](WriteWaterML2/WriteWaterML2.md)                                                               |                                 |Not yet migrated (placeholder)||
