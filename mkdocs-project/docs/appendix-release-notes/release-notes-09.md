# TSTool / Release Notes / Version 9 #

**The contents of this page have been minimally formatted.**

* [Changes in Versions 9.10.00 - 9.10.03](#changes-in-versions-91000-91003)
* [Changes in Versions 9.09.00 – 9.09.01](#changes-in-versions-90900-90901)
* [Changes in Versions 9.08.00 – 9.08.01](#changes-in-versions-90800-90801)
* [Changes in Versions 9.07.00 – 9.07.02](#changes-in-versions-90700-90702)
* [Changes in Versions 9.06.00 – 9.06.05](#changes-in-versions-90600-90605)
* [Changes in Versions 9.05.00 – 9.05.03](#changes-in-versions-90500-90503)
* [Changes in Versions 9.04.00 – 9.04.03](#changes-in-versions-90400-90403)
* [Changes in Versions 9.01.00 – 9.03.04](#changes-in-versions-90100-90304)
* [Changes in Versions 9.00.00 – 9.00.05](#changes-in-versions-90000-90005)

------------

## Changes in Versions 9.10.00 - 9.10.03 ##

* Bug Fix [09.10.03] Fix bug where RunningAverage(AverageMethod=Previous) was resulting in missing data in the result when the input was missing at the current date/time.
* Bug Fix [09.10.02] Fix bug where the time series created by the Delta() command were not listed in command editors for later commands.
* Bug Fix [09.10.01] Fix bug where time series with all zero or negative values was crashing TSTool in a log plot – a blank graph will now be shown.
* Bug Fix [09.10.01] Fix bug where HydroBase human population and livestock head count data were generating errors in the main window – they are now handled correctly.
* Bug Fix [09.10.01] Fix bug where the DeselectTimeSeries() command was not defaulting to TSList=AllTS.
* New Feature [09.10.03] The RunningAverage() command now has a AverageMethod=NAllYear method, which computes the average at any date/time based on all previous years’ data (similar to NYear, but uses all data prior to and including the year).
* New Feature [09.10.03] Add the RunningStatisticTimeSeries() command, which can be used in place of RunningAverage() and has more flexibility.
* New Feature [09.10.02] Add data store for USGS National Water Information System.  This is a preliminary feature that is under development.
* New Feature [09.10.01] Add data store for Regional Climate Center Applied Climate Information System (RCC ACIS).  This is a preliminary feature that is under development.
* New Feature [09.10.01] Add area and stacked area graph types.  Also begin phasing in ability to draw time series as different graph type on a main graph type (e.g., line on an area graph).
* New Feature [09.10.01] Add the WriteTableToHTML() command, with basic functionality.
* New Feature [09.10.01] Add CompareTables() command, useful for automated testing when calculating time series statistics.
* New Feature [09.10.00] Added initial support for Reclamation HDB database as a data store.  See the Reclamation HDB Data Store appendix for information.
* New Feature [09.10.00] Add ReadReclamationHDB() command.
* Change [09.10.04] The Copy() command now provides CopyDataFlags and CopyHistory parameters to control whether data flags and history are copied from the original.
* Change [09.10.03] Commands that create time series now create empty time series when in command editing mode.  This allows later commands to see a list of the time series that will be created, so that time series identifiers can be selected.  Previously some command editors would not list dynamically-created time series.  Additional warnings may be shown during editing if “skeleton” time series cannot be created for some reason. These will either be legitimate warnings or may be because software needs additional enhancements (in which case the problem should be reported).  Warnings typically will go away when commands are run.
* Change [09.10.03] The NewPatternTimeSeries() command editor now requires the NewTSID parameter.
* Change [09.10.01] The FillRegression(), FillMOVE2(), and FillMixedStation() commands have been made consistent to allow flexibility in testing and application of the commands.  For example, the FillRegression() command now accepts MinimumSampleSize, MinimumR, and ConfidenceInterval parameters.  These changes are being implemented and have not been finalized.
* Change [09.10.00] The numeric input filter operators now are all symbols (e.g., “equals” has been changed to “=”) for consistency.  Old operators used in commands like ReadHydroBase() are updated automatically during editing and processing.

## Changes in Versions 9.09.00 – 9.09.01 ##

* Bug Fix [09.00.00] The RunCommands() command was not passing data stores to the processor used for the command file being run.  This is now the default and a parameter has been added to not pass the data stores.
* Bug Fix [09.00.00] Fix bug where File…Open HydroBase was not showing the HydroBase login.
* Change [09.09.01] Convert the Colorado IPP input type to Colorado BNDSS data store.
* Change [09.09.01] The TableTimeSeriesMath() and Add() commands now have parameters to control how missing input are handled.
* Change [09.09.00] Several commands have been updated to have Optional/Required language in editors – this will continue until all commands are updated.
* Change [09.09.00] The ExpandTemplateFile() command now exposes processor properties set with SetProperty() to the template expansion tool. One-column tables are also exposed as lists.  This allows template processing to be dynamically controlled.
* Change [09.09.00] The FillRepeat() command now accepts a FillFlag parameter.
* Change [09.09.00] The SetTimeSeriesProperty() command now allows a user-defined property to be set.
* New Feature [09.09.00] Add the CopyTable() command, useful for creating one-column tables for lists that can be used to expand templates.
* New Feature [09.09.00] Add the ManipulateTableString() command.
* New Feature [09.09.00] Add the SetTimeSeriesPropertiesFromTable() command, which can be used to set user-defined properties for a time series.
* New Feature [09.09.00] Add the ReadTableFromDBF() command, which reads a table from a dBASE file (e.g., associated with an ESRI GIS shapefile).

## Changes in Versions 9.08.00 – 9.08.01 ##

* Bug Fix [09.08.01] HydroBase AutoConnect property in TSTool configuration file was not being recognized for non-CDSS configurations.  This has been fixed.
* Bug Fix [09.08.01] The CalculateTimeSeriesStatistic() command now properly matches time series identifiers in existing records rather than adding new records for output.  The statistic column also is automatically added if it does not exist.
* Bug Fix [09.08.01] The WriteStateMod() command editor was not opening – this has been fixed.
* Bug Fix [09.08.00] Data units for HydroBase data were shown as blank in the time series list for many data types – this has been fixed.  Units have always been properly set in time series results.
* Bug Fix [09.08.00] Better handle time series with no data in graphs – time series are ignored and warnings are not shown (see also new feature below that highlights such time series in the time series list).
* Change [09.08.01] The RiversideDB query panel now has 6 input filters and choices are editable to allow matching substrings.
* Change [09.08.01] The CalculateTimeSeriesStatistic() command now allows the TSID column format to be specified, to allow more control over linking data.
* Change [09.08.00] The File…Open…RiversideDB functionality now reads a RiversideDB configuration file rather than the full TSTool or RiverTrak® configuration file and does not prompt for a login (by default data can be read but not written to the database).  See the RiversideDB Data Store appendix for more information.
* New Feature [09.08.01] Add TableMath() command to perform simple math on table columns.
* New Feature [09.08.01] Add TableTimeSeriesMath() command to perform simple math on time series using input from a table.
* New Feature [09.08.00] Multiple RiversideDB databases can be opened using data store names.  Data stores are suitable for databases and binary files and are an alternative to the input type/name convention.  Data store names are now listed above the input types in the Input/Query area if data stores are available.
* New Feature [09.08.00] Time series that do not have data are now indicated with red text in the time series results list and are handled better in the graphing tool.

## Changes in Versions 9.07.00 – 9.07.02 ##

* Bug Fix [09.07.02] The RunningAverage() command was generating errors trying to compute N-year running average values on Feb 29 for daily and finer data.  The values are now set to missing.
* Bug Fix [09.07.00] The table display for time series now shows numbers right-justified.  The display had been left-justified for awhile.
* Change [09.07.02] The ReadStateCU(…,AutoAdjust=True,…) value is now the default to help ensure that TSTool can properly handle StateCU data types that include periods.
* Change [09.07.01] The ReplaceValue() command now provides an Action parameter to allow setting values to missing (or removing in irregular time series), and an analysis window can be specified to process data in a part of the year.
* Change [09.07.01] The CheckTimeSeries() command now provides an Action parameter to allow setting values to missing (or removing in irregular time series).
* Change [09.07.00] Period and monthly time series limits now include median, standard deviation, and skew statistics to facilitate additional analysis.
* Change [09.07.00] Status messages now indicate the command being run during processing, in addition to the progress percent estimate.
* Change [09.07.00] The WriteSummary() command now outputs an HTML file if the output file extension is “html”, and allows the output year type to be specified in the command.  An HTML report is also available from the main window results menu.  The HTML report color-codes missing and flagged values and provides notes explaining flags.  Additional enhancements to output will be added in the future.
* Change [09.07.00] The CompareFiles() command now has an AllowedDiff parameter to indicate that a certain number of lines are allowed to be different, which is useful, for example, for comparing files that have a date/time or software version in output.
* Change [09.07.00] The ReadDelimitedFile() command has improved error handling when invalid column names are specified in parameters.
* Change [09.07.00] The FillHistMonthAverage() command now accepts FillFlag=Auto and FillFlagDesc to better control flagging of filled values.
* Change [09.07.00] The CheckTimeSeries() command now accepts Flag and FlagDesc parameters to annotate values that are detected during the check, and the Change> and Change< check criteria have been added.
* Change [09.07.00] The # comment command now automatically has a status of success after editing, which avoids the “unknown status” indicator next to the command.
* Change [09.07.00] The RunPython() command now uses Jython 2.5.1 (when running the Jython embedded interpreter).  Support has also been added for IronPython (the .NET implementation of Python) and additional parameters have been added to facilitate integration in various environments).
* New Feature [09.07.02] Training materials are included in the doc/Training folder under the installation.  Additional examples will be added in the future.
* New Feature [09.07.00] An initial implementation of the ColoradoWaterHBGuest web services has been added, which allows accessing HydroBase via web services (no need for local database install).  Initial work focuses on the DivTotal data type.  Other data types will be handled in the future.
* New Feature [09.07.00] Flags associated with time series are now handled better.  The 1-character limitation has been removed internally and restrictions imposed by commands will be removed over time.  Flagged values are automatically noted on the HTML summary report.
* New Feature [09.07.00] The results area now provides Views, which allow more customized ways of listing, viewing time series.  An initial version of the NewTreeView() command has been implemented to create a tree view.  Additional views will be added in the future.

## Changes in Versions 9.06.00 – 9.06.05 ##

* Bug Fix [09.06.02] The CalculateTimeSeriesStatistic() command was reporting fraction for the missing and non-missing percent statistics – it has been fixed to report percent.
* Bug Fix [09.06.02] Running commands with SetOutputPeriod() and then loading a command file might display warnings for time series read commands because an attempt was made to change the period even though data values are not available.  Running the commands would clear the warnings.  This has been fixed so that warnings are not generated when loading the command file.
* Bug Fix [09.06.02] Commands read from a command file that have invalid parameters were not always generating a visible warning for the user – this has been fixed.
* Bug Fix [09.06.02] The NewStatisticYearTS(…,SearchStart…) parameter was disabled in the 9.05.x release but has now been restored.  The bug resulted in major errors in calculating frost dates (such as time series having mostly very low or high days in year).
* Bug Fix [09.06.00] Copying a block of time series from the query results area to the command list when a command was selected resulted in the query results order being reversed – this has been fixed.
* Change [09.06.04] The ReadDelimitedFile() command has been updated to support reading column headings from the delimited file.
* Change [09.06.02] The ChangeInterval() command now includes a Statistic parameter that supports computing MAX and MIN statistics for INST (small) to INST (large) interval conversions.  For example, use this feature to convert instantaneous temperature data to day maximum and minimum temperatures.  Additional statistic support will be added in the future.
* Change [09.06.02] Opening a new HydroBase or RiversideDB database with File…Open now refreshes the input filters for the new connection, rather than just relying on startup configuration.  A warning is now displayed when the HydroBase or RiversideDB input types are selected but no database connection is available.
* Change [09.06.01] The WriteCheckFile() command now includes the execution time for each command – this facilitates evaluation of software performance.
* New Feature [09.06.05] Add viewing capabilities for PNG and JPG output files.
* New Feature [09.06.04] Add ${InstallDir} global property for processor to facilitate locating supporting files (e.g., Python scripts) in the installed environment.  This property is recognized by commands that expand processor properties (see documentation).
* New Feature [09.06.04] Initial support for ColoradoIPP input type in main interface and ReadColoradoIPP() command.
* New Feature [09.06.03] The WebGet() command has been added to allow downloading content from a website.
* New Feature [09.06.03] The ReadFromDelimitedFile() command functionality has been fully enabled and documented.
* New Feature [09.06.02] Querying the time series list from a RiversideDB database now displays a join of time series, station, and location data, and the query can be filtered by the values.
* New Feature [09.06.01] If the TSTool configuration file indicates that the HydroBase input type is enabled and the HydroBase.AutoConnect=True property is set, then the HydroBase dialog will not be shown and the information in the CDSS configuration file will be used to make the HydroBase connection.  This is useful when TSTool is installed in a server environment and everyone will use the same HydroBase connection.
* New Feature [09.06.00] The ColoradoWaterSMS input type has been added for interactive queries and TSID commands (specialized read commands have not been implemented).  This allows TSTool users to access Colorado’s real-time data via internet web services and then analyze it with TSTool features.  The web services DO NOT provide access to data from external data providers such as the USGS.  Additional enhancements will be made in future releases.
* New Feature [09.06.00] The data units that are globally used by TSTool can now be viewed using the View… Data Units menu.  Data units are important for units conversion and when displaying data.

## Changes in Versions 9.05.00 – 9.05.03 ##

* Bug Fix [09.05.01] The AnalyzePattern() command was miscalculating positions of cutoff values, which, depending on the number of values in a sample, sometimes resulted in an edge pattern value being determined as one position to0 low.  For example, a value near one of the percentile cutoffs would be reported as AVG when it should have been WET.  This behavior resulted in a slight bias towards lower categories having higher values due to the extra value.  This has been fixed; however, a Legacy parameter has been added to duplicate old behavior, in cases where old behavior needs to be retained.
* Bug Fix [09.05.00] Time series identifier commands that have invalid time series (e.g., not connected to database or using an invalid file name) generate an error when the command file is loaded.  The “discovery” mode would not pass on the identifier to other commands and editors might fail when an empty identifier list is encountered.  The identifiers are now passed on to other commands.
* Change [09.05.03] Update the ReadStateMod() and ReadStateModB() commands to allow an alias to be assigned time series that are read, and recognize ${property} values in the input filename.  Also update the ReadStateMod() command editor to better handle water right files.
* Change [09.05.03] Update the NewStatisticTimeSeries() command to handle year, hour, and minute data interval in addition to previous support for month and day.
* Change [09.05.02] Update the NewStatisticYearTS()to generate the output time series in year type other than calendar and handle other than daily time series (previous limitation).
* Change [09.05.02] Update the ChangeInterval() command to create year interval time series from daily and monthly data, where the output year type is other than calendar year.
* Change [09.05.02] Update the ResequenceTimeSeriesData() command to process output year types other than calendar year.
* Change [09.05.01] Update the NewStatisticTimeSeries() command to include Min, Max, and Median statistics, output period (in particular to allow output to be shortened to one year), and add a parameter to require a minimum sample size for computations.
* Change [09.05.01] Update the NewStatisticTimeSeriesFromEnsemble() command to  include Min, Max, and Median statistics, output period (in particular to allow output to be shortened to one year), and add a parameter to require a minimum sample size for computations.
* Change [09.05.01] Update the CalculateTimeSeriesStatistic() command to calculate the following statistics:  DeficitMax, DeficitMean, DeficitMin, DeficitSeqLengthMax, DeficitSeqLengthMean, DeficitSeqLengthMin, DeficitSeqMax, DeficitSeqMean, DeficitSeqMin, Lag-1AutoCorrelation, Skew, StdDev, SurplusMax, SurplusMean, SurplusMin, SurplusSeqLengthMax, SurplusSeqLengthMean, SurplusSeqLengthMin, SurplusSeqMax, SurplusSeqMean, SurplusSeqMin, Variance.
* Change [09.05.01] Update the AnalyzePattern() command to allow saving output statistics to a new table, which can then be written to a file with another command.
* Change [09.05.00] Rename the CreateEnsemble() command to  CreateEnsembleFromOneTimeSeries() to reflect the command’s specific functionality and to avoid confusion with related commands.
* Change [09.05.00] Allow DateValue format files to be written with no time series.  This facilitates software testing and helps troubleshoot production command files.  Previously an error was generated.
* New Feature [09.05.01] Add table display to ensemble results – all time series in the ensemble can therefore quickly be displayed.
* New Feature [09.05.00] Add NewEnsemble() command to create a new ensemble and optionally insert 1+ time series into the ensemble.
* New Feature [09.05.00] Add InsertTimeSeriesIntoEnsemble() command to insert time series into an existing ensemble.
* New Feature [09.05.00] Add TimeSeriesToTable() command to copy time series data to a table.
* New Feature [09.05.00] Add ExpandTemplateFile() command to implement templates using FreeMarker (http://freemarker.org).  This facilitates adding conditional logic, loops, etc., to command files.

## Changes in Versions 9.04.00 – 9.04.03 ##

* Bug Fix [09.04.03] Fix bug in ResequenceTimeSeriesData() command where the last year in the resequenced time series contained missing values.
* Change [09.04.00] Finalize ReadTableFromDelimitedFile() command features for production use.
* Change [09.04.01] Finalize ResequenceTimeSeriesData() command for initial production use.
* New Feature [09.04.02] Add NewTable() command to create an empty table that can receive output from other commands.
* New Feature [09.04.02] Add CalculateTimeSeriesStatistic() command to compute statistics and optionally save in a table.
* New Feature [09.04.02] Add initial Principal Component Analysis (PCA)  tool and FillPrincipalComponentAnalysis() command – the command will be finalized after additional testing and review.
* New Feature [09.04.01] Enable ability to read RiversideDB information from TSTool configuration file for batch runs.
* New Feature [09.04.00] Add WriteTableToDelimitedFile() command.  This command is initially being used to test the read command but can be utilized as more table features are enabled.

## Changes in Versions 9.01.00 – 9.03.04 ##

* Bug Fix [09.03.05] Update the ChangeInterval() command to better handle negative values in some computations.
* Bug Fix [09.03.04] The SetTimeSeriesProperty() command was not allowing wildcards in the TSID parameter – this has been fixed.
* Bug Fix [09.03.00] The CreateFromList() command now ignores lines in the input that result in empty location identifiers – this was causing unexpected warnings.
* Bug Fix [09.01.01] The FillRegression() command was not recognizing the AnalysisStart and AnalysisEnd parameters – this has been fixed.
* Bug Fix [09.01.00] Fix WriteSummary() to output in water year if the year type has been set with SetOutputYearType().
* Bug Fix [09.03.00] Fix several issues with the ReadHecDss() and WriteHecDss() commands related to hour 23/24 conversions and address feedback about the previous release.
* Change [09.03.06] Update ChangeInterval() command documentation to reflect current software capabilities.  Also update the dialog to clarify notes about some parameters.
* Change [09.03.04] Update WriteSHEF() to provide more override parameters and allow appending to the output file.
* Change [09.03.02] Update VariableLagK() to allow negative lag.
* Change [09.03.00] Update RemoveFile() to fail if the file was not removed – users will need to check file permissions if the remove did not occur.
* Change [09.03.00] Finalize the VariableLagK() command features for release.  The DataUnits parameter has been changed to FlowUnits and comments and command messages now also use “flow”.
* Change [09.03.00] Update RunCommand() to provide parameters to specify the program name and each command line argument, in addition to the previous single command line – this facilitates handling of spaces in program name and arguments.  Add the ExitStatusIndicator parameter to allow specification of a string to detect the exit status in output.  Allow double quotes to be “escaped” in the program name and arguments by using \”.  Add the UseCommandShell parameter to indicate whether the command shell should be used – disabling the command shell for simple executable calls can increase performance and simplify error handling.
* Change [09.02.00] Change Lag() to append “routed” to the scenario, instead of setting the data sub-type – this more cleanly ensures that distinct yet similar time series result from the command.
* Change [09.01.00] Update WriteSummary() to offer full TSList parameter options similar to other commands.
* New Feature [09.03.06] Use default HTML viewing program for user environment when viewing HTML files (such as check files) and add documentation as Help…View Documentation menu.
* New Feature [09.03.04] Add preliminary CheckTimeSeries() command to test time series for invalid values, perform quality control, etc.
* New Feature [09.03.04] Add preliminary WriteCheckFile() command to write a summary of command processing warnings and failures.
* New Feature [09.03.00] Add RunDSSUTL() command to run the Army Corps of Engineers’ HEC DSSUTL program and other utility programs.
* New Feature [09.01.00] Add output year type NovToOct, similar to WaterYear, suitable for use with some systems.  WriteStateMod() and WriteSummary() now recognize this year type.
* New Feature [09.01.00] Add the Problems tab to the results to list all warning/failure messages from running the commands.  Additional features will be implemented to facilitate viewing.  The listing can be sorted by right-clicking on the column heading and can be copied and saved to a file.

## Changes in Versions  9.00.00 – 9.00.05 ##

* Bug Fix [09.00.05] Using the Exit() command would not display the results generated prior to the command – this has been fixed.
* Bug Fix [09.00.05] The ReadHydroBase() command allowed too many where clauses in queries.  A maximum of 6 criteria can be queried based on the current HydroBase interface design, and criteria beyond 6 were being ignored.  The command and its editor now only allow up to 6 criteria.
* Bug Fix [09.00.04] Writing time series with missing values to NWS Card format could result in values inappropriate for Card files – the software now converts internal missing data values (e.g., NaN) to -999 when writing Card files.
* Bug Fix [09.00.03] The Copy() command was generating an error when operating on time series with hour interval data and data flags – this has been fixed.
* Bug Fix [09.00.03] The Multiply() and Divide() commands’ default behavior is to reset the data units on the modified time series to units*units or units/units, respectively.  However, if the second time series has blank units then **, etc. could result – this has been corrected.  Additionally, the NewUnits parameter has been added to both commands to allow the units to be reset to appropriate values.
* Bug Fix [09.00.00] Reading USGS NWIS time series using a TSID command resulted in null dates in the period – this has been fixed.
* Change [09.00.03] Upgrade the editor for TSID (time series identifier commands) to allow removing/adding the working directory from file names in the identifiers.
* Change [09.00.00] Upgrade Java from version 1.4.2 to 1.6, allowing use of updated third-party components and resulting in an increase in performance.
