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
	+ [Select, Free, Sort Time Series](#select-free-sort-time-series)
	+ [Create Time Series](#create-time-series)
	+ [Read Time Series](#read-time-series)
	+ [Fill Time Series Missing Data](#fill-time-series-missing-data)
	+ [Set Time Series Contents](#set-time-series-contents)
	+ [Manipulate Time Series](#manipulate-time-series)
	+ [Analyze Time Series](#analyze-time-series)
	+ [Models - Routing](#models-routing)
	+ [Output Time Series](#output-time-series)
	+ [Check Time Series](#check-time-series)
* [Topic Area Commands](#topic-area-commands)
	+ [Datastore Processing](#datastore-processing)
	+ [Ensemble Processing](#ensemble-processing)
	+ [Network Processing](#network-processing)
	+ [Spatial Processing](#spatial-processing)
	+ [Spreadsheet Processing](#spreadsheet-processing)
	+ [Template Processing](#template-processing)
	+ [visualization Processing](#visualization-processing)
* [General Commands](#general-commands)
	+ [General - Comments](#general-comments)
	+ [General - File Handling](#general-file-handling)
	+ [General - Logging and Messaging](#general-logging-and-messaging)
	+ [General - Running and Properties](#general-running-and-properties)
	+ [General - Test Processingsaging](#general-test-processing)
* [Deprecated Commands](#deprecated-commands)
* [Table Commands](#table-commands)
	+ [Create, Copy, Free Table](#create-copy-free-table)
	+ [Read Table](#read-table)
	+ [Append, Join Tables](#append-join-tables)
	+ [Table, Time Series Processing](#table-time-series-processing)
	+ [Manipulate Tables](#manipulate-tables)
	+ [Analyze Table](#analyze-table)
	+ [Output Table](#output-table)
	+ [Running and Properties](#running-and-properties)
* [Plugin Commands](#plugin-commands)
* [Command List](#command-list)

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
Older commands assumed that only time series would be processed and have general names (e.g., `Copy`),
whereas newer commands recognize that other objects may be processed and have more specific names
(e.g., `SelectTimeSeries`).

### Select, Free, Sort Time Series ###

These commands select, free, and sort time series.

* [`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries)
* [`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries)
* [`Free`](Free/Free) - free memory used by time series
* [`SortTimeSeries`](SortTimeSeries/SortTimeSeries)

### Create Time Series ###

These commands create new time series from other time series or data values.

* [`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries)
* [`NewTimeSeries`](NewTimeSeries/NewTimeSeries)
* [`ChangeInterval`](ChangeInterval/ChangeInterval)
* [`Copy`](Copy/Copy) - copy a time series
* [`Delta`](Delta/Delta)
* [`Disaggregate`](Disaggregate/Disaggregate)
* [`LookupTimeSeriesFromTable`](LookupTimeSeriesFromTable/LookupTimeSeriesFromTable)
* [`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS)
* [`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS)
* [`Normalize`](Normalize/Normalize)
* [`RelativeDiff`](RelativeDiff/RelativeDiff)
* [`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData)
* [`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries)
* [`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries)
* [`NewStatisticYearTimeSeries`](NewStatisticYearTimeSeries/NewStatisticYearTimeSeries)
* [`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries)

### Read Time Series ###

These commands read time series from various sources.

* [`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS)
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
* [`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore)
* [`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList)
* [`ReadUsgsDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily)
* [`ReadUsgsInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous)
* [`ReadUsgsGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater)
* [`ReadUsgsRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb)
* [`ReadWaterML`](ReadUsgsWaterML/ReadUsgsWaterML)
* [`StateModMax`](StateModMax/StateModMax)

### Fill Time Series Missing Data ###

These commands fill missing time series values.

* [`FillConstant`](FillConstant/FillConstant)
* [`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS)
* [`FillFromTS`](FillFromTS/FillFromTS)
* [`FillHistMonthAverage`](FillHistMonthAverage/FillHistMonthAverage)
* [`FillHistYearAverage`](FillHistYearAverage/FillHistYearAverage)
* [`FillInterpolate`](FillInterpolate/FillInterpolate)
* [`FillMixedStation`](FillMixedStation/FillMixedStation)
* [`FillMOVE2`](FillMOVE2/FillMOVE2)
* [`FillPattern`](FillPattern/FillPattern)
	+ [`ReadPatternFile`](ReadPatternFile/ReadPatternFile)
* [`FillProrate`](FillProrate/FillProrate)
* [`FillRegression`](FillRegression/FillRegression)
* [`FillRepeat`](FillRepeat/FillRepeat)
* [`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments)
* [`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod)
* [`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod)
* [`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero)

### Set Time Series Contents ###

These commands set time series contents, including properties and data values.

* [`ReplaceValue`](ReplaceValue/ReplaceValue)
* [`SetConstant`](SetConstant/SetConstant)
* [`SetDataValue`](SetDataValue/SetDataValue)
* [`SetFromTS`](SetFromTS/SetFromTS)
* [`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookupTable/SetTimeSeriesValuesFromLookupTable)
* [`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable)
* [`SetToMax`](SetToMax/SetToMax)
* [`SetToMin`](SetToMin/SetToMin)
* [`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty) - set a time series property

### Manipulate Time Series ###

These commands perform basic time series manipulation.

* [`Add`](Add/Add)
* [`AddConstant`](AddConstant/AddConstant)
* [`AdjustExtremes`](AdjustExtremes/AdjustExtremes)
* [`ARMA`](ARMA/ARMA)
* [`Blend`](Blend/Blend)
* [`ChangePeriod`](ChangePeriod/ChangePeriod)
* [`ChangeTimeZone`](ChangeTimeZone/ChangeTimeZone)
* [`ConvertDataUnits`](ConvertDataUnits/ConvertDataUnits)
* [`Cumulate`](Cumulate/Cumulate)
* [`Divide`](Divide/ConvertDataUnits)
* [`Multiply`](Multiply/Multiply)
* [`Scale`](Scale/Scale)
* [`ShiftTimeByInterval`](ShiftTimeByInterval/ShiftTimeByInterval)
* [`Subtract`](Subtract/Subtract)

### Analyze Time Series ###

These commands analyze time series.

* [`AnalyzePattern`](AnalyzePattern/AnalyzePattern)
* [`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)
* [`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries) - compare time series to detect whether they are the same or different
* [`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/ComputeErrorTimeSeries)

### Models - Routing ###

These commands route flow time series from one location to another.

* [`LagK`](LagK/LagK)
* [`VariableLagK`](VariableLagK/VariableLagK)

### Output Time Series ###

These commands output time series to different formats.

* [`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod) - set the global processor output period
* [`SetOutputYearType`](SetOutputYearType/SetOutputYearType) - set the global processor output year type
* [`WriteDateValue`](WriteDateValue/WriteDateValue)
* [`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile) - write time series to a delimited file
* [`WriteHECDSS`](WriteHECDSS/WriteHECDSS)
* [`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB)
* [`WriteRiverWare`](WriteRiverWare/WriteRiverWare)
* [`WriteStateCU`](WriteStateCU/WriteStateCU)
* [`WriteStateMod`](WriteStateMod/WriteStateMod)
* [`WriteSummary`](WriteSummary/WriteSummary)
* [`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore)
* [`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON)
* [`WriteTimeSeriesToJSON`](WriteTimeSeriesToJSON/WriteTimeSeriesToJSON)
* [`WriteTimeSeriesToWaterML`](WriteTimeSeriesToWaterML/WriteTimeSeriesToWaterML)
* [`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile) - write time series properties to a file

### Check Time Series ###

These commands are used to check time series, for example for quality control.

* [`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries)
* [`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic)
* [`WriteCheckFile`](WriteCheckFile/WriteCheckFile)

## Topic Area Commands ##

The following commands are grouped into specific topic areas.

### Datastore Processing ###

These commands handle reading and writing time series and other data from datastores, in particular databases.
Utility commands for executing SQL and creating a data dictionary are also provided.

* [`NewDerbyDatabase`](NewDerbyDatabase/NewDerbyDatabase)
* [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore) - read a table from a datastore
* [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore)
* [`RunSql`](RunSql/RunSql)
* [`DeleteDataStoreTableRows`](DeleteDataStoreTableRows/DeleteDataStoreTableRows)
* [`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore)
* [`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore)
* [`CloseDataStore`](CloseDataStore/CloseDataStore)
* [`CreateDataStoreDataDictionary`](CreateDataStoreDataDictionary/CreateDataStoreDataDictionary)

### Ensemble Processing ###

* [`CreateEnsembleFromOneTimeSeries`](CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries)
* [`CopyEnsemble`](CopyEnsemble/CopyEnsemble)
* [`NewEnsemble`](NewEnsemble/NewEnsemble)
* [`InsertTimeSeriesIntoEnsemble`](InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble)
* [`SetEnsembleProperty`](SetEnsembleProperty/SetEnsembleProperty)
* [`NewStatisticEnsemble`](NewStatisticEnsemble/NewStatisticEnsemble)
* [`NewStatisticTimeSeriesFromEnsemble`](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble)
* [`WeightTraces`](WeightTraces/WeightTraces)

### Network Processing ###

* [`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow)

### Spatial Processing ###

* [`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON)
* [`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile)
* [`WriteTableToKml`](WriteTableToKml/WriteTableToKml)
* [`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON)
* [`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml)

### Spreadsheet Processing ###

* [`NewExceWorkbook`](NewExceWorkbook/NewExceWorkbook)
* [`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook)
* [`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel)
* [`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel)
* [`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel)
* [`SetExcelCell`](SetExcelCell/SetExcelCell)
* [`SetExcelWorksheetProperties`](SetExcelWorksheetProperties/SetExcelWorksheetProperties)
* [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel)
* [`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel)
* [`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel)
* [`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock)
* [`CloseExcelWorkbook`](CloseExcelWorkbook/CloseExcelWorkbook)

### Template Processing ###

* [`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile)

### Visualization Processing ###

* [`ProcessTSProduct`](ProcessTSProduct/ProcessTSProduct)
* [`ProcessRasterGraph`](ProcessRasterGraph/ProcessRasterGraph)
* [`NewTreeView`](NewTreeView/NewTreeView)

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

* [`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable)
* [`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries)
* [`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable)
* [`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable)
* [`CopyTimeSeriesPropertiesToTable`](CopoyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable) - copy time series properties to table

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
* [`SplitTableRow`](SplitTableRow/SplitTableRow)

### Analyze Table ###

These commands analyze tables.

* [`CompareTables`](CompareTables/CompareTables) - compare tables to detect whether they are the same or different

### Output Table ###

These commands write tables to various formats.

* [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore) - write a table to a datastore
* [`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile) - write a table to a delimited file
* [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel)
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
|[`Add`](Add/Add)                                                                                             |                                 |Not yet Migrated|
|[`AddConstant`](AddConstant/AddConstant)                                                                     |                                 |Not yet Migrated|
|[`AdjustExtremes`](AdjustExtremes/AdjustExtremes)                                                            |                                 |Not yet Migrated|
|[`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow)                                 |                                 |Not yet Migrated|
|[`AnalyzePattern`](AnalyzePattern/AnalyzePattern)                                                            |                                 |Not yet Migrated|
|[`AppendFile`](AppendFile/AppendFile)                                                                        |Append a file to another file.   |Migrated|
|[`AppendTable`](AppendTable/AppendTable)                                                                     |Append a table to another table. |Migrated|
|[`ARMA`](ARMA/ARMA)                                                                                          |                                 |Not yet Migrated|
|[`Blend`](Blend/Blend)                                                                                       |                                 |Not yet Migrated|
|[`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)                  |                                 |Not yet Migrated|
|[`ChangeInterval`](ChangeInterval/ChangeInterval)                                                            |                                 |Not yet Migrated|
|[`ChangePeriod`](ChangePeriod/ChangePeriod)                                                                  |                                 |Not yet Migrated|
|[`ChangeTimeZone`](ChangeTimeZone/ChangeTimeZone)                                                            |                                 |Not yet Migrated|
|[`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries)                                                         |                                 |Not yet Migrated|
|[`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic)                              |                                 |Not yet Migrated|
|[`CloseDataStore`](CloseDataStore/CloseDataStore)                                                            |                                 |Not yet Migrated|
|[`CloseExcelWorkbook`](CloseExcelWorkbook/CloseExcelWorkbook)                                                |                                 |Not yet Migrated|
|[`CompareFiles`](CompareFiles/CompareFiles)                                                                  |Compare files to detect whether they are the same or different.|Migrated|
|[`CompareTables`](CompareTables/CompareTables)                                                               |Compare tables to detect whether they are the same or different.|Migrated|
|[`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries)                                                   |Compare time series to detect whether they are the same or different.|Migrated|
|[`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/CompauteErrorTimeSeries)                                   |                                 |Not yet Migrated|
|[`ConvertDataUnits`](ConvertDataUnits/ConvertDataUnits)                                                      |                                 |Not yet Migrated|
|[`Copy`](Copy/Copy)                                                                                          |Copy a time series.              |Migrated|
|[`CopyEnsemble`](CopyEnsemble/CopyEnsemble)                                                                  |                                 |Not yet Migrated|
|[`CopyFile`](CopyFile/CopyFile)                                                                              |Copy a file to another name.     |Migrated|
|[`CopyPropertiesToTable`](CopyPropertiesToTable/CopyPropertiesToTable)                                       |Copy processor properties to a table.|Migrated|
|[`CopyTable`](CopyTable/CopyTable)                                                                           |Copy a table to a new table.     |Migrated|
|[`CopyTimeSeriesPropertiesToTable`](CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable)         |Copy time series properties to a table.|Not yet Migrated|
|[`CreateDataStoreDataDictionary`](CreateDataStoreDataDictionary/CreateDataStoreDataDictionary)               |                                 |Not yet Migrated|
|[`CreateEnsembleFromOneTimeSeries`](CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries)         |                                 |Not yet Migrated|
|[`CreateFromList`](CreateFromList/CreateFromList)                                                            |                                 |Not yet Migrated|
|[`CreateNetworkFromTable`](CreateNetworkFromTable/CreateNetworkFromTable)                                    |                                 |Not yet Migrated|
|[`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile)         |Create regression test suite command file.|Migrated|
|[`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable)                        |                                 |Not yet Migrated|
|[`CreateTraces`](CreateTraces/CreateTraces)                                                                  |                                 |Not yet Migrated|
|[`Cumulate`](Cumulate/Cumulate)                                                                              |                                 |Not yet Migrated|
|[`DeleteDataStoreTableRows`](DeleteDataStoreTableRows/DeleteDataStoreTableRows)                              |                                 |Not yet Migrated|
|[`DeleteTableColumns`](DeleteTableColumns/DeleteTableColumns)                                                |Delete columns from a table.     |Migrated|
|[`DeleteTableRows`](DeleteTableRows/DeleteTableRows)                                                         |Delete rows from a table.        |Migrated|
|[`Delta`](Delta/Delta)                                                                                       |                                 |Not yet Migrated|
|[`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries)                                                |                                 |Not yet Migrated|
|[`Disaggregate`](Disaggregate/Disaggregate)                                                                  |                                 |Not yet Migrated|
|[`Divide`](Divide/Divide)                                                                                    |                                 |Not yet Migrated|
|[`Empty`](Empty/Empty)                                                                                       |Empty (blank) commands line.     |Migrated|
|[`EndFor`](EndFor/EndFor)                                                                                    |End of For loop.                 |Migrated|
|[`EndIf`](EndIf/EndIf)                                                                                       |End of If loop.                  |Migrated|
|[`Exit`](Exit/Exit)                                                                                          |Stop processing commands.        |Migrated|
|[`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile)                                                |                                 |Not yet Migrated|
|[`FillCarryForward`](FillCarryForward/FillCarryForward)                                                      |                                 |Not yet Migrated|
|[`FillConstant`](FillConstant/FillConstant)                                                                  |                                 |Not yet Migrated|
|[`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS)            |                                 |Not yet Migrated|
|[`FillFromTS`](FillFromTS/FillFromTS)                                                                        |                                 |Not yet Migrated|
|[`FillHistMonthAverage`](FillHistMonthAverage/FillHistMonthAverage)                                          |                                 |Not yet Migrated|
|[`FillHistYearAverage`](FillHistYearAverage/FillHistYearAverage)                                             |                                 |Not yet Migrated|
|[`FillInterpolate`](FillInterpolate/FillInterpolate)                                                         |                                 |Not yet Migrated|
|[`FillMixedStation`](FillMixedStation/FillMixedStation)                                                      |                                 |Not yet Migrated|
|[`FillMOVE1`](FillMOVE1/FillMOVE1)                                                                           |                                 |Not yet Migrated|
|[`FillMOVE2`](FillMOVE2/FillMOVE2)                                                                           |                                 |Not yet Migrated|
|[`FillPattern`](FillPattern/FillPattern)                                                                     |                                 |Not yet Migrated|
|[`FillPrincipalComponentAnalysis`](FillPrincipalComponentAnalysis/FillPrincipalComponentAnalysis)            |                                 |Not yet Migrated|
|[`FillProrate`](FillProrate/FillProrate)                                                                     |                                 |Not yet Migrated|
|[`FillRegression`](FillRegression/FillRegression)                                                            |                                 |Not yet Migrated|
|[`FillRepeat`](FillRepeat/FillRepeat)                                                                        |                                 |Not yet Migrated|
|[`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments)                        |                                 |Not yet Migrated|
|[`For`](For/For)                                                                                             |Iterate over items in a loop.    |Migrated|
|[`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty)                                    |Format a date/time processor property.|Migrated|
|[`FormatStringProperty`](FormatStringProperty/FormatStringProperty)                                          |Format string processor property.|Migrated|
|[`FormatTableDateTime`](FormatTableDateTime/FormatTableDateTime)                                             |                                 |Not yet Migrated|
|[`FormatTableString`](FormatTableString/FormatTableString)                                                   |Format a string in a table.      |Migrated|
|[`Free`](Free/Free)                                                                                          |Free memory used by time series. |Migrated|
|[`FreeTable`](FreeTable/FreeTable)                                                                           |Free memory resources for a table.|Migrated|
|[`FTPGet`](FTPGet/FTPGet)                                                                                    |Download a file from an FTP site.|Migrated|
|[`If`](If/If)                                                                                                |Test a condition to control logic flow.|Migrated|
|[`InsertTableColumn`](InsertTableColumn/InsertTableColumn)                                                   |Insert a column in a table.      |Migrated|
|[`InsertTableRow`](InsertTableRow/InsertTableRow)                                                            |Insert a row in a table.         |Migrated|
|[`InsertTimeSeriesIntoEnsemble`](InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble)                  |                                 |Not yet Migrated|
|[`JoinTables`](JoinTables/JoinTables)                                                                        |Join two tables.                 |Migrated|
|[`LagK`](LagK/LagK)                                                                                          |                                 |Not yet Migrated|
|[`ListFiles`](ListFiles/ListFiles)                                                                           |List files in a folder.          |Migrated|
|[`LookupTimeSeriesFromTable`](LookupTimeSeriesFromTable/LookupTimeSeriesFromTable)                           |                                 |Not yet Migrated|
|[`ManipulateTableString`](ManipulateTableString/ManipulateTableString)                                       |Manipulate a string in a table.  |Migrated|
|[`Message`](Message/Message)                                                                                 |Output a message to the log file.|Migrated|
|[`Multiply`](Multiply/Multiply)                                                                              |                                 |Not yet Migrated|
|[`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS)                           |                                 |Not yet Migrated|
|[`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS)                              |                                 |Not yet Migrated|
|[`NewEnsemble`](NewEnsemble/NewEnsemble)                                                                     |                                 |Not yet Migrated|
|[`NewExcelWorkbook`](NewExcelWorkbook/NewExcelWorkbook)                                                      |                                 |Not yet Migrated|
|[`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries)                                          |                                 |Not yet Migrated|
|[`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries)                     |                                 |Not yet Migrated|
|[`NewStatisticEnsemble`](NewStatisticEnsemble/NewStatisticEnsemble)                                          |                                 |Not yet Migrated|
|[`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries)                                    |                                 |Not yet Migrated|
|[`NewStatisticTimeSeriesFromEnsemble`](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble)|                                 |Not yet Migrated|
|[`NewStatisticYearTS`](NewStatisticYearTS/NewStatisticYearTS)                                                |                                 |Not yet Migrated|
|[`NewTable`](NewTable/NewTable)                                                                              |Create a new table.              |Migrated|
|[`NewTimeSeries`](NewTimeSeries/NewTimeSeries)                                                               |                                 |Not yet Migrated|
|[`NewTreeView`](NewTreeView/NewTreeView)                                                                     |                                 |Not yet Migrated|
|[`Normalize`](Normalize/Normalize)                                                                           |                                 |Not yet Migrated|
|[`OpenCheckFile`](OpenCheckFile/OpenCheckFile)                                                               |                                 |Not yet Migrated|
|[`OpenHydroBase`](OpenHydroBase/OpenHydroBase)                                                               |                                 |Not yet Migrated|
|[`OpenNDFD`](OpenNDFD/OpenNDFD)                                                                              |                                 |Not yet Migrated|
|[`PrintTextFile`](PrintTextFile/PrintTextFile)                                                               |Print text file to a printer.    |Migrated|
|[`ProcessRasterGraph`](ProcessRasterGraph/ProcessRasterGraph)                                                |                                 |Not yet Migrated|
|[`ProcessTSProduct`](ProcessTSProduct/ProcessTSProduct)                                                      |                                 |Not yet Migrated|
|[`ProfileCommands`](ProfileCommands/ProfileCommands)                                                         |Create summary table with containing performance data|Migrated|
|[`ReadDateValue`](ReadDateValue/ReadDateValue)                                                               |                                 |Not yet Migrated|
|[`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml)                                                |                                 |Not yet Migrated|
|[`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile)                                                   |Read time series from delimited file.|Migrated|
|[`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook)                                                   |                                 |Not yet Migrated|
|[`ReadHecDss`](ReadHecDss/ReadHecDss)                                                                        |                                 |Not yet Migrated|
|[`ReadHydroBase`](ReadHydroBase/ReadHydroBase)                                                               |                                 |Not yet Migrated|
|[`ReadMODSIM`](ReadMODSIM/ReadMODSIM)                                                                        |                                 |Not yet Migrated|
|[`ReadNDFD`](ReadNDFD/ReadNDFD)                                                                              |                                 |Not yet Migrated|
|[`ReadNrcsAwdb`](ReadNrcsAwdb/ReadNrcsAwdb)                                                                  |                                 |Not yet Migrated|
|[`ReadNwsCard`](ReadNwsCard/ReadNwsCard)                                                                     |                                 |Not yet Migrated|
|[`ReadNwsrfsTraceEnsemble`](ReadNwsrfsTraceEnsemble/ReadNwsrfsTraceEnsemble)                                 |                                 |Not yet Migrated|
|[`ReadNwsrfsFs5files`](ReadNwsrfsFs5files/ReadNwsrfsFs5files)                                                |                                 |Not yet Migrated|
|[`ReadPatternFile`](ReadPatternFile/ReadPatternFile)                                                         |                                 |Not yet Migrated|
|[`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel)                                 |                                 |Not yet Migrated|
|[`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile)                                    |Read processor properties from a file.|Migrated|
|[`ReadRccAcis`](ReadRccAcis/ReadRccAcis)                                                                     |                                 |Not yet Migrated|
|[`ReadReclamationHDB`](ReadReclamationHDB/ReadReclamationHDB)                                                |                                 |Not yet Migrated|
|[`ReadReclamationPisces`](ReadReclamationPisces/ReadReclamationPisces)                                       |                                 |Not yet Migrated|
|[`ReadRiversideDB`](ReadRiversideDB/ReadRiversideDB)                                                         |                                 |Not yet Migrated|
|[`ReadRiverWare`](ReadRiverWare/ReadRiverWare)                                                               |                                 |Not yet Migrated|
|[`ReadStateCU`](ReadStateCU/ReadStateCU)                                                                     |                                 |Not yet Migrated|
|[`ReadStateCUB`](ReadStateCUB/ReadStateCUB)                                                                  |                                 |Not yet Migrated|
|[`ReadStateMod`](ReadStateMod/ReadStateMod)                                                                  |                                 |Not yet Migrated|
|[`ReadStateModB`](ReadStateModB/ReadStateModB)                                                               |                                 |Not yet Migrated|
|[`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel)                                 |                                 |Not yet Migrated|
|[`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore)                                    |Read a table from a datastore.   |Migrated|
|[`ReadTableFromDBF`](ReadTableFromDBF/ReadTableFromDBF)                                                      |Read a table from a DBF file.    |Migrated|
|[`ReadTableFromDelimitedFile`](ReadTableFromDelimitedFile/ReadTableFromDelimitedFile)                        |Read a table from a delimited file.|Migrated|
|[`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel)                                                |Read a table from an Excel workbook file.|Migrated|
|[`ReadTableFromFixedFormatFile`](ReadTableFromFixedFormatFile/ReadTableFromFixedFormatFile)                  |Read a table from a fixed-format file.|Migrated|
|[`ReadTableFromJSON`](ReadTableFromJSON/ReadTableFromJSON)                                                   |Read a table from a JSON file.   |Migrated|
|[`ReadTableFromXML`](ReadTableFromXML/ReadTableFromXML)                                                      |Read a table from an XML file.   |Migrated|
|[`ReadTimeSeries`](ReadTimeSeries/ReadTimeSeries)                                                            |                                 |Not yet Migrated|
|[`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore)                     |                                 |Not yet Migrated|
|[`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList)                                                |                                 |Not yet Migrated|
|[`ReadUsgsNwisDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily)                                                   |                                 |Not yet Migrated|
|[`ReadUsgsNwisGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater)                                 |                                 |Not yet Migrated|
|[`ReadUsgsNwisInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous)                           |                                 |Not yet Migrated|
|[`ReadWaterML`](ReadWaterML/ReadWaterML)                                                                     |                                 |Not yet Migrated|
|[`ReadWaterOneFlow`](ReadWaterOneFlow/ReadWaterOneFlow)                                                      |                                 |Not yet Migrated|
|[`ReadUsgsNwisRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb)                                                         |                                 |Not yet Migrated|
|[`RelativeDiff`](RelativeDiff/RelativeDiff)                                                                  |                                 |Not yet Migrated|
|[`RemoveFile`](RemoveFile/RemoveFile)                                                                        |Remove a file.                   |Migrated|
|[`ReplaceValue`](ReplaceValue/ReplaceValue)                                                                  |                                 |Not yet Migrated|
|[`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData)                              |                                 |Not yet Migrated|
|[`RunCommands`](RunCommands/RunCommands)                                                                     |Run a TSTool command file.       |Migrated|
|[`RunDSSUTL`](RunDSSUTL/RunDSSUTL)                                                                           |Run HEC-DSS DSSUTL program.      |Migrated|
|[`RunningAverage`](RunningAverage/RunningAverage)                                                            |                                 |Not yet Migrated|
|[`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries)                        |                                 |Not yet Migrated|
|[`RunProgram`](RunProgram/RunProgram)                                                                        |Run a program.                   |Migrated|
|[`RunPython`](RunPython/RunPython)                                                                           |Run a python program.            |Migrated|
|[`RunSql`](RunSql/RunSql)                                                                                    |                                 |Not yet Migrated|
|[`Scale`](Scale/Scale)                                                                                       |                                 |Not yet Migrated|
|[`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries)                                                      |                                 |Not yet Migrated|
|[`SendEmailMessage`](SendEmailMessage/SendEmailMessage)                                                      |Send an email message.           |**Need to write documentation.**|
|[`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod)                                             |                                 |Not yet Migrated|
|[`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod)                                                      |                                 |Not yet Migrated|
|[`SetConstant`](SetConstant/SetConstant)                                                                     |                                 |Not yet Migrated|
|[`SetConstantBefore`](SetConstantBefore/SetConstantBefore)                                                   |                                 |Not yet Migrated|
|[`SetDataValue`](SetDataValue/SetDataValue)                                                                  |                                 |Not yet Migrated|
|[`SetDebugLevel`](SetDebugLevel/SetDebugLevel)                                                               |Set the debug level for logging. |Migrated|
|[`SetEnsembleProperty`](SetEnsembleProperty/SetEnsembleProperty)                                             |                                 |Not yet Migrated|
|[`SetExcelCell`](SetExcelCell/SetExcelCell)                                                                  |                                 |Not yet Migrated|
|[`SetExcelWorksheetViewProperties`](SetExcelWorksheetViewProperties/SetExcelWorksheetViewProperties)         |                                 |Not yet Migrated|
|[`SetFromTS`](SetFromTS/SetFromTS)                                                                           |                                 |Not yet Migrated|
|[`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero)                                                         |                                 |Not yet Migrated|
|[`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS)                                             |                                 |Not yet Migrated|
|[`SetInputPeriod`](SetInputPeriod/SetInputPeriod)                                                            |Set the global processor input period.|Migrated|
|[`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod)                                                         |Set the global processor output period.|Migrated|
|[`SetOutputYearType`](SetOutputYearType/SetOutputYearType)                                                   |Set the global processor output year type. |Migrated|
|[`SetPatternFile`](SetPatternFile/SetPatternFile)                                                            |                                 |Not yet Migrated|
|[`SetProperty`](SetProperty/SetProperty)                                                                     |Set processor property value.    |Migrated|
|[`SetPropertyFromNwsrfsAppDefault`](SetPropertyFromNwsrfsAppDefault/SetPropertyFromNwsrfsAppDefault)         |                                 |Not yet Migrated|
|[`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble)                                 |Set processor property from ensemble.|Migrated|
|[`SetPropertyFromTable`](SetPropertyFromTable/SetPropertyFromTable)                                          |Set processor property from a table.|Migrated|
|[`SetPropertyFromTimeSeries`](SetPropertyFromTimeSeries/SetPropertyFromTimeSeries)                           |Set processor property from time series property.|Not yet Migrated|
|[`SetTableValues`](SetTableValues/SetTableValues)                                                            |Set values in a table.           |Migrated|
|[`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable)      |                                 |Not yet Migrated|
|[`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty)                                       |Set a time series property.      |Migrated|
|[`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookup/TableSetTimeSeriesValuesFromLookupTable)|                                 |Not yet Migrated|
|[`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable)                  |                                 |Not yet Migrated|
|[`SetToMax`](SetToMax/SetToMax)                                                                              |                                 |Not yet Migrated|
|[`SetToMin`](SetToMin/SetToMin)                                                                              |                                 |Not yet Migrated|
|[`SetWarningLevel`](SetWarningLevel/SetWarningLevel)                                                         |Set the warning level for logging.|Migrated|
|[`SetWorkingDir`](SetWorkingDir/SetWorkingDir)                                                               |Set the working directory (folder) for following commands.|Migrated|
|[`ShiftTimeByInterval`](ShiftTimeByInterval/ShiftTimeByInterval)                                             |                                 |Not yet Migrated|
|[`StateModMax`](StateModMax/StateModMax)                                                                     |                                 |Not yet Migrated|
|[`SortTable`](SortTable/SortTable)                                                                           |Sort table contents.             |Migrated|
|[`SortTimeSeries`](SortTimeSeries/SortTimeSeries)                                                            |                                 |Not yet Migrated|
|[`SplitTableColumn`](SplitTableColumn/SplitTableColumn)                                                      |Split a table column into multiple columns.|Migrated|
|[`SplitTableRow`](SplitTableRow/SplitTableRow)                                                               |                                 |Not yet Migrated|
|[`StartLog`](StartLog/StartLog)                                                                              |(Re)start the log file.          |Migrated|
|[`StartRegressionTestResultsReport`](StartRegressionTestResults/ReportStartRegressionTestResultsReport)      |Start the regression test results report file to record output of tests.|Migrated |
|[`Subtract`](Subtract/Subtract)                                                                              |                                 |Not yet Migrated|
|[`TableMath`](TableMath/TableMath)                                                                           |Perform simple math on table columns.|Migrated|
|[`TableTimeSeriesMath`](TableTimeSeriesMath/TableTimeSeriesMath)                                             |Perform simple math on a table and time series.|Migrated|
|[`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries)                                                   |                                 |Not yet Migrated|
|[`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable)                                                   |                                 |Not yet Migrated|
|[`UnknownCommand`](UnknownCommand/UnknownCommand)                                                            |Unknown command.                 |Migrated|
|[`UnzipFile`](UnzipFile/UnzipFile)                                                                           |Unzip the contents of a zip file.|Migrated|
|[`VariableLagK`](VariableLagK/VariableLagK)                                                                  |                                 |Not yet Migrated|
|[`Wait`](Wait/Wait)                                                                                          |Wait for at time before continuing.|Migrated|
|[`WebGet`](WebGet/WebGet)                                                                                    |Download a file from a URL.      |Migrated|
|[`WeightTraces`](WeightTraces/WeightTraces)                                                                  |                                 |Not yet Migrated|
|[`WriteCheckFile`](WriteCheckFile/WriteCheckFile)                                                            |                                 |Not yet Migrated|
|[`WriteCommandSummaryToFile`](WriteCommandSummaryToFile/WriteCommandSummaryToFile)                           |Write summary of command log to a file. | Migrated |
|[`WriteDateValue`](WriteDateValue/WriteDateValue)                                                            |                                 |Not yet Migrated|
|[`WriteDelftFewsPiXml`](WriteDelftFewsPiXml/WriteDelftFewsPiXml)                                             |                                 |Not yet Migrated|
|[`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile)                                                |Write time series from delimited file.|Migrated|
|[`WriteHecDss`](WriteHecDss/WriteHecDss)                                                                     |                                 |Not yet Migrated|
|[`WriteNwsCard`](WriteNwsCard/WriteNwsCard)                                                                  |                                 |Not yet Migrated|
|[`WriteNWSRFSESPTraceEnsemble`](WriteNWSRFSESPTraceEnsemble/WriteNWSRFSESPTraceEnsemble)                     |                                 |Not yet Migrated|
|[`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile)                                       |Write processor properties to a file.|Migrated|
|[`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB)                                             |                                 |Not yet Migrated|
|[`WriteRiversideDB`](WriteRiversideDB/WriteRiversideDB)                                                      |                                 |Not yet Migrated|
|[`WriteRiverWare`](WriteRiverWare/WriteRiverWare)                                                            |                                 |Not yet Migrated|
|[`WriteSHEF`](WriteSHEF/WriteSHEF)                                                                           |                                 |Not yet Migrated|
|[`WriteStateCU`](WriteStateCU/WriteStateCU)                                                                  |                                 |Not yet Migrated|
|[`WriteStateMod`](WriteStateMod/WriteStateMod)                                                               |                                 |Not yet Migrated|
|[`WriteSummary`](WriteSummary/WriteSummary)                                                                  |                                 |Not yet Migrated|
|[`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel)                                    |                                 |Not yet Migrated|
|[`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore)                                       |Write a table to a datastore.    |Migrated|
|[`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile)                           |Write a table to delimited file. |Migrated|
|[`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel)                                                   |                                 |Not yet Migrated|
|[`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON)                                             |                                 |Not yet Migrated|
|[`WriteTableToHTML`](WriteTableToHTML/lWriteTableToHTML)                                                     |Write a table to an HTML file.   |Migrated|
|[`WriteTableToKml`](WriteTableToKml/WriteTableToKml)                                                         |                                 |Not yet Migrated|
|[`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile)                                       |                                 |Not yet Migrated|
|[`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile)         |Write time series properties to a file.|Migrated|
|[`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore)                        |                                 |Not yet Migrated|
|[`WriteTimeSeriesToDataStream`](WriteTimeSeriesToDataStream/WriteTimeSeriesToDataStream)                     |                                 |Not yet Migrated|
|[`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel)                                    |                                 |Not yet Migrated|
|[`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock)                     |                                 |Not yet Migrated|
|[`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON)                              |                                 |Not yet Migrated|
|[`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON)                        |                                 |Not yet Migrated|
|[`WriteTimeSeriesToJson`](WriteTimeSeriesToJson/WriteTimeSeriesToJson)                                       |                                 |Not yet Migrated|
|[`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml)                                          |                                 |Not yet Migrated|
|[`WriteWaterML`](WriteWaterML/WriteWaterML)                                                                  |                                 |Not yet Migrated|
|[`WriteWaterML2`](WriteWaterML2/WriteWaterML2)                                                               |                                 |Not yet Migrated|
