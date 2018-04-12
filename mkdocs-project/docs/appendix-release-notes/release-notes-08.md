# TSTool / Release Notes / Version 8 #

**The contents of this page have been minimally formatted.**

* [Changes in Versions 8.18.00 - 8.18.02](#changes-in-versions-81800-81802)
* [Changes in Versions 8.17.01 – 8.17.02](#changes-in-versions-81701-81702)
* [Changes in Versions 8.16.03 – 8.17.00](#changes-in-versions-81603-81700)
* [Changes in Versions 8.16.00 – 8.16.02](#changes-in-versions-81600-81602)
* [Changes in Versions 8.15.00 – 8.15.03](#changes-in-versions-81500-81503)
* [Changes in Versions 8.13.00 – 08.14.02](#changes-in-versions-81300-081402)
* [Changes in Versions 8.03.00 – 08.12.06](#changes-in-versions-80300-081206)
* [Changes in Versions 8.00.00 – 08.02.00](#changes-in-versions-80000-080200)

----------------

## Changes in Versions 8.18.00 - 8.18.02 ##

* Bug Fix [08.18.02] Fix limitation where the cell selection behavior in many tabular displays was not correct when running with Java 5+.  TSTool will continue to be distributed with Java 1.4.2 in the short term but Java 6 will be phased in when tests are complete.
* Bug Fix [08.18.01] Fix the SetInputPeriod() and  SetOutputPeriod() commands – spaces between parameters were not being handled.
* Bug Fix [08.18.01] Fix the uninstaller to remove the python folder used for utility scripts, which results in a complete uninstall.
* Change [08.18.01] Add the MissingValue parameter to the WriteDateValue() command, in particular to support time series read from formats with very large or small values used for missing data.
* Change [08.18.01] Improve support for the RiversideDB database – all standard time series data tables are now supported.
* New Feature [08.18.02] Begin distributing example data with the installer, starting with DateValue examples.  See the TSTool-Version/examples/data/DateValue folder.
* New Feature [08.18.02] Add the Help…Import Configuration menu item, which allows a TSTool configuration file to be merged with the current file (e.g., for use after a new software install).
* New Feature [08.18.00] Add preliminary support for reading HEC-DSS files in the main interface and the ReadHecDss() command.  Irregular time series are not supported and by default only the first data block is read – use the ReadHecDSS() command with a period to read the full period.

## Changes in Versions 8.17.01 – 8.17.02 ##

* Bug Fix [08.17.02] When opening HydroBase with File…Open HydroBase more than one time, the Where filters were not being reset for the new database connection – this has been fixed.
* Bug Fix [08.17.02] When loading command files that had time series identifier commands with extra spaces, the user may have seen an error.  The error goes away when running the commands.  The software now removes unneeded spaces at load so that they are not considered part of the time series identifiers, and the errors consequently do not occur at load.
* Bug Fix [08.17.01] When run in batch mode, TSTool was not recognizing the default HydroBase connection information in the CDSS.cfg configuration file – this has been fixed, allowing TSTool to access HydroBase in batch mode.
* Bug Fix [08.17.01] Fix the bug where no TSList parameter for RunningAverage() caused an error when running.
* Bug Fix [08.17.01] The following commands were not properly transitioning the TSID parameter for older command files to new syntax.  The behavior is now to set TSList=AllMatchingTSID if the older command TSID parameter includes * and TSList=LastMatchingTSID if no wildcard is used.  This matches legacy functionality and also supports current conventions.  Problems may have occurred if the same TSID was reused in the command file because all TSList=AllMatchingTSID was used and more time series would have been operated on than desired.  The updated commands are:  AddConstant(), AdjustExtremes(), ARMA(), ConvertDataUnits(), FillConstant(), FillFromTS(), FillInterpolate(), FillPattern(), FillRepeat(), Free(), ReplaceValue(), RunningAverage(), Scale(), SetConstant(), SetDataValue(), SetFromTS(), ShiftTimeByInterval().
* Bug Fix [08.17.02] Similar to the previous item, the following commands were not properly transitioning the IndependentTSID parameter for older command files to new syntax and have been updated:  FillFromTS(), SetFromTS(), SetToMax(), SetToMin().
* Change [08.17.02] The Add() and Subtract() commands now automatically update old syntax to the current syntax – previously a message would be displayed indicating that the command had to be recreated.
* Change [08.17.02] Previously, time series aliases with periods would be treated as full time series identifiers and could only be matched with other full time series identifiers during processing.  This may have resulted in no match.  Aliases with periods are now allowed to be specified and will result in a match with similar aliases when compared with parameters that use the alias.  Care must be taken to NOT specify an alias with periods that is the same as a full time series identifier, and which is not intended to be a match.  In general, aliases that use periods should either match the full time series identifier or be different enough to not result in an unintended match.
* Change [08.17.02] When opening a command file, read commands are run in “discovery” mode in order to determine time series identifiers for command editors.  Previous versions would do a full read of the data at this point, which was slow – this has been fixed so that only time series metadata are read when loading command files.
* New Feature [08.17.02] Add the File…New menu to allow clearing the current commands and starting a new command file.
* New Feature [08.17.02] StateMod binary output files as of version 12.29 had a change in the file header – this version of TSTool is able to read the new format while being backward compatible with old formats.

## Changes in Versions 8.16.03 – 8.17.00 ##

* Bug Fix [08.17.00] Fix RiverWare file reading.  Because RiverWare dates always include 24:00, even when not needed, parsing some dates was causing roll-over into the next month.  The 24:00 is now ignored for day, month, and year interval time series.
* Bug Fix [08.17.00] Fix StateModB file reading – previously an error was occurring when no reservoirs were in the data set.
* Bug Fix [08.16.03] Re-enable the general ReadTimeSeries() command in the GUI.  It was thought that this command would be phased out in favor of specific read commands.  However, it is useful in some cases and provides a companion to the CreateFromList() command.  Also update the command to allow more control over handling missing time series with the IfNotFound parameter.
* Bug Fix [08.17.00] Fix the FillRepeat() command – the MaxIntervals parameter could not be set in the command editor.
* Bug Fix [08.17.00] Fix many editor dialogs – the TSID entry field was disabled for TSList=FirstMatchingTSID and TSList=LastMatchingTSID.  These parameter values were added for specific commands but became available globally for other commands.
* Bug Fix [08.16.03] When running in batch mode on Linux the menu bar graphic was loaded at startup.  This causes an error when an X11 connection is not configured (e.g., for cron jobs).  This error may still result if processing graphical products in batch mode – more will be done later including updating the Java version used by TSTool.
* Bug Fix [08.16.03] Fix the ReadNwsCard() command to once again enable the NewUnits parameter – this bug was introduced in version 08.03.00.
* Bug Fix [08.16.03] Fix so that reading an NWS Card file that is not 24Hour will generate an error if Read24HourAsDay=True is specified.
* Change [08.17.00] Update the following commands to have new error handling and convert to named parameter notation (if not previously converted):  AdjustExtremes(), ARMA(), CreateFromList(), Disaggregate(), Divide(), Exit(), FillDayTSFrom2MonthTSAnd1DayTS(), FillInterpolate(),  FillPattern(), FillProrate(), Multiply(), NewDayTSFromMonthAndDayTS(), NewEndOfMonthTSFromDayTS(), Normalize(), ReadDateValue(), ReadMODSIM(), ReadNwsrfsFS5Files(), ReadPatternFile(), ReadRiverWare(), ReadTimeSeries(), ReadUsgsNwis(), RelativeDiff(), ReplaceValue(), SetDataValue(), SetToMax(), SetToMin(), StateModMax(), WriteStateCU().  All commands are now updated to the new error handling and named parameter notation.
* Change [08.17.00] Disable hiding of problem gutter in main GUI.  The problem icons will always be shown and mouse over will popup the command status.
* Change [08.17.00] /*, */ and Exit() commands now have command editors even though these commands have no parameters – this provides a consistent handling of all commands.
* Change [08.17.00] Change SetPatternFile() to ReadPatternFile().  The command will automatically be converted when a command file is read.
* Change [08.17.00] Change SetMax() to SetToMax().  The command will automatically be converted when a command file is read.
* Change [08.17.00] Change RemoveFile(WarnIfMissing=…) to RemoveFile(IfNotFound=…) to be consistent with other commands.  The command will automatically be converted when a command file is read.
* Change [08.17.00] Update the FillInterpolate() command to have the FillStart, FillEnd, and FillFlag parameters.
* Change [08.17.00] Update the CreateFromList() command to change the HandleMissingHow parameter to IfNotFound and change the default to Warn.  Users can then decide whether missing time series should be a fatal problem, should be ignored, or should result in default empty time series.  Also change the default delimiter to comma (was comma and space) to more explicitly handle comma separated value files.
* Change [08.17.00] Update the ReadNwsrfsFS5Files() command to allow a relative path for the file.
* Change [08.17.00] Update the WriteSHEF() command to include the DataTypePELookup parameter, to allow assigning the PE code when running in environments when such information is not automatically initialized.
* Change [08.17.00] Update the CompareFiles() command to include the CommentLineChar parameter, to allow setting the comment line character to other than the default (#).
* Change [08.17.00] Add full command editor for the LagK() command.
* Change [08.16.03] Update the ReadHydroBase() commands to have the IfMissing parameter, to indicate how to handle missing time series.  See also the information about the OpenCheckFile() command below.
* Change [08.16.03] Update the FillFromTS()and SetFromTS() commands to have the RecalcLimits parameter, to recalculate the historical data limits as if all the data were observed in the merged time series.  This facilitates combining time series from different sources to create one observed time series.
* Change [08.16.03] Update the SetFromTS() command to have the HandleMissingHow parameter, to allow missing data to be ignored during the transfer.
* New Feature [08.16.03] Add the ReadStateCUB() command and ability to read StateCU (State of Colorado Consumptive Use model) binary output files in the main interface.
* New Feature [08.16.03] Add the initial version of the OpenCheckFile() command, to facilitate checking results.  ReadHydroBase() commands that fail will be listed in the check file.  Additional checks will be enabled in the future as the command is enhanced.  The check file is viewable in the results area.  It is expected that formatting of the output file will change.
* New Feature [08.16.03] Add the WriteTimeSeriesProperty() command, to facilitate software testing, in particular to write the data limits to test new FillFromTS() and SetFromTS() command features.  In the future this may also be used to save time series information, such as statistics.  Additional time series properties will be added over time.

## Changes in Versions 8.16.00 – 8.16.02 ##

* Bug Fix [08.16.00] TSTool running in batch mode was always exiting with status 0, even if errors occurred.  It will now exit with status 1 if any warnings or errors occurred in processing.  Refer to the log file for problems or run interactively to fix command input errors.
* Bug Fix [08.16.00] In the Free() command, the matched time series are now also freed in reverse order from the list in memory – previously the logic may have freed the wrong time series if multiple time series were matched in a pattern.
* Bug Fix [08.16.00] The FillStart and FillEnd parameters were not being recognized by the FillFromTS() command – this has been fixed.
* Change [08.16.02] Update the CopyEnsemble()command to have the NewAlias parameter, to allow more flexibility in identifying time series in the copy.
* Change [08.16.02] Update the CreateRegressionTestCommandFile()command to recognize @os and @testSuite tags in command file comments, to control collection of test command files.
* Change [08.16.00] Reset global properties (except logging levels) to defaults at the start of command processor runs.  Previously this was not done and global properties like output period could still be in effect if rerunning commands interactively.
* Change [08.16.02] Update the following command to have new error handling and convert to named parameter notation (if not previously converted):  SetAutoExtendPeriod(), SetAveragePeriod(), SetWorkingDir().
* Change [08.16.00] Update the following command to have new error handling and convert to named parameter notation (if not previously converted):  DeselectTimeSeries(), SelectTimeSeries(), SetDebugLevel(), SetIgnoreLEZero(), SetIncludeMissingTS(), SetOutputYearType(), SetWarningLevel().
* Change [08.16.00] Update the CreateRegressionTestCommandFile() and RunCommands() command to better support testing.  The expected status for a command file can now be indicated in a comment.  The output report now indicates the expected and actual status and whether the test had an overall pass/fail.  See examples of how to use these commands in the documentation.
* Change [08.16.00] Update the Free()command to use the TSList parameter, to allow more flexibility in selecting time series.  Also add the FreeEnsembleIfEmpty parameter to remove empty ensembles.
* Change [08.16.00] Update the WriteDateValue()command to have the Precision parameter, to allow more flexibility in formatting output.  The default is still 4 digits after the decimal.
* New Feature [08.16.02] Begin adding Python example scripts to the distribution, located in the python folder.  Additional scripts will be added over time.
* New Feature [08.16.00] Add the FTPGet() command to retrieve files from remote systems using file transfer protocol (FTP).
* New Feature [08.16.00] Add the RunPython() command to run Python/Jython scripts.
* Remove [08.16.00] Remove the SetMissingDataValue() command, which has not been supported in the GUI for some time.  The SetTimeSeriesProperty() or another command may be updated to specify the missing data value for the time series.
* Remove [08.16.00] Remove the SetRegressionPeriod() command, which has not been supported in the GUI for some time.  The regression analysis period can be set in the FillRegression() command parameters.

## Changes in Versions 8.15.00 – 8.15.03 ##

* Bug Fix [08.15.03] Re-enable the ability to read default HydroBase connection information from the system/CDSS.cfg file when running in batch mode.  This allows the user to configure HydroBase once and use with any command file that is run.
* Bug Fix [08.15.03] Re-enable the ability to run TSTool in batch mode with –nomaingui and have plot windows display until the Close button is pressed.  This had been broken in version 8.00.00+.
* Bug Fix [08.15.00] Fix a bug in the Add() and Subtract() commands introduced after 08.02.00.  Additional flexibility was enabled to specify the time series list but the new features were not backward compatible with old command files in all cases, in particular when a list of specified time series identifiers was used.  Version 08.15.00 is backward compatible and translates old commands on the fly.  A workaround is to use version 08.02.00 and change the command parameters to use TSList=SelectedTS (instead of AddTSList=SelectedTSID or TSList=SelectedTSID).
* Bug Fix [08.15.00] Fix a bug in the SetConstant() command introduced after 08.02.00.  Additional flexibility was enabled to specify the time series list but the new features were not backward compatible in all cases. In particular the TSList parameter default is now LastMatchingTSID when updating old command files (was mistakenly defaulted to AllMatchingTSID).
* Bug Fix [08.15.00] The ability to right-click on the command list and search for a command was recently broken and has been fixed.
* Bug Fix [08.15.00] Printing the Analysis Details from an XY-scatter plot was broken and has been fixed.
* Bug Fix [08.15.00] Fix so that the obsolete SetConstantBefore() command is treated as an unknown command and verify that all unknown commands are loaded, to allow editing and correction.   Previously some obsolete commands might be skipped when loading command files.
* Bug Fix [08.15.00] Fix the ReadNwsCard() command for ensemble files to handle leap years in the ESP run period (case where ESP run start is Feb 29 is still not handled).  Also handle the nonstandard period header produced by the NWS ESPADP software – previously this format error had to be corrected outside of TSTool.
* Bug Fix [08.15.00] Fix the ReadNwsCard() command to handle reading ensemble files where ESP was run on the last day of the year.  The conversion of 1-24 hour to 0-23 hour was causing the data to be shifted by one full month in this case.  Also allow an optional ensemble identifier and name to be specified, which will create an ensemble recognized by TSTool.
* Bug Fix [08.15.00] Fix the FillUsingDiversionComments() command (used when processing HydroBase diversions).  A bug was present that caused the filling to not occur when operating on only one time series (filling worked when operating on all time series).
* Bug Fix [08.15.00] Fix the FillMOVE2() command to properly handle legacy command parameters (prior to named parameter syntax) – this problem only occurred for old command files.
* Bug Fix [08.15.00] Fix the SetFromTS() command to properly handle legacy command parameters (prior to named parameter syntax) – this problem only occurred for old command files.
* Change [08.15.03] Change the Copy() command to be more forgiving when reading old command files.  The required NewTSID parameter will now be defaulted to a copy of TSID with scenario “copy”.  Using an alias for TSID will still require updating the command to specify appropriate NewTSID parameter information.
* Change [08.15.02] Change the ChangePeriod() command to also operate on ensembles.
* Change [08.15.00] Change DateValue time series file reading to NOT allow multiple adjacent delimiters and do not allow mixing of space and tabs for delimiters.  For example, when using commas as the delimiter, “,,” would not result in a missing value.  The updated software is more strict in order to prevent inadvertent data errors.  The default delimiter is a space.  If for example, columns are being pasted from Excel using tabs as the delimiter, make sure to add the following line at the top of the DateValue file:
* limiter = “	“
* ere a tab character is inside the quotes.
* Change [08.15.00] Change DateValue time series reading to generate a more explicit error if the file does not exist, to facilitate error checks.  Command files that reference invalid files may now generate errors at different processing steps.
* Change [08.15.00] Update the WriteDateValue() command to recognize ensembles.
* Change [08.15.00] Update the Blend() command to current error handling and parameter naming conventions.  The old syntax is recognized and will be automatically updated.
* Change [08.15.00] Fix the WeightTraces() command – it had been disabled for some time and has now been updated with command parameters and error handling consistent with current standards.  The old syntax is no longer recognized because the command now operates on an ensemble identifier (old depended on less robust time series identifier conventions).
* Change [08.15.00] The “REF TS” label shown in the legend for plots, indicating which time series is used in the overview (reference) window under the main plot has been removed.  On-screen, saved images, and printed plots should now look the same.
* Change [08.15.00] Improve the startup so that database queries for choices do not cause user interface problems.
* Change [08.15.00] Software is now distributed with installers that install to a versioned folder and indicate the software version in menus.  This allows multiple versions of the software to be installed at the same time.  Previous versions evaluated this approach without full installers.
* New Feature [08.15.00] Indicate that the command file is modified when reading a command file and changes to command syntax are automatically applied.  This will occur with commands that have been fully updated to the new error handling (you are not required to edit the command for its syntax to be updated).  The command file can then be saved to accept the automatic changes.

## Changes in Versions 8.13.00 – 08.14.02 ##

* Bug Fix Warning dialogs in command editors were inadvertently turned off in a previous release and have been enabled again.
* Bug Fix Fix so that the TSAlias is used if specified in time series product files (used with ProcessTSProduct()). This allows aliases to be configured in commands and passed to pre-generated product files, to streamline product processing.  
* Change The WriteDateValue() command has been updated to include a Delimiter parameter (e.g., to allow comma to be specified) and the output period can be set in the command.  The alias is also now printed in column headings if it has been specified.
* New Feature Continue updating commands to have new error handling and to enable ensemble processing for many commands.
* New Feature Add SetProperty() and SetPropertyFromNwsrfsAppDefault() commands to set controlling information for processing.  In particular, it is envisioned that this capability will be used to set date/time and filename information at the top of a command file, for use in other commands throughout the command file.
* New Feature Add ability to recognize ${Property} in read/write commands for DateValue, NwsCard, and NwsrfsEspTraceEnsemble commands.  This capability will be added to other commands in future releases.
* New Feature Add the ability to set the time series alias dynamically in the ReadNwsrfsEspTraceEnsemble() command.
* New Feature Add preliminary capability in the ReadDelimitedFile() command – additional work will be completed to fully enable this command.
* New Feature Add the ComputeErrorTimeSeries() command, to create a time series indicating the difference between, for example, observed and simulated time series.  Percent error is enabled and additional error measures may be added in the future.
* New Feature The RunPython() command has been enabled in preliminary fashion, with the goal of implementing full support for calling external Python processing scripts, to support more complex processing.
* New Feature Add the ResequenceTimeSeriesData() command to resequence years of data in a time series, given a list of years.

## Changes in Versions 8.03.00 – 08.12.06 ##

* Bug Fix Fix NwsrfsEspTranceEnsemble handling to handle leap year and correct bug where time zone was not being handled properly (one hour off).
* Change Many commands have been updated to use the TSList parameter, which indicates the time series to be processed by the command.  Commands are backward compatible; however, the new parameter will not be recognized by older versions of TSTool.  Once this parameter is enabled in a command, it will allow additional values to be recognized in the future (e.g., getting the list of time series from a table may be enabled).  A consistent approach for the parameter also promotes consistency between commands.
* Change As much as possible, update commands that read time series to provide the list of time series identifiers to other commands.  This facilitates command editing.  For example, when a Read*() command is inserted, it will partially run (discovery mode) to read time series information, but not the full data.  The time series information is then made available to later commands to facilitate editing the commands.
* Change Expand the capabilities of the SetTimeSeriesProperty() to include setting whether editable – editable time series will enable editing capabilities in the graph view.  Add the DefaultSaveFile parameter to the ProcessTSProduct() command to help automate saving edited time series.
* Change Change all results to a tabbed panel of lists, with appropriate mouse actions.  For example, a variety of actions can be taken by right-clicking on the time series results.  However, for output files, a single click on a file will result in the file being displayed.
* Change Include most output files in the results tab.  Some secondary files are not yet included but will be as additional commands are updated with improved error handling.
* Change Reorganize general command menus to group related commands and avoid a long list of general commands.
* Change Reorganize into a separate command menu commands that only apply to ensembles.
* Change The performance of the ShiftTimeByInterval() command has been greatly improved.
* Change Running “TSTool File.TSTool” will cause the command file to be loaded, but not run.  To run in batch mode, continue to run with “TSTool –commands File.TSTool”.
* Remove Remove obsolete commands from menus.  Running old command files will warn about the obsolete commands and recommend new commands.  Most of these commands have not been used for a long time:  SetConstantBefore() was previously replaced with SetConstant().  FillCarryForward() was previously replaced with FillRepeat().
* New Feature Add the ReadTableFromDelimitedFile() and ResequenceTimeSeriesData() commands to facilitate generation of stochastic time series.
* New Feature Add the CreateEnsemble() command to create an ensemble of time series from a single time series (e.g., by shifting and overlapping each year of the time series).
* New Feature Add the CopyEnsemble() command, which copies each time series in an ensemble.
* New Feature Add the NewStatisticTimeSeriesFromEnsemble() command, which generates a statistic (e.g., “Mean”) time series from an ensemble.
* New Feature Add a command menu group and results tab for table processing.  Add the ReadTableFromDelimitedFile() command, for example to read a CSV file.  It is envisioned that table commands will be used to further automate and streamline processing.
* New Feature The NewStatisticTimeSeries() command has been added to generate a statistic time series determined from a time series.  For example, for the “Mean” statistic, the mean of all Jan 1 daily values are repeated throughout the period for each Jan 1.  This allows the mean to be graphed or otherwise used for analysis.

## Changes in Versions 8.00.00 – 08.02.00 ##

* Change The Copy() command now requires a new time series identifier to be specified, in order to avoid confusion with the original time series identifier.  Old commands will fail if a valid new identifier is not specified.  A simple workaround is to use the same location and interval as the original time series and “copy” for the scenario.  Because an alias is assigned to the copy, this full time series identifier will likely only be used for displays about time series details.
* Change Begin distributing TSTool such that when installed the software lives in a separate versioned folder with a name similar to “TSTool-08.02.00”.  This allows different versions of the software to be installed at the same time, in case a specific version must be used and to allow for transition to new versions without conflicts with other software that may share components.  A zip file install is available and a full installer is being created, similar to previous versions.
* New Feature Initial implementation of new error-handling features, which display graphics to the left and right of the command area indicating warnings and failures.  The intent is to provide users with more immediate and accessible feedback and minimize the need to review the log file.  Black dots after running indicate commands that have not been updated to the new error handling.  Right click on a command and select “Show Command Status” to see useful information about resolving a problem.  A command has 3 phases:  initialization, discovery, and run, each with a status of unknown, success, warning, or failure.
* New Feature Process commands on a separate thread.  This allows the GUI to remain responsive and show command progress during running.  Features are being implemented to cancel processing.
* New Feature Add CreateRegressionTestCommandFile(), RemoveFile(), and StartRegressionTestResultsReport() commands to facilitate creating command test suites, to allow regression testing.  Use these commands to create test suites for testing, to automate testing for future releases.
* New Feature Add the WriteProperty() command to write a processor property (e.g., the output start date) to a file, primarily for use in testing.
* New Feature Add the RemoveFile() command for use in testing, and can also be used in normal processing.
* New Feature Add the NewPatternTimeSeries() command, which can be used to generate test data for other commands, and can also be used for normal processing.
