# Learn TSTool / Command Reference / Overview #

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
* [Command List](#command-list) - alphabetical list of commands

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
(e.g., [`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries).

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
* [`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS)
* [`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS) - create a new end of month time series from daily time series
* [`Normalize`](Normalize/Normalize) - create a new time series by normalizing a time series
* [`RelativeDiff`](RelativeDiff/RelativeDiff) - create a new time series as relative difference of two time series
* [`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData) - resequence time series data values by year
* [`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries) - create a new time series having statistic repeated each year
* [`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries) - create a new time series with monthly statistics
* [`NewStatisticYearTS`](NewStatisticYearTS/NewStatisticYearTS)
* [`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries)

### Read Time Series ###

These commands read time series from various sources.

* [`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS) - set the global property to include missing time series in output
* [`SetInputPeriod`](SetInputPeriod/SetInputPeriod) - set the global processor input period
* [`CreateFromList`](CreateFromList/CreateFromList)
* [`ReadDateValue`](ReadDateValue/ReadDateValue)
* [`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml)
* [`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile) - read time series from delimited file
* [`ReadHecDss`](ReadHecDss/ReadHecDss)
* [`ReadHydroBase`](ReadHydroBase/ReadHydroBase)
* [`ReadMODSIM`](ReadMODSIM/ReadMODSIM)
* [`ReadNrcsAwdb`](ReadNrcsAwdb/ReadNrcsAwdb)
* [`ReadNwsCard`](ReadNwsCard/ReadNwsCard)
* [`ReadNwsrfsTraceEnsemble`](ReadNwsrfsTraceEnsemble/ReadNwsrfsTraceEnsemble)
* [`ReadNwsrfsFs5files`](ReadNwsrfsFs5files/ReadNwsrfsFs5files)
* [`ReadRccAcis`](ReadRccAcis/ReadRccAcis)
* [`ReadReclamationHDB`](ReadReclamationHDB/ReadReclamationHDB)
* [`ReadReclamationPisces`](ReadReclamationPisces/ReadReclamationPisces)
* [`ReadRiverWare`](ReadRiverWare/ReadRiverWare)
* [`ReadStateCU`](ReadStateCU/ReadStateCU)
* [`ReadStateCUB`](ReadStateCUB/ReadStateCUB)
* [`ReadStateMod`](ReadStateMod/ReadStateMod)
* [`ReadStateModB`](ReadStateMod/ReadStateModB)
* [`ReadTimeSeries`](ReadTimeSeries/ReadTimeSeries)
* [`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore) - read time series from a datastore
* [`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList)
* [`ReadUsgsDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily)
* [`ReadUsgsInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous)
* [`ReadUsgsGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater)
* [`ReadUsgsRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb)
* [`ReadWaterML`](ReadUsgsWaterML/ReadUsgsWaterML)
* [`StateModMax`](StateModMax/StateModMax)

### Fill Time Series Missing Data ###

These commands fill missing time series values.

* [`FillConstant`](FillConstant/FillConstant) - fill missing time series values with a constant
* [`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS)
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
* [`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments)
* [`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod) - set global property to auto-extend time series to output period
* [`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod) - set the global period used to compute historical averages
* [`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero) - set global property to ignore time series values <= 0 in averages

### Set Time Series Contents ###

These commands set time series contents, including properties and data values.

* [`ReplaceValue`](ReplaceValue/ReplaceValue) - replace values in time series data
* [`SetConstant`](SetConstant/SetConstant) - set time series data values to a constant
* [`SetDataValue`](SetDataValue/SetDataValue) - set data values in time series
* [`SetFromTS`](SetFromTS/SetFromTS) - set time series data values from another time series
* [`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookupTable/SetTimeSeriesValuesFromLookupTable)
* [`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable)
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

* [`LagK`](LagK/LagK)
* [`VariableLagK`](VariableLagK/VariableLagK)

### Output Time Series ###

These commands output time series to different formats.

* [`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod) - set the global processor output period
* [`SetOutputYearType`](SetOutputYearType/SetOutputYearType) - set the global processor output year type
* [`WriteDateValue`](WriteDateValue/WriteDateValue) - write time series to [DateValue format file](../datastore-ref/DateValue/DateValue)
* [`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile) - write time series to a delimited file
* [`WriteHECDSS`](WriteHECDSS/WriteHECDSS)
* [`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB)
* [`WriteRiverWare`](WriteRiverWare/WriteRiverWare)
* [`WriteStateCU`](WriteStateCU/WriteStateCU)
* [`WriteStateMod`](WriteStateMod/WriteStateMod)
* [`WriteSummary`](WriteSummary/WriteSummary)
* [`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore)
* [`WriteTimeSeriesToDataStream`](WriteTimeSeriesToDataStream/WriteTimeSeriesToDataStream) - write time series to a stream of data lines
* [`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON)
* [`WriteTimeSeriesToJSON`](WriteTimeSeriesToJSON/WriteTimeSeriesToJSON)
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

* [`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow)

### Spatial Processing ###

* [`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON)
* [`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile)
* [`WriteTableToKml`](WriteTableToKml/WriteTableToKml)
* [`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON)
* [`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml)

### Spreadsheet Processing ###

* [`NewExcelWorkbook`](NewExcelWorkbook/NewExcelWorkbook) - create a new Excel workbook file
* [`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook)
* [`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel) - read a table from an Excel workbook file
* [`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel)
* [`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel)
* [`SetExcelCell`](SetExcelCell/SetExcelCell)
* [`SetExcelWorksheetProperties`](SetExcelWorksheetProperties/SetExcelWorksheetProperties)
* [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel) - write a table to an Excel workbook file
* [`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel)
* [`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel)
* [`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock)
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

* [`Message`](Message/Message) - output a message to the log file
* [`SetDebugLevel`](SetDebugLevel/SetDebugLevel) - set the debug level for logging
* [`SetWarningLevel`](SetWarningLevel/SetWarningLevel) - set the warning level for logging
* [`StartLog`](StartLog/StartLog) - (re)start the log file
* [`SendEmailMessage`](SendEmailMessage/SendEmailMessage) - **need to write documentation**

### General - Running and Properties ###

These commands provide general capabilities to control running commands, including running programs external to TSTool,
handling processor properties (used with `${Property}`), and control commands such as [`For`](For/For) and [`If`](If/If).

* [`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile) - read processor properties from a file
* [`SetProperty`](SetProperty/SetProperty) - set a processor property value
* [`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble) - set a processor property from an ensemble
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
* [`CopyPropertiesToTable`](CopyPropertiesToTable/CopyPropertiesToTable) - **under development**

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

|**Command**                                                                                                  |**Description**                  |**Documentation Status**|
|-------------------------------------------------------------------------------------------------------------|---------------------------------|:----------------------:|
|[`#` comment](Comment/Comment)                                                                               |Single line comment.             |Migrated|
|[`\*` comment block start](CommentBlockStart/CommentBlockStart)                                              |Start of multi-line comment block.|Migrated|
|[`\*` comment block end](CommentBlockEnd/CommentBlockEnd)                                                    |End of multi-line comment block. |Migrated|
|[`Add`](Add/Add)                                                                                             |Add time series to time series.|Migrated|
|[`AddConstant`](AddConstant/AddConstant)                                                                     |Add a constant to time series values.|Migrated|
|[`AdjustExtremes`](AdjustExtremes/AdjustExtremes)                                                            |Adjust extreme values in time series.|Migrated|
|[`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow)                                 |                                 |Not yet migrated|
|[`AnalyzePattern`](AnalyzePattern/AnalyzePattern)                                                            |Analyze pattern of time series data.|Migrated|
|[`AppendFile`](AppendFile/AppendFile)                                                                        |Append a file to another file.   |Migrated|
|[`AppendTable`](AppendTable/AppendTable)                                                                     |Append a table to another table. |Migrated|
|[`ARMA`](ARMA/ARMA)                                                                                          |                                 |Not yet migrated|
|[`Blend`](Blend/Blend)                                                                                       |Blend one time series into another.|Migrated|
|[`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)                  |                                 |Not yet migrated|
|[`ChangeInterval`](ChangeInterval/ChangeInterval)                                                            |                                 |Not yet migrated|
|[`ChangePeriod`](ChangePeriod/ChangePeriod)                                                                  |Change time series data period.  |Migrated|
|[`ChangeTimeZone`](ChangeTimeZone/ChangeTimeZone)                                                            |Change the time zone for time series.|Migrated|
|[`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries)                                                         |Check time series values against criteria.|Migrated|
|[`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic)                              |Check time series statistic against criteria.|Migrated|
|[`CloseDataStore`](CloseDataStore/CloseDataStore)                                                            |Close an open datastore.         |Migrated|
|[`CloseExcelWorkbook`](CloseExcelWorkbook/CloseExcelWorkbook)                                                |Close Excel workbook that is open.|Migrated|
|[`CompareFiles`](CompareFiles/CompareFiles)                                                                  |Compare files to detect whether they are the same or different.|Migrated|
|[`CompareTables`](CompareTables/CompareTables)                                                               |Compare tables to detect whether they are the same or different.|Migrated|
|[`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries)                                                   |Compare time series to detect whether they are the same or different.|Migrated|
|[`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/CompauteErrorTimeSeries)                                   |Compute the error between two time series.|Migrated|
|[`ConvertDataUnits`](ConvertDataUnits/ConvertDataUnits)                                                      |Convert time series data units.  |Migrated|
|[`Copy`](Copy/Copy)                                                                                          |Copy a time series.              |Migrated|
|[`CopyEnsemble`](CopyEnsemble/CopyEnsemble)                                                                  |Copy an ensemble to a new ensemble.|Migrated|
|[`CopyFile`](CopyFile/CopyFile)                                                                              |Copy a file to another name.     |Migrated|
|[`CopyPropertiesToTable`](CopyPropertiesToTable/CopyPropertiesToTable)                                       |Copy processor properties to a table.|Migrated|
|[`CopyTable`](CopyTable/CopyTable)                                                                           |Copy a table to a new table.     |Migrated|
|[`CopyTimeSeriesPropertiesToTable`](CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable)         |Copy time series properties to a table.|Not yet migrated|
|[`CreateDataStoreDataDictionary`](CreateDataStoreDataDictionary/CreateDataStoreDataDictionary)               |Create a database data dictionary.|Migrated|
|[`CreateEnsembleFromOneTimeSeries`](CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries)         |Create an ensemble from a time series.|Migrated|
|[`CreateFromList`](CreateFromList/CreateFromList)                                                            |                                 |Not yet migrated|
|[`CreateNetworkFromTable`](CreateNetworkFromTable/CreateNetworkFromTable)                                    |                                 |Not yet migrated|
|[`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile)         |Create regression test suite command file.|Migrated|
|[`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable)                        |Create an event table associated with time series.|Migrated|
|[`CreateTraces`](CreateTraces/CreateTraces)                                                                  |                                 |Not yet migrated|
|[`Cumulate`](Cumulate/Cumulate)                                                                              |Set time series values to cumulative values.|Migrated|
|[`DeleteDataStoreTableRows`](DeleteDataStoreTableRows/DeleteDataStoreTableRows)                              |Delete datastore table rows.     |Migrated|
|[`DeleteTableColumns`](DeleteTableColumns/DeleteTableColumns)                                                |Delete columns from a table.     |Migrated|
|[`DeleteTableRows`](DeleteTableRows/DeleteTableRows)                                                         |Delete rows from a table.        |Migrated|
|[`Delta`](Delta/Delta)                                                                                       |Create a new time series from delta between time series values.|Migrated|
|[`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries)                                                |Deselect output time series for processing.|Migrated|
|[`Disaggregate`](Disaggregate/Disaggregate)                                                                  |Create a new time series by disaggregating a time series.|Migrated|
|[`Divide`](Divide/Divide)                                                                                    |Divide one time series by another.|Migrated|
|[`Empty`](Empty/Empty)                                                                                       |Empty (blank) commands line.     |Migrated|
|[`EndFor`](EndFor/EndFor)                                                                                    |End of For loop.                 |Migrated|
|[`EndIf`](EndIf/EndIf)                                                                                       |End of If loop.                  |Migrated|
|[`Exit`](Exit/Exit)                                                                                          |Stop processing commands.        |Migrated|
|[`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile)                                                |Expand template file into full file.|Migrated|
|[`FillCarryForward`](FillCarryForward/FillCarryForward)                                                      |                                 |Not yet migrated|
|[`FillConstant`](FillConstant/FillConstant)                                                                  |Fill missing time series values with a constant.|Migrated|
|[`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS)            |                                 |Not yet migrated|
|[`FillFromTS`](FillFromTS/FillFromTS)                                                                        |Fill missing time series values from another time series.|Migrated|
|[`FillHistMonthAverage`](FillHistMonthAverage/FillHistMonthAverage)                                          |Fill missing time series values with historical monthly average. |Migrated|
|[`FillHistYearAverage`](FillHistYearAverage/FillHistYearAverage)                                             |Fill missing time series values with historical yearly average.|Migrated|
|[`FillInterpolate`](FillInterpolate/FillInterpolate)                                                         |Fill missing time series values using interpolation. |Migrated|
|[`FillMixedStation`](FillMixedStation/FillMixedStation)                                                      |                                 |Not yet migrated|
|[`FillMOVE1`](FillMOVE1/FillMOVE1)                                                                           |                                 |Not yet migrated|
|[`FillMOVE2`](FillMOVE2/FillMOVE2)                                                                           |                                 |Not yet migrated|
|[`FillPattern`](FillPattern/FillPattern)                                                                     |Fill missing time series values using historical pattern average.|Migrated|
|[`FillPrincipalComponentAnalysis`](FillPrincipalComponentAnalysis/FillPrincipalComponentAnalysis)            |                                 |Not yet migrated|
|[`FillProrate`](FillProrate/FillProrate)                                                                     |Fill missing time series values by prorating another time series.|Migrated|
|[`FillRegression`](FillRegression/FillRegression)                                                            |                                 |Not yet migrated|
|[`FillRepeat`](FillRepeat/FillRepeat)                                                                        |Fill missing time series values by repeating values.|Migrated|
|[`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments)                        |                                 |Not yet migrated|
|[`For`](For/For)                                                                                             |Iterate over items in a loop.    |Migrated|
|[`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty)                                    |Format a date/time processor property.|Migrated|
|[`FormatStringProperty`](FormatStringProperty/FormatStringProperty)                                          |Format string processor property.|Migrated|
|[`FormatTableDateTime`](FormatTableDateTime/FormatTableDateTime)                                             |                                 |Not yet migrated|
|[`FormatTableString`](FormatTableString/FormatTableString)                                                   |Format a string in a table.      |Migrated|
|[`Free`](Free/Free)                                                                                          |Free memory used by time series. |Migrated|
|[`FreeTable`](FreeTable/FreeTable)                                                                           |Free memory resources for a table.|Migrated|
|[`FTPGet`](FTPGet/FTPGet)                                                                                    |Download a file from an FTP site.|Migrated|
|[`If`](If/If)                                                                                                |Test a condition to control logic flow.|Migrated|
|[`InsertTableColumn`](InsertTableColumn/InsertTableColumn)                                                   |Insert a column in a table.      |Migrated|
|[`InsertTableRow`](InsertTableRow/InsertTableRow)                                                            |Insert a row in a table.         |Migrated|
|[`InsertTimeSeriesIntoEnsemble`](InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble)                  |Insert a time series into an ensemble.|Migrated|
|[`JoinTables`](JoinTables/JoinTables)                                                                        |Join two tables.                 |Migrated|
|[`LagK`](LagK/LagK)                                                                                          |                                 |Not yet migrated|
|[`ListFiles`](ListFiles/ListFiles)                                                                           |List files in a folder.          |Migrated|
|[`LookupTimeSeriesFromTable`](LookupTimeSeriesFromTable/LookupTimeSeriesFromTable)                           |Create a time series by looking up data values from a table.|Migrated|
|[`ManipulateTableString`](ManipulateTableString/ManipulateTableString)                                       |Manipulate a string in a table.  |Migrated|
|[`Message`](Message/Message)                                                                                 |Output a message to the log file.|Migrated|
|[`Multiply`](Multiply/Multiply)                                                                              |Multiply one time series by another.|Migrated|
|[`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS)                           |                                 |Not yet migrated|
|[`NewDerbyDatabase`](NewDerbyDatabase/NewDerbyDatabase)                                                      |                                 |**Command is under development**|
|[`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS)                              |Create a new end of month time series from daily time series.|Migrated|
|[`NewEnsemble`](NewEnsemble/NewEnsemble)                                                                     |Create a new time series ensemble.|Migrated|
|[`NewExcelWorkbook`](NewExcelWorkbook/NewExcelWorkbook)                                                      |Create a new Excel workbook file.|Migrated|
|[`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries)                                          |Create a new time series with repeating pattern for data values.|Migrated|
|[`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries)                     |Create a new time series with monthly statistics.|Migrated|
|[`NewStatisticEnsemble`](NewStatisticEnsemble/NewStatisticEnsemble)                                          |Create an ensemble of static time series.|Migrated|
|[`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries)                                    |Create a new time series having statistic repeated each year.|Migrated|
|[`NewStatisticTimeSeriesFromEnsemble`](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble)|                                 |Not yet migrated|
|[`NewStatisticYearTS`](NewStatisticYearTS/NewStatisticYearTS)                                                |                                 |Not yet migrated|
|[`NewTable`](NewTable/NewTable)                                                                              |Create a new table.              |Migrated|
|[`NewTimeSeries`](NewTimeSeries/NewTimeSeries)                                                               |Create a new time series.        |Not yet migrated|
|[`NewTreeView`](NewTreeView/NewTreeView)                                                                     |Create a tree view in the user interface.|Migrated|
|[`Normalize`](Normalize/Normalize)                                                                           |Create new time series by normalizing a time series.|Migrated|
|[`OpenCheckFile`](OpenCheckFile/OpenCheckFile)                                                               |                                 |Not yet migrated|
|[`OpenHydroBase`](OpenHydroBase/OpenHydroBase)                                                               |                                 |Not yet migrated|
|[`OpenNDFD`](OpenNDFD/OpenNDFD)                                                                              |                                 |Not yet migrated|
|[`PrintTextFile`](PrintTextFile/PrintTextFile)                                                               |Print text file to a printer.    |Migrated|
|[`ProcessRasterGraph`](ProcessRasterGraph/ProcessRasterGraph)                                                |Process (create) time series raster graph.|Migrated|
|[`ProcessTSProduct`](ProcessTSProduct/ProcessTSProduct)                                                      |Process (create) time series data product.|Migrated|
|[`ProfileCommands`](ProfileCommands/ProfileCommands)                                                         |Create summary table with containing performance data|Migrated|
|[`ReadDateValue`](ReadDateValue/ReadDateValue)                                                               |                                 |Not yet migrated|
|[`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml)                                                |                                 |Not yet migrated|
|[`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile)                                                   |Read time series from delimited file.|Migrated|
|[`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook)                                                   |                                 |Not yet migrated|
|[`ReadHecDss`](ReadHecDss/ReadHecDss)                                                                        |                                 |Not yet migrated|
|[`ReadHydroBase`](ReadHydroBase/ReadHydroBase)                                                               |                                 |Not yet migrated|
|[`ReadMODSIM`](ReadMODSIM/ReadMODSIM)                                                                        |                                 |Not yet migrated|
|[`ReadNDFD`](ReadNDFD/ReadNDFD)                                                                              |                                 |Not yet migrated|
|[`ReadNrcsAwdb`](ReadNrcsAwdb/ReadNrcsAwdb)                                                                  |                                 |Not yet migrated|
|[`ReadNwsCard`](ReadNwsCard/ReadNwsCard)                                                                     |                                 |Not yet migrated|
|[`ReadNwsrfsTraceEnsemble`](ReadNwsrfsTraceEnsemble/ReadNwsrfsTraceEnsemble)                                 |                                 |Not yet migrated|
|[`ReadNwsrfsFs5files`](ReadNwsrfsFs5files/ReadNwsrfsFs5files)                                                |                                 |Not yet migrated|
|[`ReadPatternFile`](ReadPatternFile/ReadPatternFile)                                                         |Read time series used by [`ReadPattern`](ReadPattern/ReadPattern)|Migrated|
|[`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel)                                 |                                 |Not yet migrated|
|[`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile)                                    |Read processor properties from a file.|Migrated|
|[`ReadRccAcis`](ReadRccAcis/ReadRccAcis)                                                                     |                                 |Not yet migrated|
|[`ReadReclamationHDB`](ReadReclamationHDB/ReadReclamationHDB)                                                |                                 |Not yet migrated|
|[`ReadReclamationPisces`](ReadReclamationPisces/ReadReclamationPisces)                                       |                                 |Not yet migrated|
|[`ReadRiversideDB`](ReadRiversideDB/ReadRiversideDB)                                                         |                                 |Not yet migrated|
|[`ReadRiverWare`](ReadRiverWare/ReadRiverWare)                                                               |                                 |Not yet migrated|
|[`ReadStateCU`](ReadStateCU/ReadStateCU)                                                                     |                                 |Not yet migrated|
|[`ReadStateCUB`](ReadStateCUB/ReadStateCUB)                                                                  |                                 |Not yet migrated|
|[`ReadStateMod`](ReadStateMod/ReadStateMod)                                                                  |                                 |Not yet migrated|
|[`ReadStateModB`](ReadStateModB/ReadStateModB)                                                               |                                 |Not yet migrated|
|[`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel)                                 |                                 |Not yet migrated|
|[`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore)                                    |Read a table from a datastore.   |Migrated|
|[`ReadTableFromDBF`](ReadTableFromDBF/ReadTableFromDBF)                                                      |Read a table from a DBF file.    |Migrated|
|[`ReadTableFromDelimitedFile`](ReadTableFromDelimitedFile/ReadTableFromDelimitedFile)                        |Read a table from a delimited file.|Migrated|
|[`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel)                                                |Read a table from an Excel workbook file.|Migrated|
|[`ReadTableFromFixedFormatFile`](ReadTableFromFixedFormatFile/ReadTableFromFixedFormatFile)                  |Read a table from a fixed-format file.|Migrated|
|[`ReadTableFromJSON`](ReadTableFromJSON/ReadTableFromJSON)                                                   |Read a table from a JSON file.   |Migrated|
|[`ReadTableFromXML`](ReadTableFromXML/ReadTableFromXML)                                                      |Read a table from an XML file.   |Migrated|
|[`ReadTimeSeries`](ReadTimeSeries/ReadTimeSeries)                                                            |                                 |Not yet migrated|
|[`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore)                     |Read time series from a datastore.|Migrated|
|[`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList)                                                |                                 |Not yet migrated|
|[`ReadUsgsNwisDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily)                                                   |                                 |Not yet migrated|
|[`ReadUsgsNwisGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater)                                 |                                 |Not yet migrated|
|[`ReadUsgsNwisInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous)                           |                                 |Not yet migrated|
|[`ReadWaterML`](ReadWaterML/ReadWaterML)                                                                     |                                 |Not yet migrated|
|[`ReadWaterOneFlow`](ReadWaterOneFlow/ReadWaterOneFlow)                                                      |                                 |Not yet migrated|
|[`ReadUsgsNwisRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb)                                                         |                                 |Not yet migrated|
|[`RelativeDiff`](RelativeDiff/RelativeDiff)                                                                  |Create a new time series as relative difference of two time series.|Migrated|
|[`RemoveFile`](RemoveFile/RemoveFile)                                                                        |Remove a file.                   |Migrated|
|[`ReplaceValue`](ReplaceValue/ReplaceValue)                                                                  |Replace values in time series data.|Migrated|
|[`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData)                              |Resequence time series data values by year.|Migrated|
|[`RunCommands`](RunCommands/RunCommands)                                                                     |Run a TSTool command file.       |Migrated|
|[`RunDSSUTL`](RunDSSUTL/RunDSSUTL)                                                                           |Run HEC-DSS DSSUTL program.      |Migrated|
|[`RunningAverage`](RunningAverage/RunningAverage)                                                            |                                 |Not yet migrated|
|[`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries)                        |                                 |Not yet migrated|
|[`RunProgram`](RunProgram/RunProgram)                                                                        |Run a program.                   |Migrated|
|[`RunPython`](RunPython/RunPython)                                                                           |Run a python program.            |Migrated|
|[`RunSql`](RunSql/RunSql)                                                                                    |Run an SQL statement on a datastore.|Migrated|
|[`Scale`](Scale/Scale)                                                                                       |Scale time series values.        |Migrated|
|[`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries)                                                      |Select output time series for processing.|Migrated|
|[`SendEmailMessage`](SendEmailMessage/SendEmailMessage)                                                      |Send an email message.           |**Need to write documentation.**|
|[`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod)                                             |Set global property to auto-extend time series to output period.|Migrated|
|[`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod)                                                      |Set the global period used to compute historical averages.|Migrated|
|[`SetConstant`](SetConstant/SetConstant)                                                                     |Set time series data values to a constant.|Migrated|
|[`SetConstantBefore`](SetConstantBefore/SetConstantBefore)                                                   |                                 |Not yet migrated|
|[`SetDataValue`](SetDataValue/SetDataValue)                                                                  |Set data values in time series.  |Migrated|
|[`SetDebugLevel`](SetDebugLevel/SetDebugLevel)                                                               |Set the debug level for logging. |Migrated|
|[`SetEnsembleProperty`](SetEnsembleProperty/SetEnsembleProperty)                                             |Set an ensemble property.        |Migrated|
|[`SetExcelCell`](SetExcelCell/SetExcelCell)                                                                  |                                 |Not yet migrated|
|[`SetExcelWorksheetViewProperties`](SetExcelWorksheetViewProperties/SetExcelWorksheetViewProperties)         |                                 |Not yet migrated|
|[`SetFromTS`](SetFromTS/SetFromTS)                                                                           |Set time series data values from another time series.|Migrated|
|[`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero)                                                         |Set global property to ignore time series values <=0 in averages.|Migrated|
|[`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS)                                             |Set the global property to include missing time series in output.|Migrated|
|[`SetInputPeriod`](SetInputPeriod/SetInputPeriod)                                                            |Set the global processor input period.|Migrated|
|[`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod)                                                         |Set the global processor output period.|Migrated|
|[`SetOutputYearType`](SetOutputYearType/SetOutputYearType)                                                   |Set the global processor output year type. |Migrated|
|[`SetPatternFile`](SetPatternFile/SetPatternFile)                                                            |Replaced by [`ReadPatternFile`](ReadPatternFile/ReadPatternFile) command|NA|
|[`SetProperty`](SetProperty/SetProperty)                                                                     |Set processor property value.    |Migrated|
|[`SetPropertyFromNwsrfsAppDefault`](SetPropertyFromNwsrfsAppDefault/SetPropertyFromNwsrfsAppDefault)         |                                 |Not yet migrated|
|[`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble)                                 |Set processor property from ensemble.|Migrated|
|[`SetPropertyFromTable`](SetPropertyFromTable/SetPropertyFromTable)                                          |Set processor property from a table.|Migrated|
|[`SetPropertyFromTimeSeries`](SetPropertyFromTimeSeries/SetPropertyFromTimeSeries)                           |Set processor property from time series property.|Not yet migrated|
|[`SetTableValues`](SetTableValues/SetTableValues)                                                            |Set values in a table.           |Migrated|
|[`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable)      |Set time series properties from table values.|Migrated|
|[`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty)                                       |Set a time series property.      |Migrated|
|[`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookup/TableSetTimeSeriesValuesFromLookupTable)|                                 |Not yet migrated|
|[`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable)                  |                                 |Not yet migrated|
|[`SetToMax`](SetToMax/SetToMax)                                                                              |Set time series values to maximum of 1+ time series.|Migrated|
|[`SetToMin`](SetToMin/SetToMin)                                                                              |Set time series values to minimum of 1+ time series.|Mmigrated|
|[`SetWarningLevel`](SetWarningLevel/SetWarningLevel)                                                         |Set the warning level for logging.|Migrated|
|[`SetWorkingDir`](SetWorkingDir/SetWorkingDir)                                                               |Set the working directory (folder) for following commands.|Migrated|
|[`ShiftTimeByInterval`](ShiftTimeByInterval/ShiftTimeByInterval)                                             |Shift time series data values by a time interval.|Migrated|
|[`SortTable`](SortTable/SortTable)                                                                           |Sort table contents.             |Migrated|
|[`SortTimeSeries`](SortTimeSeries/SortTimeSeries)                                                            |Sort the output time series.     |Migrated|
|[`SplitTableColumn`](SplitTableColumn/SplitTableColumn)                                                      |Split a table column into multiple columns.|Migrated|
|[`SplitTableRow`](SplitTableRow/SplitTableRow)                                                               |Split a table row into multiple rows. |Migrated|
|[`StartLog`](StartLog/StartLog)                                                                              |(Re)start the log file.          |Migrated|
|[`StartRegressionTestResultsReport`](StartRegressionTestResults/ReportStartRegressionTestResultsReport)      |Start the regression test results report file to record output of tests.|Migrated |
|[`StateModMax`](StateModMax/StateModMax)                                                                     |                                 |Not yet migrated|
|[`Subtract`](Subtract/Subtract)                                                                              |Subtract time series from time series.|Migrated|
|[`TableMath`](TableMath/TableMath)                                                                           |Perform simple math on table columns.|Migrated|
|[`TableTimeSeriesMath`](TableTimeSeriesMath/TableTimeSeriesMath)                                             |Perform simple math on a table and time series.|Migrated|
|[`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries)                                                   |Create time series from a table. |Migrated|
|[`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable)                                                   |Copy time series to a table.     |Migrated|
|[`UnknownCommand`](UnknownCommand/UnknownCommand)                                                            |Unknown command.                 |Migrated|
|[`UnzipFile`](UnzipFile/UnzipFile)                                                                           |Unzip the contents of a zip file.|Migrated|
|[`VariableLagK`](VariableLagK/VariableLagK)                                                                  |                                 |Not yet migrated|
|[`Wait`](Wait/Wait)                                                                                          |Wait for at time before continuing.|Migrated|
|[`WebGet`](WebGet/WebGet)                                                                                    |Download a file from a URL.      |Migrated|
|[`WeightTraces`](WeightTraces/WeightTraces)                                                                  |Create time series as weighted sum of ensemble traces.|Migrated|
|[`WriteCheckFile`](WriteCheckFile/WriteCheckFile)                                                            |Write command log to file.       |Migrated|
|[`WriteCommandSummaryToFile`](WriteCommandSummaryToFile/WriteCommandSummaryToFile)                           |Write summary of command log to a file. | Migrated |
|[`WriteDateValue`](WriteDateValue/WriteDateValue)                                                            |Write time series to [DateValue format file](../datastore-ref/DateValue/DateValue).|Migrated|
|[`WriteDelftFewsPiXml`](WriteDelftFewsPiXml/WriteDelftFewsPiXml)                                             |                                 |Not yet migrated|
|[`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile)                                                |Write time series from delimited file.|Migrated|
|[`WriteHecDss`](WriteHecDss/WriteHecDss)                                                                     |                                 |Not yet migrated|
|[`WriteNwsCard`](WriteNwsCard/WriteNwsCard)                                                                  |                                 |Not yet migrated|
|[`WriteNWSRFSESPTraceEnsemble`](WriteNWSRFSESPTraceEnsemble/WriteNWSRFSESPTraceEnsemble)                     |                                 |Not yet migrated|
|[`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile)                                       |Write processor properties to a file.|Migrated|
|[`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB)                                             |                                 |Not yet migrated|
|[`WriteRiversideDB`](WriteRiversideDB/WriteRiversideDB)                                                      |                                 |Not yet migrated|
|[`WriteRiverWare`](WriteRiverWare/WriteRiverWare)                                                            |                                 |Not yet migrated|
|[`WriteSHEF`](WriteSHEF/WriteSHEF)                                                                           |                                 |Not yet migrated|
|[`WriteStateCU`](WriteStateCU/WriteStateCU)                                                                  |                                 |Not yet migrated|
|[`WriteStateMod`](WriteStateMod/WriteStateMod)                                                               |                                 |Not yet migrated|
|[`WriteSummary`](WriteSummary/WriteSummary)                                                                  |                                 |Not yet migrated|
|[`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel)                                    |                                 |Not yet migrated|
|[`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore)                                       |Write a table to a datastore.    |Migrated|
|[`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile)                           |Write a table to delimited file. |Migrated|
|[`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel)                                                   |Write a table to an Excel workbook file.|Migrated|
|[`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON)                                             |                                 |Not yet migrated|
|[`WriteTableToHTML`](WriteTableToHTML/lWriteTableToHTML)                                                     |Write a table to an HTML file.   |Migrated|
|[`WriteTableToKml`](WriteTableToKml/WriteTableToKml)                                                         |                                 |Not yet migrated|
|[`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile)                                       |                                 |Not yet migrated|
|[`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile)         |Write time series properties to a file.|Migrated|
|[`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore)                        |Write time series to a datastore.|Migrated|
|[`WriteTimeSeriesToDataStream`](WriteTimeSeriesToDataStream/WriteTimeSeriesToDataStream)                     |Write time series to a stream of data lines.|Migrated|
|[`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel)                                    |                                 |Not yet migrated|
|[`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock)                     |                                 |Not yet migrated|
|[`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON)                              |                                 |Not yet migrated|
|[`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON)                        |                                 |Not yet migrated|
|[`WriteTimeSeriesToJson`](WriteTimeSeriesToJson/WriteTimeSeriesToJson)                                       |                                 |Not yet migrated|
|[`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml)                                          |                                 |Not yet migrated|
|[`WriteWaterML`](WriteWaterML/WriteWaterML)                                                                  |                                 |Not yet migrated|
|[`WriteWaterML2`](WriteWaterML2/WriteWaterML2)                                                               |                                 |Not yet migrated|
