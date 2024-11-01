# TSTool / Release Notes / Version 11 #

**The contents of this page have been minimally formatted.**

*   [Changes in Versions 11.11.00 – 11.13.00](#changes-in-versions-111100-111300)
*   [Changes in Versions 11.09.00 – 11.10.01](#changes-in-versions-110900-111001)
*   [Changes in Versions 11.08.00 – 11.08.01](#changes-in-versions-110800-110801)
*   [Changes in Versions 11.07.00 – 11.07.06](#changes-in-versions-110700-110706)
*   [Changes in Versions 11.06.00 – 11.06.01](#changes-in-versions-110600-110601)
*   [Changes in Version 11.05.00](#changes-in-version-110500)
*   [Changes in Versions 11.04.00 – 11.04.03](#changes-in-versions-110400-110403)
*   [Changes in Versions 11.03.00 – 11.03.10](#changes-in-versions-110300-110310)
*   [Changes in Versions 11.02.00 – 11.02.02](#changes-in-versions-110200-110202)
*   [Changes in Version 11.01.00](#changes-in-version-110100)
*   [Changes in Version 11.00.00](#changes-in-version-110000)

-----------------

## Changes in Versions 11.11.00 – 11.13.00 ##

*   ![bug](bug.png) [11.13.00] Datastore configuration files for USGS NWIS and NRCS AWDB web services have been changed to use https URLs based on changes in the web services.
*   ![bug](bug.png) [11.13.00] The ReadUsgsNwisInstantaneous() command previously hard-coded the time series interval as 15Min when the transfer file is WaterML 1.1.  This was an issue for some stations where the data included irregular-interval.  The command now requires that the interval is specified and performs checks to make sure data are aligned with the selected interval.
*   ![bug](bug.png) [11.13.00] The StartLogFile() command did not properly handle ${Property} notation, for example when using ${TempDir}.  This has been fixed.
*   ![bug](bug.png) [11.13.00] The WriteDelimitedFile() command did not properly handle irregular time series and could generate large output files.  The command has been updated to allow writing one irregular interval time series.
*   ![bug](bug.png) [11.12.00] Fix bug where the CompareTables() command CompareColumns parameter was not being recognized.
*   ![bug](bug.png) [11.11.00] The ReadTableFromExcel() command now ensures that column heading cells that are numbers are treated as integers (e.g. year) so that the formatting of headers is correct.  The ColumnIncludeFilters and ColumnExcludeFilters parameter handling has also been updated to work as documented.
*   ![bug](bug.png) [11.11.00] The ReadDelfFewsPiXml() command generated an error when the time zone offset was not specified.  The command will now default to the file time zone.
*   ![new](new.png) [11.13.00] Text report windows now have a search feature.
*   ![new](new.png) [11.13.00] An enhanced mouse tracker has been added to graph windows, which displays time series values on the graph.
*   ![new](new.png) [11.13.00] Clicking on a time series in the graph legend now will highlight the time series in the legend and graph for line graphs.  See the SelectTimeSeriesLineWidth product property.
*   ![new](new.png) [11.12.00] New processor properties have been added to facilitate automation: ComputerName, ComputerTimeZone, TempDir, UserName.
*   ![new](new.png) [11.11.00] The DeleteTableColumns() command has been added.
*   ![new](new.png) [11.12.02] The SetPropertyFromTimeSeries() command has been added.
*   ![new](new.png) [11.13.00] The graphing tool has been updated with new functionality:
    +   LeftYAxisTitlePosition and LeftYAxisTitleRotation graph properties allow left y-axis title to be positioned, including rotating to run vertically.
    +   Right y-axis is now supported with properties similar to the left y-axis.  Time series default to the left axis but can be associated with the right y-axis.
    +   Graph annotation properties editor has been updated to be more organized and new rectangle shape has been added for annotations.
    +   A new annotation shape type Rectangle has been added with new Order property BehindAxes to ensure the rectangle does not overwrite other visual data.
    +   A new product property ShowDrawingAreaOutline has been added to facilitate developers working on graph layout.
*   ![change](change.png) [11.12.00] The Add() and Subtract() command have been enhanced to specify the analysis period.
*   ![change](change.png) [11.12.00] The ExpandTemplateFile() command has been enhanced to include StringParameters and TableColumnParameters commands to allow specifying additional input directly to the command.
*   ![change](change.png) [11.11.00] The ManipulateTableString() command Operator=Remove parameter has been added to remove a substring and Operator=Split has been added to return a token from a delimited string.
*   ![change](change.png) [11.12.00] The ReadDelimitedFile() command has been updated to support ${Property} in more parameters and handles dynamic input files created at runtime.
*   ![change](change.png) [11.12.00] The ReadTableFromDelimitedFile() command has been updated to support ${Property} in more parameters and allow specifying which columns are floating point and integers.
*   ![change](change.png) [11.11.00] The SetInputPeriod(), SetOutputPeriod(), and SetProperty()  commands have been enhanced to add “modifiers” on the CurrentToMinute and similar values, allowing rounding to an even interval and setting the time zone.
*   ![change](change.png) [11.12.05] The SetProperty() command now allows setting special values such as null, NaN, and empty string, and removing a property.
*   ![change](change.png) [11.11.00] The SplitTableRow() command now supports splitting transposing “tuples” of values into a vertical column, for example to convert horizontal time series into vertical time series.
*   ![change](change.png) [11.12.03] The ReadTableFromDelimitedFile() command will now automatically detect escaped double quotes in strings and convert to a single double quote.
*   ![change](change.png) [11.11.00] The ReadUsgsNwisRdb() command has been updated to work with current RDB file format.  Only the first time series is read.
*   ![change](change.png) [11.11.00] The SelectTimeSeries() command PropertyName property now allows ${Property}.
*   ![change](change.png) [11.12.00] The SetExcelWorksheetViewProperties() command now allows multiple sheets to be specified and * wildcard can be specified in filenames.
*   ![change](change.png) [11.12.02-11.12.03] The VariableLagK() command has be enhanced to allow states to be saved and read from a table and parameters, and output period can be specified.
*   ![change](change.png) [11.12.03] The WriteRiverWare() command has been enhanced to include WriteHeaderComments parameter.  Also, the SetScale and SetUnits parameters were not being recognized.
*   ![change](change.png) [11.12.03] The WriteTableToDelimitedFile() command will now automatically escape double quotes in strings by writing two double quotes.  Similarly the ReadTableFromDelimitedFile() command will convert two double quotes to one when reading.
*   ![change](change.png) [11.12.00] The WriteTableToGeoJSON() command has been enhanced to include CRSText, IncludeBBox, and IncludeFeatureBBox parameters.
*   ![change](change.png) [11.11.00-11.12.00] The following commands have been enhanced to work with the For() command and recognize ${Property} notation (where appropriate):  CreateDataStoreDataDictionary(), Delta(), Divide(), FillRepeat(),  If(),   JoinTables(),  Multiply(),  ReadUsgsNwisDaily(),  ReadUsgsNwisInstantaneous(),  RunPython(),  SetOutputPeriod(),  SetPropertyFromTable(),   SetWorkingDir(),  SplitTableRow(),  TableTimeSeriesMath(), WriteSummary().

## Changes in Versions 11.09.00 – 11.10.01 ##

*   ![bug](bug.png) [11.10.00] NRCS AWDB hourly time series would sometimes only return values on the hour (hour=0) due to how the web service beginHour and endHour were specified.  These values are now set to 0 and 23, respectively, to return all possible values and are then transferred to the output time series for the requested period.  A bug was also fixed that prevented multiple time series to be read, for example when reading stations for a county.
*   ![bug](bug.png) [11.10.00] TSTool’s handling of time zone has been made more robust.  Internal date/time objects are initialized with the local time zone ID (previously used a display string that may not have allowed lookup of the underlying system time zone).  Greater care is taken to handle daylight savings time.
*   ![bug](bug.png) [11.09.00] Fix bug command status messages where the most severe warning was used for details – now warnings are labelled as such even when failure messages are also present.
*   ![bug](bug.png) [11.10.00] Fix bug in ReadHecDss() command where specifying input period was not working (resulted in input period request with year of 0000).
*   ![bug](bug.png) [11.10.00] Fix bug in WriteHecDss() command where errors were caught but themselves generated an exception when printing.  Errors about > 80 character paths and unsupported interval are now printed without exceptions.
*   ![new](new.png) [11.09.00] TSTool user configuration files are now enabled under the user’s home folder in a .tstool folder, in order to override the settings in the software installation configuration files.  Datastore types can be enabled/disabled in the .tstool/system/TSTool.cfg file and datastore configuration files can be added under the .tstool/datastore folder.  The startup log file is now created in .tstool/log.  These changes allow TSTool settings to be persisted across software updates and allow different users to have different TSTool settings when using a shared TSTool installation in a network environment.
*   ![new](new.png) [11.10.00] Preliminary support has been added for plugin commands, which allows third-party software developers to add custom commands.  Documentation will be provided in a later release.
*   ![new](new.png) [11.10.00] Commands can now be edited as text, as an option to the editor dialog.
*   ![new](new.png) [11.10.00] The Tools / Date/time Tools provides useful tools for converting between time zones and other date/time representations.
*   ![new](new.png) [11.09.00] The popup menu on duration graphs now provides an Analysis Details menu to view the table of data values used in the graph.
*   ![new](new.png) [11.10.00] Add preliminary new  ChangeInterval()commands to provide more direct functionality rather than existing command that does a lot but can be confusing.
*   ![new](new.png) [11.10.00] Add preliminary new  SendEmailMessage()command to facilitate notification when running TSTool in batch mode as a scheduled process.  Functionality is limited.
*   ![new](new.png) [11.09.00] Add SetEnsembleProperty()command.
*   ![new](new.png) [11.10.00] Implement prototype HTML documentation for commands.  HTML documentation will be phased in and evaluated.  See the Help button in the SortTimeSeries() command for an example.
*   ![change](change.png) [11.10.00] Dates in time series were internally defaulting to the local computer time zone using Java display.  This might result in “MDT” for example when the time zone is actually “MST7MDT”.  The time zone is now defaulted to the time zone ID, for example America/Denver.  This can impact cases were the TSTool date/time is converted to UNIX time (seconds since Jan 1, 1970 00:00:00).  The new functionality is a more accurate representation of the actual time zone.
*   ![change](change.png) [11.10.01] Date/time strings parsing now handles longer time zones better.  For example, date/time strings that are saved to DateValue files now can have longer time zones such as America/Denver.
*   ![change](change.png) [11.09.01] Dialogs and other windows now open in the same screen as the main TSTool window.  Multiple monitors are properly handled.
*   ![change](change.png) [11.09.00] The ARMA() command has been updated to include properties OutputMinimum, OutputMaximum, InputPreviousValues, OutputPreviousValues, RequireCoefficienctsSumTo1.  The command has also been updated to optionally create new output time series.  The OutputStart and OutputEnd parameters have been enabled (previously the time series period was always used).
*   ![change](change.png) [11.10.00] The CompareTimeSeries() command now allows two time series or two ensembles to be specified for comparison.
*   ![change](change.png) [11.10.00] The CreateDataStoreDataDictionary() command now handles periods and $ characters in the ExcludeTables command.
*   ![change](change.png) [11.10.00] The For() command now handles allows other processor properties to be set for other column values.
*   ![change](change.png) [11.09.00] The NewStatisticYearTS() command now will process multiple time series and optionally create an ensemble as output.
*   ![change](change.png) [11.09.00] Update the ReadDelftFewsPiXml() command to have TimeZone and Read24HourAsDayCutoff parameters to provide additional control of output time series.
*   ![change](change.png) [11.09.00] Update the ReadNrcsAwdb() command to have TimeZoneMap parameter to provide control of time zone used for output time series, and default the time zone for date/times to stationDataTimeZone from data.  Time zone is typically only shown in displays for hourly or smaller data interval.
*   ![change](change.png) [11.09.00] The RunProgram() command has been significantly enhanced to provide options for checking the program output for errors.
*   ![change](change.png) [11.09.00] The WebGet() command has been updated to have the OutputProperty parameter to set the retrieved content in a property.
*   ![change](change.png) [11.09.00] The WriteHecDss() command has been updated to handle minute data.
*   ![change](change.png) [11.09.00 – 11.10.00] The following commands have been enhanced to work with the For() command and recognize ${Property} notation (where appropriate):  CompareFiles(), CompareTimeSeries(), CopyFiles(), CreateRegressionTestCommandFile(), Cumulate(), ProfileCommands(), RunProgram(), NewEnsemble(), ReadNrcsAwdb(), ReadTableFromDBF(), SetDebugLevel(), SetTableValues(), SortTimeSeries(), StartLog(), WriteCheckFile.

## Changes in Versions 11.08.00 – 11.08.01 ##

*   ![bug](bug.png) [11.08.01] Fix bug in ReadReclamationHDB() command query filter – where choices were causing an error.
*   ![bug](bug.png) [11.08.00] Fix the NewTreeView() command to output (was not working) and add ability to include time series products in the tree rather than simply relying on basic default graph.
*   ![bug](bug.png) [11.08.00] Fix bug when Clear Commands was selected and a new command file was opened, the previously opened command file contents were cleared.  Now the previous contents will remain because there is little reason to blank out the file.  Another bug fixed was that a non-zero length file was auto-saving when a new file was opened.  These bugs were introduced in version 11.07.05.
*   ![new](new.png) [11.08.01] Add Run / Cancel Command Processing (interrupt processing) menu to perform an interrupt on processing – can be used when a long process needs to be killed.
*   ![new](new.png) [11.08.01] Add new experimental run mode –batchServer that will run TSTool continuously in headless mode in order to run command files placed into a hot folder.
*   ![new](new.png) [11.08.01] Add new experimental run mode –httpServer that will run TSTool as an HTTP server to listen for processing requests.
*   ![new](new.png) [11.08.00] Add ReadDelftFewsPiXML()and WriteDelftFewsPiXml() commands to handle DEFT FEWS PI XML files (software is used by the National Weather Service).
*   ![new](new.png) [11.08.00] Add WriteTableToGeoJSON()and WriteTableToShapefile() commands to generate basic point and polygon spatial output products.
*   ![new](new.png) [11.08.01] Add WriteTimeSeriesToGeoJSON()command to generate basic point and polygon spatial output products.
*   ![change](change.png) [11.08.01] The ReclamationHDB query filters now include model run date, as a string.
*   ![change](change.png) [11.08.00] The For()command now supports integer or floating point number sequences.
*   ![change](change.png) [11.08.00] The FormatTableDateTime()command now handles converting from a starting date/time and column of incremental offsets from the start.
*   ![change](change.png) [11.08.00] The ManipulateTableString(operator=Replace)command is updated to specify start and end of string and handle space characters.
*   ![change](change.png) [11.08.00] The ReadDateValue() and UnzipFile() commands now handle gzip (`*.gz`) files.
*   ![change](change.png) [11.08.00] The TableToTimeSeries()command has been updated to have SequenceIDColumn and SequenceID parameters to read time series for ensemble traces.  The IrregularIntervalPrecision parameter has also been added to control the precision of date/times in time series, in particular when parsing tables from database queries.
*   ![change](change.png) [11.08.00] The WriteTableToExcel() command has been updated to support strings in conditional formatting and integers are handled explicitly (not as floating point).
*   ![change](change.png) [11.08.00-11.08.01] The following commands have been enhanced to work with the For() command and recognize ${Property} notation:  ConvertDataUnits(), ManipulateTableString(), ReadHecDss(), ReadRiverWare(),  ReadTableFromDBF(),  ReadTimeSeriesFromDataStore(), SetExceWorksheetViewProperties(), VariableLagK(), WriteHecDss(),  WriteRiverWare(), WriteTimeSeriesToDataStore(), WriteTimeSeriesToKml().

## Changes in Versions 11.07.00 – 11.07.06 ##

*   ![bug](bug.png) [11.07.00] Fix bug when reading dates from databases – precision was not being set and output defaulted to minute formatting.  Now precision is set to the finest level of data from the date with second as smallest interval.
*   ![bug](bug.png) [11.07.03] Fix the TableToTimeSeries() command to handle numeric values in text column, discard periods in data fields when forming TSIDs.
*   ![bug](bug.png) [11.07.03] Fix the WriteTimeSeriesToExcel() command – there was a bug writing to a range that did not start with cell A1.
*   ![bug](bug.png) [11.07.06] Improve batch mode execution start-up – fix timeout exception for 0 seconds.
*   ![change](change.png) [11.07.00] Change missing value for database values from -999 to NaN and smallest available integer.  This ensures that no valid data are misinterpreted as missing.
*   ![change](change.png) [11.07.00] Enhance the CheckTimeSeries() command to have TableValuePrecision parameter to control precision of value column in check output.
*   ![change](change.png) [11.07.03] Enhance the CreateDataStoreDataDictionary() command to have Newline , SurroundWithPre, and EncodeHtmlChars parameters to control formatting.
*   ![change](change.png) [11.07.01] Enhance the FormatTableDateTime() command to support %s format (seconds since Jan 1, 1970), useful for time comparisons.
*   ![change](change.png) [11.07.03] Enhance the ReadDateValue() command to handle a zipped input file.
*   ![change](change.png) [11.07.03] Enhance the ReadTableFromDataStore() command to recognize ${Property} for the table identifier.
*   ![change](change.png) [11.07.01] Enhance the ReadTableFromDelimitedFile() command to have the DateTimeColumns, TextColumns, and Top parameters.
*   ![change](change.png) [11.07.03] Enhance the ReadTimeSeries() command to recognize ${Property}.
*   ![change](change.png) [11.07.02] Allow SetInputPeriod() to have start, end or both date/times when reading time series using TSID. Previously both were required.  This will be phased into each input type.
*   ![change](change.png) [11.07.01] Enhance the TableMath() command to allow math operations on 2 integers, 2 double precision values, or a combination.  Add support for ${Property} for TableID.
*   ![change](change.png) [11.07.00] Enhance the TableToTimeSeries() command to provide minute and second in time format, also allow DataType to be specified with ${Property}.
*   ![change](change.png) [11.07.05] Enhance the WebGet() command to display more error information.
*   ![change](change.png) [11.07.00] Enhance the WriteDateValue() command to support wildcards in the IncludeProperties parameter.
*   ![change](change.png) [11.07.00] Enhance the WriteTimeSeriesToDataStream() command to support ${Property} in parameters, add parameters to read header and footer from files and specify different format for last data line.
*   ![change](change.png) [11.07.03] Enhance the WriteTableToExcel() and WriteTimeSeriesToExcelBlock() commands to allow for a display string for the legend.
*   ![change](change.png) [11.07.03] Enhance the WriteWaterML() command to support writing WaterML 1.1 as JSON and WaterMl 2.0 as XML.  Functionality is preliminary pending further review.
*   ![change](change.png) [11.07.03] The FilledDataSymbolStyle in graphs will have the same value as SymbolStyle by default so that a symbol is shown at all non-missing points.
*   ![change](change.png) [11.07.05] Change SQL Server to not use a port when an instance of the database has been specified (port is redundant in this case).  Update the HydroBase database configuration to specify the instance in all cases.  Remove old SQL Server port numbers that are no longer used for HydroBase.
*   ![new](new.png) [11.07.00] Initial support for Reclamation Pisces database has been added as datastore with TSID command support.
*   ![new](new.png) [11.07.03] Added ReadReclamationPisces() command.
*   ![new](new.png) [11.07.05] Added ReadTableFromJSON() command.
*   ![new](new.png) [11.07.03] Added UnzipFile() command.
*   ![new](new.png) [11.07.03] Added initial WriteTimeSeriesToHydroJSON() command.

## Changes in Versions 11.06.00 – 11.06.01 ##

*   ![remove](remove.png) [11.06.00] The MexicoCSMN input type has been removed because the data format is obsolete.
*   ![change](change.png) [11.06.00,11.06.01] Enhance the CloseExcelWorkbook() command to have more control of  writing the output file, to better handle reading and writing from Excel.
*   ![change](change.png) [11.06.00] Update the ChangePeriod() command to support ${Property} in parameters.
*   ![new](new.png) [11.06.00] The ReadExcelWorkbook() command has been added to allow reading and Excel workbooks so that they can be modified with commands that write to Excel.

## Changes in Version 11.05.00 ##

*   ![bug](bug.png) [11.05.00] Fix bug in CalculateTimeSeriesStatistic() command where the table ID was not visible to following command editors when using ${Property} for the table ID.
*   ![change](change.png) [11.05.00] Add date/time to the output for CalculateTimeSeriesStatistic() command for appropriate statistics like Max and Min.

## Changes in Versions 11.04.00 – 11.04.03 ##

*   ![bug](bug.png) [11.04.00] Fix bug in ReadTableFromExcel() command where the table ID was not visible to following command editors when using ${Property} for the table ID.
*   ![change](change.png) [11.04.03] The TSTool main interface now lists all output files.  Previously commands run in a For() loop would only list the files from the last iteration.  Command messages for commands run with RunCommands() are also now listed in the main interface to facilitate troubleshooting.
*   ![change](change.png) [11.04.00] The following commands now accept ${Property} notation for at least some parameters (those that likely need to be set dynamically and provide an editor text field for the parameter): AppendTable(), ChangeInterval(), Subtract().
*   ![change](change.png) [11.04.00] The TableToTimeSeries() command has been updated to remove hard-coded internal parameter values for block format data.  Year rows and month columns can now be read for single or multiple time series.
*   ![change](change.png) [11.04.00] The WriteTimeSeriesToExcel() command has been updated to provide parameters for style formatting of column heading cells.  Parameters are also available for comment width and height and logic for comment size has been improved.
*   ![change](change.png) [11.04.03] The WriteTableToExcel(), WriteTimeSeriesToExcel() and WriteTimeSeriesToExcelBlock() commands now have LegendWorksheet and LegendAddress commands to include a legend for style formatting (preliminary functionality).

## Changes in Versions 11.03.00 – 11.03.10 ##

*   ![bug](bug.png) [11.03.05] The Exit() command can now be included in If() blocks – previously Exit() would always execute.
*   ![bug](bug.png) [11.03.06] The SetTimeSeriesValuesFromLookupTable() command now ignores rows from the lookup table that have missing values in the input or output columns.  Previously output would sometimes have missing values where estimates could be determined.
*   ![change](change.png) [11.03.00] Enhanced the Introduction chapter to explain and contrast templates compared to built-in TSTool logic control commands.
*   ![change](change.png) [11.03.00] The following commands now accept ${Property} notation for at least some parameters (those that likely need to be set dynamically and provide an editor text field for the parameter):  Add(), AddConstant(), CalculateTimeSeriesStatistic(), CheckTimeSeries(), Copy(), CopyTable(), CopyTimeSeriesPropertiesToTable(), ExpandTemplateFile(), FillConstant(), FillRegression(),  FormatTableDateTime(), FormatTableString(), InsertTableColumn(), NewPatternTimeSeries(), NewStatisticYearTS(),  NewTimeSeries(), ProcessTSProduct(),  ReadTableFromDelimitedFile(), ReadTimeSeriesList(), RemoveFile(), Scale(), SelectTimeSeries(), SetConstant(),  SetFromTS(), SetTimeSeriesProperty(), ShiftTimeByInterval(), SortTable(), TableToTimeSeries(), TimeSeriesToTable(), WriteDelimitedFile(),  WriteTableToDelimitedFile().
*   ![change](change.png) [11.03.01] More of the above:  NewEndOfMonthTSFromDayTS(), ReplaceValue.
*   ![change](change.png) [11.03.02] More of the above:  AppendFile(), NewExcelWorkbook(), ReadTableFromExcel(), RunningStatisticTimeSeries(),  WriteTableToHTML(), WriteTableToExcel().
*   ![change](change.png) [11.03.03] More of the above:  CloseExcelWorkbook(),  NewTable(),  ReadDelimitedFile(), WriteDateValue().
*   ![change](change.png) [11.03.04] More of the above: SetTimeSeriesValuesFromTable(),  SetTimeSeriesValuesFromLookupTable().
*   ![change](change.png) [11.03.07] More of the above: FillHistMonthAverage(),  FillInterpolate().  Also add the fill flag description to the FillInterpolate() command.
*   ![change](change.png) [11.03.09] More of the above: AdjustExtremes().  Also add set flag and description.
*   ![change](change.png) [11.03.10] More of the above: FillPattern(), FillFromTS().  
*   ![change](change.png) [11.03.06] The CalculateTimeSeriesStatistic() command Last statistic functionality has been changed to LastNonmissing and the Last statistic returns the last missing or non-missing value.  The analysis window is now also recognized by these statistics.  This addresses an ambiguity in the meaning of “last”.
*   ![change](change.png) [11.03.08] The CheckTimeSeries() command now will optionally output properties with the count of issues and create a table listing issues.  An analysis window can also now be specified.
*   ![change](change.png) [11.03.01] The CopyTimeSeriesPropertiesToTable() command PropertyNames parameter has been changed to IncludeProperties, backward compatible.
*   ![change](change.png) [11.03.01] The For() command can now be nested.  Command status messages are accumulated on each command regardless of how many loops for commands updated to handle properties above.
*   ![change](change.png) [11.03.06] The ReadTableFromExcel() command now provides the RowCountProperty parameter to set the rows read, useful for error handling.
*   ![change](change.png) [11.03.02] The ReadTimeSeriesList() command has been updated to have TimeSeriesDefaultCountProperty and TimeSeriesReadCountProperty parameters to help with error handling.
*   ![change](change.png) [11.03.02] The ReplaceValue() command now provides the SetFlagDesc parameter.
*   ![change](change.png) [11.03.05] The SetFromTS() command now handles setting data when the time series have different intervals.
*   ![change](change.png) [11.03.07] The WriteTableToExcel() and WriteTimeSeriesToExcel() commands include functionality for formatting cells using a condition/style table approach, similar to Excel conditional formatting.
*   ![new](new.png) [11.03.01] The empty line command has been added so that blank lines in command files are handled gracefully and not treated as unknown commands.  See under comment commands.
*   ![new](new.png) [11.03.00] The #@template comment is now supported to indicate a template file, with special handling when saving files.
*   ![new](new.png) [11.03.09] The WriteTimeSeriesToExcelBlock() command has been added.  This replaces the WriteTimeSeriesToExcelFormatted() command.

## Changes in Versions 11.02.00 – 11.02.02 ##

*   ![bug](bug.png) [11.02.00] The path used to remember the command file history was hard-coded for Windows.  It is now fixed to work on Linux.
*   ![bug](bug.png) [11.02.00] Fix bug in NewTimeSeries() command editor where InitialValue was reset to blank.
*   ![bug](bug.png) [11.02.01] Fix bug in ReadNrcsAwdb() command where forecast table dates were saved as strings even though table column was configured as a date/time – now use date/times for all.
*   ![bug](bug.png) [11.02.00] Remove limitation that the ReadTableCellsFromExcel() command would not handle Excel date cells.
*   ![change](change.png) [11.02.00] The AppendFile() command now provides the Newline parameter to specify the newline for output files, necessary to ensure that automated tests work on different platforms.
*   ![change](change.png) [11.02.00] The CalculateTimeSerieStatistic() command now allows setting a time series property with the statistic value.  Table output is also handled better.
*   ![change](change.png) [11.02.00] The FormatTableDateTime() command now handles an input column that contains a string version of the date/time.
*   ![change](change.png) [11.02.00] The If() command now allows comparing floating point numbers, Booleans, and integers and the comparison can be forced to do a string comparison.
*   ![change](change.png) [11.02.00] The ManipulateTableString() command now provides parameters to filter the rows to process.
*   ![change](change.png) [11.02.00] The NewEndOfMonthTSFromDayTS() command now accepts ${Property} for the daily time series identifier parameter.
*   ![change](change.png) [11.02.00] The ReadDateValue() command now allows processor properties for the input period.  The WriteDateValue() command now allows processor properties for the output period.  Both commands support the DateValue file 1.6 format, which adds support for time series properties and data flag descriptions.
*   ![change](change.png) [11.02.02] The ReadTableFromDataStore() command now provides the RowCountProperty parameter to set a property for the row count.
*   ![change](change.png) [11.02.00] The ReadTableFromExcel() command now provides the ColumnIncludeFilters parameter to filter which rows are read, and ExcelDateTimeColumns and ExcelTextColumns to specify how to handle data types.
*   ![change](change.png) [11.02.00] The SetFromTS() command now allows a set flag to be specified and the set period can be specified using ${Property} notation.
*   ![change](change.png) [11.02.00] The SetInputPeriod() command now supports ${Property} notation.
*   ![change](change.png) [11.02.00] The SetOutputPeriod() command now supports ${Property} notation.
*   ![change](change.png) [11.02.00] The SetProperty() command now allows Boolean values.
*   ![change](change.png) [11.02.00] The WritePropertiesToFile() command now allows wildcards to match property names.
*   ![change](change.png) [11.02.03] The WritePropertiesToFile() command IncludeProperty has been changed to IncludeProperties.
*   ![new](new.png) [11.02.00] The ProgramVersionString and ProgramVersionNumber processor properties are now set.  These can be used to handle logic in command files when multiple versions of TSTool may be used.  Use the If() command to check the property.
*   ![new](new.png) [11.02.00] The ReadPropertiesFromExcel() command has been added.
*   ![new](new.png) [11.02.02] The SetTimeSeriesValuesFromTable() command has been added.
*   ![new](new.png) [11.02.00] The WriteTimeSeriesPropertiesToFile() command has been added.

## Changes in Version 11.01.00 ##

*   ![change](change.png) [11.01.00] The InsertTableColumn() command now provides the InitialValue parameter to set the initial value in the column.
*   ![change](change.png) [11.01.00] The ReclamationHDB datastore configuration file now supports the ResultSetFetchSize and WriteToHDBInsertStateMentMax parameter to optimize performance.   The default value for ReadNHourEndDateTime is now StartDateTimePlusInterval, which is appropriate for the current HDB.
*   ![change](change.png) [11.01.00] The WritePropertiesToFile() command now provides the SortOrder parameter to sort properties for output.  Build-in and user properties are fully supported.
*   ![new](new.png) [11.01.00] The ReclamationHDB datastore SystemLogin and SystemPassword properties can now be set to Prompt to cause a dialog to be shown when TSTool starts.  The login can also be changed using the File / Open / ReclamationHDB menu.  Database connections that timeout due to non-use now are reconnected automatically.
*   ![new](new.png) [11.01.00] Added the ReadPropertiesFromExcel() command.

## Changes in Version 11.00.00 ##

*   ![bug](bug.png) [11.00.00] Fix bug where Cummulate(…,ResetValue=DataValue,…) parameter was not being handled and the first value in each output year was set to zero.
*   ![bug](bug.png) [11.00.00] Fixed bug in HydroBase daily diversion read code.  Years after a full blank year also were skipped and the carry forward processing during the year did not occur.
*   ![bug](bug.png) [11.00.00] The FillRepeat() command editor was not saving the TSList parameter in the command string.
*   ![bug](bug.png) [11.00.00] The FillUsingDiversionComments() command used with HydroBase was filling missing data in the whole period with zeros when CIU was H, I, or N.  Handling of flags has been improved.  Filling was ignoring DivClass and RelClass time series.  The command editor has been restructured to be more clear.
*   ![bug](bug.png) [11.00.00] The FormatTableString() command now supports formatting syntax like %05.1f to pad floating point number output with leading zeros.  This is a global change for all features that perform similar formatting.
*   ![bug](bug.png) [11.00.00] Fix bug in HEC-DSS code where new location type part of TSID was not handled.  The location type is now equivalent to the A part in the HEC-DSS path.
*   ![bug](bug.png) [11.00.00] Fix bug where time series for HydroBase structures were listed in the main TSTool interface using longitude for latitude.
*   ![change](change.png) [11.00.00] Upgrade from Java 6 to Java 7.  Java 6 is no longer being supported by Oracle and Java 7 provides performance increases and many enhancements.
*   ![change](change.png) [11.00.00] Upgrade FreeMarker templating library from version 2.3.15 to version 2.3.21.  There are many enhancements and in particular error messages are more user-friendly.
*   ![change](change.png) [11.00.00] The For() command now allows iterating over a list of specified values and error handling has been improved.
*   ![change](change.png) [11.00.00] The FormatTableString() command now has InsertBeforeColumn parameter to control the position of the new column.
*   ![change](change.png) [11.00.00] The HydroBaseDataStore now allows the OdbcName property to be set to an ODBC DSN for the SQL Server database connection.  This may be useful for troubleshooting or in cases where authentication is different than the default for HydroBase.
*   ![change](change.png) [11.00.00] The JoinTables() command now has the HandleMultipleJoinMatchesHow parameter to specify how multiple matches are handled in the joined table.
*   ![change](change.png) [11.00.00] The NrcsAwdbDataStore now recognizes the ConnectTimeout and ReadTimeout properties to be set.  These properties are useful to prevent TSTool from hanging when the NRCS web services are unavailable.
*   ![change](change.png) [11.00.00] The SortTable() command now supports sorting by multiple columns, each with sort order.
*   ![change](change.png) [11.00.00] The WriteTableToExcel() command now allows columns and rows to be excluded from writing.  Output column widths can also now be set globally for empty columns.
*   ![change](change.png) [11.00.00] Table commands have been moved to a Commands/Table menu to provide more room to grow.
*   ![change](change.png) [11.00.00] The View / Datastores display now includes datastore properties for enabled, status, status message, and ODBC DSN.
*   ![new](new.png) [11.00.00] Allow users to select recent files when opening command files.
*   ![new](new.png) [11.00.00] Add command line argument –batchTimeout Seconds, which is useful when TSTool hangs accessing a datastore.
*   ![new](new.png) [11.00.00] Add CloseDataStore() command.
*   ![new](new.png) [11.00.00] Add CloseExcelWorkbook() command.
*   ![new](new.png) [11.00.00] Enable the DiffProgram TSTool configuration file property.  If set to the path for a program such as KDiff3, the program can be called from some user interface features to compare files, such as the CompareFiles() editor.
*   ![new](new.png) [11.00.00] Add FormatStringProperty() command.
*   ![new](new.png) [11.00.00] Add SetExcelCell() command.
*   ![new](new.png) [11.00.00] Add SetExcelWorksheetViewProperties() command.
*   ![new](new.png) [11.00.00] Add SetPropertyFromTable() command.
*   ![new](new.png) [11.00.00] Add SplitTableColumn() command.
*   ![new](new.png) [11.00.00] Add SplitTableRow() command.
*   ![new](new.png) [11.00.00] Add Wait() command.
*   ![new](new.png) [11.00.00] Add functional WriteTimeSeriesToExcel() and experimental WriteTimeSeriesToExcelFormatted() command.
