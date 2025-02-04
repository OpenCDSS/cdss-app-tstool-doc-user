# TSTool / Release Notes #

This appendix provides information about changes that have occurred in TSTool.
A summary table is provided, with links to details for major versions.

*   [TSTool Version History](#tstool-version-history)
*   [TSTool Version Details] - the following are separate documentation pages for major TSTool versions
    +   [Version 14 Details](release-notes-14.md)
    +   [Version 13 Details](release-notes-13.md)
    +   [Version 12 Details](release-notes-12.md)
    +   [Version 11 Details](release-notes-11.md)
    +   [Version 10 Details](release-notes-10.md)
    +   [Version 9 Details](release-notes-09.md)
    +   [Version 8 Details](release-notes-08.md)
    +   [Version 7 Details](release-notes-07.md)
    +   [Version 6 Details](release-notes-06.md)
*   [Known Limitations](#known-limitations)
*   [TSTool Version Numbering Convention](#tstool-version-numbering-convention)
*   [TSTool Issue Icons](#tstool-issue-icons)

---------------

## TSTool Version History ##

The following table summarizes the TSTool release history.
See the TSTool Version Details links above or the links in the following table for more detailed information about each version.
Only recent versions are documented in detail.
Comments for minor versions may be listed under a version that is publicly released.
Release note details are categorized with [issue type icons](#tstool-issue-icons).

**<p style="text-align: center;">
TSTool Version History Summary (most current at top)
</p>**

|**TSTool Version(s)**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Summary of Major Changes in Version**|**Release Date**|
|--|--|--|
|[14.10.0](release-notes-14.md)|Feature release with many enhancements to support advanced workflows. | 2025-02-04 |
|[14.9.6](release-notes-14.md)|Maintenance release to improve complex workflow automation and maintenance. | 2024-08-19 |
|[14.9.5](release-notes-14.md)|Maintenance release to improve complex workflow automation and maintenance. | 2024-04-29 |
|[14.9.4](release-notes-14.md)|Maintenance release to improve table comparison and enable command notifications. | 2024-04-15 |
|[14.9.3](release-notes-14.md)|Maintenance release to improve table comparison and math, and time series comparison. | 2024-03-07 |
|[14.9.2](release-notes-14.md)|Maintenance release to enable step graph. | 2024-01-02 |
|[14.9.1](release-notes-14.md)|Maintenance release to enhance plugin integration and fix workflow issues. | 2023-12-04 |
|[14.9.0](release-notes-14.md)|Feature release to use OpenJDK 8, enable additional plotting symbols, map view fixes. | 2023-10-30 |
|[14.8.6](release-notes-14.md)|Maintenance release to improve time zone handling. | 2023-07-24 |
|[14.8.5](release-notes-14.md)|Maintenance release to enhance plugin integration. | 2023-07-14 |
|[14.8.4](release-notes-14.md)|Maintenance release to fix issues when processing text files. | 2023-07-11 |
|[14.8.3](release-notes-14.md)|Maintenance release to enable raster graph for hour and minute interval time series. | 2023-06-05 |
|[14.8.2](release-notes-14.md)|Maintenance release to fix raster graphs when missing data. | 2023-05-30 |
|[14.8.1](release-notes-14.md)|Maintenance release to support the new Zabbix plugin. | 2023-05-25 |
|[14.8.0](release-notes-14.md)|Feature release to improve dataset publishing and visualization. Remove the requirement for administrator permissions to install on Windows. | 2023-04-27 |
|[14.7.0](release-notes-14.md)|Feature release to improve the experience for new users. | 2023-03-26 |
|[14.6.0](release-notes-14.md)|Feature release to implement command indentation. | 2023-02-26 |
|[14.5.4](release-notes-14.md)|Maintenance release to improve plugin integration and automated testing. | 2023-02-13 |
|[14.5.3](release-notes-14.md)|Maintenance release to improve plugin integration. | 2023-01-19 |
|[14.5.2](release-notes-14.md)|Maintenance release to improve JSON object features, fix HydroBase web service issue. | 2023-01-05 |
|[14.5.1](release-notes-14.md)|Maintenance release to improve cloud integration, JSON object features, and HydroBase web service diversion record handling. | 2022-12-14 |
|[14.5.0](release-notes-14.md)|Feature release to improve cloud integration and JSON object features. | 2022-12-02 |
|[14.4.0](release-notes-14.md)|Feature release to improve cloud integration features, add object top-level data type, fix HEC-DSS 64-bit implementation. | 2022-10-27 |
|[14.3.0](release-notes-14.md)|Feature release to improve automated testing and cloud integration, re-enable Access. | 2022-08-01 |
|[14.2.2](release-notes-14.md)|Maintenance release to fix issues identified in HydroBase REST web services. | 2022-04-07 |
|[14.2.1](release-notes-14.md)|Maintenance release to disable real-time data in HydroBase database datastore, other cleanup for recent releases. |2022-03-24|
|[14.2.0](release-notes-14.md)|Feature release to add HydroBase REST web service historical climate and surface water stations and support sub-second time precision. |2022-03-21|
|[14.1.1](release-notes-14.md)|Maintenance release to improve features used in automated testing.|2022-02-28|
|[14.1.0](release-notes-14.md)|Feature release to add commands to output table in Markdown format, set table column properties.|2022-02-16|
|[14.0.6](release-notes-14.md)|Maintenance release to improve `# @require` functionality.|2022-02-04|
|[14.0.5](release-notes-14.md)|Maintenance release for testing features and to update `Log4J` library.|2022-01-30|
|[14.0.4](release-notes-14.md)|Maintenance release to update training documentation and respond to "Log4Shell" vulnerability.|2021-12-19|
|[14.0.3](release-notes-14.md)|Maintenance release for ReclamationHDB release.|2021-11-26|
|[14.0.2](release-notes-14.md)|Maintenance release, mainly fixes related to automated testing.|2021-11-15|
|[14.0.1](release-notes-14.md)|Maintenance release, mainly fixes related to automated testing.|2021-10-29|
|[14.0.0](release-notes-14.md)|First 64-bit Java release.|2021-08-26|
|[13.04.00](release-notes-13.md)|Enhancements to facilitate automated testing, final 32-bit Java release.|2021-08-24|
|[13.03.00](release-notes-13.md)|Many enhancements to automate processing of large datasets.|2020-08-12|
|[13.02.00](release-notes-13.md)|Improve table processing commands, clarify HydroBase read commands, improve support for stored procedures with parameters.|2019-09-10|
|[13.01.00](release-notes-13.md)|Improve troubleshooting feedback for HydroBase datastore configuration, streamline Linux installer.|2019-08-04|
|[13.00.00](release-notes-13.md)|First major release with OpenCDSS open source license.|2019-07-12|
|[12.07.00](release-notes-12.md)|Improve plugin datastore support. |2018-09-19|
|[12.06.00](release-notes-12.md)|Update all editor dialogs to link to documentation and other editor improvements.|2018-09-14|
|[12.05.00](release-notes-12.md)|Various enhancements and cleanup based on open source migration, preliminary HydroBase REST web services implementation.|2018-07-03|
|[12.04.00](release-notes-12.md)|Enhance support for [datastore plugins](../datastore-ref/Plugin/Plugin.md).  Add network object.  Add initial [WaterML 2.0](../datastore-ref/WaterML2/WaterML2.md) support.|2017-07-13|
|[12.00.00](release-notes-12.md)|Update to use Java 8 including using Java 8 language standards.  Add new graphing features including y-axis zoom, and graph template feature.  Many other minor enhancements.|2017-04-24|
|11.11.00 – 11.13.00|Improve Excel integration, enhance [`For`](../command-ref/For/For.md) command support for various commands.  Enhance [`VariableLagK`](../command-ref/VariableLagK/VariableLagK.md) command to read and save states.  Add graph mouse tracker and time series select/highlight.|2017-03-07|
|11.09.00 – 11.10.01|TSTool configuration files have been added to the user’s home folder in addition to the installation files.  Windows are positioned on TSTool screen, handling multiple monitors.  Begin prototyping HTML command documentation.  Initial version of [plugin datastore](../datastore-ref/Plugin/Plugin.md) and [plugin command](../command-ref/Plugin/Plugin.md) features.|2016-05-02|
|11.08.00 – 11.08.01|Enhancements to write tables and time series to additional spatial formats.  Add support for [Delft FEWS Pi XML format](../datastore-ref/Delft-FEWS-PI-XML/Delft-FEWS-PI-XML.md), which is used by the National Weather Service.  Update additional commands to recognize properties as input.|2016-02-14|
|11.07.00 – 11.07.06|Add support for [Reclamation Pisces datastore](../datastore-ref/ReclamationPisces/ReclamationPisces.md).  Add support for writing [HydroJSON format](../datastore-ref/HydroJSON/HydroJSON.md).  Add preliminary support for writing [WaterML](../datastore-ref/WaterML/WaterML.md). Add support for reading JSON into table.|2015-12-09|
|11.06.00 – 11.06.01|Add [`ReadExcelWorkbook`](../command-ref/ReadExcelWorkbook/ReadExcelWorkbook.md) command and enhance [`CloseExcelWorkbook`](../command-ref/CloseExcelWorkbook/CloseExcelWorkbook.md) to allow existing workbooks to be read and updated.  Other maintenance.|2015-07-29|
|11.05.00|Add date/time for appropriate statistics in [`CalculateTimeSeriesStatistic`](../command-ref/CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic.md).|2015-07-17|
|11.04.00 – 11.04.03|Add support for `${Property}` in additional commands.  Improve error handling when [`RunCommands`](../command-ref/RunCommands/RunCommands.md) is used with [`For`](../command-ref/For/For.md).   List all output files in TSTool interface when using [`For`](../command-ref/For/For.md).|2015-07-15|
|11.03.00 – 11.03.10|Add support for `${Property}` in some command parameters for over 50 commands.  Enable nested [`For`](../command-ref/For/For.md) loops.  Add support for Excel formatting condition and style tables.  Multiple incremental updates during beta testing.|2015-06-29|
|11.02.00 – 11.02.03|Improved Excel integration and automation control for table and properties, add properties and data flag descriptions to [DateValue files](../datastore-ref/DateValue/DateValue.md), add flags and descriptions to more fill/set commands.|2015-05-27|
|11.01.00|[ReclamationHDB datastore](../datastore-ref/ReclamationHDB/ReclamationHDB.md) support enhancements.|2015-03-23|
|11.00.00|Update from Java 6 to 7.  Enhancements for Excel integration.  Add PostgreSQL database support.|2015-03-16|
|10.31.00|Add preliminary [`For`](../command-ref/For/For.md) command.|2014-08-05|
|10.30.00 – 10.30.02|Add [`InsertTableColumn`](../command-ref/InsertTableColumn/InsertTableColumn.md), other enhancements to facilitate calculating statistics and saving output to tables.|2014-06-22|
|10.29.00|Additional Excel integration and table processing features.|2014-05-19|
|10.28.02|Enable table view for irregular interval time series.  Enhance [ReclamationHDB](../datastore-ref/ReclamationHDB/ReclamationHDB.md) query features.|2014-04-19|
|10.27.00|Significant Excel integration improvements, add some utility commands.|2014-03-21|
|10.26.00|Improve [NRCS AWDB web service](../datastore-ref/NRCS-AWDB/NRCS-AWDB.md) support.  Add [`If`](../command-ref/If/If.md) and [`Endif`](../command-ref/EndIf/EndIf.md) and other enhancements to help automate computation of NRCS Surface Water Supply Index.|2013-12-24|
|10.25.00|Additional enhancements for [ReclamationHDB datastore](../datastore-ref/ReclamationHDB/ReclamationHDB.md).|2013-10-15|
|10.24.01|Change ensemble trace identifiers to string to allow more flexibility.  Update [ReclamationHDB](../datastore-ref/ReclamationHDB/ReclamationHDB.md) commands to handle ensembles.|2013-09-30|
|10.23.00|Initial work to add features to create time series event table to annotate products.  Fix [`FillRegression`](../command-ref/FillRegression/FillRegression.md) and [`FillMixedStation`](../command-ref/FillMixedStation/FillMixedStation.md) issues introduced in previous release.|2013-09-12|
|10.22.00|Add raster graph and move data visualization commands to new menu, improve [generic database datastore](../datastore-ref/GenericDatabase/GenericDatabase.md) read/write functionality.|2013-08-30|
|10.21.00|Add initial network processing command, add additional functionality for processing tables, and a number of maintenance updates.|2013-07-14|
|10.20.00|Enhancements to [ReclamationHDB](../datastore-ref/ReclamationHDB/ReclamationHDB.md) read/write commands.  Enable filtering [HydroBase](../datastore-ref/CO-HydroBase/CO-HydroBase.md) diversion coding structures by structure type and WDID.|2013-04-21|
|10.19.00|Enhancements to [ReclamationHDB](../datastore-ref/ReclamationHDB/ReclamationHDB.md) write features.|2013-03-16|
|10.18.00|Add commands to read a table from Excel and write to a datastore.|2013-03-03|
|10.17.00|Add [`ProfileCommands`](../command-ref/ProfileCommands/ProfileCommands.md) command and other features to help with performance on large command files.|2013-02-18|
|10.16.00|Minor update to improve processing of well level data and templates.|2013-02-13|
|10.15.00|Minor update in response to feedback on previous release, split documentation into multiple volumes.|2013-01-14|
|10.14.00|Minor update in response to feedback on previous release.|2012-12-18|
|10.13.00|Many enhancements to improve USGS processing, add [NRCS AWDB support](../datastore-ref/NRCS-AWDB/NRCS-AWDB.md), add [`TableToTimeSeries`](../command-ref/TableToTimeSeries/TableToTimeSeries.md) command.|2012-12-04|
|10.12.00|Many enhancements to improve HydroBase, USGS, and general datastore processing.|2012-10-01|
|10.11.00|Update to support [RCC ACIS](../datastore-ref/RCC-ACIS/RCC-ACIS.md) version 2.|2012-07-03|
|10.10.00|Add exceedance probability and related statistics to [`RunningStatisticTimeSeries`](../command-ref/RunningStatisticTimeSeries/RunningStatisticTimeSeries.md) command.|2012-06-12|
|10.00.00 – 10.09.00|Migrate all `TS Alias = Command()` syntax to `Command(Alias=”...”)`.  Other user interface cleanup, maintenance, and many enhancements.|2012-05-15|
|9.10.00 – 9.10.03|Add support for [Reclamation HDB database](../datastore-ref/ReclamationHDB/ReclamationHDB.md), [Regional Climate Center RCC ACIS](../datastore-ref/RCC-ACIS/RCC-ACIS.md) (preliminary), and [USGS NWIS](../datastore-ref/USGS-NWIS-Daily/USGS-NWIS-Daily.md) (preliminary) as data stores.  Add area graphs.|2011-02-18|
|9.09.00 – 9.09.01|Add additional commands for table processing.  Improve template integration with processor properties and tables.|2010-10-18|
|9.08.00 – 9.08.01|Support connecting to more than one [RiversideDB](../datastore-ref/RiversideDB/RiversideDB.md) and introduce the concept of named data stores as an alternative to input type/name.  Add [`TableMath`](../command-ref/TableMath/TableMath.md) and [`TableTimeSeriesMath`](../command-ref/TableTimeSeriesMath/TableTimeSeriesMath.md) commands.|2010-09-15|
|9.07.00 – 9.07.02|Add HTML summary, improve data flag handling, improve Python integration, initial support for [ColoradoWaterHBGuest web service](../datastore-ref/ColoradoWaterHBGuest/ColoradoWaterHBGuest.md), include training materials, other maintenance.|2010-08-20|
|9.06.00 – 9.06.04|Initial support for [ColoradoWaterSMS web service](../datastore-ref/ColoradoWaterSMS/ColoradoWaterSMS.md), enhance [RiversideDB](../datastore-ref/RiversideDB/RiversideDB.md) support, various improvements.|2010-05-25|
|9.05.00 – 9.05.03|Enhancements to support additional time series and ensemble processing, in particular to compute statistics for drought studies.|2009-11-17|
|9.04.00 – 9.04.02|The following features are now at production level:  [`ReadTableFromDelimitedFile`](../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md), [`WriteTableToDelimitedFile`](../command-ref/WriteTableToDelimitedFile/WriteTableToDelimitedFile.md), [`ResequenceTimeSeriesData`](../command-ref/ResequenceTimeSeriesData/ResequenceTimeSeriesData.md).   The [`CalculateTimeSeriesStatistic`](../command-ref/CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic.md) command and additional table processing features have been added.|2009-07-28|
|9.01.00 – 9.03.06|Add [`VariableLagK`](../command-ref/VariableLagK/VariableLagK.md) and [`RunDSSUTL`](../command-ref/RunDSSUTL/RunDSSUTL.md) commands, fix several bugs, and enhance several commands.   Add preliminary [`CheckTimeSeries`](../command-ref/CheckTimeSeries/CheckTimeSeries.md), [`WriteCheckFile`](../command-ref/WriteCheckFile/WriteCheckFile.md) commands.  Enhance the [`ChangeInterval`](../command-ref/ChangeInterval/ChangeInterval.md) command and documentation.|2009-04-29|
|9.00.00 – 9.00.05|Update from Java 1.4.2 to Java 1.6, various bug fixes.|2009-02-05|
|8.18.00 – 8.18.02|Initial [HEC-DSS](../datastore-ref/HEC-DSS/HEC-DSS.md) support.  Improved [RiversideDB](../datastore-ref/RiversideDB/RiversideDB.md) support.|2008-11-24|
|8.17.01 – 8.17.02|Bug fixes for 8.17.00.  See below. New features include ***File / New*** to open a new command file and add support for new [StateMod 12.29 binary file format](../datastore-ref/StateModB/StateModB.md).|2008-10-29|
|8.17.00|All commands are updated to the new error handling and named parameter notation.  Many other minor changes have been made for consistency.  Many minor user-requested enhancements have been implemented.  Several minor bugs reported by users have been fixed.  The [StateCUB (StateCU binary output file)](../datastore-ref/StateCUB/StateCUB.md) has been enabled.|2008-10-06|
|8.16.00 – 8.16.02|Migrate additional commands to new error-handling and named parameter notation.  Add [`RunPython`](../command-ref/RunPython/RunPython.md) and [`FTPGet`](../command-ref/FTPGet/FTPGet.md) commands.|2008-07-22|
|8.15.01 – 8.15.03|Fix a number of problems where migration of commands from fixed parameter to named parameter syntax resulted in some old command files not being handled.  The command file is also now marked as modified if any commands are automatically updated.  Added more error checks, such as in DateValue file reading to help provide better feedback to users.|2008-06-11|
|8.13.00 – 8.14.02|Add commands to set properties, for use by other commands (e.g., to configure file names).  Continue updating commands to utilize the new error handling.|2008-02-20|
|8.03.00 – 8.12.06|Update many commands to utilize new error handling and consistently handle the `TSList` parameter.  Add ensemble processing to many commands.  Enable ability for read commands to run in discovery mode to let other commands know time series identifiers.  Add more commands to compute statistics time series.|2008-01-14|
|8.00.00 – 8.02.00|Update main interface to use new error-handling visualization features.  Add several commands to allow TSTool to perform regression tests on itself.|2007-12-03|
|7.04.00|Various updates for [HydroBase](../datastore-ref/CO-HydroBase/CO-HydroBase.md) including adding support for administrative flow station.  Allow reading [StateMod rights files](../datastore-ref/StateMod/StateMod.md) and handle new [StateCU file formats](../datastore-ref/StateCU/StateCU.md).|2007-06-22|
|7.01.00|Support new `SFUT(G)` coding for [HydroBase](../datastore-ref/CO-HydroBase/CO-HydroBase.md) diversion classes, and allow `CIU` when filling diversion data.  Fix a number of bugs in the [`AnalyzePattern`](../command-ref/AnalyzePattern/AnalyzePattern.md), [`FillInterpolate`](../command-ref/FillInterpolate/FillInterpolate.md), and [`Cumulate`](../command-ref/Cumulate/Cumulate.md) commands|2007-03-02|
|7.00.00|Begin distributing software using a new installer.  Add CASS livestock data and human population data.|2006-10-31|
|6.19.00|Update to extend period when filling with diversion comments.|2006-05-19|
|6.18.00|Add the [`RunCommands`](../command-ref/RunCommands/RunCommands.md) command to facilitate data processing.|2006-05-02|
|6.17.00|Add the [`CompareFiles`](../command-ref/CompareFiles/CompareFiles.md) command to facilitate testing.|2006-04-17|
|6.16.02|Begin adding commands to test data, for alarms.|2006-04-17|
|6.16.01|Time series to map link is enabled.  Improve UNC support.  Improve startup performance in batch mode.|2006-02-16|
|6.16.00|Begin adding support for [NDFD (National Digitial Forecast Database)](../datastore-ref/NDFD/NDFD.md) input type, and maintenance.|2006-01-31|
|6.15.00|Begin adding time series to map link.|2006-01-16|
|6.14.00|Update some commands to named parameter notation, and maintenance.|2005-12-14|
|6.13.00|Internal release.|2005-11-13|
|6.12.00|Improve error handling when running in batch mode with graphs.|2005-10-05|
|6.11.00|Enable the ColoradoSMS input type for hydrograph annotations and update batch mode features to better utilize the CDSS configuration file.|2005-10-05|
|6.10.09|Maintenance release – convert some commands to use named parameters.|2005-09-28|
|6.10.08|Maintenance release – convert some commands to use named parameters.  Add the [`NewStatisticYearTS`](../command-ref/NewStatisticYearTS/NewStatisticYearTS.md) command.|2005-09-22|
|6.10.07|Maintenance release – convert some commands to use named parameters.|2005-08-24|
|6.10.06|Release corresponding to the CDSS CD release.|2005-08-04|
|6.10.05|Respond to CDSS testing feedback.|2005-08-01|
|6.10.04|Respond to CDSS testing feedback.  Add additional query filters for [HydroBase](../datastore-ref/CO-HydroBase/CO-HydroBase.md) stations and structures.|2005-07-20|
|6.10.03 BETA|Begin phasing in saving time series products to [HydroBase](../datastore-ref/CO-HydroBase/CO-HydroBase.md) and [`RiversideDB`](../datastore-ref/RiversideDB/RiversideDB.md).|2005-07-08|
|6.10.02 BETA|Update the [`OpenHydroBase`](../command-ref/OpenHydroBase/OpenHydroBase.md) command to use free-format parameters.|2005-06-28|
|6.10.01 BETA|Begin enabling data flags for time series to support enhancements to fill commands.|2005-06-03|
|6.10.00 BETA|Initial release supporting [HydroBase](../datastore-ref/CO-HydroBase/CO-HydroBase.md) stored procedures with initial prototypes of Mixed Station Analysis and related features.  Implement new message log viewer and commands to simplify comparison of time series.|2005-06-01|
|6.09.03|Maintenance release.|2004-12-21|
|6.09.02|Maintenance release.|2004-10-05|
|6.09.01|Add NWSRFS FS5Files input type.|2004-09-01|
|6.09.00|Add [`ReadHydroBase`](../command-ref/ReadHydroBase/ReadHydroBase.md) commands.|2004-08-27|
|6.08.02|Documentation made current to include all version 6 changes.|2004-07-27|
|6.08.01|Allow [HydroBase](../datastore-ref/CO-HydroBase/CO-HydroBase.md) connection to be made at startup.|2004-07-20|
|6.08.00|Allow wildcards in commands that read from [StateCU](../datastore-ref/StateCU/StateCU.md) and [StateModB](../datastore-ref/StateModB/StateModB.md) input types.|2004-07-11|
||Initial Java version.|1997-10-23|

## Known Limitations ##

*   ![limitation](limitation.png) TSTool uses a “discovery mode” to partially execute commands when editing the commands.
    This is used to determine lists of time series identifiers, table identifiers, and properties for editor choices.
    However, some workflow logic is so complex that commands cannot fully execute in discovery mode.
    Consequently, warnings may result when loading a command file or some editor choices may be incomplete.
    When this is known to be an issue, the command editors provide a text field rather than a choice.
    These complexities will be improved over time as additional resources are devoted to solving design limitations.
*   ![limitation](limitation.png) When saving time series product [(`*.tsp`) files](../appendix-tsview/tsview.md),
    the absolute path is saved with each file.
    This is not as portable as saving a path relative to the command file.
    It may be necessary to edit the product file manually to change file paths from absolute to relative – the
    relative path will then be converted to absolute when processed and time series files will be found,
    assuming that the locations are consistent.
*   ![limitation](limitation.png) The [`ReadStateCUB`](../command-ref/ReadStateCUB/ReadStateCUB.md) command,
    unlike other read commands, does not provide a discovery mode.
    Consequently, other commands will not be provided with a list of time series identifiers for the binary file.
    The reason for this is that StateMod and StateCU binary files can contain a huge number
    of time series and providing a list could be overwhelming and slow.
    Alternatives are being evaluated.
    Currently, commands that reference time series in the binary files must use
    more generic selection methods such as `TSLIST=AllMatchingTSID` and `TSID` with wildcards.
*   ![limitation](limitation.png) Plotting features do not understand the concept of instantaneous, mean,
    and accumulated time series (referred to as the time scale).  All values are plotted at data value date/time.
    In the future, features may be implemented to automatically determine from the
    data type and time scale whether to adjust the visual representation based on the time scale,
    for example to use a “carry forward” line instead of connecting points.
*   ![limitation](limitation.png) Using the [`SetWorkingDir`](../command-ref/SetWorkingDir/SetWorkingDir.md)
    command may result in warnings after commands are edited.
    This is due to the initial checks on filenames not fully recognizing the impacts of previous
    [`SetWorkingDir`](../command-ref/SetWorkingDir/SetWorkingDir.md) commands.
    It is recommended that the [`SetWorkingDir`](../command-ref/SetWorkingDir/SetWorkingDir.md) command be avoided and
    that paths be specified relative to the command file.

## TSTool Version Numbering Convention ##

TSTool versioning generally adheres to the following pattern.
The version may be incremented in source code but does not become official until a public software release is made.

```
Major.Minor.Maintenance
```
where:

*   `Major` is a number indicating a major change to the software
*   `Minor` is a number indicating a minor change to the software
*   `Maintenance` is a number indicating a maintenance release,
    for example to fix a bug with no new features
*   The version may also be followed by another indicator such as `dev1` or `beta` to indicate
    a development release that is intended for review before a production release.
*   Numbers have traditionally been two digits and zero-padded;
    however, the zero-padding convention may be abandoned moving forward given
    that the major version does not require it to sort the version.

This convention is not always strictly followed but more attention to this standard is now occurring.

The above version string is used in the software as follows, where `Version` is the version as noted above:

*   installation folder on Windows is `C:\CDSS\TSTool-Version`
*   Windows ***Start*** menu is ***Start / CDSS / TSTool-Version***
*   Windows install file is `TSTool_CDSS_Version_Setup.exe`

## TSTool Issue Icons ##

The following icons are used to indicate the type of issue in release notes,
and release note items are typically listed in the following order:

*   ![limitation](limitation.png) **Known Limitation** – A known limitation has been documented and may impact the user.
    The limitation will be addressed in a future release.
*   ![bug](bug.png) **Bug Fix** – A bug has been fixed.  Users should evaluate whether their work is impacted.
    Sometimes bug fixes impact internal code and changes may not be very visible to users.
*   ![remove](remove.png) **Remove** – A feature has been removed, generally because functionality
    has been migrated to other code or the functionality is no longer needed (e.g., a database is no longer available).
*   ![change](change.png) **Update/Change** – An existing feature has been changed or enhanced.
    Backward compatibility is usually retained.  Modifications to an existing command are considered a change.
*   ![new](new.png) **New Feature** – A new feature has been added, such as a new command.
    New features may or may not be obvious to users but will generally be visible in menus.
