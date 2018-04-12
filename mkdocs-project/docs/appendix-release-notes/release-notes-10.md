# TSTool / Release Notes / Version 10 #

**The contents of this page have been minimally formatted.**

* [Changes in Version 10.31.00](#changes-in-version-103100)
* [Changes in Versions 10.30.00 – 10.30.02](#changes-in-versions-103000-103002)
* [Changes in Version 10.29.00](#changes-in-version-102900)
* [Changes in Versions 10.28.00 – 10.28.02](#changes-in-versions-102800-102802)
* [Changes in Versions 10.27.00](#changes-in-versions-102700)
* [Changes in Versions 10.26.00](#changes-in-versions-102600)
* [Changes in Versions 10.25.00](#changes-in-versions-102500)
* [Changes in Versions 10.24.00 – 10.24.01](#changes-in-versions-102400-102401)
* [Changes in Version 10.23.00](#changes-in-version-102300)
* [Changes in Version 10.22.00 – 10.22.01](#changes-in-version-102200-102201)
* [Changes in Version 10.21.00](#changes-in-version-102100)
* [Changes in Version 10.20.00](#changes-in-version-102000)
* [Changes in Version 10.19.00](#changes-in-version-101900)
* [Changes in Version 10.18.00](#changes-in-version-101800)
* [Changes in Version 10.17.00](#changes-in-version-101700)
* [Changes in Version 10.16.00](#changes-in-version-101600)
* [Changes in Versions 10.15.00](#changes-in-versions-101500)
* [Changes in Versions 10.14.00](#changes-in-versions-101400)
* [Changes in Versions 10.13.00](#changes-in-versions-101300)
* [Changes in Versions 10.12.00](#changes-in-versions-101200)
* [Changes in Versions 10.11.00](#changes-in-versions-101100)
* [Changes in Versions 10.10.00](#changes-in-versions-101000)
* [Changes in Versions 10.09.00](#changes-in-versions-100900)
* [Changes in Versions 10.08.00](#changes-in-versions-100800)
* [Changes in Versions 10.07.00](#changes-in-versions-100700)
* [Changes in Versions 10.06.00 – 10.06.01](#changes-in-versions-100600-100601)
* [Changes in Versions 10.05.00](#changes-in-versions-100500)
* [Changes in Versions 10.04.00](#changes-in-versions-100400)
* [Changes in Versions 10.03.00](#changes-in-versions-100300)
* [Changes in Versions 10.02.00](#changes-in-versions-100200)
* [Changes in Versions 10.01.00 – 10.01.01](#changes-in-versions-100100-100101)
* [Changes in Versions 10.00.00 – 10.00.05](#changes-in-versions-100000-100005)

----

## Changes in Version 10.31.00 ##

* Bug Fix [10.31.00] Fix bug where WriteTableToExcel() command generated errors when columns containing other than strings were specified.
* Bug Fix [10.31.00] Fix bug where SetFromTS() command was not handling cases where input and output time series used different missing values.
* Bug Fix [10.31.00] Fix bug where time series identifier/alias choices included commands, which could then cause command editor dialogs to be very wide.  The bug was due to adding support for TSIDs containing parentheses in version 10.30.02.
* Change [10.31.00] The AnalyzeNetworkPointFlow command has been updated to allow time series identifiers for input time series to be specified by a column in the input table.
* Change [10.31.00] Added the HandleDuplicatesHow parameter to the TableToTimeSeries() command.
* Change [10.31.00] Add the MonthTestValues parameter to the NewStatisticTimeSeries() command.
* Change [10.31.00] Changed the SetTimeSeriesPropertiesFromTable() command to set the original object types (integer, floating point number, string, etc.). Previously all table values were converted to string time series properties.
* New Feature [10.31.00] Preliminary For() and EndFor() commands have been added to support basic looping.

## Changes in Versions 10.30.00 – 10.30.02 ##

* Bug Fix [10.30.01] Fix bug where NRCS web service returning null start date for time series was not handled.
* Change [10.30.02] Allow any part of a time series identifier (TSID) to include parentheses.
* Change [10.30.01] Add support for port number in Reclamation HDB datastore connection.
* Change [10.30.00] Added the TimeSeriesIndex1Property parameter to the ReadTimeSeriesList() command to allow additional control over processing.
* Change [10.30.00] Added the CopyProperties parameter to the RunningStatisticTimeSeries() command to copy properties from the parent time series.
* Change [10.30.00] The CalculateTimeSeriesStatistic() command has been updated to allow time series properties in command parameters for the output table column names.
* New Feature [10.30.00] The InsertTableColumn() command has been added.

## Changes in Version 10.29.00 ##

* Bug Fix [10.29.00] TSID commands for ColoradoWaterSMS web services were not working reliably – a fix to how the period was specified was implemented.
* Change [10.29.00] The CopyTable() command has been updated to provide the ExcludeColumnFilters parameter to limit rows that are copied.
* Change [10.29.00] The FormatTableDateTime() command has been updated to provide the InsertBeforeColumn parameter to control insertion of the new output column.
* Change [10.29.00] The ReadTimeSeriesList() command editor has been updated to a tabbed interface and new parameters ColumnProperties, and TimeSeriesCountProperty have been added to set properties for use in later commands.
* Change [10.29.00] The WriteTableToExcel() command editor has been updated to a tabbed interface and new parameters ColumnCellTypes, ColumnWidths, and ColumnDecimalPlaces have been added to more precisely control output.

## Changes in Versions 10.28.00 – 10.28.02 ##

* New Feature [10.28.00] The ReadTableFromFixedFormatFile() command has been added.
* New Feature [10.28.00] A preliminary version of the NewStatisticMonthTimeSeries() command has been added, which supports daily time series input.
* New Feature [10.28.00] Update the table view to display irregular time series.
* Change [10.28.02] Changes to Reclamation HDB features:  ensemble name is now a query filter and listed in time series metadata, agency is specified when requesting trace model run identifiers, NWS ensemble files have a property index1 to facilitate HDB/RiverWare integration.
* Change [10.28.01] Update the AppendFile() command to have an ExcludeText parameter.
* Change [10.28.00] Features to browse the Reclamation HDB database have been updated based on user feedback.  The Properties parameter has been added to the ReadReclamationHDB() command and can be used to set the TableViewHeaderFormat to control table header display and the tsp:LegendFormat to control the legend in time series graphs.  These properties default to appropriate values for model and ensemble traces.
* Change [10.28.00] The LegendFormat property in time series product files now allows ${ts:Property} notation to be used to format time series properties in the legend.

## Changes in Versions 10.27.00 ##

* Bug Fix [10.27.00] The editors for the CheckTimeSeries() and CheckTimeSeriesStatistic() commands were removing the = from >= and <= constraints – this has been fixed.
* Change [10.27.00] TSTool documentation is now being created using a tool that allows control over merging – the old table of contents is no longer included in documents and the PDF bookmarks are more straightforward.
* Change [10.27.00] Removed a constraint from the ReadNwsAwdb() command that was limiting reading data – an issue with the NRCS web services still exists but a work-around is in place.
* Change [10.27.00] The RunningStatisticTimeSeries() command now provides AnalysisStart, AnalysisEnd , NormalStart, NormalEnd, OutputStart, and OutputEnd parameters to more explicitly handle periods for the analysis and output.
* Change [10.27.00] The TableToTimeSeries() command has been updated to handle appending to tables and output window has been added to transfer a window in each year.
* Change [10.27.00] The WriteTableToExcel() command features have been improved.
* Change [10.27.00] The WriteTableToKml() and WriteTimeSeriesToKml() commands have been made functional for point and polygon shapes.
* Change [10.27.00] The ReadTableFromDataStore() and RunSql() commands will now remove comments from SQL when used with a Microsoft Access datastore because Access does not support comments.
* New Feature [10.27.00] The CopyFile() command has been added.
* New Feature [10.27.00] The CreateDataStoreDataDictionary() command has been added.
* New Feature [10.27.00] The InsertTableRow() command has been added.
* New Feature [10.27.00] The ListFiles() command has been added.
* New Feature [10.27.00] The NewExcelWorkbook() command has been added.
* New Feature [10.27.00] The ReadTableCellsFromExcel() command has been added.
* New Feature [10.27.00] The SetTimeSeriesValuesFromLookupTable() command has been added to set data in a time series using a lookup table.
* New Feature [10.27.00] The WriteTableCellsToExcel() command has been added.

## Changes in Versions 10.26.00 ##

* Change [10.26.00] The CopyTable() command behavior has been changed.  Multiple columns can now be specified for DistinctColumns and IncludeColumns is always checked to determine output (DistinctColumns no longer overrides this parameter).  To reproduce previous behavior with DistinctColumns, specify IncludeColumns to match DistinctColumns.  The RowCountProperty has been added to allow the row count to be set as a processor property, which is useful for checking for errors with If() and Message() commands.
* Change [10.26.00] The ExpandTemplateFile() command now allows a text string to be specified, as an alternative to specifying an input file.
* Change [10.26.00] The ReadNrcsAwdb() command has been updated to use the web service API as of 2013-11-05.  Support for hourly data and forecasts as output table have been added.
* Change [10.26.00] The ReadStateMod() command now reads the *.xop file for monthly time series.
* Change [10.26.00] The ReadTimeSeriesList() command has been updated to include the Properties parameter to set time series properties.
* Change [10.26.00] The RunningStatisticTimeSeries() command has been updated to specify a distribution for use with the PlottingPosition statistic and the Rank statistic has been added.
* Change [10.26.00] The SelectTimeSeries() command has been updated to include the IfNotFound parameter to allow control how errors are handled and the SelectCountProperty parameter to set a processor property with results.
* Change [10.26.00] The SetConstant() command now allows monthly values to be specified as * to keep the original value and blank or NaN to set to missing.
* Change [10.26.00] The SetFromTS() command now provides parameters to define a window to set data only within part of the year.
* Change [10.26.00] The TableToTimeSeries() command now supports appending to an existing table for multiple-column output.
* Change [10.26.00] The release notes have been split into two files, for current major version and older versions.  This shortens the information that most users need to review.
* New Feature [10.26.00] The TSTool configuration file now includes the UILookAndFeel property, in particular to allow users to configure the user interface look and feel on Linux.
* New Feature [10.26.00] The FormatTableDateTime() command has been added.
* New Feature [10.26.00] The If() and EndIf() commands have been added to provide additional control of the workflow.
* New Feature [10.26.00] The Message() command has been added.
* New Feature [10.26.00] The WriteTableToKml() command has been added.

## Changes in Versions 10.25.00 ##

* Bug Fix [10.25.00] Support for Oracle databases used with GenericDatabaseDataStore has been enabled.
* Change [10.25.00] The ReadNwsrfsEspTraceEnsemble() command now allows 24Hour time series to be converted to Day interval during reading.
* Change [10.25.00] The WriteTimeSeriesToDataStream() command now provides the NonMissingOutputCount parameter, useful for outputting the most recent values.
* Change [10.25.00] The ReadReclamationHDB () and WriteReclamationHDB() commands now adjust NHour input period and output period, respectively, to align with the time series, to ensure that iteration over data results in times that align with data.
* Change [10.25.00] The Oracle database drive has been updated to support Oracle version 12g.  This and other changes resolve issues writing time series with many values.

## Changes in Versions 10.24.00 – 10.24.01 ##

* Change [10.24.00] Time series ensembles traces now are identified with a string sequence identifier, rather than the integer sequence number in previous versions.  This provides more flexibility.
* Change [10.24.00] The WriteDateValue() command now provides the Version parameter, in particular to provide an option to writing older ensemble version 1.4 SequenceNumber.
* Change [10.24.00] The RunningStatisticTimeSeries() command has been updated to support AllYears sample method and the MinimumSampleSize parameter has been added.
* Change [10.24.00] The CompareFiles() command now provides the MatchCase parameter.
* Change [10.24.00] The ReadRiverWare () command now reads RiverWare RDF files.
* Change [10.24.01] The ReadReclamationHDB () and WriteReclamationHDB() commands have been updated to be functional for processing model time series and ensembles.  Time series identifiers have been changed to ensure unique identification of time series.
* New Feature [10.24.00] The SortTable() command has been added.

## Changes in Version 10.23.00 ##

* Bug Fix [10.23.00] The ${TS:property} syntax used to specify time series properties was not being expanded for some commands.  This has been fixed.
* Bug Fix [10.23.00] Reading USGS NWIS instantaneous data should only be used with 15Min requests and this constraint is now hard-coded.  The requested period date/times are also now rounded to the nearest 15Min interval.
* Bug Fix [10.23.00] The SetTableValues() command was not working.  It is fixed.
* Bug Fix [10.23.00] The TableMath() command was not working.  It is fixed.
* Bug Fix [10.23.00] The FillRegression() and FillMixedStation() commands were not working in the previous.  They are fixed.  Also update to allow zero values to be set to missing.
* Change [10.23.00] The RemoveDataStoreTableRows() command has been renamed  to  DeleteDataStoreTableRows(), and added the RemoveAllRows=Truncate parameter.
* Change [10.23.00] The ReadTimeSeriesList() command now supports location type and alias.  The location type, data source, and data type can be read from input table columns.
* Change [10.23.00] The SetTimeSeriesPropertiesFromTable() command has been updated to improve how time series property names are mapped to input table columns.
* Change [10.23.00] The Data Visualization commands menu has been changed to Visualization Processing.  The Datastore Processing menu has been added and relevant datastore commands have been added to this menu.  Some commands are listed in multiple menus for usability.
* New Feature [10.23.00] The CreateTimeSeriesEventTable() command has been added in order to provide data for annotating graphs.
* New Feature [10.23.00] The WriteTimeSeriesToDataStream() command has been added to improve integration with real-time data management systems.

## Changes in Version 10.22.00 – 10.22.01 ##

* Change [10.22.00] The CopyTimeSeriesPropertiesToTable() command has been updated to have the AllowDuplicates property.
* Change [10.22.00] The ReadTableFromExcel() command now provides the ColumnExcludeFilters parameter to exclude rows from the table.
* Change [10.22.00] The NewTimeSeriesCommand() command now provides the InitialFlag parameter to set the initial data flag for the time series.
* Change [10.22.00] The RemoveTableRowsFromDataStore() command has been renamed to RemoveDataStoreTableRows().
* Change [10.22.00] Editors for the following commands now use tabs to help ensure that editor windows are not too large for typical screens:  FillRegression(),  FillMisedStation(), AnalyzeNetworkPointFlow(),  ReadDelimitedFile().
* Change [10.22.00] The ReadTableFromDBF() command now provides the Top parameter to limit the number of rows returned.
* New Feature [10.22.00] The ProcessRasterGraph() command has been added to automate creation of raster graphs.  Visualization commands are now grouped under a Data Visualization commands menu.
* New Feature [10.22.00] The JoinTables() command is now functional.
* New Feature [10.22.00] The RunSql() command has been added to automate database tasks.
* New Feature [10.22.00] The SetTableValues() command has been added.
* New Feature [10.22.00] The appendix Running TSTool in Various Modes has been added to centralize information about running TSTool, in particular in integrated environments.

## Changes in Version 10.21.00 ##

* Bug Fix [10.21.00] The FillRegression() command in the previous version was not properly handling confidence interval and zero intercept, resulting in filling not occurring.  This has been fixed.  A work-around was to specify a non-blank confidence interval.
* Bug Fix [10.21.00] The WriteTableToDelimitedFile() command was not listing available tables to write.  This has been fixed.
* Bug Fix [10.21.00] Time series that used NaN for missing were also treating -999 as missing.  Only NaN is now treated as missing for such time series.
* Bug Fix [10.21.00] The ReadTableFromExcel() command that used ExcelIntegerColumns always returned 1.  The actual numeric value is now returned.  The command also has been enhanced to read additional rows to determine column data types when the first row contained blanks.
* Bug Fix [10.21.00] TSTool would allow a command file to be opened while the current commands are running, leading to the interface being unresponsive.  A dialog now warns the user, allowing them to return to the current commands or let the existing commands run in the background.
* Change [10.21.00] The FillRegression() command now outputs all relevant statistics to the output statistics table, and functionality is complete as per the documentation.  Many of the new enhancements were implemented to allow consistency with the FillMixedStation() command.
* Change [10.21.00] The CopyTable() command now provides the DistinctColumns parameter to allow copying distinct values from one table to another.  The ColumnFilters parameter allows rows to be copied only when column values match a pattern.
* Change [10.21.00] The NewTimeSeries() command now allows initializing the time series with random values, useful for testing or prototyping.
* Change [10.21.00] The ManipulateTableString() command now provides the Replace parameter to replace a substring in a table column.
* Change [10.21.00] The ExpandTemplateFile() command now provides the OutputProperty parameter to set the result to a processor property.
* Change [10.21.00] The ReadTableFromDataStore() command now allows ${Property} to be used in the SQL, to utilize processor properties.
* Change [10.21.00] The TableToTimeSeries() command now allows reading time series metadata from additional columns in the table.  A bug was fixed that prevented handling dates as integer years.
* New Feature [10.21.00] Time series identifiers (TSIDs) now support the optional LocationType: syntax at the beginning of the identifier.  This is useful when location identifiers are not unique across location types or the location type helps to interpret the TSID.  Location types in TSIDs will be utilized for some datastores where such data are available (e.g., station type for RCC ACIS).
* New Feature [10.21.00] The FormatTableString() command has been added to provide flexibility in formatting strings in table columns.
* New Feature [10.21.00] The AnalyzeNetworkPointFlow() command has been added to perform a “point flow” analysis on a network of nodes and links.
* New Feature [10.21.00] The AppendTable() command has been added.
* New Feature [10.21.00] The ReadTimeSeriesList() command has been added to read multiple time series using a table of metadata as input.
* New Feature [10.21.00] The WriteTimeSeriesToDataStore() command has been added to write time series to a database datastore (under development).
* New Feature [10.21.00] The WriteTimeSeriesToJson() command has been added to write time series to JSON.
* New Feature [10.21.00] A basic version of the WriteTimeSeriesToKml() command has been added to write time series to KML.
* New Feature [10.21.00] The Properties tab has been added to the TSTool results area, to show time series processor properties after the run.

## Changes in Version 10.20.00 ##

* Change [10.20.00] The StartRegressionTestResultsReport() and RunCommands() commands have been updated to improve the regression test output, including adding run time, whether a test is disabled, and notes explaining the report.
* Change [10.20.00] HydroBase version 20130404 provides access to WDID and structure type in structure-related views, and TSTool has been updated to allow filtering on these values for diversion coding time series.
* Change [10.20.00] The ReadTableFromDataStore() command editor has been reconfigured to used a tabbed interface.  The Top parameter is now available to limit rows returned.  Database procedures that do not have parameters can be run.
* Change [10.20.00] The WriteReclamationHDB() command now supports writing ensembles.
* Change [10.20.00] The WriteTableToDelimitedFile() command now provides the NewlineReplacement parameter to replace newlines in output strings, to avoid unexpected line breaks in the delimited output file.
* Change [10.20.00] The ReadNwsrfsEspTraceEnsemble() command now saves time series properties from the input, to allow use in later commands.
* Change [10.20.00] The main TSTool interface now displays datastores and input types in a tabbed panel in order to clearly differentiate the access to data inputs.  A message is now displayed when TSTool starts to indicate that data connections are initializing.  Previously this was not evident and a user could try using data connections before they were initialized, resulting in errors.
* Change [10.20.00] The WriteReclamationHDB() command now handles NHour time series by specifying the start and end date/time for the data values.

## Changes in Version 10.19.00 ##

* Change [10.19.00] Add ColumnMap parameter to CopyTable() command to allow copy to have different column names.
* Change [10.19.00] The WriteReclamationHDB() command now allows the agency, overwrite flag, and time zone to be specified.
* Change [10.19.00] Show table count and number of rows and columns in table results.
* New Feature [10.19.00] Preliminary work on the JoinTables() command.

## Changes in Version 10.18.00 ##

* Bug Fix [10.18.00] Fix bug where NewStatisticTimeSeriesFromEnsemble() command was using the period from the first time series for the analysis period if no analysis period was specified.  The command now uses the maximum period from all ensemble traces by default.
* Change [10.18.00] The CalculateTimeSeriesStatistic() and NewStatisticTimeSeriesFromEnsemble() commands now provide the Total statistic.
* New Feature [10.18.00] Add the ReadTableFromExcel() command to read cell ranges into a TSTool table.
* New Feature [10.18.00] Add the RemoveTableRowsFromDataStore() command to delete rows in a datastore table, useful prior to (re)loading database tables.
* New Feature [10.18.00] Add the WriteTableToDataStore() command to write TSTool table rows into a datastore table, useful for (re)loading database tables.

## Changes in Version 10.17.00 ##

* Bug Fix [10.17.00] Fix bug where Free() command failed without any parameters.
* Change [10.17.00] The ExpandTemplateFile() command now has a UseTables parameter to disable passing tables to the template expander (improves performance when tables are not needed in template).
* New Feature [10.17.00] Updated the Getting Started chapter of the documentation to have a section on running TSTool in batch mode.
* New Feature [10.17.00] The ProfileCommands() command has been added to help understand command performance so that software and command files can be enhanced.
* New Feature [10.17.00] The FreeTable() command has been added to free table resources.
* New Feature [10.17.00] Command files can now be loaded without running discovery, by using the –nodiscovery command like parameter (for batch runs) and the File…Open...Command File (no discovery) menu (for interactive runs).  This results in much faster loads when command files are not expected to be edited (such as when running a large command file produced from a template).

## Changes in Version 10.16.00 ##

* Bug Fix [10.16.00] Fix bug where FormatDateTimeProperty() command editor had error.
* Change [10.16.00] The CalculateTimeSeriesStatistic() command now allows computing the TrendOLS statistic, with output being the intercept, slope, and R2.  This is useful for trend analysis for annual data or other time series that exhibit a trend.  The GECount, GTCount, LECount, and LTCount statistics also are now available.  The AnalysisWindowStart and AnalysisWindowEnd parameters have been added to filter data values to a window within the year and are available for some statistics.
* Change [10.16.00] The LeftYAxisDirection graph property has been added and can be used to reverse the axis direction, for example to graph positive water level depths going down from zero.  The property is not recognized in all graph types and additional updates will be made as needed.

## Changes in Versions 10.15.00 ##

* Bug Fix [10.15.00] NRCS AWDB web service for daily values always returns a null value for February 29.  A work-around has been implemented so that this value is ignored and does not cause the time series timestep to advance for the extra data value when reading the data.
* Bug Fix [10.15.00] The ReadHydroBase() command was always using the legacy HydroBase input type, instead of the specified datastore.  This has been fixed.
* Change [10.15.00] The DeselectTimeSeries() and SelectTimeSeries() commands have been moved from the Commands / Output Time Series menu to a new Commands / Select Time Series menu because the results of the commands impact many other commands.
* Change [10.15.00] DivClass and RelClass time series read from HydroBase now result in time series properties being set for the individual parts of the SFUTG2 coding.  This allows, for example, the group identifier to be extracted based on time series queries.
* Change [10.15.00] The documentation has been split into multiple volumes to facilitate use, available from the Help menu.  A User Manual chapter has been added for Excel Integration.

## Changes in Versions 10.14.00 ##

* Change [10.14.00] The CreateEnsembleFromOneTimeSeries() command now has the OutputYearType parameter to offset the sequence number (historical year).  This allows, for example, SNOTEL snow water equivalent graphs to be created.
* Change [10.14.00] The ReadHydroBase() command well level time series can now be filtered by data source.
* Change [10.14.00] The HydroBase datastore documentation has been updated to explain how to connect to the HBGuest account in HydroBase, which provides access to additional data tables.

## Changes in Versions 10.13.00 ##

* Bug Fix [10.13.00] Fix bug in WaterML parser so that missing value is recognized as indicated string (e.g., -999999.0) and integer equivalent (e.g., -999999) since both show up as data values.
* Change [10.13.00] The OpenHydroBase() command has been moved to a the new Commands / Deprecated menu, which is a holding area for commands slated to be phased out.
* Change [10.13.00] The WriteTableToDelimitedFile() command now allows comments to be omitted from output, which facilitates use of files with software such as Esri’s ArcMap.  The AlwaysQuoteStrings parameter has also been added.
* Change [10.13.00] The ChangeInterval() command now has a RecalcLimits parameter to recalculate period of record statistics, to allow such information to be used in fill commands.
* Change [10.13.00] The TimeSeriesToTable() command now allows missing values to be omitted when creating a single-column output table, which is useful for exporting lists of sparse time series.  The DataColumn parameter has been renamed ValueColumn to be consistent with other commands.  The FlagColumn parameter has been added to allow flags to be saved in the output table.
* Change [10.13.00] The following datastores now set metadata as time series properties when time series are read:  ColoradoWaterSMS, ColoradoWaterHBGuest, RCC ACIS.  The information is useful for filtering time series, creating tables of information, etc.
* Change [10.13.00] Some HydroBase well locations do not have identifiers.  In these cases, an identifier LL:LatLong is now created, similar to the USGS site identifiers.  These identifiers allow time series well level data to be queried and indicate that a location identifier needs to be assigned.
* New Feature [10.13.00] The TableToTimeSeries() command has been added to create time series from a table.
* New Feature [10.13.00] Support has been added for the USGS NWIS instantaneous values web service via the USGS NWIS Instantaneous datastore and ReadUsgsNwisInstantaneous() command.
* New Feature [10.13.00] Support has been added for the USGS NWIS groundwater web service via the USGS NWIS Groundwater datastore and ReadUsgsNwisGroundwater() command.
* New Feature [10.13.00] Support has been added for the NRCS AWDB web service a datastore and ReadNrcsAwdb() command.
* New Feature [10.13.00] The Commands / Deprecated menu has been added as a holding area for commands slated to be phased out.  Commands will be supported here for a period of time but eventually will be removed from the software.
* New Feature [10.13.00] The Commands / Spatial Processing menu has been added.  Spatial commands are envisioned and will be added as resources allow.
* New Feature [10.13.00] The TSTool Syntax Guide appendix has been added to summarize the various notations used in TSTool.

## Changes in Versions 10.12.00 ##

* Bug Fix [10.12.00] Fix bug in ReadFromDelimitedFile() when using filler characters in the date/time format string.  Also add %b date/time format specifier, to parse month abbreviations.
* Change [10.12.00] The CopyTimeSeriesPropertiesToTable() command now will automatically create the output table if it does not exist, and insert columns if necessary.
* Change [10.12.00] The ReadHydroBase() command has been updated to provide choices for selecting data type and interval, and input filters are provided, similar to the main TSTool window.  HydroBase datastores are now supported and location properties are set on the time series when read from the database.
* Change [10.12.00] The ReadTableFromDataStore() command now allows a free-format SQL string and the SQL also can be specified by an input file.
* Change [10.12.00] Update many commands to indicate progress within the command, which results in the TSTool interface indicating the progress in the command progress bar.  For example, if multiple time series are being processed, the command progress bar will indicate how many time series have been processed.
* Change [10.12.00] Update the NewStatisticYearTS() command to have the DayOfCentroid and MonthOfCentroid statistics, for example to evaluate change in streamflow patterns over time.
* Change [10.12.00] Update the ReadUsgsNwisDaily() command editor to provide more choices to users for counties, parameters, and statistics.
* Change [10.12.00] Update the NewStatisticTimeSeriesFromEnsemble() command to have the MissingCount, MissingPercent, NonmissingCount, and NonmissingPercent statistics.
* Change [10.12.00] Update the RunningStatisticTimeSeries() command to have the ProbabilityUnits parameter to control whether output statistic value is fraction (0-1) or percent (0-100).
* Change [10.12.00] Update the Scale() command editor to provide the MonthValues parameter for monthly scaling.
* Change [10.12.00] Update the Cumulate() command to expand the Reset parameter functionality, in particular by adding other parameters to more specifically control the behavior.
* Change [10.12.00] Update the TimeSeriesToTable() command to allow writing multiple time series to single column.
* New Feature [10.12.00] HydroBase database connections can now be configured using a datastore configuration file (see the HydroBase Datastore appendix).
* New Feature [10.12.00] Add the WritePropertiesToFile() command, which is more flexible and will replace the WriteProperty() command.
* New Feature [10.12.00] Add the ReadPropertiesFromFile() command.
* New Feature [10.12.00] Add the AppendFile() command.
* New Feature [10.12.00] Add the NewStatisticEnsemble() command to compute an ensemble of statistics (such as percent of stations reporting above threshold values).

## Changes in Versions 10.11.00 ##

* Change [10.11.00] Update to support RCC ACIS version 2 web service API.  The version 1 service is still supported.  Command files created for version 1 will need to be updated for use with version 2.  Refer to the RCC ACIS Data Store appendix.
* Change [10.11.00] Update the ColoradoWaterHBGuest data store to use the latest web service API.  All HBGuest data types that are supported in TSTool were compared with HydroBase results to confirm consistent results and handling of missing data (previously was an issue).
* Change [10.11.00] Update the HydroBase input type to provide WellLevelDepth and WellLevelElev data types.  The legacy WellLevel data type is still supported but will be phased out in favor of WellLevelElev.  The new data types are consistent with those used in the ColoradoWaterHBGuest data store.
* Change [10.11.00] Update the following commands to calculate the GeometricMean statistic:  NewStatisticTimeSeries(), NewStatisticTimeSeriesFromEnsemble(), RunningStatisticTimeSeries().
* Remove [10.01.00] The Colorado BNDSS data store has been removed because the initial implementation used a direct database connection and data now can be accessed via web services.  Use the WebGet() command and commands that read delimited files.

## Changes in Versions 10.10.00 ##

* Bug Fix [10.10.00] Fix bug in ReadFromDelimitedFile() command that resulted in warning in discovery mode (after opening command file).  Also improve handling of input files that have all blanks in last column.
* Change [10.10.00] Enhance the RunningStatisticTimeSeries() command to have ExceedanceProbability, NonexceedanceProbability, PercentOfMax, PercentOfMean, PercentOfMedian, and PercentOfMin statistics.  Also add the AllowMissingCount parameter.
* Change [10.10.00] Add the Alias parameter to set the alias for each trace time series created by the CreateEnsembleFromOneTimeSeries() command.
* New Feature [10.10.00] Add the new GenericDatabaseDataStore data store type to connect to any database via ODBC or JDBC.  This allows the ReadTableFromDataStore() command to read any table or view.

## Changes in Versions 10.09.00 ##

* Change [10.09.00] The TSTool main window time series lists for HydroBase and related web services now show the longitude, latitude, and UTM coordinates.
* Change [10.09.00] The ColoradoWaterHBGuest web service has been enhanced to enable station historical time series.  Also fix problem where caches of time series lists were not initializing in all cases – opening command files showed errors about time series not being found.  Implementation of irrigated lands time series is incomplete.
* Change [10.09.00] The ColoradoWaterSMS data type choices now include “*”, which allows listing all available data types for all locations.

## Changes in Versions 10.08.00 ##

* Change [10.08.00] The ColoradoWaterSMS (Colorado real-time streamflow) web service has been converted to a data store and is no longer listed as an “input type”.  A configuration file is distributed with the software installer and the data store is enabled by default.
* Change [10.08.00] The ColoradoWaterHBGuest (Colorado HydroBase database) web service has been converted to a data store and is no longer listed as an “input type”.  A configuration file is distributed with the software installer and the data store is enabled by default for CDSS use.  Additional diversion, reservoir, and well data types have been implemented.
* Change [10.08.00] The ReadDelimitedFile() command now allows reading files with flags by using the FlagColumn parameter.
* Change [10.08.00] The ReadRccAcis() command now allows specifying a single site ID, which is consistent with the ACIS REST API StnData web service call.  Multiple time series also can be processed.
* Change [10.08.00] Time series tables now allow formatting data values with a superscript for the data flag.

## Changes in Versions 10.07.00 ##

* Change [10.07.00] The NewTimeSeries() command now has a InitialFunction parameter, which can be used to initialize the time series to a function.  This feature is being used to test software and will be enhanced with more functions in the future.
* Change [10.07.00] The SetTimeSeriesPropertiesFromTable() command now has a TSPropertyNames parameter to set the name of properties if different from the table, and the time series description can be set from a table.

## Changes in Versions 10.06.00 – 10.06.01 ##

* Bug Fix [10.06.00] Data stores that are opened at start-up now are only opened if the data store type is enabled in the main TSTool configuration file.  This improves performance.
* Bug Fix [10.06.00] Irregular time series were not properly being treated as having data flags, resulting in no flags in output.  Because of the software design, irregular time series always have data flags (even if most are blank) and output will now reflect this (e.g., data flags will be output to DateValue files).
* Change [10.06.00] The ReadDelimitedFile() command has been updated to support functional DateTimeFormat, InputStart, and InputEnd parameters.
* Change [10.06.00] The WriteDateValue() command has been updated to support writing more than one irregular time series.  Non-overlapping points are represented as blanks in the DateValue file.
* Change [10.06.00] The MissingValue parameter has been added to the NewTimeSeries(), NewPatternTimeSeries(), and ReadRiversideDB() commands to allow setting the missing value.  Historical defaults of -999 are being transitioned to NaN and the parameters allow flexibility.
* Change [10.06.00] The ReplaceValue() command now has a MatchFlag parameter to allow data flags to be matched to find values to replace.
* Change [10.06.00] The ReclamationHDB features now support instantaneous time series as irregular interval data with minute precision for date/times.
* Change [10.06.00] The CreateEnsembleFromOneTimeSeries() command ReferenceDate parameter now can have special values like CurrentToDay.
* New Feature [10.06.01] The time series table view now allows data flags to be shown if available, in which case the table column is treated as strings rather than numbers.
* New Feature [10.06.00] Add WriteRiversideDB() command.

## Changes in Versions 10.05.00 ##

* Bug Fix [10.05.00] Fixed issue where the ReadDelimitedFile() generated an error reading a file with a single line of data.
* Change [10.05.00] The ReadUsgsNwis() command has been renamed ReadUsgsNwisRdb() and the USGSNWIS input type has been changed to UsgsNwisRdb to allow more specific handling of USGS NWIS data offerings.  Old commands are automatically updated.
* New Feature [10.05.00] Add ReadUsgsNwisDaily() command to read time series from USGS NWIS Daily Value web service.
* New Feature [10.05.00] Add ReadWaterML() command to read time series from a WaterML file.
* New Feature [10.05.00] Add preliminary WriteWaterML() command to write time series to a WaterML file.
* New Feature [10.05.00] Add LookupTimeSeriesFromTable() command to create a new time series from an input time series and lookup table.
* New Feature [10.05.00] Add ReadTableFromDataStore() command to create a new table from a database table or view.

## Changes in Versions 10.04.00 ##

* Change [10.04.00] The TableTimeSeriesMath() command now supports assignment of a table value to time series.

## Changes in Versions 10.03.00 ##

* Change [10.03.00] The CompareTables() command now has Tolerance and Precision parameters to control floating point value comparisons.  The AllowedDiff command has been added to allow a certain number of values to be different and not trigger a warning (useful for testing the command).
* Change [10.03.00] The FillFromTS() command now has FillFlag and FillFlagDesc parameters.
* Change [10.03.00] The CheckTimeSeries() command now allows the threshold of repeated values to be specified for the Repeat statistic.

## Changes in Versions 10.02.00 ##

* New Feature [10.02.00] Add ReadRiversideDB() command.

## Changes in Versions 10.01.00 – 10.01.01 ##

* Bug Fix [10.01.01] Fixed issue where the Copy() command failed on minute data that had data flags.
* Bug Fix [10.01.01] All command editors that allow an alias to be specified with the % specifiers, and similar commands that specify TSID formatting for table columns did not update the parameter when using the drop-down choices – all have been fixed.
* Bug Fix [10.01.00] Fix RunPython() to allow parameters (such as filenames) with spaces.
* Change [10.01.00] The TimeSeriesToTable() command now supports an output window so that months or seasons can be transferred from time series to the table.
* Change [10.01.00] The SetProperty() command now allows date/time properties to be defined dynamically using CurrentToDay and similar syntax.
* Change [10.01.00] The NewStatisticTimeSeriesFromEnsemble() command now supports calculating exceedance probabilities.
* Change [10.01.00] The following commands now recognize ${Property} syntax in appropriate parameters:   SetProperty(), FTPGet(), WebGet().
* New Feature [10.01.00] Add the View / Close All View Windows menu item – this will close all open graph, graph property, summary, and table windows.
* New Feature [10.01.00] Add FormatDateTimeProperty() command to facilitate formatting date/time strings, for example to use in dynamically configured filenames.
* New Feature [10.01.00] Add MG to ACFT and MGD to AF/D conversions to units file.

## Changes in Versions 10.00.00 – 10.00.05 ##

* Bug Fix [10.00.04] Command parameters that had parenthesis in the values were causing an error initializing the command – parameters can now contain parentheses.
* Bug Fix [10.00.03] Fix bug where ColoradoWaterSMS irregular (real-time) data values had the wrong date/time for hour 12 transitioning between AM and PM.
* Bug Fix [10.00.03] Fix bug where some RCC-ACIS flagged values were not being handled – all values should now be handled, based on available documentation.
* Bug Fix [10.00.01] The Commands / Convert TS Identifier to Read Command menu items were not functional.  The menu items have now been moved to the Edit menu (and popup command list menu) and consist of two choices:  converting a TSID to a ReadTimeSeries() command or to a more specific read command, which will depend on whether a matching read command is available for the TSID (additional support will be enabled over time).  One advantage of using a read command is that an alias can be assigned, which allows the processing logic to be more clearly defined.
* Bug Fix [10.00.00] Fix bug where SetFromTS() and FillFromTS() command editor was listing extra duplicate blank and * choices.
* Bug Fix [10.00.00] The NewTimeSeries() and NewPatternTimeSeries() command editors generated a warning if SetStart and SetEnd were not specified as parameters – the command now recognizes the results of SetOutputPeriod() commands during editing.
* Bug Fix [10.00.00] Some network environments block HTTP traffic on default ports due to firewall settings, which prevents web services from working properly.  The Java command line parameter has been added to fix this issue:  -Djava.net.useSystemProxies=true
* Change [10.00.05] The ReclamationHDB queries are now case-insensitive for string filters.  Also set the time zone for hourly and instantaneous time series, using the global HDB time zone.
* Change [10.00.04] The ReadDelimiteFile() command now handles data that are listed from latest to oldest, and the DateColumn and TimeColumn parameters have been enabled.
* Change [10.00.01] The Convert TSID to… menus have been compressed into Convert TSID to general ReadTimeSeries() Command… and Convert TSID to specific Read…() Command… menus, which are available as a popup and the Edit menu but no longer in the Commands menu.  These features will be more fully enabled over time.
* Change [10.00.01] The CreateFromList() command editor menu has been moved to the read commands.
* Change [10.00.01] The ReplaceValue() command now has a SetFlag parameter to flag data values that have been changed.
* Change [10.00.01] The SetFromTS() command now has a SetDataFlags parameter to control whether data flags from the independent time series are copied, and HandleMissingHow=SetOnlyMissingValues parameter will cause only the missing values to be transferred.
* Change [10.00.01] The NewStatisticYearTS() command now supports NonmissingCount and NonmissingPercent statistics and also supports the YearMayToApr output year type.
* Change [10.00.00] All commands that used TS Alias = Command(…) syntax have been migrated to Command(Alias=”…”,…) syntax.  Older command files can be read by the current version of TSTool.  However, once saved in the new format, older versions of TSTool will not recognize the new command syntax for the impacted commands.  If necessary, use the File / Save Commands As (Version 9 Syntax) menu to save the commands in the older format.  The Alias parameter also has been updated to support formatting specifiers like %L (for location) to allow dynamic definition of the alias based on time series properties.  See additional notes in this section for specific changes to some commands.  Some commands require the Alias parameter in order to be consistent with previous functionality.  However, over time, the parameter may be made optional.  These changes have allowed documentation to be condensed and menus to be reorganized to improve consistency.  However, the examples in the command reference will be updated over time to use the new syntax.
* Change [10.00.00] The TS Alias = ReadDateValue(…) command has been merged with the ReadDateValue(Alias=…) syntax, with the new command reading DateValue files with one or more time series.
* Change [10.00.00] The TS Alias = ReadHydroBase(…) command has been merged with the ReadHydroBase(Alias=…) syntax, with the new command reading one or more time series from HydroBase.
* Change [10.00.00] The TS Alias = ReadMODSIM(…) command has been merged with the ReadMODSIM(Alias=…) syntax, with the new command reading one or more time series from a MODSIM files.
* Change [10.00.00] The TS Alias = ReadNwsCard(…) command has been merged with the ReadNwsCard(Alias=…) syntax, with the new command reading a single or ensemble format NWS CARD file.
* Change [10.00.00] The ChangeInterval(…) command now allows multiple time series to be processed and also can process an ensemble and generate a new ensemble.  The AllowMissingConsecutive parameter has been added to further constrain how data can be converted.  The output year type YearMayToApr has been enabled when converting to year interval.
* Change [10.00.00] Files listed in the results now are displayed using the computer’s configured applications (e.g., Acrobat Reader for *.pdf), or a default text file viewer as a last resort.
* Remove [10.00.01] The Edit / Command File menu has been removed – users edit command files externally using their preferred editors and don’t want to confuse the software which might load a command file into the current TSTool session.
* New Feature [10.00.05] Add the prototype WriteReclamationHDB() command, which is envisioned to write  time series to a Reclamation HDB database.  Functionality is limited to and is intended for discussion – full implementation will be completed in a future release.
* New Feature [10.00.04] Add the ReadRccAcis() command, which allows bulk reads of RCC ACIS web service time series.  Also enable the Global Historical Climate Network (GHCN) and Community Collaborative Rain, Hail, and Snow Network (CoCoRaHS) station types in displays and time series identifiers.  Enable FIPS county and state data, and NOAA climate division in the query filters.
* New Feature [10.00.03] Add the PrintTextFile() command, which automates formatting and printing text files.  Printing the commands from the main TSTool window now numbers the lines to facilitate comparison with the on-screen commands.
* New Feature [10.00.02] The Tools / Options dialog now allows input types in the TSTool configuration file to be enabled/disabled.
* New Feature [10.00.01] Add the CheckTimeSeriesStatistic() command, which has features of the CalculateTimeSeriesStatistic() and CheckTimeSeries() commands and is intended to help quality control entire time series.  Move these commands to the Commands / Check Time Series menu to recognize as a production-level feature.
* New Feature [10.00.01] Add the CopyTimeSeriesPropertiesToTable() command, which is essentially the inverse of SetTimeSeriesPropertiesFromTable().
* New Feature [10.00.01] Progress within each command is now shown in a second progress bar if the command implements the progress reporting feature.
* New Feature [10.00.00] Training materials now are listed by the Help / View Training Materials menu.
