# TSTool / Tools #

This chapter discusses the tools available under the ***Tools*** menu.
Tools configure TSTool or analyze data and information.

The ***Tools*** menu lists tools that perform additional analysis on
time series that are selected in the ***Time Series Results*** list.
These features are similar to the ***Results*** menu features in that a
level of additional analysis is performed to produce the data product.

Tools may or may not correspond to commands – often tools internally execute the features available in commands,
in order to implement a more complicated analysis.
Tools are interactive, whereas commands can be used in automated processing.
Tools are therefore appropriate for one-off interactive data viewing,
whereas commands should be used to automate processing on large datasets.

**<p style="text-align: center;">
![Tools Menu](Menu_Tools.png)
</p>**

**<p style="text-align: center;">
Tools Menu
</p>**

Tools may be specific to a datastore type and consequently some
tools may not be available in TSTool for all configurations.
Where possible, TSTool functionality is included in commands to facilitate automation.

*   [Analysis Tools](#analysis-tools)
    +   [Mixed Station Analysis](#mixed-station-analysis)
*   [Report Tools](#report-tools)
    +   [Data Coverage by Year Report](#data-coverage-by-year-report)
    +   [Data Limits Summary Report](#data-limits-summary-report)
    +   [Month Summary Reports](#month-summary-reports)
    +   [Year to Date Total Report](#year-to-date-total-report)
*   [Map Tools](#map-tools)
*   [TSTool Options](#tstool-options)
*   Software and file management:
    +   [File Manager](#file-manager)
    +   [Plugin Manager](#plugin-manager)
    +   [TSTool Installation Manager](#tstool-installation-manager)
*   [Diagnostics](#diagnostics)
    +   [Diagnostics Settings](#diagnostics-settings)
    +   [Diagnostics - View Log File](#diagnostics-view-log-file)

------------------------

## Analysis Tools ##

Analysis tools analyze time series and typically produce an output report.

**<p style="text-align: center;">
![Tools Analysis Menu](Menu_Tools_Analysis.png)
</p>**

**<p style="text-align: center;">
Tools / Analysis Menu
</p>**

### Mixed Station Analysis ###

The ***Mixed Station Analysis*** tool is under development and not ready for production use.
Instead, use the
[`FillMixedStation`](../command-ref/FillMixedStation/FillMixedStation.md) and
[`FillRegression`](../command-ref/FillRegression/FillRegression.md) commands,
which provide most of the functionality envisioned by the interactive tool.
The following  documentation is retained for discussion purposes and to guide future enhancements.

The ***Mixed Station Analysis*** tool is an interactive tool that tries to find the best
combination of time series necessary to fill data using regression or the MOVE2 method.
The optimal results can then optionally be used as parameters for the
[`FillMixedStation`](../command-ref/FillMixedStation/FillMixedStation.md) command.
The following figure illustrates the ***Mixed Station Analysis*** tool.

**<p style="text-align: center;">
![Mixed Station Analysis Interface](Menu_Tools_Analysis_MixedStationAnalysis.png)
</p>**

**<p style="text-align: center;">
Mixed Station Analysis Interface (<a href="../Menu_Tools_Analysis_MixedStationAnalysis.png">see full-size image</a>)
</p>**

## Report Tools ##

Report tools analyze time series, typically creating a summary report.  
 
**<p style="text-align: center;">
![Tools Report Menu](Menu_Tools_Report.png)
</p>**

**<p style="text-align: center;">
Tools / Report Menu
</p>**

### Data Coverage by Year Report ###

The ***Tools / Report - Data Coverage by Year*** menu processes the time series
that have been selected and produces a report similar to the following (abbreviated).
This report is useful, in particular, for evaluating data availability for multiple time series over a period.
Although effort has been taken to make the report as compact as possible,
it may need to be printed in landscape format on a large paper size.

**<p style="text-align: center;">
![Data Coverage by Year Report](Menu_Tools_Report_DataCoverage.png)
</p>**

**<p style="text-align: center;">
Data Coverage by Year Report (<a href="../Menu_Tools_Report_DataCoverage.png">see full-size image</a>)
</p>**
 
### Data Limits Summary Report ###

The ***Tools / Report - Data Limits*** Summary menu processes the time series that
have been selected and produces a report similar to the following (abbreviated).
The data limits summary for each time series is included.
This report is useful, in particular, for evaluating data availability for specific time series.
Currently, only monthly time series have detailed summaries.
All other data intervals shown overall period summaries.
The value `-999` is used to indicate missing data.

**<p style="text-align: center;">
![Data Limits Summary Report](Menu_Tools_Report_DataLimits.png)
</p>**

**<p style="text-align: center;">
Data Limits Summary Report (<a href="../Menu_Tools_Report_DataLimits.png">see full-size image</a>)
</p>**
 
### Month Summary Reports ###

The ***Tools / Report - Month Summary*** menus process the time series
that have been selected and produces a report similar to the following (abbreviated).
This report is similar to default summary output for monthly time series;
however, it is applied to shorter data intervals, including minute, hour, and day interval.
Values are first accumulated to daily values (by averaging the values in a day if the ***Daily Means*** report
is chosen or by totaling the values in a day if the ***Daily Totals*** report is chosen).
For example, use total for precipitation and means for average flows or daily temperature.
The daily values are then further accumulated to produce monthly values, again using means or totals.
The report includes a header for the time series, the report, and footnotes.
Values are only shown if full data are available for a month and statistics are computed using only complete months.

**<p style="text-align: center;">
![Monthly Summary Daily Mean Report](Menu_Tools_Report_MonthSummary_DailyMean.png)
</p>**

**<p style="text-align: center;">
Monthly Summary (Daily Mean) Report (<a href="../Menu_Tools_Report_MonthSummary_DailyMean.png">see full-size image</a>)
</p>**
 
### Year to Date Total Report ###

The ***Tools / Report - Year to Date Total*** menu processes the time series that
have been selected and produces a report similar to the following (abbreviated).
This report is useful, in particular, for comparing on a volumetric basis the
different years of a time series over a full period.
The year-to-date volumes are sorted; to find a particular year, use the ***Search*** button on the report display.
The report information can then be used, for example, to select time series traces for analysis and output.
Currently, this report can only be used to process daily CFS data.
Real-time data can be analyzed by first converting to a daily interval using the
[`ChangeInterval`](../command-ref/ChangeInterval/ChangeInterval.md) command.
Warning: some years may have no data at the beginning of a year and the
corresponding year-to-date totals will consequently be zero.
Refer to the data coverage and data limit reports for more detail.

**<p style="text-align: center;">
![Year to Date Total Report](Menu_Tools_Report_YearToDateTotal.png)
</p>**

**<p style="text-align: center;">
Year to Date Total Report (<a href="../Menu_Tools_Report_YearToDateTotal.png">see full-size image</a>)
</p>**
 
## Map Tools ##

The ***Tools / Select on Map*** menu button is enabled when a map is displayed (using ***View / Map***)
and time series are listed in the upper right part of the main window.
The locations corresponding to selected time series or all time series in this
list can be displayed on the map.  See the [Processing / Spatial Data](../processing/spatial-data/spatial-data.md) documentation for more information.
Map features are implemented at only a basic level.

## TSTool Options ##

The ***Tools / Options*** menu provides a way to set TSTool options during the session.
Minimal capabilities are provided.  Instead, the TSTool environment is typically configured
in its configuration file (see the [Installation and Configuration appendix](../appendix-install/install.md)),
data store configuration files, and with commands.

## File Manager ##

**This feature is under development.**

The ***Tools / File Manager...*** menu item displays the list of managed temporary and cached files used by TSTool.
Temporary files are used in a single TSTool session and may be deleted at the start or end of a session to free up disk space.
Cached files are typically used to increase TSTool performance,
for example to save large web services content that would otherwise require time to download and would negatively impact the user experience
during interactive sessions.

**<p style="text-align: center;">
![File Manager](FileManager.png)
</p>**

**<p style="text-align: center;">
File Manager (<a href="../FileManager.png">see full-size image</a>)
</p>**

The table displays the following information:

**<p style="text-align: center;">
File Manager Table Contents
</p>**

| **Column**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| -- | -- |
| `Scope` | Whether the file is `Temporary` or `Cached`. |
| `Name` | The file name without the full path. |
| `Data Type` | The type of data stored in the file. |
| `File Type` |  |
| `Expires` | The expiration time for the file, used with cached files to indicate when the data need to be reread from the original source. |
| `Is Expired` | Indicates whether the cached file is expired.  If true, it will be reread the next time that the data are requested by TSTool. |
| `Size` | Size of the file in bytes, useful to understand which files are large. |
| `Path` | The full path for the file. |

## Plugin Manager ##

The ***Tools / Plugin Manager...*** menu item displays the list of TSTool plugins,
as shown in the following figure.

The ***Plugin Manager*** is used to list and manage TSTool plugins,
which can be installed to extend the functionality of the core TSTool software.
See the [Plugins](../plugin-ref/overview.md) reference documentation for background.
Note that a single plugin can be used by zero or more datastores as shown by ***View / Datastores***.
Plugins are loaded by TSTool first and then corresponding datastores are connected.

**<p style="text-align: center;">
![Plugin Manager](PluginManager.png)
</p>**

**<p style="text-align: center;">
Plugin Manager (<a href="../PluginManager.png">see full-size image</a>)
</p>**

The table displays the following information:

**<p style="text-align: center;">
TSTool Plugin Manager Table Contents
</p>**

| **Column**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| -- | -- |
| `Name` | Plugin name, which is used in the plugin installation folder and Java `jar` file. |
| `Installation Location` | Whether the plugin is installed in the software installation location or user files. |
| `Plugin Jar File` | Path to the Java `jar` file for the plugin software. |
| `Version` | Plugin version, determined from the `jar` file manifest, `jar` file name, and installation folder name, as available. |
| `Uses Version Folder` | Whether the installation uses a version folder. Version folders were phased in for TSTool 15 and allow multiple versions of the same plugin to be installed and used with the appropriate TSTool version. |
| `TSTool Version Requirement` | The plugin `jar` file manifest data indicating the required TSTool version, being phased in as of TSTool 15 to allow different plugin versions to indicate their TSTool compatibility (e.g., `> 15.0.0`). |
| `Compatible with TSTool` | Whether the plugin is compatible with the current TSTool, may be blank if unable to determine.  Lacking other information, the plugin will be assumed to be compatible. |
| `Best Compatible with TSTool` | Whether the plugin is the best compatible version for the current TSTool.  This version will be loaded when TSTool starts and other versions will be ignored. The newest compatible plugin version will be used (or newest if compatibility is unknown for all plugin versions). |
| `Installation Folder` | The plugin installation folder (folder for `Plugin jar file`). |
| `Installation Size` | The size of all files in the installation folder, in bytes.  This is useful when considering whether to delete old TSTool plugin software to free up disk space. |
| `Last Modified Time` | The last time that the plugin software was modified, based on the installation folder contents. This can be useful for troubleshooting. |
| `Dependencies` | The number of dependency files that are packaged with the plugin in the plugin's `dep/` folder. This is useful for understanding dependencies, which have versions compatible with the plugin version. | 
| `Jar Manifest` | Java `jar` file manifest attributes, useful for troubleshooting. |

The ***Plugin Manager*** can be used to perform plugin software maintenance.
Select a single plugin by clicking on a cell in the table.
Then use the following buttons.
Checks, warnings, and confirmations are shown, as appropriate.

*   ***Add Version Folder*** - If the plugin installation does not use a version folder,
    a version folder will be created and plugin software files will be moved to the folder.
    **If the plugin is loaded when TSTool starts, then the action must be performed when TSTool is not running,
    using File Explorer on Windows or other suitable tool.**

*   ***Delete*** - Delete the selected plugin.
    **If the plugin is loaded when TSTool starts, then the action must be performed when TSTool is not running,
    using File Explorer on Windows or other suitable tool.**

## TSTool Installation Manager ##

The ***Tools / TSTool Installation Manager...*** menu item displays the list of TSTool installations,
as shown in the following figure.
This is used to list and manage TSTool installations.
Note that the software installation files are separate from the TSTool user files located in the user's `.tstool` folder.

**<p style="text-align: center;">
![TSTool Installation Manager](TSToolInstallationManager.png)
</p>**

**<p style="text-align: center;">
TSTool Installation Manager (<a href="../TSToolInstallationManager.png">see full-size image</a>)
</p>**

The table displays the following information:

**<p style="text-align: center;">
TSTool Installation Manager Table Contents
</p>**

| **Column**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| -- | -- |
| `Version` | TSTool version, determined from the installation folder name. |
| `Version Date` | TSTool version date, determined from running the command line version with `--version-date`. **This is under development.** |
| `Installation Folder` | The main installation folder for the software, based on searching standard installation locations on the computer. On Windows, this does not currently examine the Windows registry so installations in nonstandard locations may not be listed. |
| `Installation Size` | The size of all files in the installation folder, in bytes.  This is useful when considering whether to delete old TSTool versions to free up disk space. |
| `Last Run Time` | The last time that the TSTool version was run, based on the timestamp on the software installation and user startup log files. If a version has not been run recently, it may not be needed and can be removed (see the [Install TSTool](../appendix-install/install.md/#uninstalling-tstool) appendix). |
| `Last Modified Time` | The last time that the TSTool software was modified, based on the software `bin` folder contents. This can be useful for troubleshooting. |
| `User Folder` | The user folder for the TSTool major version.  This folder will be shared among multiple TSTool installations having the same major version. |
| `User Folder Size` | The size of the user folder, in bytes, for the TSTool major version. This is useful when considering whether to delete old TSTool user files, such as TSTool plugins and the startup log file, to free up disk space. Some files, including datastore configuration files, are automatically copied to a new TSTool major version's user files when a new major version of TSTool is run for the first time, which helps to avoid accidental loss of useful files. |

## Diagnostics ##

Diagnostics features are useful for troubleshooting.
When an error occurs, a small warning dialog may be displayed, as shown in the following figure:

**<p style="text-align: center;">
![Example Warning Message Dialog](Diagnostics_Warning.png)
</p>**

**<p style="text-align: center;">
Example Warning Message Dialog
</p>**

If results are not as expected, also review the messages in the status bar at the bottom of the main or secondary windows. 

### Diagnostics Settings ###

The ***Tools / Diagnostics*** menu item displays the ***Diagnostics*** dialog,
which is used to set message levels and view messages as the application runs.
The ***Diagnostics*** dialog (see the following figure) can be used to evaluate a problem.

**<p style="text-align: center;">
![Diagnostics Interface](Diagnostics.png)
</p>**

**<p style="text-align: center;">
Diagnostics Interface (<a href="../Diagnostics.png">see full-size image</a>)
</p>**

The settings at the top of the dialog are used to specify the level of detail
for messages printed to the console window,
the status area at the bottom of the main window (and the ***Diagnostics*** dialog), and the log file.
The log file contains warning, status, and debug messages,
many of which are not normally displayed in the main interface.
The log file is created in the logs directory under the installation directory.
The ***Diagnostics*** interface features are as follows:

|**Dialog Feature**|**Description**|
|--|--|
|***Status***, ***Warning***, ***Debug***|Enter integer values, with larger numbers resulting in more output and slower performance.  Zero indicates no output.  If troubleshooting, a good guideline is to set the debug level to 10 or 30 (and select the ***Allow Debug*** checkbox).  The default settings are often enough for normal troubleshooting and result in good software performance.|
|***Allow Debug***|Select to enable debug messages.  Turning on debug messages will significantly slow down the software.|
|***Show Messages***|Select to display messages in the ***Diagnostics*** window.|
|***Flush Log File***|Force messages to be written to the log file.  Messages can be buffered in memory and may not otherwise immediately be written to the log file.|
|***Restart Log File***|Restart the log file.  This is useful if a long session has occurred and troubleshooting will occur on new actions.|
|***New Log File***|Open a new log file, with a new name.|
|***Apply***|Apply the settings in the ***Diagnostics*** dialog.|
|***View Log File***|View the log file in an integrated window.  The View Log File button will be enabled if the log file has been opened.|
|***Launch Log File Viewer***|View the log file using a viewer from the operating system.  On Windows computers, Notepad will be used.|
|***Close***|Apply the settings in the ***Diagnostics*** dialog and close the window.|

### Diagnostics - View Log File ###

The ***Tools / Diagnostics – View Log File*** menu item displays the integrated log file viewer.
Selecting this menu item is equivalent to selecting the View Log File button in the ***Diagnostics*** dialog.
The log file viewer will be displayed in a window as shown in the following figure.

**<p style="text-align: center;">
![Log File Viewer Window](Diagnostics_ViewLog.png)
</p>**

**<p style="text-align: center;">
Log File Viewer Window (<a href="../Diagnostics_ViewLog.png">see full-size image</a>)
</p>**

The log file messages can be scrolled.
To find a string in the log file, right-click and select the ***Find*** menu item.
The information in the log file can also be copied and pasted into email, when contacting support.
