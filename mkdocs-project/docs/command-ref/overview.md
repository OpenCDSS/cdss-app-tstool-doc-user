# Learn TSTool / Command Reference / Overview #

This reference section of the documentation provides information about TSTool commands,
listed in groups consistent with the TSTool software menus.
If necessary, use the documentation ***Search*** tool or the ***Find*** tool for the
web browser to find a specific command or topic.

**Reference documentation for commands is being transferred from
the original Word versions.
Refer to the PDF documentation distributed with TSTool and available online if
documentation is not available below.**

* [Command Syntax Overview](#command-syntax-overview)
* [Time Series Processing](#time-series-processing)
	+ [Select, Free, Sort Time Series](#select-free-sort-time-series)
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

## Select, Free, Sort Time Series ##

### Read Time Series ###

* [AddGeoLayerAttribute](AddGeoLayerAttribute/AddGeoLayerAttribute) - add an attribute to a GeoLayer
* [ClipGeoLayer](ClipGeoLayer/ClipGeoLayer) - clip a GeoLayer by the boundary of another GeoLayer 
* [CopyGeoLayer](CopyGeoLayer/CopyGeoLayer) - copy a GeoLayer to a new GeoLayer
* [CreateGeoLayerFromGeometry](CreateGeoLayerFromGeometry/CreateGeoLayerFromGeometry) - create a GeoLayer from input geometry data
* [FreeGeoLayers](FreeGeoLayers/FreeGeoLayers) - removes one or more GeoLayers from the GeoProcessor
* [IntersectGeoLayer](IntersectGeoLayer/IntersectGeoLayer) - intersects a GeoLayer by another GeoLayer
* [MergeGeoLayers](MergeGeoLayers/MergeGeoLayers) - merge multiple GeoLayers into one GeoLayer
* [ReadGeoLayerFromDelimitedFile](ReadGeoLayerFromDelimitedFile/ReadGeoLayerFromDelimitedFile) - read a GeoLayer from a file in delimited file format
* [ReadGeoLayerFromGeoJSON](ReadGeoLayerFromGeoJSON/ReadGeoLayerFromGeoJSON) - read a GeoLayer from a file in GeoJSON format
* [ReadGeoLayerFromShapefile](ReadGeoLayerFromShapefile/ReadGeoLayerFromShapefile) - read a GeoLayer from a file in Shapefile format
* [ReadGeoLayersFromFGDB](ReadGeoLayersFromFGDB/ReadGeoLayersFromFGDB) - read GeoLayers from a file geodatabase
* [ReadGeoLayersFromFolder](ReadGeoLayersFromFolder/ReadGeoLayersFromFolder) - read GeoLayers from a folder
* [RemoveGeoLayerAttributes](RemoveGeoLayerAttributes/RemoveGeoLayerAttributes) - remove one or more attributes from a GeoLayer
* [RenameGeoLayerAttribute](RenameGeoLayerAttribute/RenameGeoLayerAttribute) - rename a GeoLayer's attribute
* [SetGeoLayerCRS](SetGeoLayerCRS/SetGeoLayerCRS) - sets a GeoLayer's coordinate reference system
* [SetGeoLayerProperty](SetGeoLayerProperty/SetGeoLayerProperty) - set a GeoGeoLayer property
* [SimplifyGeoLayerGeometry](SimplifyGeoLayerGeometry/SimplifyGeoLayerGeometry) - decreases the verticies in a polygon or line GeoLayer 
* [WriteGeoLayerToDelimitedFile](WriteGeoLayerToDelimitedFile/WriteGeoLayerToDelimitedFile) - write GeoLayer to a file in delimited file format
* [WriteGeoLayerToGeoJSON](WriteGeoLayerToGeoJSON/WriteGeoLayerToGeoJSON) - write GeoLayer to a file in GeoJSON format
* [WriteGeoLayerToKML](WriteGeoLayerToKML/WriteGeoLayerToKML) - write GeoLayer to a file in KML format
* [WriteGeoLayerToShapefile](WriteGeoLayerToShapefile/WriteGeoLayerToShapefile) - write GeoLayer to a file in Shapefile format

### Fill Time Series Missing Data ###

### Set Time Series Contents ###

### Manipulate Time Series ###

### Analyze Time Series ###

### Models - Routing ###

### Output Time Series ###

### Check Time Series ###

## Topic Area Commands ##

### Datastore Processing ###

### Ensemble Processing ###

### Network Processing ###

### Spatial Processing ###

### Spreadsheet Processing ###

### Template Processing ###

### visualization Processing ###

## General Commands ##

### General - Comments ###

* [\# comment](Comment/Comment) - single line comment
* [/\* comment block start](CommentBlockStart/CommentBlockStart) - start of multi-line comment block
* [\*/ comment block end](CommentBlockEnd/CommentBlockEnd) - end of multi-line comment block

### General - File Handling ###

* [CopyFile](CopyFile/CopyFile) - copy a file to a new file
* [ListFiles](ListFiles/ListFiles) - list the files and folder within a folder or a URL
* [RemoveFile](RemoveFile/RemoveFile) - remove a file
* [UnzipFile](UnzipFile/UnzipFile) - unzip a file
* [WebGet](WebGet/WebGet) - download a file from URL

### General - Logging and Messaging ###

* [Message](Message/Message) - print a message to the log file
* [StartLog](StartLog/StartLog) - start a new log file

### General - Running and Properties ###

* [Blank](Blank/Blank) - used for blank lines
* [EndIf](EndIf/EndIf) - indicate the end of an `If` block
* [EndFor](EndFor/EndFor) - indicate the end of a `For` block
* [For](For/For) - indicate the start of a `For` block
* [If](If/If) - indicate the start of an `If` block
* [RunCommands](RunCommands/RunCommands) - run a command file, useful to automate running all tests or a multi-step workflow
* [RunProgram](RunProgram/RunProgram) - run a program
* [SetProperty](SetProperty/SetProperty) - set a GeoProcessor property
* [SetPropertyFromGeoLayer](SetPropertyFromGeoLayer/SetPropertyFromGeoLayer) - set a GeoProcessor property from a GeoLayer property
* [UnknownCommand](UnknownCommand/UnknownCommand) - used when the command is not recognized

### General - Test Processing ###

* [CompareFiles](CompareFiles/CompareFiles) - compare files and optionally warn/fail if different/same
* [CreateRegressionTestCommandFile](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile) - create a master command file to automate running all tests
* [RunCommands](RunCommands/RunCommands) - used when running a test suite
* [StartRegressionTestResultsReport](StartRegressionTestResultsReport/StartRegressionTestResultsReport) - start (open) a file to receive regression test results
* [WriteCommandSummaryToFile](WriteCommandSummaryToFile/WriteCommandSummaryToFile) - write a summary of command log messages to a file
* [WriteGeoLayerPropertiesToFile](WriteGeoLayerPropertiesToFile/WriteGeoLayerPropertiesToFile) - write GeoLayer properties to file
* [WritePropertiesToFile](WritePropertiesToFile/WritePropertiesToFile) - write properties to file

## Deprecated Commands ##

"Deprecated" commands are obsolete and have typically been replaced by other commands.
These commands are generally quite old and may be removed at some point.

## Table Commands ##

### Create, Copy, Free Table ###

### Read Table ###

### Append, Join Tables ###

### Table, Time Series Processing ###

### Manipulate Tables ###

### Analyze Table ###

### Output Table ###

### Running and Properties ###

## Plugin Commands ##

## Command List ##

The following table contains every command and provides summary information that
is useful to software users and developers.
"Documentation Migrated" indicates whether the original Word version of documentation
have been migrated to the new online version (this documentation).

**This table needs to be completed for all commands.**

|**Command**                                                                                                |**Description**                  |**Documentation Status**|
|-----------------------------------------------------------------------------------------------------------|---------------------------------|------------------------|
|[`#` comment](Comment/Comment)                                                                             |Single line comment.             |Not yet migrated        |
|[`\*` comment block start](CommentBlockStart/CommentBlockStart)                                            |Start of multi-line comment block|Not yet migrated        |
|[`\*` comment block end](CommentBlockEnd/CommentBlockEnd)                                                  |End of multi-line comment block  |Not yet migrated        |
|[Add](Add/Add)                                                                                             |                                 |Not yet migrated        |
|[AddConstant](AddConstant/AddConstant)                                                                     |                                 |Not yet migrated        |
|[AdjustExtremes](AdjustExtremes/AdjustExtremes)                                                            |                                 |Not yet migrated        |
|[AnalyzeNetworkPointFlow](AnalyzeNetworkPointFlow/AnalyzeNetworkPointFlow)                                 |                                 |Not yet migrated        |
|[AnalyzePattern](AnalyzePattern/AnalyzePattern)                                                            |                                 |Not yet migrated        |
|[AppendFile](AppendFile/AppendFile)                                                                        |                                 |Not yet migrated        |
|[AppendTable](AppendTable/AppendTable)                                                                     |                                 |Not yet migrated        |
|[ARMA](ARMA/ARMA)                                                                                          |                                 |Not yet migrated        |
|[Blend](Blend/Blend)                                                                                       |                                 |Not yet migrated        |
|[CalculateTimeSeriesStatistic](CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)                  |                                 |Not yet migrated        |
|[ChangeInterval](ChangeInterval/ChangeInterval)                                                            |                                 |Not yet migrated        |
|[ChangePeriod](ChangePeriod/ChangePeriod)                                                                  |                                 |Not yet migrated        |
|[ChangeTimeZone](ChangeTimeZone/ChangeTimeZone)                                                            |                                 |Not yet migrated        |
|[CheckTimeSeries](CheckTimeSeries/CheckTimeSeries)                                                         |                                 |Not yet migrated        |
|[CheckTimeSeriesStatistic](CheckTimeSeriesStatistic/CheckTimeSeriesStatistic)                              |                                 |Not yet migrated        |
|[CloseDataStore](CloseDataStore/CloseDataStore)                                                            |                                 |Not yet migrated        |
|[CloseExcelWorkbook](CloseExcelWorkbook/CloseExcelWorkbook)                                                |                                 |Not yet migrated        |
|[CompareFiles](CompareFiles/CompareFiles)                                                                  |                                 |Not yet migrated        |
|[CompareTables](CompareTables/CompareTables)                                                               |                                 |Not yet migrated        |
|[CompareTimeSeries](CompareTimeSeries/CompareTimeSeries)                                                   |                                 |Not yet migrated        |
|[ConvertDataUnits]()|                                 |Not yet migrated        |
|[Copy]()|                                 |Not yet migrated        |
|[CopyFile]()|                                 |Not yet migrated        |
|[CopyTable]()|                                 |Not yet migrated        |
|[CopyTimeSeriesPropertiesToTable]()|                                 |Not yet migrated        |
|[CreateDataStoreDataDictionary]()|                                 |Not yet migrated        |
|[CreateEnsembleFromOneTimeSeries]()|                                 |Not yet migrated        |
|[CreateNetworkFromTable]()|                                 |Not yet migrated        |
|[CreateRegressionTestCommandFile](CreateRegressionTestCommandFile/CreateRegressionTestCommandFile)|                                 |Not yet migrated        |
|[CreateTimeSeriesEventTable]()|                                 |Not yet migrated        |
|[Cumulate]()|                                 |Not yet migrated        |
|[DeleteTableColumns]()|                                 |Not yet migrated        |
|[DeleteTableRows]()|                                 |Not yet migrated        |
|[Delta]()|                                 |Not yet migrated        |
|[Divide]()|                                 |Not yet migrated        |
|[EndFor]()|                                 |Not yet migrated        |
|[EndIf]()|                                 |Not yet migrated        |
|[Exit]()|                                 |Not yet migrated        |
|[ExpandTemplateFile]()|                                 |Not yet migrated        |
|[FillConstant]()|                                 |Not yet migrated        |
|[FillFromTS]()|                                 |Not yet migrated        |
|[FillHistMonthAverage]()|                                 |Not yet migrated        |
|[FillInterpolate]()|                                 |Not yet migrated        |
|[FillMOVE1]()|                                 |Not yet migrated        |
|[FillMOVE2]()|                                 |Not yet migrated        |
|[FillPattern]()|                                 |Not yet migrated        |
|[FillRegression]()|                                 |Not yet migrated        |
|[FillRepeat]()|                                 |Not yet migrated        |
|[FillUsingDiversionComments]()|                                 |Not yet migrated        |
|[For]()|                                 |Not yet migrated        |
|[FormatDateTimeProperty]()|                                 |Not yet migrated        |
|[FormatStringProperty]()|                                 |Not yet migrated        |
|[FormatTableDateTime]()|                                 |Not yet migrated        |
|[FormatTableString]()|                                 |Not yet migrated        |
|[Free]()|                                 |Not yet migrated        |
|[FreeTable]()|                                 |Not yet migrated        |
|[If]()|                                 |Not yet migrated        |
|[InsertTableColumn]()|                                 |Not yet migrated        |
|[InsertTableRow]()|                                 |Not yet migrated        |
|[JoinTables]()|                                 |Not yet migrated        |
|[ListFiles]()|                                 |Not yet migrated        |
|[ManipulateTableString]()|                                 |Not yet migrated        |
|[Message]()|                                 |Not yet migrated        |
|[Multiply]()|                                 |Not yet migrated        |
|[NewEndOfMonthTSFromDayTS]()|                                 |Not yet migrated        |
|[NewEnsemble]()|                                 |Not yet migrated        |
|[NewExcelWorkbook]()|                                 |Not yet migrated        |
|[NewPatternTimeSeries]()|                                 |Not yet migrated        |
|[NewStatisticMonthTimeSeries]()|                                 |Not yet migrated        |
|[AdjustExtremes](AdjustExtremes/AdjustExtremes)                                                            |                                   |Not yet migrated        |
|[NewStatisticTimeSeriesFromEnsemble](NewStatisticTimeSeriesFromEnsemble/NewStatisticTimeSeriesFromEnsemble)|                                   |Not yet migrated        |
|[NewStatisticYearTS]()|                                 |Not yet migrated        |
|[NewTable]()|                                 |Not yet migrated        |
|[NewTimeSeries]()|                                 |Not yet migrated        |
|[NewTreeView]()|                                 |Not yet migrated        |
|[ProcessRasterGraph]()|                                 |Not yet migrated        |
|[ProcessTSProduct]()|                                 |Not yet migrated        |
|[ProfileCommands]()|                                 |Not yet migrated        |
|[ReadDateValue]()|                                 |Not yet migrated        |
|[ReadDelftFewsPiXml]()|                                 |Not yet migrated        |
|[ReadDelimitedFile]()|                                 |Not yet migrated        |
|[ReadExcelWorkbook]()|                                 |Not yet migrated        |
|[ReadHecDss]()|                                 |Not yet migrated        |
|[ReadNrcsAwdb]()|                                 |Not yet migrated        |
|[ReadPropertiesFromExcel]()|                                 |Not yet migrated        |
|[ReadPropertiesFromFile]()|                                 |Not yet migrated        |
|[ReadReclamationHDB]()|                                 |Not yet migrated        |
|[ReadReclamationPisces]()|                                 |Not yet migrated        |
|[ReadRiverWare]()|                                 |Not yet migrated        |
|[ReadStateMod]()|                                 |Not yet migrated        |
|[ReadTableCellsFromExcel]()|                                 |Not yet migrated        |
|[ReadTableFromDataStore]()|                                 |Not yet migrated        |
|[ReadTableFromDBF]()|                                 |Not yet migrated        |
|[ReadTableFromDelimitedFile]()|                                 |Not yet migrated        |
|[ReadTableFromExcel]()|                                 |Not yet migrated        |
|[ReadTableFromFixedFormatFile]()|                                 |Not yet migrated        |
|[ReadTableFromJSON]()|                                 |Not yet migrated        |
|[ReadTableFromXML]()|                                 |Not yet migrated        |
|[ReadTimeSeries]()|                                 |Not yet migrated        |
|[ReadTimeSeriesFromDataStore]()|                                 |Not yet migrated        |
|[ReadTimeSeriesList]()|                                 |Not yet migrated        |
|[ReadUsgsNwisDaily]()|                                 |Not yet migrated        |
|[ReadUsgsNwisInstantaneous]()|                                 |Not yet migrated        |
|[ReadUsgsNwisRdb]()|                                 |Not yet migrated        |
|[RemoveFile]()|                                 |Not yet migrated        |
|[ReplaceValue]()|                                 |Not yet migrated        |
|[RunCommands]()|                                 |Not yet migrated        |
|[RunningStatisticTimeSeries]()|                                 |Not yet migrated        |
|[RunProgram]()|                                 |Not yet migrated        |
|[RunPython]()|                                 |Not yet migrated        |
|[RunSql]()|                                 |Not yet migrated        |
|[Scale]()|                                 |Not yet migrated        |
|[SelectTimeSeries]()|                                 |Not yet migrated        |
|[SetConstant]()|                                 |Not yet migrated        |
|[SetDebugLevel]()|                                 |Not yet migrated        |
|[SetEnsembleProperty]()|                                 |Not yet migrated        |
|[SetExcelCell]()|                                 |Not yet migrated        |
|[SetExcelWorksheetViewProperties]()|                                 |Not yet migrated        |
|[SetFromTS]()|                                 |Not yet migrated        |
|[SetInputPeriod]()|                                 |Not yet migrated        |
|[SetOutputPeriod]()|                                 |Not yet migrated        |
|[SetProperty]()|                                 |Not yet migrated        |
|[SetPropertyFromEnsemble]()|                                 |Not yet migrated        |
|[SetPropertyFromTable]()|                                 |Not yet migrated        |
|[SetPropertyFromTimeSeries]()|                                 |Not yet migrated        |
|[SetTableValues]()|                                 |Not yet migrated        |
|[SetTimeSeriesProperty]()|                                 |Not yet migrated        |
|[SetTimeSeriesValuesFromLookupTable]()|                                 |Not yet migrated        |
|[SetTimeSeriesValuesFromTable]()|                                 |Not yet migrated        |
|[SetWorkingDir]()|                                 |Not yet migrated        |
|[ShiftTimeByInterval]()|                                 |Not yet migrated        |
|[SortTable]()|                                 |Not yet migrated        |
|[SortTimeSeries]()|                                 |Not yet migrated        |
|[SplitTableColumn]()|                                 |Not yet migrated        |
|[SplitTableRow]()|                                 |Not yet migrated        |
|[StartLog]()|                                 |Not yet migrated        |
|[StartRegressionTestResultsReport]()|                                 |Not yet migrated        |
|[Subtract]()|                                 |Not yet migrated        |
|[TableMath]()|                                 |Not yet migrated        |
|[TableTimeSeriesMath]()|                                 |Not yet migrated        |
|[TableToTimeSeries]()|                                 |Not yet migrated        |
|[TimeSeriesToTable]()|                                 |Not yet migrated        |
|[UnzipFile]()|                                 |Not yet migrated        |
|[VariableLagK]()|                                 |Not yet migrated        |
|[Wait]()|                                 |Not yet migrated        |
|[WebGet]()|                                 |Not yet migrated        |
|[WriteCheckFile]()|                                 |Not yet migrated        |
|[WriteDateValue]()|                                 |Not yet migrated        |
|[WriteDelftFewsPiXml]()|                                 |Not yet migrated        |
|[WriteDelimitedFile]()|                                 |Not yet migrated        |
|[WriteHecDss]()|                                 |Not yet migrated        |
|[WritePropertiesToFile]()|                                 |Not yet migrated        |
|[WriteReclamationHDB]()|                                 |Not yet migrated        |
|[WriteRiverWare]()|                                 |Not yet migrated        |
|[WriteSHEF]()|                                 |Not yet migrated        |
|[WriteSummary]()|                                 |Not yet migrated        |
|[WriteTableCellsToExcel]()|                                 |Not yet migrated        |
|[WriteTableToDelimitedFile]()|                                 |Not yet migrated        |
|[WriteTableToExcel]()|                                 |Not yet migrated        |
|[WriteTableToGeoJSON]()|                                 |Not yet migrated        |
|[WriteTableToHTML]()|                                 |Not yet migrated        |
|[WriteTableToKml]()|                                 |Not yet migrated        |
|[WriteTableToShapefile]()|                                 |Not yet migrated        |
|[WriteTimeSeriesPropertiesToFile]()|                                 |Not yet migrated        |
|[WriteTimeSeriesToDataStore]()|                                 |Not yet migrated        |
|[WriteTimeSeriesToDataStream]()|                                 |Not yet migrated        |
|[WriteTimeSeriesToExcel]()|                                 |Not yet migrated        |
|[WriteTimeSeriesToExcelBlock]()|                                 |Not yet migrated        |
|[WriteTimeSeriesToGeoJSON]()|                                 |Not yet migrated        |
|[WriteTimeSeriesToHydroJSON]()|                                 |Not yet migrated        |
|[WriteTimeSeriesToJson]()|                                 |Not yet migrated        |
|[WriteTimeSeriesToKml]()|                                 |Not yet migrated        |
|[WriteWaterML]()|                                 |Not yet migrated        |
|[WriteWaterML2]()|                                 |Not yet migrated        |
