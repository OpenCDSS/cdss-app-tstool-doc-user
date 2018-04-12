# TSTool / Release Notes / Version 6 #

**The contents of page have been minimally formatted.**

* [Changes in Version 6.19.00](#changes-in-version-61900)
* [Changes in Version 6.18.00](#changes-in-version-61800)
* [Changes in Version 6.17.00](#changes-in-version-61700)
* [Changes in Version 6.16.02](#changes-in-version-61602)
* [Changes in Version 6.16.01](#changes-in-version-61601)
* [Changes in Version 6.16.00](#changes-in-version-61600)
* [Changes in Version 6.15.00](#changes-in-version-61500)
* [Changes in Version 6.14.00](#changes-in-version-61400)
* [Changes in Version 6.12.00](#changes-in-version-61200)
* [Changes in Version 6.11.00](#changes-in-version-61100)
* [Changes in Version 6.10.09](#changes-in-version-61009)
* [Changes in Version 6.10.08](#changes-in-version-61008)
* [Changes in Version 6.10.07](#changes-in-version-61007)
* [Changes in Version 6.10.06](#changes-in-version-61006)
* [Changes in Version 6.10.05](#changes-in-version-61005)
* [Changes in Version 6.10.04](#changes-in-version-61004)
* [Changes in Version 6.10.03 BETA](#changes-in-version-61003-BETA)
* [Changes in Version 6.10.02 BETA](#changes-in-version-61002-BETA)
* [Changes in Version 6.10.01 BETA](#changes-in-version-61001-BETA)
* [Changes in Version 6.10.00 BETA](#changes-in-version-61000-BETA)
* [Changes in Version 6.09.03](#changes-in-version-60903)
* [Changes in Version 6.09.02](#changes-in-version-60902)
* [Changes in Version 6.09.01](#changes-in-version-60901)
* [Changes in Version 6.09.00](#changes-in-version-60900)
* [Changes in Version 6.08.02](#changes-in-version-60802)
* [Changes in Version 6.08.01](#changes-in-version-60801)
* [Changes in Version 6.08.00](#changes-in-version-60800)

------------

## Changes in Version 6.19.00 ##

 Update fillUsingDiversionComments() to extend time series with diversion comments available outside the normal diversion records period, if no query or output period has been specified.

## Changes in Version 6.18.00 ##

* Add runCommands() to allow a controlling commands file to run other commands files.

## Changes in Version 6.17.00 ##

* Add compareFiles() to help with regression testing, to verify current and expected results.

## Changes in Version 6.16.02 ##

* Begin adding data test commands in development mode – these commands will evaluate time series for critical conditions.
* Reenabled fillMove2(), which was unintentionally disabled in a previous release.

## Changes in Version 6.16.01 ##

* First version that includes operational features to support link between time series and map interface.
* Increase performance at startup when no main GUI is shown, for cases when TSTool is being used to provide graphs for other software.
* Add support for Universal Naming Convention (UNC) for software home in startup files.
* Change View…Map Interface to View…Map.

## Changes in Version 6.16.00 ##

* Implement hooks for the NDFD input type.
* Improve handling of NWS Card file extensions in commands and File…Save menu choices.
* Add map interaction features.  See the Installation and Configuration Appendix for more information about configuring links with maps.

## Changes in Version 6.15.00 ##

* Begin implementing link between time series and map interface.
* Reorder general command menus to be more consistent with other software.
* Add warning if time series cannot be retrieved from the RiversideDB input type.

## Changes in Version 6.14.00 ##

* Change the setQueryPeriod() command to setInputPeriod() to be consistent with other software nomenclature.  The old command is still supported.
* The readNwsCard() and TS Alias = readNwsCard() commands both now use the named-parameter notation and have the new Read24HourAsDay parameter.
* Blank lines in commands files now display properly.
* Fix bug where time series table sometimes showed half-drawn rows.
* Fix bugs where StateMod binary and StateCU input type file chooser prompt would not allow a cancel of the file select to occur.  Cancel now results in the previous file that was selected being displayed.

## Changes in Version 6.12.00 ##

* Improve error handling for processing time series products. In particular, TSTool now returns a non-zero exit status if there is an error processing a product.  This can be detected by external software that is running TSTool.

## Changes in Version 6.11.00 ##

* Enable the ColoradoSMS input type and begin adding alert annotations for streamflow graphs.
* Fix bug so that if a commands file is specified using a relative path, the working directory is interpreted correctly to determine the full path to the commands file.
* Add the ability to accept Parameter=Value command line parameters.  This will allow override of configuration file information.
* Convert processTSProduct() to use named parameters and ensure that output can be viewed even if in batch mode with no main GUI.
* Update so that for batch runs, the CDSS.cfg file information for HydroBase is used to make the initial connection.  Phase out the HydroBase database properties in the TSTool.cfg file.

## Changes in Version 6.10.09 ##

* Convert cumulate() to use named parameters and begin development of a new Reset parameter.
* Convert readStateModB() to use named parameters and add the Version parameter to allow reading of old files.  The features associated with the Version parameter are under development.
* Update the newStatisticYearTS() to support calculation of maximum and minimum values in a year and count of values in a year above/below a test value.  Also update the command to better handle incomplete data at the end of the analysis period.
* Update the openHydroBase() command to check the CDSS.cfg information and provide database server and database name choices to the user, to minimize errors in use.

## Changes in Version 6.10.08 ##

* Convert fillConstant() to use named parameters.
* Convert newTimeSeries() to use named parameters.
* Add the newStatisticYearTS() command, in particular to support calculation of frost date time series.
* Update openHydroBase() to accept the database name parameter.
* Double-clicking on a command will now cause the editor for the command to be displayed.
* Add a Command Glossary to the documentation and begin to standardize command parameter names to be consistent.

## Changes in Version 6.10.07 ##

* Convert scale() to use named parameters.
* Change TS X = … to TS Alias = … in menus.  Start to change notation in documentation and command dialogs.
* Convert copy() to use named parameters and add the ability to assign a new TSID to the copy.
* Convert writeStateMod() to use named parameters and add ability to select time series to write.
* Convert readStateMod() to use named parameters and add parameters for the input period..

## Changes in Version 6.10.06 ##

* Official release to support stored procedures.
* Documentation made current to reflect changes since the last documentation issue.
* Respond to feedback from previous 6.10.x incremental releases.
* Fix bug where XY-Scatter graph was not working due to changes in the 6.10.00 BETA release.

## Changes in Version 6.10.05 ##

* Add the lagK() command.
* Update the fillProrate() command InitialValue parameter to support NearestForward and NearestBackward.

## Changes in Version 6.10.04 ##

* Add additional input filter choices for HydroBase structures and stations, consistent with the StateView software.
* Update the fillProrate() command to include the ComputeFactorHow parameter to allow computing the proration factor based on an average of ratios.  Update the command to support free-format parameters.
* Update the selectTimeSeries() command to allow combinations of selection filters, to allow more flexibility.
* Add the ability to query HydroBase infrequent diversion and reservoir release time series.

## Changes in Version 6.10.03 BETA ##

* Input filters for HydroBase well structures and stations are now handled properly.
* Add initial support for saving time series products to HydroBase and RiversideDB.

## Changes in Version 6.10.02 BETA ##

* Update the openHydroBase() command to use free-format parameters.

## Changes in Version 6.10.01 BETA ##

* Enable ability to have data flags for daily and monthly data.
* Update the writeRiverWare() command to handle time steps other than hourly.

## Changes in Version 6.10.00 BETA ##

* Begin releasing support for HydroBase stored procedures.
* Begin development of generic changeInterval() command and update to free-format parameters.
* Begin work on the Mixed Station Analysis tool and fillMixedStation() command.
* Update the fillRegression() command to support free-format parameters.
* Begin work on the analyzePattern() command.
* Add the Commands…Analyze Time Series menu for analysis commands.
* Add the Commands…Models menu for more complicated modeling commands.
* Add the Tools…Analysis menu for analysis tools.
* Begin implementing the generic log file viewer, which allows links between commands and log messages.
* Change defaults to NOT display messages to the console, to improve performance.
* Add the point graph type.
* Add the predicted value graph type.
* Add the predicted value residual graph type.
* Add the sortTimeSeries() command.
* Add the ability for the readNWSCard() command to read 1+ time series.
* Add the startLog() command.
* Add the compareTimeSeries() command.
* Update the fillHistMonthAverage() and fillHistYearAverage() commands to have fill flag and free-format parameters.
* Add a warning in the add() command when frost date time series are added and indicate more appropriate commands.

## Changes in Version 6.09.03 ##

* Fix bug where initial directory with spaces in name was causing errors.

## Changes in Version 6.09.02 ##

* Added release notes to documentation.
* Fix bug in NWSRFS FS5Files input type where identifiers with underscores were not being handled.
* StateModB input type reservoir data types (and some well types) had ? for data groups – this has been resolved using StateMod 10.27 HTML documentation. 

## Changes in Version 6.09.01 ##

* Added NWSRFS FS5Files input type support, for use with the National Weather Service River Forecast System (NWSRFS).
* Fix summary reports (daily totals and means) to handle minute data.

## Changes in Version 6.09.00 ##

* Add the readHydroBase() command to read one or more HydroBase time series while filtering based on location, ID, etc.

## Changes in Version 6.08.02 ##

* Documentation updated to reflect all version 6 changes.
* Minor corrections to interface based on documentation review.

## Changes in Version 6.08.01 ##

* For the HydroBase input type, allow the ODBC DSN to be specified in the TSTool configuration file, to allow a HydroBase connection to be made at startup without prompting.  This supports the CDSS CD distribution.

## Changes in Version 6.08.00 ##

* Allow StateCU input type time series read commands to allow wildcards.
* Allow StateMod input type time series read commands to allow wildcards.
