# Learn TSTool / Command Reference / Overview #

This reference section of the documentation provides information about TSTool commands,
listed in groups consistent with the TSTool software menus.
If necessary, use the documentation ***Search*** tool or the ***Find*** tool for the
web browser to find a specific command or topic.

**Reference documentation for commands is being transferred from
the original Word versions.
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
	1. Comments starting with `#`.
	2. Block comments `/*` and `*/` that surround one or more command lines.
	3. Command such as `Exit`, which will always have empty list of parameters in the parentheses.
2. Commands are generally not case-specific although the TSTool software enforces standards.
3. Command and parameter names use mixed case where the first letter of each word is capitalized.
4. Parameter values may optionally be surrounded by double quotes, regardless of type.
Double quotes are required in some cases to protect spaces and other characters within quotes.
5. Each command must exist on a single line.
6. Spaces at the front of a command for indentation are currently not allowed.
This limitation is planned to be removed in the future.
Tabs used for indentation are discouraged and will likely be prohibited because tab width is ambiguous between different users and tools.
Spaces will be the preferred method of indentation.
7. Blank lines are allowed and will be handled as [`Blank`](Blank/Blank) commands.
8. Unknown commands are handled as [`UnknownCommand`](UnknownCommand/UnknownCommand) commands.

## Time Series Processing ##

Time series processing commands focus on time series,
although other outputs such as tables and files may result from processing.
Older commands assumed that only time series would be processed and have general names (e.g., `Copy`),
whereas newer commands recognize that other objects may be processed and have more specific names
(e.g., `SelectTimeSeries`).

### Select, Free, Sort Time Series ###

* [`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries)
* [`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries)
* [`Free`](Free/Free)
* [`SortTimeSeries`](SortTimeSeries/SortTimeSeries)

### Create Time Series ###

* [`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries)
* [`NewTimeSeries`](NewTimeSeries/NewTimeSeries)
* [`ChangeInterval`](ChangeInterval/ChangeInterval)
* [`Copy`](Copy/Copy)
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

* [`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS)
* [`SetInputPeriod`](SetInputPeriod/SetInputPeriod)
* [`CreateFromList`](CreateFromList/CreateFromList)
* [`ReadDateValue`](ReadDateValue/ReadDateValue)
* [`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml)
* [`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile)
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

* [`ReplaceValue`](ReplaceValue/ReplaceValue)
* [`SetConstant`](SetConstant/SetConstant)
* [`SetDataValue`](SetDataValue/SetDataValue)
* [`SetFromTS`](SetFromTS/SetFromTS)
* [`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookupTable/SetTimeSeriesValuesFromLookupTable)
* [`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable)
* [`SetToMax`](SetToMax/SetToMax)
* [`SetToMin`](SetToMin/SetToMin)
* [`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty)

### Manipulate Time Series ###

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

* [`AnalyzePattern`](AnalyzePattern/AnalyzePattern)
* [`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)
* [`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries)
* [`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/ComputeErrorTimeSeries)

### Models - Routing ###

* [`LagK`](LagK/LagK)
* [`VariableLagK`](VariableLagK/VariableLagK)

### Output Time Series ###

* [`SetOutputDetailedHeaders`](SetOutputDetailedHeaders/SetOutputDetailedHeaders)
* [`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod)
* [`SetOutputYearType`](SetOutputYearType/SetOutputYearType)
* [`WriteDateValue`](WriteDateValue/WriteDateValue)
* [`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile)
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
* [`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile)

### Check Time Series ###

* [`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries)
* [`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic)
* [`WriteCheckFile`](WriteCheckFile/WriteCheckFile)

## Topic Area Commands ##

The following commands are grouped into specific topic areas.

### Datastore Processing ###

* [`NewDerbyDatabase`](NewDerbyDatabase/NewDerbyDatabase)
* [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore)
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
meaning they are not specific to processing data.

### General - Comments ###

* [`#` comment](Comment/Comment) - single line comment
* [`\*` comment block start](CommentBlockStart/CommentBlockStart) - start of multi-line comment block
* [`\*` comment block end](CommentBlockEnd/CommentBlockEnd) - end of multi-line comment block

### General - File Handling ###

* [`AppendFile`](AppendFile/AppendFile)
* [`CopyFile`](CopyFile/CopyFile) - copy a file to another name
* [`ListFiles`](ListFiles/ListFiles)
* [`FTPGet`](FTPGet/FTPGet)
* [`WebGet`](WebGet/WebGet)
* [`RemoveFile`](RemoveFile/RemoveFile)
* [`UnzipFile`](UnzipFile/UnzipFile)
* [`PrintTextFile`](PrintTextFile/PrintTextFile)

### General - Logging and Messaging ###

* [`Message`](Message/Message)
* [`SetDebugLevel`](SetDebugLevel/SetDebugLevel)
* [`SetWarningLevel`](SetWarningLevel/SetWarningLevel)
* [`StartLog`](StartLog/StartLog)
* [`SendEmailMessage`](SendEmailMessage/SendEmailMessage)

### General - Running and Properties ###

* [`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile)
* [`SetProperty`](SetProperty/SetProperty)
* [`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble)
* [`SetPropertyFromTimeSeries`](SetPropertyFromTimeSeries/SetPropertyFromTimeSeries)
* [`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty)
* [`FormatStringProperty`](FormatStringProperty/FormatStringProperty)
* [`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile)
* [`RunCommands`](RunCommands/RunCommands) - run a TSTool command file
* [`RunProgram`](RunProgram/RunProgram)
* [`RunPython`](RunPython/RunPython)
* [`RunDSSUTL`](RunDSSUTL/RunDSSUTL)
* [`If`](If/If)
* [`EndIf`](EndIf/EndIf)
* [`For`](For/For)
* [`EndFor`](EndFor/EndFor) - end of a For loop block of commands
* [`Exit`](Exit/Exit)
* [`Wait`](Wait/Wait)
* [`SetWorkingDir`](SetWorkingDir/SetWorkingDir)
* [`ProfileCommands`](ProfileCommands/ProfileCommands)
* [`Blank`](Blank/Blank)
* [`UnknownCommand`](UnknownCommand/UnknownCommand)

### General - Test Processing ###

* [`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile)
* [`WriteTimeSeriesProperty`](WriteTimeSeriesProperty/WriteTimeSeriesProperty)
* [`CompareFiles`](CompareFiles/CompareFiles) - compare files to detect if the same/different
* [`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile) - create a regression test suite command file
* [`StartRegressionTestResultsReport`](StartRegressionTestResultsReport/StartRegressionTestResultsReport)
* [`WriteCommandSummaryToFile`](WriteCommandSummaryToFile/WriteCommandSummaryToFile)

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

* [`NewTable`](NewTable/NewTable)
* [`CopyTable`](CopyTable/CopyTable)
* [`FreeTable`](FreeTable/FreeTable)

### Read Table ###

* [`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore)
* [`ReadTableFromDBF`](ReadTableFromDBF/ReadTableFromDBF)
* [`ReadTableFromDelimitedFile`](ReadTableFromDBF/ReadTableFromDelimitedFile)
* [`ReadTableFromExcel`](ReadTableFromDBF/ReadTableFromExcel)
* [`ReadTableFromFixedFormatFile`](ReadTableFromFixedFormatFile/ReadTableFromFixedFormatFile)
* [`ReadTableFromJSON`](ReadTableFromDBF/ReadTableFromJSON)
* [`ReadTableFromXml`](ReadTableFromXml/ReadTableFromXml)

### Append, Join Tables ###

* [`AppendTables`](AppendTables/AppendTables)
* [`JoinTables`](JoinTables/JoinTables)

### Table, Time Series Processing ###

* [`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable)
* [`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries)
* [`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable)
* [`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable)
* [`CopyTimeSeriesPropertiesToTable`](CopoyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable)

### Manipulate Tables ###

* [`InsertTableColumn`](InsertTableColumn/InsertTableColumn)
* [`DeleteTableColumns`](DeleteTableColumns/DeleteTableColumns)
* [`DeleteTableRows`](DeleteTableRows/DeleteTableRows)
* [`FormatTableDateTime`](FormatTableDateTime/FormatTableDateTime)
* [`FormatTableString`](FormatTableString/FormatTableString)
* [`ManipulateTableString`](ManipulateTableString/ManipulateTableString)
* [`SetTableValues`](SetTableValues/SetTableValues)
* [`SplitTableColumn`](SplitTableColumn/SplitTableColumn)
* [`TableMath`](TableMath/TableMath)
* [`TableTimeSeriesMath`](TableTimeSeriesMath/TableTimeSeriesMath)
* [`InsertTableRow`](InsertTableRow/InsertTableRow)
* [`SortTable`](SortTable/SortTable)
* [`SplitTableRow`](SplitTableRow/SplitTableRow)

### Analyze Table ###

* [`CompareTables`](CompareTables/CompareTables)

### Output Table ###

* [`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore)
* [`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile)
* [`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel)
* [`WriteTableToHTML`](WriteTableToHTML/WriteTableToHTML)

### Running and Properties ###

* [`SetPropertyFromTable`](SetPropertyFromTable/SetPropertyFromTable)
* [`CopyPropertiesToTable`](CopyPropertiesToTable/CopyPropertiesToTable)

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
|[`#` comment](Comment/Comment)                                                                               |Single line comment.             |Migrated                |
|[`\*` comment block start](CommentBlockStart/CommentBlockStart)                                              |Start of multi-line comment block|Migrated                |
|[`\*` comment block end](CommentBlockEnd/CommentBlockEnd)                                                    |End of multi-line comment block  |Migrated                |
|[`Add`](Add/Add)                                                                                             |                                 |Not yet migrated        |
|[`AddConstant`](AddConstant/AddConstant)                                                                     |                                 |Not yet migrated        |
|[`AdjustExtremes`](AdjustExtremes/AdjustExtremes)                                                            |                                 |Not yet migrated        |
|[`AnalyzeNetworkPointFlow`](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow)                                 |                                 |Not yet migrated        |
|[`AnalyzePattern`](AnalyzePattern/AnalyzePattern)                                                            |                                 |Not yet migrated        |
|[`AppendFile`](AppendFile/AppendFile)                                                                        |                                 |Not yet migrated        |
|[`AppendTable`](AppendTable/AppendTable)                                                                     |                                 |Not yet migrated        |
|[`ARMA`](ARMA/ARMA)                                                                                          |                                 |Not yet migrated        |
|[`Blend`](Blend/Blend)                                                                                       |                                 |Not yet migrated        |
|[`CalculateTimeSeriesStatistic`](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)                  |                                 |Not yet migrated        |
|[`ChangeInterval`](ChangeInterval/ChangeInterval)                                                            |                                 |Not yet migrated        |
|[`ChangePeriod`](ChangePeriod/ChangePeriod)                                                                  |                                 |Not yet migrated        |
|[`ChangeTimeZone`](ChangeTimeZone/ChangeTimeZone)                                                            |                                 |Not yet migrated        |
|[`CheckTimeSeries`](CheckTimeSeries/CheckTimeSeries)                                                         |                                 |Not yet migrated        |
|[`CheckTimeSeriesStatistic`](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic)                              |                                 |Not yet migrated        |
|[`CloseDataStore`](CloseDataStore/CloseDataStore)                                                            |                                 |Not yet migrated        |
|[`CloseExcelWorkbook`](CloseExcelWorkbook/CloseExcelWorkbook)                                                |                                 |Not yet migrated        |
|[`CompareFiles`](CompareFiles/CompareFiles)                                                                  |Compare files to detect if the same/different. |Migrated                |
|[`CompareTables`](CompareTables/CompareTables)                                                               |                                 |Not yet migrated        |
|[`CompareTimeSeries`](CompareTimeSeries/CompareTimeSeries)                                                   |                                 |Not yet migrated        |
|[`ComputeErrorTimeSeries`](ComputeErrorTimeSeries/CompauteErrorTimeSeries)                                   |                                 |Not yet migrated        |
|[`ConvertDataUnits`](ConvertDataUnits/ConvertDataUnits)                                                      |                                 |Not yet migrated        |
|[`Copy`](Copy/Copy)                                                                                          |                                 |Not yet migrated        |
|[`CopyEnsemble`](CopyEnsemble/CopyEnsemble)                                                                  |                                 |Not yet migrated        |
|[`CopyFile`](CopyFile/CopyFile)                                                                              |Copy a file to another name.                   |Migrated                |
|[`CopyTable`](CopyTable/CopyTable)                                                                           |                                 |Not yet migrated        |
|[`CopyTimeSeriesPropertiesToTable`](CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable)         |                                 |Not yet migrated        |
|[`CreateDataStoreDataDictionary`](CreateDataStoreDataDictionary/CreateDataStoreDataDictionary)               |                                 |Not yet migrated        |
|[`CreateEnsembleFromOneTimeSeries`](CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries)         |                                 |Not yet migrated        |
|[`CreateFromList`](CreateFromList/CreateFromList)                                                            |                                 |Not yet migrated        |
|[`CreateNetworkFromTable`](CreateNetworkFromTable/CreateNetworkFromTable)                                    |                                 |Not yet migrated        |
|[`CreateRegressionTestCommandFile`](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile)         |Create regression test suite command file. |Migrated                |
|[`CreateTimeSeriesEventTable`](CreateTimeSeriesEventTable/CreateTimeSeriesEventTable)                        |                                 |Not yet migrated        |
|[`CreateTraces`](CreateTraces/CreateTraces)                                                                  |                                 |Not yet migrated        |
|[`Cumulate`](Cumulate/Cumulate)                                                                              |                                 |Not yet migrated        |
|[`DeleteDataStoreTableRows`](DeleteDataStoreTableRows/DeleteDataStoreTableRows)                              |                                 |Not yet migrated        |
|[`DeleteTableColumns`](DeleteTableColumns/DeleteTableColumns)                                                |                                 |Not yet migrated        |
|[`DeleteTableRows`](DeleteTableRows/DeleteTableRows)                                                         |                                 |Not yet migrated        |
|[`Delta`](Delta/Delta)                                                                                       |                                 |Not yet migrated        |
|[`DeselectTimeSeries`](DeselectTimeSeries/DeselectTimeSeries)                                                |                                 |Not yet migrated        |
|[`Disaggregate`](Disaggregate/Disaggregate)                                                                  |                                 |Not yet migrated        |
|[`Divide`](Divide/Divide)                                                                                    |                                 |Not yet migrated        |
|[`EndFor`](EndFor/EndFor)                                                                                    |End of For loop                  |Migrated                |
|[`EndIf`](EndIf/EndIf)                                                                                       |                                 |Not yet migrated        |
|[`Exit`](Exit/Exit)                                                                                          |                                 |Not yet migrated        |
|[`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile)                                                |                                 |Not yet migrated        |
|[`FillCarryForward`](FillCarryForward/FillCarryForward)                                                      |                                 |Not yet migrated        |
|[`FillConstant`](FillConstant/FillConstant)                                                                  |                                 |Not yet migrated        |
|[`FillDayTSFrom2MonthTSAnd1DayTS`](FillDayTSFrom2MonthTSAnd1DayTS/FillDayTSFrom2MonthTSAnd1DayTS)            |                                 |Not yet migrated        |
|[`FillFromTS`](FillFromTS/FillFromTS)                                                                        |                                 |Not yet migrated        |
|[`FillHistMonthAverage`](FillHistMonthAverage/FillHistMonthAverage)                                          |                                 |Not yet migrated        |
|[`FillHistYearAverage`](FillHistYearAverage/FillHistYearAverage)                                             |                                 |Not yet migrated        |
|[`FillInterpolate`](FillInterpolate/FillInterpolate)                                                         |                                 |Not yet migrated        |
|[`FillMixedStation`](FillMixedStation/FillMixedStation)                                                      |                                 |Not yet migrated        |
|[`FillMOVE1`](FillMOVE1/FillMOVE1)                                                                           |                                 |Not yet migrated        |
|[`FillMOVE2`](FillMOVE2/FillMOVE2)                                                                           |                                 |Not yet migrated        |
|[`FillPattern`](FillPattern/FillPattern)                                                                     |                                 |Not yet migrated        |
|[`FillPrincipalComponentAnalysis`](FillPrincipalComponentAnalysis/FillPrincipalComponentAnalysis)            |                                 |Not yet migrated        |
|[`FillProrate`](FillProrate/FillProrate)                                                                     |                                 |Not yet migrated        |
|[`FillRegression`](FillRegression/FillRegression)                                                            |                                 |Not yet migrated        |
|[`FillRepeat`](FillRepeat/FillRepeat)                                                                        |                                 |Not yet migrated        |
|[`FillUsingDiversionComments`](FillUsingDiversionComments/FillUsingDiversionComments)                        |                                 |Not yet migrated        |
|[`For`](For/For)                                                                                             |                                 |Not yet migrated        |
|[`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty)                                    |                                 |Not yet migrated        |
|[`FormatStringProperty`](FormatStringProperty/FormatStringProperty)                                          |                                 |Not yet migrated        |
|[`FormatTableDateTime`](FormatTableDateTime/FormatTableDateTime)                                             |                                 |Not yet migrated        |
|[`FormatTableString`](FormatTableString/FormatTableString)                                                   |                                 |Not yet migrated        |
|[`Free`](Free/Free)                                                                                          |                                 |Not yet migrated        |
|[`FreeTable`](FreeTable/FreeTable)                                                                           |                                 |Not yet migrated        |
|[`FTPGet`](FTPGet/FTPGet)                                                                                    |                                 |Not yet migrated        |
|[`If`](If/If)                                                                                                |                                 |Not yet migrated        |
|[`InsertTableColumn`](InsertTableColumn/InsertTableColumn)                                                   |                                 |Not yet migrated        |
|[`InsertTableRow`](InsertTableRow/InsertTableRow)                                                            |                                 |Not yet migrated        |
|[`InsertTimeSeriesIntoEnsemble`](InsertTimeSeriesIntoEnsemble/InsertTimeSeriesIntoEnsemble)                  |                                 |Not yet migrated        |
|[`JoinTables`](JoinTables/JoinTables)                                                                        |                                 |Not yet migrated        |
|[`LagK`](LagK/LagK)                                                                                          |                                 |Not yet migrated        |
|[`ListFiles`](ListFiles/ListFiles)                                                                           |                                 |Not yet migrated        |
|[`LookupTimeSeriesFromTable`](LookupTimeSeriesFromTable/LookupTimeSeriesFromTable)                           |                                 |Not yet migrated        |
|[`ManipulateTableString`](ManipulateTableString/ManipulateTableString)                                       |                                 |Not yet migrated        |
|[`Message`](Message/Message)                                                                                 |                                 |Not yet migrated        |
|[`Multiply`](Multiply/Multiply)                                                                              |                                 |Not yet migrated        |
|[`NewDayTSFromMonthAndDayTS`](NewDayTSFromMonthAndDayTS/NewDayTSFromMonthAndDayTS)                           |                                 |Not yet migrated        |
|[`NewEndOfMonthTSFromDayTS`](NewEndOfMonthTSFromDayTS/NewEndOfMonthTSFromDayTS)                              |                                 |Not yet migrated        |
|[`NewEnsemble`](NewEnsemble/NewEnsemble)                                                                     |                                 |Not yet migrated        |
|[`NewExcelWorkbook`](NewExcelWorkbook/NewExcelWorkbook)                                                      |                                 |Not yet migrated        |
|[`NewPatternTimeSeries`](NewPatternTimeSeries/NewPatternTimeSeries)                                          |                                 |Not yet migrated        |
|[`NewStatisticMonthTimeSeries`](NewStatisticMonthTimeSeries/NewStatisticMonthTimeSeries)                     |                                 |Not yet migrated        |
|[`NewStatisticEnsemble`](NewStatisticEnsemble/NewStatisticEnsemble)                                          |                                 |Not yet migrated        |
|[`NewStatisticTimeSeries`](NewStatisticTimeSeries/NewStatisticTimeSeries)                                    |                                 |Not yet migrated        |
|[`NewStatisticTimeSeriesFromEnsemble`](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble)|                                 |Not yet migrated        |
|[`NewStatisticYearTS`](NewStatisticYearTS/NewStatisticYearTS)                                                |                                 |Not yet migrated        |
|[`NewTable`](NewTable/NewTable)                                                                              |                                 |Not yet migrated        |
|[`NewTimeSeries`](NewTimeSeries/NewTimeSeries)                                                               |                                 |Not yet migrated        |
|[`NewTreeView`](NewTreeView/NewTreeView)                                                                     |                                 |Not yet migrated        |
|[`Normalize`](Normalize/Normalize)                                                                           |                                 |Not yet migrated        |
|[`OpenCheckFile`](OpenCheckFile/OpenCheckFile)                                                               |                                 |Not yet migrated        |
|[`OpenHydroBase`](OpenHydroBase/OpenHydroBase)                                                               |                                 |Not yet migrated        |
|[`OpenNDFD`](OpenNDFD/OpenNDFD)                                                                              |                                 |Not yet migrated        |
|[`PrintTextFile`](PrintTextFile/PrintTextFile)                                                               |                                 |Not yet migrated        |
|[`ProcessRasterGraph`](ProcessRasterGraph/ProcessRasterGraph)                                                |                                 |Not yet migrated        |
|[`ProcessTSProduct`](ProcessTSProduct/ProcessTSProduct)                                                      |                                 |Not yet migrated        |
|[`ProfileCommands`](ProfileCommands/ProfileCommands)                                                         |                                 |Not yet migrated        |
|[`ReadDateValue`](ReadDateValue/ReadDateValue)                                                               |                                 |Not yet migrated        |
|[`ReadDelftFewsPiXml`](ReadDelftFewsPiXml/ReadDelftFewsPiXml)                                                |                                 |Not yet migrated        |
|[`ReadDelimitedFile`](ReadDelimitedFile/ReadDelimitedFile)                                                   |                                 |Not yet migrated        |
|[`ReadExcelWorkbook`](ReadExcelWorkbook/ReadExcelWorkbook)                                                   |                                 |Not yet migrated        |
|[`ReadHecDss`](ReadHecDss/ReadHecDss)                                                                        |                                 |Not yet migrated        |
|[`ReadHydroBase`](ReadHydroBase/ReadHydroBase)                                                               |                                 |Not yet migrated        |
|[`ReadMODSIM`](ReadMODSIM/ReadMODSIM)                                                                        |                                 |Not yet migrated        |
|[`ReadNDFD`](ReadNDFD/ReadNDFD)                                                                              |                                 |Not yet migrated        |
|[`ReadNrcsAwdb`](ReadNrcsAwdb/ReadNrcsAwdb)                                                                  |                                 |Not yet migrated        |
|[`ReadNwsCard`](ReadNwsCard/ReadNwsCard)                                                                     |                                 |Not yet migrated        |
|[`ReadNwsrfsTraceEnsemble`](ReadNwsrfsTraceEnsemble/ReadNwsrfsTraceEnsemble)                                 |                                 |Not yet migrated        |
|[`ReadNwsrfsFs5files`](ReadNwsrfsFs5files/ReadNwsrfsFs5files)                                                |                                 |Not yet migrated        |
|[`ReadPatternFile`](ReadPatternFile/ReadPatternFile)                                                         |                                 |Not yet migrated        |
|[`ReadPropertiesFromExcel`](ReadPropertiesFromExcel/ReadPropertiesFromExcel)                                 |                                 |Not yet migrated        |
|[`ReadPropertiesFromFile`](ReadPropertiesFromFile/ReadPropertiesFromFile)                                    |                                 |Not yet migrated        |
|[`ReadRccAcis`](ReadRccAcis/ReadRccAcis)                                                                     |                                 |Not yet migrated        |
|[`ReadReclamationHDB`](ReadReclamationHDB/ReadReclamationHDB)                                                |                                 |Not yet migrated        |
|[`ReadReclamationPisces`](ReadReclamationPisces/ReadReclamationPisces)                                       |                                 |Not yet migrated        |
|[`ReadRiversideDB`](ReadRiversideDB/ReadRiversideDB)                                                         |                                 |Not yet migrated        |
|[`ReadRiverWare`](ReadRiverWare/ReadRiverWare)                                                               |                                 |Not yet migrated        |
|[`ReadStateCU`](ReadStateCU/ReadStateCU)                                                                     |                                 |Not yet migrated        |
|[`ReadStateCUB`](ReadStateCUB/ReadStateCUB)                                                                  |                                 |Not yet migrated        |
|[`ReadStateMod`](ReadStateMod/ReadStateMod)                                                                  |                                 |Not yet migrated        |
|[`ReadStateModB`](ReadStateModB/ReadStateModB)                                                               |                                 |Not yet migrated        |
|[`ReadTableCellsFromExcel`](ReadTableCellsFromExcel/ReadTableCellsFromExcel)                                 |                                 |Not yet migrated        |
|[`ReadTableFromDataStore`](ReadTableFromDataStore/ReadTableFromDataStore)                                    |                                 |Not yet migrated        |
|[`ReadTableFromDBF`](ReadTableFromDBF/ReadTableFromDBF)                                                      |                                 |Not yet migrated        |
|[`ReadTableFromDelimitedFile`](ReadTableFromDelimitedFile/ReadTableFromDelimitedFile)                        |                                 |Not yet migrated        |
|[`ReadTableFromExcel`](ReadTableFromExcel/ReadTableFromExcel)                                                |                                 |Not yet migrated        |
|[`ReadTableFromFixedFormatFile`](ReadTableFromFixedFormatFile/ReadTableFromFixedFormatFile)                  |                                 |Not yet migrated        |
|[`ReadTableFromJSON`](ReadTableFromJSON/ReadTableFromJSON)                                                   |                                 |Not yet migrated        |
|[`ReadTableFromXML`](ReadTableFromXML/ReadTableFromXML)                                                      |                                 |Not yet migrated        |
|[`ReadTimeSeries`](ReadTimeSeries/ReadTimeSeries)                                                            |                                 |Not yet migrated        |
|[`ReadTimeSeriesFromDataStore`](ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore)                     |                                 |Not yet migrated        |
|[`ReadTimeSeriesList`](ReadTimeSeriesList/ReadTimeSeriesList)                                                |                                 |Not yet migrated        |
|[`ReadUsgsNwisDaily`](ReadUsgsNwisDaily/ReadUsgsNwisDaily)                                                   |                                 |Not yet migrated        |
|[`ReadUsgsNwisGroundwater`](ReadUsgsNwisGroundwater/ReadUsgsNwisGroundwater)                                 |                                 |Not yet migrated        |
|[`ReadUsgsNwisInstantaneous`](ReadUsgsNwisInstantaneous/ReadUsgsNwisInstantaneous)                           |                                 |Not yet migrated        |
|[`ReadWaterML`](ReadWaterML/ReadWaterML)                                                                     |                                 |Not yet migrated        |
|[`ReadWaterOneFlow`](ReadWaterOneFlow/ReadWaterOneFlow)                                                      |                                 |Not yet migrated        |
|[`ReadUsgsNwisRdb`](ReadUsgsNwisRdb/ReadUsgsNwisRdb)                                                         |                                 |Not yet migrated        |
|[`RelativeDiff`](RelativeDiff/RelativeDiff)                                                                  |                                 |Not yet migrated        |
|[`RemoveFile`](RemoveFile/RemoveFile)                                                                        |                                 |Not yet migrated        |
|[`ReplaceValue`](ReplaceValue/ReplaceValue)                                                                  |                                 |Not yet migrated        |
|[`ResequenceTimeSeriesData`](ResequenceTimeSeriesData/ResequenceTimeSeriesData)                              |                                 |Not yet migrated        |
|[`RunCommands`](RunCommands/RunCommands)                                                                     |Run a TSTool command file.       |Migrated                |
|[`RunDSSUtil`](RunDSSUtil/RunDSSUtil)                                                                        |                                 |Not yet migrated        |
|[`RunningAverage`](RunningAverage/RunningAverage)                                                            |                                 |Not yet migrated        |
|[`RunningStatisticTimeSeries`](RunningStatisticTimeSeries/RunningStatisticTimeSeries)                        |                                 |Not yet migrated        |
|[`RunProgram`](RunProgram/RunProgram)                                                                        |                                 |Not yet migrated        |
|[`RunPython`](RunPython/RunPython)                                                                           |                                 |Not yet migrated        |
|[`RunSql`](RunSql/RunSql)                                                                                    |                                 |Not yet migrated        |
|[`Scale`](Scale/Scale)                                                                                       |                                 |Not yet migrated        |
|[`SelectTimeSeries`](SelectTimeSeries/SelectTimeSeries)                                                      |                                 |Not yet migrated        |
|[`SetAutoExtendPeriod`](SetAutoExtendPeriod/SetAutoExtendPeriod)                                             |                                 |Not yet migrated        |
|[`SetAveragePeriod`](SetAveragePeriod/SetAveragePeriod)                                                      |                                 |Not yet migrated        |
|[`SetConstant`](SetConstant/SetConstant)                                                                     |                                 |Not yet migrated        |
|[`SetConstantBefore`](SetConstantBefore/SetConstantBefore)                                                   |                                 |Not yet migrated        |
|[`SetDataValue`](SetDataValue/SetDataValue)                                                                  |                                 |Not yet migrated        |
|[`SetDebugLevel`](SetDebugLevel/SetDebugLevel)                                                               |                                 |Not yet migrated        |
|[`SetEnsembleProperty`](SetEnsembleProperty/SetEnsembleProperty)                                             |                                 |Not yet migrated        |
|[`SetExcelCell`](SetExcelCell/SetExcelCell)                                                                  |                                 |Not yet migrated        |
|[`SetExcelWorksheetViewProperties`](SetExcelWorksheetViewProperties/SetExcelWorksheetViewProperties)         |                                 |Not yet migrated        |
|[`SetFromTS`](SetFromTS/SetFromTS)                                                                           |                                 |Not yet migrated        |
|[`SetIgnoreLEZero`](SetIgnoreLEZero/SetIgnoreLEZero)                                                         |                                 |Not yet migrated        |
|[`SetIncludeMissingTS`](SetIncludeMissingTS/SetIncludeMissingTS)                                             |                                 |Not yet migrated        |
|[`SetInputPeriod`](SetInputPeriod/SetInputPeriod)                                                            |                                 |Not yet migrated        |
|[`SetOutputPeriod`](SetOutputPeriod/SetOutputPeriod)                                                         |                                 |Not yet migrated        |
|[`SetOutputYearType`](SetOutputYearType/SetOutputYearType)                                                   |                                 |Not yet migrated        |
|[`SetPatternFile`](SetPatternFile/SetPatternFile)                                                            |                                 |Not yet migrated        |
|[`SetProperty`](SetProperty/SetProperty)                                                                     |                                 |Not yet migrated        |
|[`SetPropertyFromNwsrfsAppDefault`](SetPropertyFromNwsrfsAppDefault/SetPropertyFromNwsrfsAppDefault)         |                                 |Not yet migrated        |
|[`SetPropertyFromEnsemble`](SetPropertyFromEnsemble/SetPropertyFromEnsemble)                                 |                                 |Not yet migrated        |
|[`SetPropertyFromTable`](SetPropertyFromTable/SetPropertyFromTable)                                          |                                 |Not yet migrated        |
|[`SetPropertyFromTimeSeries`](SetPropertyFromTimeSeries/SetPropertyFromTimeSeries)                           |                                 |Not yet migrated        |
|[`SetTableValues`](SetTableValues/SetTableValues)                                                            |                                 |Not yet migrated        |
|[`SetTimeSeriesPropertiesFromTable`](SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable)      |                                 |Not yet migrated        |
|[`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty)                                       |                                 |Not yet migrated        |
|[`SetTimeSeriesValuesFromLookupTable`](SetTimeSeriesValuesFromLookup/TableSetTimeSeriesValuesFromLookupTable)|                                 |Not yet migrated        |
|[`SetTimeSeriesValuesFromTable`](SetTimeSeriesValuesFromTable/SetTimeSeriesValuesFromTable)                  |                                 |Not yet migrated        |
|[`SetToMax`](SetToMax/SetToMax)                                                                              |                                 |Not yet migrated        |
|[`SetToMin`](SetToMin/SetToMin)                                                                              |                                 |Not yet migrated        |
|[`SetWarningLevel`](SetWarningLevel/SetWarningLevel)                                                         |                                 |Not yet migrated        |
|[`SetWorkingDir`](SetWorkingDir/SetWorkingDir)                                                               |                                 |Not yet migrated        |
|[`ShiftTimeByInterval`](ShiftTimeByInterval/ShiftTimeByInterval)                                             |                                 |Not yet migrated        |
|[`StateModMax`](StateModMax/StateModMax)                                                                     |                                 |Not yet migrated        |
|[`SortTable`](SortTable/SortTable)                                                                           |                                 |Not yet migrated        |
|[`SortTimeSeries`](SortTimeSeries/SortTimeSeries)                                                            |                                 |Not yet migrated        |
|[`SplitTableColumn`](SplitTableColumn/SplitTableColumn)                                                      |                                 |Not yet migrated        |
|[`SplitTableRow`](SplitTableRow/SplitTableRow)                                                               |                                 |Not yet migrated        |
|[`StartLog`](StartLog/StartLog)                                                                              |                                 |Not yet migrated        |
|[`StartRegressionTestResultsReport`](StartRegressionTestResults/ReportStartRegressionTestResultsReport)      |Start the regression test results report file to record output of tests.|Migrated                |
|[`Subtract`](Subtract/Subtract)                                                                              |                                 |Not yet migrated        |
|[`TableMath`](TableMath/TableMath)                                                                           |                                 |Not yet migrated        |
|[`TableTimeSeriesMath`](TableTimeSeriesMath/TableTimeSeriesMath)                                             |                                 |Not yet migrated        |
|[`TableToTimeSeries`](TableToTimeSeries/TableToTimeSeries)                                                   |                                 |Not yet migrated        |
|[`TimeSeriesToTable`](TimeSeriesToTable/TimeSeriesToTable)                                                   |                                 |Not yet migrated        |
|[`UnzipFile`](UnzipFile/UnzipFile)                                                                           |                                 |Not yet migrated        |
|[`VariableLagK`](VariableLagK/VariableLagK)                                                                  |                                 |Not yet migrated        |
|[`Wait`](Wait/Wait)                                                                                          |                                 |Not yet migrated        |
|[`WebGet`](WebGet/WebGet)                                                                                    |                                 |Not yet migrated        |
|[`WeightTraces`](WeightTraces/WeightTraces)                                                                  |                                 |Not yet migrated        |
|[`WriteCheckFile`](WriteCheckFile/WriteCheckFile)                                                            |                                 |Not yet migrated        |
|[`WriteDateValue`](WriteDateValue/WriteDateValue)                                                            |                                 |Not yet migrated        |
|[`WriteDelftFewsPiXml`](WriteDelftFewsPiXml/WriteDelftFewsPiXml)                                             |                                 |Not yet migrated        |
|[`WriteDelimitedFile`](WriteDelimitedFile/WriteDelimitedFile)                                                |                                 |Not yet migrated        |
|[`WriteHecDss`](WriteHecDss/WriteHecDss)                                                                     |                                 |Not yet migrated        |
|[`WriteNwsCard`](WriteNwsCard/WriteNwsCard)                                                                  |                                 |Not yet migrated        |
|[`WriteNWSRFSESPTraceEnsemble`](WriteNWSRFSESPTraceEnsemble/WriteNWSRFSESPTraceEnsemble)                     |                                 |Not yet migrated        |
|[`WritePropertiesToFile`](WritePropertiesToFile/WritePropertiesToFile)                                       |                                 |Not yet migrated        |
|[`WriteProperty`](WriteProperty/WriteProperty)                                                               |                                 |Not yet migrated        |
|[`WriteReclamationHDB`](WriteReclamationHDB/WriteReclamationHDB)                                             |                                 |Not yet migrated        |
|[`WriteRiversideDB`](WriteRiversideDB/WriteRiversideDB)                                                      |                                 |Not yet migrated        |
|[`WriteRiverWare`](WriteRiverWare/WriteRiverWare)                                                            |                                 |Not yet migrated        |
|[`WriteSHEF`](WriteSHEF/WriteSHEF)                                                                           |                                 |Not yet migrated        |
|[`WriteStateCU`](WriteStateCU/WriteStateCU)                                                                  |                                 |Not yet migrated        |
|[`WriteStateMod`](WriteStateMod/WriteStateMod)                                                               |                                 |Not yet migrated        |
|[`WriteSummary`](WriteSummary/WriteSummary)                                                                  |                                 |Not yet migrated        |
|[`WriteTableCellsToExcel`](WriteTableCellsToExcel/WriteTableCellsToExcel)                                    |                                 |Not yet migrated        |
|[`WriteTableToDataStore`](WriteTableToDataStore/WriteTableToDataStore)                                       |                                 |Not yet migrated        |
|[`WriteTableToDelimitedFile`](WriteTableToDelimitedFile/WriteTableToDelimitedFile)                           |                                 |Not yet migrated        |
|[`WriteTableToExcel`](WriteTableToExcel/WriteTableToExcel)                                                   |                                 |Not yet migrated        |
|[`WriteTableToGeoJSON`](WriteTableToGeoJSON/WriteTableToGeoJSON)                                             |                                 |Not yet migrated        |
|[`WriteTableToHTML`](WriteTableToHTML/lWriteTableToHTML)                                                     |                                 |Not yet migrated        |
|[`WriteTableToKml`](WriteTableToKml/WriteTableToKml)                                                         |                                 |Not yet migrated        |
|[`WriteTableToShapefile`](WriteTableToShapefile/WriteTableToShapefile)                                       |                                 |Not yet migrated        |
|[`WriteTimeSeriesProperty`](WriteTimeSeriesProperty/WriteTimeSeriesProperty)                                 |                                 |Not yet migrated        |
|[`WriteTimeSeriesPropertiesToFile`](WriteTimeSeriesPropertiesToFile/WriteTimeSeriesPropertiesToFile)         |                                 |Not yet migrated        |
|[`WriteTimeSeriesToDataStore`](WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore)                        |                                 |Not yet migrated        |
|[`WriteTimeSeriesToDataStream`](WriteTimeSeriesToDataStream/WriteTimeSeriesToDataStream)                     |                                 |Not yet migrated        |
|[`WriteTimeSeriesToExcel`](WriteTimeSeriesToExcel/WriteTimeSeriesToExcel)                                    |                                 |Not yet migrated        |
|[`WriteTimeSeriesToExcelBlock`](WriteTimeSeriesToExcelBlock/WriteTimeSeriesToExcelBlock)                     |                                 |Not yet migrated        |
|[`WriteTimeSeriesToGeoJSON`](WriteTimeSeriesToGeoJSON/WriteTimeSeriesToGeoJSON)                              |                                 |Not yet migrated        |
|[`WriteTimeSeriesToHydroJSON`](WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON)                        |                                 |Not yet migrated        |
|[`WriteTimeSeriesToJson`](WriteTimeSeriesToJson/WriteTimeSeriesToJson)                                       |                                 |Not yet migrated        |
|[`WriteTimeSeriesToKml`](WriteTimeSeriesToKml/WriteTimeSeriesToKml)                                          |                                 |Not yet migrated        |
|[`WriteWaterML`](WriteWaterML/WriteWaterML)                                                                  |                                 |Not yet migrated        |
|[`WriteWaterML2`](WriteWaterML2/WriteWaterML2)                                                               |                                 |Not yet migrated        |
