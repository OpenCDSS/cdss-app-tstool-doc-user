# TSTool / Release Notes / Version 7 #

**The contents of this page have been minimally formatted.**

* [Changes in Versions 7.02.00 – 07.04.00](#changes-in-versions-70200-070400)
* [Changes in Version 7.01.00](#changes-in-version-70100)
* [Changes in Version 7.00.00](#changes-in-version-70000)

-------------

## Changes in Versions 7.02.00 – 07.04.00 ##

* Remove checkbox for stored procedures from HydroBase login – the transition to stored procedures has been complete for some time.
* Allow the readStateMod() command to read water rights files – this was implemented to verify CDSS StateDMI software processing.
* Add support for HydroBase administrative flow stations.
* Add the setToMin() command similar to setMax().
* Update the TSTool PDF documentation to include navigation.
* Update the HydroBase fillUsingDiversionComments() command to optionally fill with the CIU (currently in use) flag.
* Improve the sizing of the time series query list table.
* Change installer so that when TSTool is run in batch mode from the command line, the working directory is the starting location, rather than the software installation home.
* Update to allow the readNWSRFSFS5Files() command to work in batch mode.
* Update to handle new StateCU file formats.

## Changes in Version 7.01.00 ##

* HydroBase 20061003 and later has a G: at the end of the SFUT and the F: has been expanded to seven characters.  This version of TSTool handles the new identifiers and is backward compatible with older databases and commands files.  Old commands files using SFUT should return the same results as before.
* The time series list area now has a minimum height consistent with the HydroBase input type – lists of time series from StateMod or other files are now more readable.
* The analyzePattern() command dialog now correctly forces the user to use percentiles in the range of 0 to 1.   The command has also been updated to use the output period from setOutputPeriod() and the year type from setOutputYearType() to write the pattern file.  Consequently, the input time series are no longer required to be the specific water year period to control output.  The previous version added “_pattern” on the location part of the TSID, but the current version instead sets the data type to “Pattern” – this will allow the pattern file output to be directly used with fillPattern(), using standard locations.
* When saving commands files, the “TSTool” file extension is automatically added.  This is compatible with the new installer, which lets the operating know that the extension should be associated with TSTool.
* Fix the fillInterpolate() command to allow time series identifiers with space.
* Fix the cumulate() command to allow the HandleMissingHow parameter to not be specified – it will default to SetMissingIfMissing.
* The fillUsingDiversionComments() command has been updated to use the CIU HydroBase data to provide more zeros.
* Update to support new StateCU file formats with longer crop names, consistent with similar StateDMI software updates.
* The installer includes several improvements, including more ability to configure the HydroBase information, and displaying previously set HydroBase configuration information as defaults.

## Changes in Version 7.00.00 ##

* Begin using the Nullsoft Scriptable Install System (NSIS) to build software installers.
* Begin distributing TSTool as an executable file TSTool.exe, which starts up the Java Runtime Environment.  This allows for simpler configuration of the Start menu and gives users a more traditional executable to run.
* The software organization is slightly different from the previous releases in order to recognize clearer boundaries between components.  Several new Jar files are provided, rather than being merged with other Jar files.  The Installation and Configuration Appendix lists the files.
* Add support for Colorado Agricultural Livestock Statistics and human population time series in HydroBase.
