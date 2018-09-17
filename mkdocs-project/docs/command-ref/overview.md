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
[`For`](For/For) and [`If`](If/If) control commands, if present, will cause execution order to jump over commands.

Each command adheres to the syntax:

```text
CommandName(ParameterName1="ParameterValue1",ParameterName2="ParameterValue2",...)
```

The following are guidelines for commands:

1. Commands always follow the convention of command name at start with a list of named parameters in parentheses.
The only exceptions are:
	1. Comments starting with [`#`](Comment/Comment).
	2. Block comments [`/*`](CommentBlockStart/CommentBlockStart) and
	[`*/`](CommentBlockEnd/CommentBlockEnd) that surround one or more command lines.
	3. Command such as [`Exit`](Exit/Exit), which will always have empty list of parameters in the parentheses.
2. Commands are generally not case-specific although the TSTool software enforces standards.
3. Command and parameter names use mixed case where the first letter of each word is capitalized.
4. Parameter values may optionally be surrounded by double quotes, regardless of type.
Double quotes are required in some cases to protect spaces and other characters within quotes.
5. Each command must exist on a single line.
6. Spaces at the front of a command for indentation are currently not allowed.
This limitation is planned to be removed in the future.
Tabs used for indentation are discouraged and will likely be prohibited because tab width is ambiguous between different users and tools.
Spaces will be the preferred method of indentation.
7. Empty (blank) lines are allowed and will be handled as [`Empty`](Empty/Empty) commands.
8. Unknown commands are handled as [`UnknownCommand`](UnknownCommand/UnknownCommand) commands.

## Time Series Processing ##

Time series processing commands focus on time series,
although other outputs such as tables and files may result from processing.
Older commands assumed that only time series would be processed and have general names (e.g.,
[`Copy`](Copy/Copy)),
whereas newer commands recognize that other objects may be processed and have more specific names
(e.g., [`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries)).

### Select, Free, Sort Time Series ###

These commands select, free, and sort time series.

* [`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries) - select output time series for processing
* [`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries) - deselect output time series for processing
* [`Free`](Free/Free) - free memory used by time series
* [`SortTimeSeries`](SortTimeSeries/SortTimeSeries) - sort the output time series

### Create Time Series ###

These commands create new time series from other time series or data values.

* [`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries) - create a new time series with repeating pattern for data values
* [`NewTimeSeries`](NewTimeSeries/NewTimeSeries) - create a new time series
* [`ChangeInterval`](ChangeInterval/ChangeInterval)
* [`Copy`](Copy/Copy) - copy a time series
* [`Delta`](Delta/Delta) - create a new time series from delta between time series values
* [`Disaggregate`](Disaggregate/Disaggregate) - create a new time series by disaggregating a time series
* [`LookupTimeSeriesFromTable`](LookupTimeSeriesFromTable/LookupTimeSeriesFromTable) - create a time series by looking up data values from a table
* [`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS) - create a new daily time series by distributing a monthly time series using a daily pattern
* [`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS) - create a new end of month time series from daily time series
* [`Normalize`](Normalize/Normalize) - create a new time series by normalizing a time series
* [`RelativeDiff`](RelativeDiff/RelativeDiff) - create a new time series as relative difference of two time series
* [`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData) - resequence time series data values by year
* [`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries) - create a new time series having statistic repeated each year
* [`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries) - create a new time series with monthly statistics
* [`NewStatisticYearTS`](NewStatisticYearTS/NewStatisticYearTS) - create a new time series of annual statistics
* [`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries) - create time series containing statistic from moving "running" sample

### Read Time Series ###

These commands read time series from various sources.

* [`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS) - set the global property to include missing time series in output
* [`SetInputPeriod`](SetInputPeriod/SetInputPeriod) - set the global processor input period
* [`CreateFromList`](CreateFromList/CreateFromList) - create time series from a list in a file
* [`ReadColoradoHydroBaseRest`](ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest) - read time series from [Colorado HydroBase REST web services](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest)
* [`ReadDateValue`](ReadDateValue/ReadDateValue) - read time series from a [DateValue file](../datastore-ref/DateValue/DateValue)
* [`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml) - read time series from Delft [FEWS PI XML file](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML)
* [`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile) - read time series from delimited file
* [`ReadHecDss`](ReadHecDss/ReadHecDss) - read time series from [HEC-DSS file](../datastore-ref/HEC-DSS/HEC-DSS)
* [`ReadHydroBase`](ReadHydroBase/ReadHydroBase) - read time series from [State of Colorado HydroBase database](../datastore-ref/CO-HydroBase/CO-HydroBase)
* [`ReadMODSIM`](ReadMODSIM/ReadMODSIM) - read time series from [MODSIM model file](../datastore-ref/MODSIM/MODSIM)
* [`ReadNrcsAwdb`](ReadNrcsAwdb/ReadNrcsAwdb) - read time series from [NRCS AWDB web services](../datastore-ref/NRCS-AWDB/NRCS-AWDB)
* [`ReadNwsCard`](ReadNwsCard/ReadNwsCard)
* [`ReadNwsrfsTraceEnsemble`](ReadNwsrfsTraceEnsemble/ReadNwsrfsTraceEnsemble)
* [`ReadNwsrfsFS5files`](ReadNwsrfsFS5files/ReadNwsrfsFS5files)
* [`ReadRccAcis`](ReadRccAcis/ReadRccAcis) - read time series from [RCC ACIS web service](../datastore-ref/RCC-ACIS/RCC-ACIS)
* [`ReadReclamationHDB`](ReadReclamationHDB/ReadReclamationHDB) - read time series from [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB)
* [`ReadReclamationPisces`](ReadReclamationPisces/ReadReclamationPisces) - read time series from [Reclamation Pisces database](../datastore-ref/ReclamationPisces)
* [`ReadRiverWare`](ReadRiverWare/ReadRiverWare) - read time series from [RiverWare file](../datastore-ref/RiverWare/RiverWare)
* [`ReadStateCU`](ReadStateCU/ReadStateCU) - read time series from a [StateCU file](../datastore-ref/StateCU/StateCU)
* [`ReadStateCUB`](ReadStateCUB/ReadStateCUB) - read time series from a [StateCU binary file](../datastore-ref/StateCUB/StateCUB)
* [`ReadStateMod`](ReadStateMod/ReadStateMod) - read time series from a [StateMod file](../datastore-ref/StateMod/StateMod)
* [`ReadStateModB`](ReadStateModB/ReadStateModB) - read time series from a [StateMod binary file](../datastore-ref/StateModB/StateModB)
* [`ReadTimeSeries`](ReadTimeSeries/ReadTimeSeries) - read a single time series using TSID to determine data source
* [`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore) - read time series from a datastore
* [`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList) - read time series from a list in a table
* [`ReadUsgsNwisDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily) - read daily value time series from [USGS NWIS Daily web services](../datastore-ref/USGS-NWIS-Daily/USGS-NWIS-Daily)
* [`ReadUsgsNwisInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous) - read instantaneous value time series from [USGS NWIS Instantaneous web services](../datastore-ref/USGS-NWIS-Instantaneous/USGS-NWIS-Instantaneous)
* [`ReadUsgsNwisGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater) - read groundwater time series from [USGS NWIS Daily web services](../datastore-ref/USGS-NWIS-Daily/USGS-NWIS-Daily) 
* [`ReadUsgsNwisRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb) - read time series from a [USGS NWS RDB file](../datastore-ref/USGS-NWIS-RDB/USGS-NWIS-RDB)
* [`ReadWaterML`](ReadUsgsWaterML/ReadUsgsWaterML)
* [`ReadWaterML2`](ReadUsgsWaterML2/ReadUsgsWaterML2)
* [`StateModMax`](StateModMax/StateModMax) - create time series that are maximum of two [StateMod files](../datastore-ref/StateMod/StateMod)

### Fill Time Series Missing Data ###

These commands fill missing time series values.

* [`FillConstant`](FillConstant/FillConstant) - fill missing time series values with a constant
* [`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS) - fill a daily time series by prorating monthly volumes using a daily pattern
* [`FillFromTS`](FillFromTS/FillFromTS) - fill missing time series values from another time series
* [`FillHistMonthAverage`](FillHistMonthAverage/FillHistMonthAverage) - fill missing time series values with historical monthly average
* [`FillHistYearAverage`](FillHistYearAverage/FillHistYearAverage) - fill missing time series values with historical yearly average
* [`FillInterpolate`](FillInterpolate/FillInterpolate) - fill missing time series values using interpolation
* [`FillMixedStation`](FillMixedStation/FillMixedStation)
* [`FillMOVE2`](FillMOVE2/FillMOVE2)
* [`FillPattern`](FillPattern/FillPattern) - fill missing time series values using historical pattern average
	+ [`ReadPatternFile`](ReadPatternFile/ReadPatternFile) - read pattern time series used by [`FillPattern`](FillPattern/FillPattern)
* [`FillProrate`](FillProrate/FillProrate) - fill missing time series values by prorating another time series
* [`FillRegression`](FillRegression/FillRegression)
* [`FillRepeat`](FillRepeat/FillRepeat) - fill missing time series values by repeating values
* [`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments) - fill missing time series values using HydroBase diversion comments
* [`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod) - set global property to auto-extend time series to output period
* [`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod) - set the global period used to compute historical averages
* [`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero) - set global property to ignore time series values <= 0 in averages

### Set Time Series Contents ###

These commands set time series contents, including properties and data values.

* [`ReplaceValue`](ReplaceValue/ReplaceValue) - replace values in time series data
* [`SetConstant`](SetConstant/SetConstant) - set time series data values to a constant
* [`SetDataValue`](SetDataValue/SetDataValue) - set data values in time series
* [`SetFromTS`](SetFromTS/SetFromTS) - set time series data values from another time series
* [`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookupTable/SetTimeSeriesValuesFromLookupTable) - set time series values from a lookup table
* [`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable) - set time series values from a table
* [`SetToMax`](SetToMax/SetToMax) - set time series values to maximum of 1+ time series
* [`SetToMin`](SetToMin/SetToMin) - set time series values to minimum of 1+ time series
* [`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty) - set a time series property

### Manipulate Time Series ###

These commands perform basic time series manipulation.

* [`Add`](Add/Add) - add time series to time series
* [`AddConstant`](AddConstant/AddConstant) - add a constant to time series values
* [`AdjustExtremes`](AdjustExtremes/AdjustExtremes) - adjust extreme values in time series
* [`ARMA`](ARMA/ARMA)
* [`Blend`](Blend/Blend) - blend one time series into another
* [`ChangePeriod`](ChangePeriod/ChangePeriod) - change time series data period
* [`ChangeTimeZone`](ChangeTimeZone/ChangeTimeZone) - change the time zone for time series
* [`ConvertDataUnits`](ConvertDataUnits/ConvertDataUnits) - convert time series data units
* [`Cumulate`](Cumulate/Cumulate) - set time series values to cumulative values
* [`Divide`](Divide/Divide) - divide one time series by another
* [`Multiply`](Multiply/Multiply) - multiply one time series by another
* [`Scale`](Scale/Scale) - scale time series values
* [`ShiftTimeByInterval`](ShiftTimeByInterval/ShiftTimeByInterval) - shift time series data values by a time interval
* [`Subtract`](Subtract/Subtract) - subtract time series from time series

### Analyze Time Series ###

These commands analyze time series.

* [`AnalyzePattern`](AnalyzePattern/AnalyzePattern) - analyze pattern of time series data
* [`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)
* [`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries) - compare time series to detect whether they are the same or different
* [`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/ComputeErrorTimeSeries) - compute the error between two time series

### Models - Routing ###

These commands route flow time series from one location to another.

* [`LagK`](LagK/LagK) - lag and attenuate flows
* [`VariableLagK`](VariableLagK/VariableLagK) - lag and attenuate flows

### Output Time Series ###

These commands output time series to different formats.

* [`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod) - set the global processor output period
* [`SetOutputYearType`](SetOutputYearType/SetOutputYearType) - set the global processor output year type
* [`WriteDateValue`](WriteDateValue/WriteDateValue) - write time series to [DateValue format file](../datastore-ref/DateValue/DateValue)
* [`WriteDelftFewsPiXml`](WriteDelftFewsPiXml/WriteDelftFewsPiXml) - write time series to [Delft FEWS PI XML format file](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML)
* [`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile) - write time series to a delimited file
* [`WriteHecDss`](WriteHecDss/WriteHecDss) - write time series to a [HEC-DSS file](../datastore-ref/HEC-DSS/HEC-DSS)
* [`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB) - write time series to [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB)
* [`WriteRiverWare`](WriteRiverWare/WriteRiverWare) write time series to a [RiverWare file](../datastore-ref/RiverWare/RiverWare)
* [`WriteStateCU`](WriteStateCU/WriteStateCU) - write time series to a [StateCU file](../datastore-ref/StateCU/StateCU)
* [`WriteStateMod`](WriteStateMod/WriteStateMod) - write time series to a [StateMod file](../datastore-ref/StateMod/StateMod)
* [`WriteSummary`](WriteSummary/WriteSummary) - write time series to a summary report file
* [`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore) - write time series to a datastore
* [`WriteTimeSeriesToDataStream`](WriteTimeSeriesToDataStream/WriteTimeSeriesToDataStream) - write time series to a stream of data lines
* [`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON) - write time series to a [HydroJSON file](../datastore-ref/HydroJSON/HydroJSON).
* [`WriteTimeSeriesToJSON`](WriteTimeSeriesToJSON/WriteTimeSeriesToJSON) - write time series to a JSON file
* [`WriteTimeSeriesToWaterML`](WriteTimeSeriesToWaterML/WriteTimeSeriesToWaterML)
* [`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile) - write time series properties to a file

### Check Time Series ###

These commands are used to check time series, for example for quality control.

* [`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries) - check time series values against criteria
* [`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic) - check time series statistic against criteria
* [`WriteCheckFile`](WriteCheckFile/WriteCheckFile) - write command log to file

## Topic Area Commands ##

The following commands are grouped into specific topic areas.

### Datastore Processing ###

These commands handle reading and writing time series and other data from datastores, in particular databases.
Utility commands for executing SQL and creating a data dictionary are also provided.

* [`NewDerbyDatabase`](NewDerbyDatabase/NewDerbyDatabase) - **this command is under development**
* [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore) - read a table from a datastore
* [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore) - write a table to a datastore
* [`RunSql`](RunSql/RunSql) - run an SQL statement on a datastore
* [`DeleteDataStoreTableRows`](DeleteDataStoreTableRows/DeleteDataStoreTableRows) - delete datastore table rows
* [`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore) - read time series from a datastore
* [`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore) - write time series to a datastore
* [`CloseDataStore`](CloseDataStore/CloseDataStore) - close an open datastore
* [`CreateDataStoreDataDictionary`](CreateDataStoreDataDictionary/CreateDataStoreDataDictionary) - create a database data dictionary

### Ensemble Processing ###

* [`CreateEnsembleFromOneTimeSeries`](CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries) - create an ensemble from a time series
* [`CopyEnsemble`](CopyEnsemble/CopyEnsemble) - copy an ensemble to a new ensemble
* [`NewEnsemble`](NewEnsemble/NewEnsemble) - create a new time series ensemble
* [`InsertTimeSeriesIntoEnsemble`](InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble) - insert a time series into an ensemble
* [`SetEnsembleProperty`](SetEnsembleProperty/SetEnsembleProperty) - set an ensemble property
* [`NewStatisticEnsemble`](NewStatisticEnsemble/NewStatisticEnsemble) - create an ensemble of statistic time series
* [`NewStatisticTimeSeriesFromEnsemble`](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble)
* [`WeightTraces`](WeightTraces/WeightTraces) - create time series as weighted sum of ensemble traces

### Network Processing ###

* [`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow) - perform point flow analysis for a network
* [`CreateNetworkFromTable`](CreateNetworkFromTable/CreateNetworkFromTable) - create a network from a table

### Spatial Processing ###

* [`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON) - write a table to a GeoJSON file
* [`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile) - write a table to a shapefile
* [`WriteTableToKml`](WriteTableToKml/WriteTableToKml) - write a table to a KML file
* [`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON) - write time series to a GeoJSON file
* [`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml) - write time series to a KML file

### Spreadsheet Processing ###

* [`NewExcelWorkbook`](NewExcelWorkbook/NewExcelWorkbook) - create a new Excel workbook file
* [`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook) - read Excel workbook file
* [`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel) - read a table from an Excel workbook file
* [`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel) - read table cells from Excel worksheet
* [`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel) - read processor properties from Excel
* [`SetExcelCell`](SetExcelCell/SetExcelCell) - set data in an Excel cell
* [`SetExcelWorksheetViewProperties`](SetExcelWorksheetViewProperties/SetExcelWorksheetViewProperties) - set Excel worksheet view properties
* [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel) - write a table to an Excel workbook file
* [`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel) - write table row cells to an Excel worksheet
* [`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel) - write time series to an Excel workbook
* [`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock) - write time series to an Excel workbook using block format
* [`CloseExcelWorkbook`](CloseExcelWorkbook/CloseExcelWorkbook) - close Excel workbook that is open

### Template Processing ###

* [`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile) - expand template file into full file

### Visualization Processing ###

* [`ProcessTSProduct`](ProcessTSProduct/ProcessTSProduct) - process (create) time series data product
* [`ProcessRasterGraph`](ProcessRasterGraph/ProcessRasterGraph) - process (create) time series raster graph
* [`NewTreeView`](NewTreeView/NewTreeView) - create a tree view in the user interface

## General Commands ##

General commands perform tasks that are general in nature,
meaning they are not specific to processing time series, tables, or other specific data types.

### General - Comments ###

These commands are used to insert comments into command files.

* [`#` comment](Comment/Comment) - single line comment
* [`\*` comment block start](CommentBlockStart/CommentBlockStart) - start of multi-line comment block
* [`\*` comment block end](CommentBlockEnd/CommentBlockEnd) - end of multi-line comment block

### General - File Handling ###

These commands provide general file handling capabilities.

* [`AppendFile`](AppendFile/AppendFile) - append a file to another file
* [`CopyFile`](CopyFile/CopyFile) - copy a file to another name
* [`ListFiles`](ListFiles/ListFiles) - list files in a folder
* [`FTPGet`](FTPGet/FTPGet) - download a file from an FTP site
* [`WebGet`](WebGet/WebGet) - download a file from a URL
* [`RemoveFile`](RemoveFile/RemoveFile) - remove a file
* [`UnzipFile`](UnzipFile/UnzipFile) - unzip the contents of a zip file
* [`PrintTextFile`](PrintTextFile/PrintTextFile) - print a text file to printer

### General - Logging and Messaging ###

These commands handle run-time configuration of logging and sending messages.

* [`ConfigureLogging`](ConfigureLogging/ConfigureLogging) - configure logging
* [`Message`](Message/Message) - output a message to the log file
* [`SetDebugLevel`](SetDebugLevel/SetDebugLevel) - set the debug level for logging
* [`SetWarningLevel`](SetWarningLevel/SetWarningLevel) - set the warning level for logging
* [`StartLog`](StartLog/StartLog) - (re)start the log file
* [`SendEmailMessage`](SendEmailMessage/SendEmailMessage) - send an email message

### General - Running and Properties ###

These commands provide general capabilities to control running commands, including running programs external to TSTool,
handling processor properties (used with `${Property}`), and control commands such as [`For`](For/For) and [`If`](If/If).

* [`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile) - read processor properties from a file
* [`SetProperty`](SetProperty/SetProperty) - set a processor property value
* [`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble) - set a processor property from an ensemble
* [`SetPropertyFromNwsrfsAppDefault`](SetPropertyFromNwsrfsAppDefault/SetPropertyFromNwsrfsAppDefault)
* [`SetPropertyFromTimeSeries`](SetPropertyFromTimeSeries/SetPropertyFromTimeSeries) - set time series property from time series property
* [`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty) - format a date/time processor property
* [`FormatStringProperty`](FormatStringProperty/FormatStringProperty) - format a string processor property
* [`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile) - write processor properties to a file
* [`RunCommands`](RunCommands/RunCommands) - run a TSTool command file
* [`RunProgram`](RunProgram/RunProgram) - run a program
* [`RunPython`](RunPython/RunPython) - run a Python a program
* [`RunDSSUTL`](RunDSSUTL/RunDSSUTL) - run HEC-DSS DSSUTL program
* [`If`](If/If) - test a condition to control logic flow
* [`EndIf`](EndIf/EndIf) - end of an [`If`](If/If) block of commands
* [`For`](For/For) - iterate over items in a loop
* [`EndFor`](EndFor/EndFor) - end of a [`For`](For/For) loop block of commands
* [`Exit`](Exit/Exit) - stop processing commands
* [`Wait`](Wait/Wait) - wait for a time before continuing
* [`SetWorkingDir`](SetWorkingDir/SetWorkingDir) - set the working directory (folder) for following commands
* [`ProfileCommands`](ProfileCommands/ProfileCommands) - create summary table with containing performance data
* [`Empty`](Empty/Empty) - empty (blank) line
* [`UnknownCommand`](UnknownCommand/UnknownCommand) - unknown command

### General - Test Processing ###

These commands are used to run automated tests, in particular when running the full suite of tests.

* [`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile) - write time series properties to a file
* [`CompareFiles`](CompareFiles/CompareFiles) - compare files to detect whether they are the same or different
* [`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile) - create a regression test suite command file
* [`StartRegressionTestResultsReport`](StartRegressionTestResultsReport/StartRegressionTestResultsReport) - start the regression test results report file to record output of tests
* [`WriteCommandSummaryToFile`](WriteCommandSummaryToFile/WriteCommandSummaryToFile) - write summary of command log to a file

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

* [`NewTable`](NewTable/NewTable) - create a new table
* [`CopyTable`](CopyTable/CopyTable) - copy a table to a new table
* [`FreeTable`](FreeTable/FreeTable) - free memory resources for a table

### Read Table ###

These commands read tables from various sources.

* [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore) - read a table from a datastore
* [`ReadTableFromDBF`](ReadTableFromDBF/ReadTableFromDBF) - read a table from a DBF file
* [`ReadTableFromDelimitedFile`](ReadTableFromDBF/ReadTableFromDelimitedFile) - read a table from a delimited file
* [`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel) - read a table from an Excel workbook file
* [`ReadTableFromFixedFormatFile`](ReadTableFromFixedFormatFile/ReadTableFromFixedFormatFile) - read a table from a fixed-format file
* [`ReadTableFromJSON`](ReadTableFromJSON/ReadTableFromJSON) - read a table from a JSON file
* [`ReadTableFromXml`](ReadTableFromXml/ReadTableFromXml) - read a table from an XML file

### Append, Join Tables ###

These commands append and join tables.

* [`AppendTable`](AppendTable/AppendTable) - append a table to another table
* [`JoinTables`](JoinTables/JoinTables) - join two tables

### Table, Time Series Processing ###

These commands convert between tables and time series.

* [`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable) - copy a time series to a table
* [`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries) - create time series from a table
* [`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable) - create an event table associated with time series
* [`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable) - set time series properties from table values
* [`CopyTimeSeriesPropertiesToTable`](CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable) - copy time series properties to table

### Manipulate Tables ###

These commands manipulate tables.

* [`InsertTableColumn`](InsertTableColumn/InsertTableColumn) - insert a column in a table
* [`DeleteTableColumns`](DeleteTableColumns/DeleteTableColumns) - delete columns from a table
* [`DeleteTableRows`](DeleteTableRows/DeleteTableRows) - delete rows from a table
* [`FormatTableDateTime`](FormatTableDateTime/FormatTableDateTime) - format a date/time in a table
* [`FormatTableString`](FormatTableString/FormatTableString) - format a string in a table
* [`ManipulateTableString`](ManipulateTableString/ManipulateTableString) - manipulate a string in a table
* [`SetTableValues`](SetTableValues/SetTableValues) - set values in a table
* [`SplitTableColumn`](SplitTableColumn/SplitTableColumn) - split table column into multiple columns
* [`TableMath`](TableMath/TableMath) - perform simple math on table columns
* [`TableTimeSeriesMath`](TableTimeSeriesMath/TableTimeSeriesMath) - perform simple math on a table and time series
* [`InsertTableRow`](InsertTableRow/InsertTableRow) - insert a row in a table
* [`SortTable`](SortTable/SortTable) - sort table contents
* [`SplitTableRow`](SplitTableRow/SplitTableRow) - split a table row into multiple rows

### Analyze Table ###

These commands analyze tables.

* [`CompareTables`](CompareTables/CompareTables) - compare tables to detect whether they are the same or different

### Output Table ###

These commands write tables to various formats.

* [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore) - write a table to a datastore
* [`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile) - write a table to a delimited file
* [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel) - write a table to an Excel workbook file
* [`WriteTableToHTML`](WriteTableToHTML/WriteTableToHTML) - write a table to an HTML file

### Running and Properties ###

These commands handle table properties, which are used to control run logic.

* [`SetPropertyFromTable`](SetPropertyFromTable/SetPropertyFromTable) - set a processor property from a table
* [`CopyPropertiesToTable`](CopyPropertiesToTable/CopyPropertiesToTable) - **command is under development**

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
|[`#` comment](Comment/Comment)                                                                               |Single line comment.             |Migrated||
|[`\*` comment block start](CommentBlockStart/CommentBlockStart)                                              |Start of multi-line comment block.|Migrated||
|[`\*` comment block end](CommentBlockEnd/CommentBlockEnd)                                                    |End of multi-line comment block. |Migrated||
|[`Add`](Add/Add)                                                                                             |Add time series to time series.|Migrated||
|[`AddConstant`](AddConstant/AddConstant)                                                                     |Add a constant to time series values.|Migrated||
|[`AdjustExtremes`](AdjustExtremes/AdjustExtremes)                                                            |Adjust extreme values in time series.|Migrated||
|[`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow)                                 |Perform point flow analysis for a network.|Migrated||
|[`AnalyzePattern`](AnalyzePattern/AnalyzePattern)                                                            |Analyze pattern of time series data.|Migrated||
|[`AppendFile`](AppendFile/AppendFile)                                                                        |Append a file to another file.   |Migrated||
|[`AppendTable`](AppendTable/AppendTable)                                                                     |Append a table to another table. |Migrated||
|[`ARMA`](ARMA/ARMA)                                                                                          |                                 |Not yet migrated (placeholder)||
|[`Blend`](Blend/Blend)                                                                                       |Blend one time series into another.|Migrated||
|[`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)                  |                                 |Not yet migrated (placeholder)||
|[`ChangeInterval`](ChangeInterval/ChangeInterval)                                                            |                                 |Not yet migrated (placeholder)||
|[`ChangePeriod`](ChangePeriod/ChangePeriod)                                                                  |Change time series data period.  |Migrated||
|[`ChangeTimeZone`](ChangeTimeZone/ChangeTimeZone)                                                            |Change the time zone for time series.|Migrated||
|[`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries)                                                         |Check time series values against criteria.|Migrated||
|[`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic)                              |Check time series statistic against criteria.|Migrated||
|[`CloseDataStore`](CloseDataStore/CloseDataStore)                                                            |Close an open datastore.         |Migrated||
|[`CloseExcelWorkbook`](CloseExcelWorkbook/CloseExcelWorkbook)                                                |Close Excel workbook that is open.|Migrated||
|[`CompareFiles`](CompareFiles/CompareFiles)                                                                  |Compare files to detect whether they are the same or different.|Migrated||
|[`CompareTables`](CompareTables/CompareTables)                                                               |Compare tables to detect whether they are the same or different.|Migrated||
|[`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries)                                                   |Compare time series to detect whether they are the same or different.|Migrated||
|[`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/CompauteErrorTimeSeries)                                   |Compute the error between two time series.|Migrated||
|[`ConfigureLogging`](ConfigureLogging/ConfigureLogging)                                                      |Configure logging.               |Migrated||
|[`ConvertDataUnits`](ConvertDataUnits/ConvertDataUnits)                                                      |Convert time series data units.  |Migrated||
|[`Copy`](Copy/Copy)                                                                                          |Copy a time series.              |Migrated||
|[`CopyEnsemble`](CopyEnsemble/CopyEnsemble)                                                                  |Copy an ensemble to a new ensemble.|Migrated||
|[`CopyFile`](CopyFile/CopyFile)                                                                              |Copy a file to another name.     |Migrated||
|[`CopyPropertiesToTable`](CopyPropertiesToTable/CopyPropertiesToTable)                                       |Command is under development.    |Not yet migrated||
|[`CopyTable`](CopyTable/CopyTable)                                                                           |Copy a table to a new table.     |Migrated||
|[`CopyTimeSeriesPropertiesToTable`](CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable)         |Copy time series properties to a table.|Migrated||
|[`CreateDataStoreDataDictionary`](CreateDataStoreDataDictionary/CreateDataStoreDataDictionary)               |Create a database data dictionary.|Migrated||
|[`CreateEnsembleFromOneTimeSeries`](CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries)         |Create an ensemble from a time series.|Migrated||
|[`CreateFromList`](CreateFromList/CreateFromList)                                                            |Create time series from a list in a file.|Migrated||
|[`CreateNetworkFromTable`](CreateNetworkFromTable/CreateNetworkFromTable)                                    |Create a network from a table.|Migrated||
|[`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile)         |Create regression test suite command file.|Migrated||
|[`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable)                        |Create an event table associated with time series.|Migrated||
|[`Cumulate`](Cumulate/Cumulate)                                                                              |Set time series values to cumulative values.|Migrated||
|[`DeleteDataStoreTableRows`](DeleteDataStoreTableRows/DeleteDataStoreTableRows)                              |Delete datastore table rows.     |Migrated||
|[`DeleteTableColumns`](DeleteTableColumns/DeleteTableColumns)                                                |Delete columns from a table.     |Migrated||
|[`DeleteTableRows`](DeleteTableRows/DeleteTableRows)                                                         |Delete rows from a table.        |Migrated||
|[`Delta`](Delta/Delta)                                                                                       |Create a new time series from delta between time series values.|Migrated||
|[`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries)                                                |Deselect output time series for processing.|Migrated||
|[`Disaggregate`](Disaggregate/Disaggregate)                                                                  |Create a new time series by disaggregating a time series.|Migrated||
|[`Divide`](Divide/Divide)                                                                                    |Divide one time series by another.|Migrated||
|[`Empty`](Empty/Empty)                                                                                       |Empty (blank) commands line.     |Migrated||
|[`EndFor`](EndFor/EndFor)                                                                                    |End of For loop.                 |Migrated||
|[`EndIf`](EndIf/EndIf)                                                                                       |End of If loop.                  |Migrated||
|[`Exit`](Exit/Exit)                                                                                          |Stop processing commands.        |Migrated||
|[`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile)                                                |Expand template file into full file.|Migrated||
|[`FillCarryForward`](FillCarryForward/FillCarryForward)                                                      |Replaced by [`FillRepeat`](FillRepeat/FillRepeat).|NA||
|[`FillConstant`](FillConstant/FillConstant)                                                                  |Fill missing time series values with a constant.|Migrated||
|[`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS)            |Fill a daily time series by prorating monthly volumes using a daily pattern.|Migrated||
|[`FillFromTS`](FillFromTS/FillFromTS)                                                                        |Fill missing time series values from another time series.|Migrated||
|[`FillHistMonthAverage`](FillHistMonthAverage/FillHistMonthAverage)                                          |Fill missing time series values with historical monthly average. |Migrated||
|[`FillHistYearAverage`](FillHistYearAverage/FillHistYearAverage)                                             |Fill missing time series values with historical yearly average.|Migrated||
|[`FillInterpolate`](FillInterpolate/FillInterpolate)                                                         |Fill missing time series values using interpolation. |Migrated||
|[`FillMixedStation`](FillMixedStation/FillMixedStation)                                                      |                                 |Not yet migrated (placeholder)||
|[`FillMOVE1`](FillMOVE1/FillMOVE1)                                                                           |                                 |Not yet migrated (placeholder)||
|[`FillMOVE2`](FillMOVE2/FillMOVE2)                                                                           |                                 |Not yet migrated (placeholder)||
|[`FillPattern`](FillPattern/FillPattern)                                                                     |Fill missing time series values using historical pattern average.|Migrated||
|[`FillPrincipalComponentAnalysis`](FillPrincipalComponentAnalysis/FillPrincipalComponentAnalysis)            |                                 |Not yet migrated (placeholder)||
|[`FillProrate`](FillProrate/FillProrate)                                                                     |Fill missing time series values by prorating another time series.|Migrated||
|[`FillRegression`](FillRegression/FillRegression)                                                            |                                 |Not yet migrated (placeholder)||
|[`FillRepeat`](FillRepeat/FillRepeat)                                                                        |Fill missing time series values by repeating values.|Migrated||
|[`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments)                        |Fill missing time series values using HydroBase diversion comments.|Migrated||
|[`For`](For/For)                                                                                             |Iterate over items in a loop.    |Migrated||
|[`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty)                                    |Format a date/time processor property.|Migrated||
|[`FormatStringProperty`](FormatStringProperty/FormatStringProperty)                                          |Format string processor property.|Migrated||
|[`FormatTableDateTime`](FormatTableDateTime/FormatTableDateTime)                                             |Format a date/time in a table.   |Migrated||
|[`FormatTableString`](FormatTableString/FormatTableString)                                                   |Format a string in a table.      |Migrated||
|[`Free`](Free/Free)                                                                                          |Free memory used by time series. |Migrated||
|[`FreeTable`](FreeTable/FreeTable)                                                                           |Free memory resources for a table.|Migrated||
|[`FTPGet`](FTPGet/FTPGet)                                                                                    |Download a file from an FTP site.|Migrated||
|[`If`](If/If)                                                                                                |Test a condition to control logic flow.|Migrated||
|[`InsertTableColumn`](InsertTableColumn/InsertTableColumn)                                                   |Insert a column in a table.      |Migrated||
|[`InsertTableRow`](InsertTableRow/InsertTableRow)                                                            |Insert a row in a table.         |Migrated||
|[`InsertTimeSeriesIntoEnsemble`](InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble)                  |Insert a time series into an ensemble.|Migrated||
|[`JoinTables`](JoinTables/JoinTables)                                                                        |Join two tables.                 |Migrated||
|[`LagK`](LagK/LagK)                                                                                          |Lag and attenuate flows.         |Migrated||
|[`ListFiles`](ListFiles/ListFiles)                                                                           |List files in a folder.          |Migrated||
|[`LookupTimeSeriesFromTable`](LookupTimeSeriesFromTable/LookupTimeSeriesFromTable)                           |Create a time series by looking up data values from a table.|Migrated||
|[`ManipulateTableString`](ManipulateTableString/ManipulateTableString)                                       |Manipulate a string in a table.  |Migrated||
|[`Message`](Message/Message)                                                                                 |Output a message to the log file.|Migrated||
|[`Multiply`](Multiply/Multiply)                                                                              |Multiply one time series by another.|Migrated||
|[`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS)                           |Create a new daily time series by distributing a monthly time series using a daily pattern.|Migrated||
|[`NewDerbyDatabase`](NewDerbyDatabase/NewDerbyDatabase)                                                      |                                 |**Command is under development**||
|[`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS)                              |Create a new end of month time series from daily time series.|Migrated||
|[`NewEnsemble`](NewEnsemble/NewEnsemble)                                                                     |Create a new time series ensemble.|Migrated||
|[`NewExcelWorkbook`](NewExcelWorkbook/NewExcelWorkbook)                                                      |Create a new Excel workbook file.|Migrated||
|[`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries)                                          |Create a new time series with repeating pattern for data values.|Migrated||
|[`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries)                     |Create a new time series with monthly statistics.|Migrated||
|[`NewStatisticEnsemble`](NewStatisticEnsemble/NewStatisticEnsemble)                                          |Create an ensemble of static time series.|Migrated||
|[`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries)                                    |Create a new time series having statistic repeated each year.|Migrated||
|[`NewStatisticTimeSeriesFromEnsemble`](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble)|                                 |Not yet migrated (placeholder)||
|[`NewStatisticYearTS`](NewStatisticYearTS/NewStatisticYearTS)                                                |Create a new time series of annual statistics.|Migrated||
|[`NewTable`](NewTable/NewTable)                                                                              |Create a new table.              |Migrated||
|[`NewTimeSeries`](NewTimeSeries/NewTimeSeries)                                                               |Create a new time series.        |Migrated||
|[`NewTreeView`](NewTreeView/NewTreeView)                                                                     |Create a tree view in the user interface.|Migrated||
|[`Normalize`](Normalize/Normalize)                                                                           |Create new time series by normalizing a time series.|Migrated||
|[`OpenCheckFile`](OpenCheckFile/OpenCheckFile)                                                               |                                 |Not yet migrated (placeholder)||
|[`OpenHydroBase`](OpenHydroBase/OpenHydroBase)                                                               |Open a HydroBase database connection.|Migrated||
|[`PrintTextFile`](PrintTextFile/PrintTextFile)                                                               |Print text file to a printer.    |Migrated||
|[`ProcessRasterGraph`](ProcessRasterGraph/ProcessRasterGraph)                                                |Process (create) time series raster graph.|Migrated||
|[`ProcessTSProduct`](ProcessTSProduct/ProcessTSProduct)                                                      |Process (create) time series data product.|Migrated||
|[`ProfileCommands`](ProfileCommands/ProfileCommands)                                                         |Create summary table with containing performance data|Migrated||
|[`ReadColoradoHydroBaseRest`](ReadColordoHydroBaseRest/ReadColoradoHydroBaseRest)                            |Read time series from [State of Colorado HydroBase REST web services](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest)|Migrated||
|[`ReadDateValue`](ReadDateValue/ReadDateValue)                                                               |Read time series from a [DateValue file](../datastore-ref/DateValue/DateValue).|Migrated||
|[`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml)                                                |Read time series from [Delft FEWS PI XML file](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML).|Migrated||
|[`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile)                                                   |Read time series from delimited file.|Migrated||
|[`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook)                                                   |Read Excel workbook file.        |Migrated||
|[`ReadHecDss`](ReadHecDss/ReadHecDss)                                                                        |Read time series from [HEC-DSS file](../datastore-ref/HEC-DSS/HEC-DSS)|Migrated||
|[`ReadHydroBase`](ReadHydroBase/ReadHydroBase)                                                               |Read time series from [State of Colorado HydroBase database](../datastore-ref/CO-HydroBase/CO-HydroBase)|Migrated||
|[`ReadMODSIM`](ReadMODSIM/ReadMODSIM)                                                                        |Read time series from [MODSIM model file](../datastore-ref/MODSIM/MODSIM).|Migrated||
|[`ReadNrcsAwdb`](ReadNrcsAwdb/ReadNrcsAwdb)                                                                  |Read time series from [NRCS AWDB web services](../datastore-ref/NRCS-AWDB/NRCS-AWDB)|Migrated||
|[`ReadNwsCard`](ReadNwsCard/ReadNwsCard)                                                                     |                                 |Not yet migrated (placeholder)||
|[`ReadNwsrfsTraceEnsemble`](ReadNwsrfsTraceEnsemble/ReadNwsrfsTraceEnsemble)                                 |                                 |Not yet migrated (placeholder)||
|[`ReadNwsrfsFS5files`](ReadNwsrfsFS5files/ReadNwsrfsFS5files)                                                |                                 |Not yet migrated (placeholder)||
|[`ReadPatternFile`](ReadPatternFile/ReadPatternFile)                                                         |Read time series used by [`ReadPattern`](ReadPattern/ReadPattern)|Migrated||
|[`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel)                                 |Read processor properties from Excel.|Migrated||
|[`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile)                                    |Read processor properties from a file.|Migrated||
|[`ReadRccAcis`](ReadRccAcis/ReadRccAcis)                                                                     |Read time series from [RCC ACIS web service](../datastore-ref/RCC-ACIS/RCC-ACIS).|Migrated||
|[`ReadReclamationHDB`](ReadReclamationHDB/ReadReclamationHDB)                                                |Read time series from [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB)|Migrated||
|[`ReadReclamationPisces`](ReadReclamationPisces/ReadReclamationPisces)                                       |Read time series from [Reclamation Pisces database](../datastore-ref/ReclamationPisces)|Migrated||
|[`ReadRiversideDB`](ReadRiversideDB/ReadRiversideDB)                                                         |                                 |Not yet migrated (placeholder)||
|[`ReadRiverWare`](ReadRiverWare/ReadRiverWare)                                                               |Read time series from [RiverWare file](../datastore-ref/RiverWare/RiverWare)|Migrated||
|[`ReadStateCU`](ReadStateCU/ReadStateCU)                                                                     |Read time series from a [StateCU file](../datastore-ref/StateCU/StateCU).|Migrated||
|[`ReadStateCUB`](ReadStateCUB/ReadStateCUB)                                                                  |Read time series from a [StateCU binary file](../datastore-ref/StateCUStateCUB).|Migrated||
|[`ReadStateMod`](ReadStateMod/ReadStateMod)                                                                  |Read time series from a [StateMod file](../datastore-ref/StateMod/StateMod).|Migrated|yes|
|[`ReadStateModB`](ReadStateModB/ReadStateModB)                                                               |Read time series from a [StateMod binary file](../datastore-ref/StateModB/StateModB).|Migrated||
|[`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel)                                 |Read table cells from Excel worksheet.|Migrated||
|[`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore)                                    |Read a table from a datastore.   |Migrated||
|[`ReadTableFromDBF`](ReadTableFromDBF/ReadTableFromDBF)                                                      |Read a table from a DBF file.    |Migrated||
|[`ReadTableFromDelimitedFile`](ReadTableFromDelimitedFile/ReadTableFromDelimitedFile)                        |Read a table from a delimited file.|Migrated||
|[`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel)                                                |Read a table from an Excel workbook file.|Migrated||
|[`ReadTableFromFixedFormatFile`](ReadTableFromFixedFormatFile/ReadTableFromFixedFormatFile)                  |Read a table from a fixed-format file.|Migrated||
|[`ReadTableFromJSON`](ReadTableFromJSON/ReadTableFromJSON)                                                   |Read a table from a JSON file.   |Migrated||
|[`ReadTableFromXML`](ReadTableFromXML/ReadTableFromXML)                                                      |Read a table from an XML file.   |Migrated||
|[`ReadTimeSeries`](ReadTimeSeries/ReadTimeSeries)                                                            |Read a single time series using TSID to determine data source.|Migrated||
|[`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore)                     |Read time series from a datastore.|Migrated||
|[`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList)                                                |Read time series from a list in a table.|Migrated||
|[`ReadUsgsNwisDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily)                                                   |Read daily value time series from [USGS NWIS Daily web services](../datastore-ref/USGS-NWIS-Daily/USGS-NWIS-Daily)|Migrated||
|[`ReadUsgsNwisGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater)                                 |Read groundwater time series from [USGS NWIS Groundwater web services](../datastore-ref/USGS-NWIS-Groundwater/USGS-NWIS-Groundwater)|Migrated||
|[`ReadUsgsNwisInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous)                           |Read instantaneous value time series from [USGS NWIS Instantaneous web services](../datastore-ref/USGS-NWIS-Instantaneous/USGS-NWIS-Instantaneous)|Migrated||
|[`ReadWaterML`](ReadWaterML/ReadWaterML)                                                                     |                                 |Not yet migrated (placeholder)||
|[`ReadWaterML2`](ReadWaterML2/ReadWaterML2)                                                                  |                                 |Not yet migrated (placeholder)||
|[`ReadWaterOneFlow`](ReadWaterOneFlow/ReadWaterOneFlow)                                                      |                                 |Not yet migrated (placeholder)||
|[`ReadUsgsNwisRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb)                                                         |Read time series from a [USGS NWS RDB file](../datastore-ref/USGS-NWIS-RDB/USGS-NWIS-RDB)|Migrated||
|[`RelativeDiff`](RelativeDiff/RelativeDiff)                                                                  |Create a new time series as relative difference of two time series.|Migrated||
|[`RemoveFile`](RemoveFile/RemoveFile)                                                                        |Remove a file.                   |Migrated||
|[`ReplaceValue`](ReplaceValue/ReplaceValue)                                                                  |Replace values in time series data.|Migrated||
|[`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData)                              |Resequence time series data values by year.|Migrated||
|[`RunCommands`](RunCommands/RunCommands)                                                                     |Run a TSTool command file.       |Migrated||
|[`RunDSSUTL`](RunDSSUTL/RunDSSUTL)                                                                           |Run HEC-DSS DSSUTL program.      |Migrated||
|[`RunningAverage`](RunningAverage/RunningAverage)                                                            |Replaced by [`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries)|NA||
|[`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries)                        |Create time series containing statistic from moving "running" sample.|Not yet migrated (placeholder)||
|[`RunProgram`](RunProgram/RunProgram)                                                                        |Run a program.                   |Migrated||
|[`RunPython`](RunPython/RunPython)                                                                           |Run a python program.            |Migrated||
|[`RunSql`](RunSql/RunSql)                                                                                    |Run an SQL statement on a datastore.|Migrated||
|[`Scale`](Scale/Scale)                                                                                       |Scale time series values.        |Migrated||
|[`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries)                                                      |Select output time series for processing.|Migrated||
|[`SendEmailMessage`](SendEmailMessage/SendEmailMessage)                                                      |Send an email message.           |Migrated||
|[`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod)                                             |Set global property to auto-extend time series to output period.|Migrated||
|[`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod)                                                      |Set the global period used to compute historical averages.|Migrated||
|[`SetConstant`](SetConstant/SetConstant)                                                                     |Set time series data values to a constant.|Migrated||
|[`SetConstantBefore`](SetConstantBefore/SetConstantBefore)                                                   |Replaced by [`SetConstant`](SetConstant/SetConstant)|NA||
|[`SetDataValue`](SetDataValue/SetDataValue)                                                                  |Set data values in time series.  |Migrated||
|[`SetDebugLevel`](SetDebugLevel/SetDebugLevel)                                                               |Set the debug level for logging. |Migrated||
|[`SetEnsembleProperty`](SetEnsembleProperty/SetEnsembleProperty)                                             |Set an ensemble property.        |Migrated||
|[`SetExcelCell`](SetExcelCell/SetExcelCell)                                                                  |Set data in an Excel cell.       |Migrated||
|[`SetExcelWorksheetViewProperties`](SetExcelWorksheetViewProperties/SetExcelWorksheetViewProperties)         |Set Excel worksheet view properties.|Migrated||
|[`SetFromTS`](SetFromTS/SetFromTS)                                                                           |Set time series data values from another time series.|Migrated||
|[`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero)                                                         |Set global property to ignore time series values <=0 in averages.|Migrated||
|[`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS)                                             |Set the global property to include missing time series in output.|Migrated||
|[`SetInputPeriod`](SetInputPeriod/SetInputPeriod)                                                            |Set the global processor input period.|Migrated||
|[`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod)                                                         |Set the global processor output period.|Migrated||
|[`SetOutputYearType`](SetOutputYearType/SetOutputYearType)                                                   |Set the global processor output year type. |Migrated||
|[`SetPatternFile`](SetPatternFile/SetPatternFile)                                                            |Replaced by [`ReadPatternFile`](ReadPatternFile/ReadPatternFile) command|NA||
|[`SetProperty`](SetProperty/SetProperty)                                                                     |Set processor property value.    |Migrated||
|[`SetPropertyFromNwsrfsAppDefault`](SetPropertyFromNwsrfsAppDefault/SetPropertyFromNwsrfsAppDefault)         |                                 |Not yet migrated (placeholder)||
|[`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble)                                 |Set processor property from ensemble.|Migrated||
|[`SetPropertyFromTable`](SetPropertyFromTable/SetPropertyFromTable)                                          |Set processor property from a table.|Migrated||
|[`SetPropertyFromTimeSeries`](SetPropertyFromTimeSeries/SetPropertyFromTimeSeries)                           |Set processor property from time series property.|Migrated||
|[`SetTableValues`](SetTableValues/SetTableValues)                                                            |Set values in a table.           |Migrated||
|[`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable)      |Set time series properties from table values.|Migrated||
|[`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty)                                       |Set a time series property.      |Migrated||
|[`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookupTable/SetTimeSeriesValuesFromLookupTable)|Set time series values from a lookup table.|Migrated||
|[`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable)                  |Set time series values from a table.|Migrated||
|[`SetToMax`](SetToMax/SetToMax)                                                                              |Set time series values to maximum of 1+ time series.|Migrated||
|[`SetToMin`](SetToMin/SetToMin)                                                                              |Set time series values to minimum of 1+ time series.|Migrated||
|[`SetWarningLevel`](SetWarningLevel/SetWarningLevel)                                                         |Set the warning level for logging.|Migrated||
|[`SetWorkingDir`](SetWorkingDir/SetWorkingDir)                                                               |Set the working directory (folder) for following commands.|Migrated||
|[`ShiftTimeByInterval`](ShiftTimeByInterval/ShiftTimeByInterval)                                             |Shift time series data values by a time interval.|Migrated||
|[`SortTable`](SortTable/SortTable)                                                                           |Sort table contents.             |Migrated||
|[`SortTimeSeries`](SortTimeSeries/SortTimeSeries)                                                            |Sort the output time series.     |Migrated||
|[`SplitTableColumn`](SplitTableColumn/SplitTableColumn)                                                      |Split a table column into multiple columns.|Migrated||
|[`SplitTableRow`](SplitTableRow/SplitTableRow)                                                               |Split a table row into multiple rows. |Migrated||
|[`StartLog`](StartLog/StartLog)                                                                              |(Re)start the log file.          |Migrated||
|[`StartRegressionTestResultsReport`](StartRegressionTestResults/ReportStartRegressionTestResultsReport)      |Start the regression test results report file to record output of tests.|Migrated ||
|[`StateModMax`](StateModMax/StateModMax)                                                                     |Create time series that are maximum of two [StateMod files](../datastore-ref/StateMod/StateMod).|Migrated||
|[`Subtract`](Subtract/Subtract)                                                                              |Subtract time series from time series.|Migrated||
|[`TableMath`](TableMath/TableMath)                                                                           |Perform simple math on table columns.|Migrated||
|[`TableTimeSeriesMath`](TableTimeSeriesMath/TableTimeSeriesMath)                                             |Perform simple math on a table and time series.|Migrated||
|[`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries)                                                   |Create time series from a table. |Migrated||
|[`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable)                                                   |Copy time series to a table.     |Migrated||
|[`TSID`](TSID/TSID)                                                                                          |Time series identifier (TSID), causes time series to be read. |Migrated||
|[`UnknownCommand`](UnknownCommand/UnknownCommand)                                                            |Unknown command.                 |Migrated||
|[`UnzipFile`](UnzipFile/UnzipFile)                                                                           |Unzip the contents of a zip file.|Migrated||
|[`VariableLagK`](VariableLagK/VariableLagK)                                                                  |Lag and attenuate flows.         |Migrated||
|[`Wait`](Wait/Wait)                                                                                          |Wait for at time before continuing.|Migrated||
|[`WebGet`](WebGet/WebGet)                                                                                    |Download a file from a URL.      |Migrated||
|[`WeightTraces`](WeightTraces/WeightTraces)                                                                  |Create time series as weighted sum of ensemble traces.|Migrated||
|[`WriteCheckFile`](WriteCheckFile/WriteCheckFile)                                                            |Write command log to file.       |Migrated||
|[`WriteCommandSummaryToFile`](WriteCommandSummaryToFile/WriteCommandSummaryToFile)                           |Write summary of command log to a file. | Migrated ||
|[`WriteDateValue`](WriteDateValue/WriteDateValue)                                                            |Write time series to [DateValue format file](../datastore-ref/DateValue/DateValue).|Migrated||
|[`WriteDelftFewsPiXml`](WriteDelftFewsPiXml/WriteDelftFewsPiXml)                                             |Write time series to a [Delft FEWS PI XML file](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML).|Migrated||
|[`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile)                                                |Write time series from delimited file.|Migrated||
|[`WriteHecDss`](WriteHecDss/WriteHecDss)                                                                     |Write time series to a [HEC-DSS file](../datastore-ref/HEC-DSS/HEC-DSS).|Migrated||
|[`WriteNwsCard`](WriteNwsCard/WriteNwsCard)                                                                  |                                 |Not yet migrated (placeholder)||
|[`WriteNWSRFSESPTraceEnsemble`](WriteNWSRFSESPTraceEnsemble/WriteNWSRFSESPTraceEnsemble)                     |                                 |Not yet migrated (placeholder)||
|[`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile)                                       |Write processor properties to a file.|Migrated||
|[`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB)                                             |Write time series to [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB)|Migrated||
|[`WriteRiversideDB`](WriteRiversideDB/WriteRiversideDB)                                                      |                                 |Not yet migrated (placeholder)||
|[`WriteRiverWare`](WriteRiverWare/WriteRiverWare)                                                            |Write time series to a [RiverWare file](../datastore-ref/RiverWare/RiverWare).|Migrated||
|[`WriteSHEF`](WriteSHEF/WriteSHEF)                                                                           |Write time series to [SHEF file](../datastore-ref/SHEF/SHEF).|Migrated||
|[`WriteStateCU`](WriteStateCU/WriteStateCU)                                                                  |Write time series to a [StateCU file](../datastore-ref/StateCU/StateCU).|Migrated||
|[`WriteStateMod`](WriteStateMod/WriteStateMod)                                                               |Write time series to a [StateMod file](../datastore-ref/StateMod/StateMod).|Migrated||
|[`WriteSummary`](WriteSummary/WriteSummary)                                                                  |Write time series to a summary report file.|Migrated||
|[`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel)                                    |Write table row cells to an Excel worksheet.|Migrated||
|[`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore)                                       |Write a table to a datastore.    |Migrated||
|[`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile)                           |Write a table to delimited file. |Migrated||
|[`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel)                                                   |Write a table to an Excel workbook file.|Migrated||
|[`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON)                                             |Write a table to a GeoJSON file.|Migrated||
|[`WriteTableToHTML`](WriteTableToHTML/lWriteTableToHTML)                                                     |Write a table to an HTML file.   |Migrated||
|[`WriteTableToKml`](WriteTableToKml/WriteTableToKml)                                                         |Write a table to a KML file.|Migrated||
|[`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile)                                       |Write a table to a shapefile.|Migrated||
|[`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile)         |Write time series properties to a file.|Migrated||
|[`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore)                        |Write time series to a datastore.|Migrated||
|[`WriteTimeSeriesToDataStream`](WriteTimeSeriesToDataStream/WriteTimeSeriesToDataStream)                     |Write time series to a stream of data lines.|Migrated||
|[`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel)                                    |Write time series to an Excel workbook.|Migrated||
|[`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock)                     |Write time series to an Excel workbook using block format.|Migrated||
|[`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON)                              |Write time series to a GeoJSON file.|Migrated||
|[`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON)                        |Write time series to a [HydroJSON file](../datastore-ref/HydroJSON/HydroJSON).|Migrated||
|[`WriteTimeSeriesToJson`](WriteTimeSeriesToJson/WriteTimeSeriesToJson)                                       |Write time series to a JSON file.|Migrated||
|[`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml)                                          |Write time esries to a KML file. |Migrated||
|[`WriteWaterML`](WriteWaterML/WriteWaterML)                                                                  |                                 |Not yet migrated (placeholder)||
|[`WriteWaterML2`](WriteWaterML2/WriteWaterML2)                                                               |                                 |Not yet migrated (placeholder)||
