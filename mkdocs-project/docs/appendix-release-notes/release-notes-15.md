# TSTool / Release Notes / Version 15 #

Release notes for specific versions are listed below.
See also the [GitHub repository issues](https://github.com/OpenCDSS/cdss-app-tstool-main/issues)
for outstanding issues and enhancement requests.
Issues may also be included in other repositories that are TSTool components.

*   [Changes in Version 15.4.0](#changes-in-version-1540)
*   [Changes in Version 15.3.2](#changes-in-version-1532)
*   [Changes in Version 15.3.1](#changes-in-version-1531)
*   [Changes in Version 15.3.0](#changes-in-version-1530)
*   [Changes in Version 15.2.0](#changes-in-version-1520)
*   [Changes in Version 15.1.0](#changes-in-version-1510)
*   [Changes in Version 15.0.0](#changes-in-version-1500)
*   [Release notes for all versions](release-notes.md)

----------

## Changes in Version 15.4.0 ##

**Feature release to improve NRCS AWDB REST API integration, graphing, and complex workflows.**

*   ![bug](change.png) [15.4.0] Fix the [`ReadDelimitedFile`](../command-ref/ReadDelimitedFile/ReadDelimitedFile.md) command:
    +   Irregular interval time series records with no data value were being skipped.
        The values are now set using the time series' missing data value.
*   ![new](new.png) [15.4.0] Begin adding [TSView Time Series Viewing Tools](../appendix-tsview/examples/overview.md) example configurations
    to help create data visualizations.
*   ![change](change.png) [15.4.0] Update the ***Results / Time Series Properties*** view:
    +   include notes explaining the data
    +   improve the properties table layout
    +   add the data flag table
*   ![change](change.png) [15.4.0] Improve database connection code to better handle resource management for statements and sessions,
    especially when connections are lost.
*   ![change](change.png) [15.4.0] Update graphing tools:
    +   Add the `CompareSymbolColor`, `CompareSymbolSize`, `CompareSymbolStyle`, and `CompareTolerance` properties for point graphs,
        which will display a symbol if the data for the graphed time series have the same date/time and value.
        This can be used to compare time series from two sources.
    +   Determine the y-axis limits based on the time series period that is output for a time series product
        (previously the full available period was used).
*   ![change](change.png) [15.4.0] Update heat map (raster graph) tools:
    +   Add the `expression` column to symbol table to allow more complex logic in symbol tables using the EvalEx library.
    +   Verify that single and multiple time series graphs can be created for all regular intervals minute through year.
*   ![change](change.png) [15.4.0] Replace the `TSTool.bat` file with `tstool.cmd` for Windows:
    +   Update to the current TSTool configuration so that it can be run as an option to `TSTool.exe` for troubleshooting.
*   ![change](change.png) [15.4.0] Update the [`AppendFile`](../command-ref/AppendFile/AppendFile.md) command:
    +   Do not trim the `AppendText` parameter value so that text with leading and trailing spaces can be appended.
*   ![change](change.png) [15.4.0] Update the [`CheckTimeSeries`](../command-ref/CheckTimeSeries/CheckTimeSeries.md) command:
    +   Add the `ActionStatus` parameter to control the command status when criteria matches occur.
*   ![change](change.png) [15.4.0] Update the [`Delta`](../command-ref/Delta/Delta.md) command:
    +   Add the `DeltaValue` parameter and allow using the date/time parts as the delta.
        This is useful for evaluating gaps between data transmissions.
*   ![change](change.png) [15.4.0] Update the [`For`](../command-ref/For/For.md) command:
    +   The `List` values are no longer trimmed for white space and empty values are allowed.
        The [`If`](../command-ref/If/If.md) command can then be used in a loop to check for empty strings.
        This provides more flexibility in processing datasets that are missing values.
*   ![change](change.png) [15.4.0] Update the [`If`](../command-ref/If/If.md) command:
    +   Improve error handling for cases where time series could not be retrieved from the command processor.
    +   Add the `Expression` parameter, which provides many features for evaluating complex expressions.
    +   Allow any combination of parameters.  Any single false evaluation will result in an overall false evaluation.
    +   Add the `TSID`, `TSPropertyIsNotDefinedOrIsEmpty`, `TSPropertyIsDefined`, and `TSPropertyIsDefinedAndIsNotEmpty` parameters
        to check time series properties.
*   ![change](change.png) [15.4.0] Update the [`RunCommands`](../command-ref/RunCommands/RunCommands.md) command:
    +   Add the `IncludeProperties` and `ExcludeProperties` command parameters to control which processor properties to share.
*   ![change](change.png) [15.4.0] Update the [`SetProperty`](../command-ref/SetProperty/SetProperty.md) command:
    +   Add the `Expression` parameter, which provides many features for evaluating expressions.
*   ![change](change.png) [15.4.0] Update the [`SetTimeSeriesProperty`](../command-ref/SetTimeSeriesProperty/SetTimeSeriesProperty.md) command:
    +   Enable `Boolean` as a `PropertyType` choice.
*   ![change](change.png) [15.4.0] Update the [`TableToTimeSeries`](../command-ref/TableToTimeSeries/TableToTimeSeries.md) command:
    +   Add the `DescriptionColumn` to set the time series description from a column value.
*   ![change](change.png) [15.4.0] Update the [`WriteTableToHTML`](../command-ref/WriteTableToHTML/WriteTableToHTML.md) command:
    +   Add the `IncludeDocument` parameter to control whether the surrounding document is written or just the table elements.

## Changes in Version 15.3.2 ##

**Maintenance release to improve NRCS AWDB REST API integration.**

*   ![change](change.png) [15.3.2] Update the [`SelectTimeSeries`](../command-ref/SelectTimeSeries/SelectTimeSeries.md) command:
    +   Matching a time series property will now convert the property to a string and then do a comparison.
*   ![change](change.png) [15.3.2] Update the [`SetAveragePeriod`](../command-ref/SetAveragePeriod/SetAveragePeriod.md) command:
    +   Using the command with no input will now set `AverageStart` and `AverageEnd` properties to null,
        which will cause defaults to be used.
    +   Specifying one parameter will only set the property for the specified parameter.
*   ![change](change.png) [15.3.2] Update the [`SetInputPeriod`](../command-ref/SetInputPeriod/SetInputPeriod.md) command:
    +   Using the command with no input will now set `InputStart` and `InputEnd` properties to null,
        which will cause defaults to be used.
    +   Specifying one parameter will only set the property for the specified parameter.
*   ![change](change.png) [15.3.2] Update the [`SetOutputPeriod`](../command-ref/SetOutputPeriod/SetOutputPeriod.md) command:
    +   Using the command with no input will now set `OutputStart` and `OutputEnd` properties to null,
        which will cause defaults to be used.
    +   Specifying one parameter will only set the property for the specified parameter.

## Changes in Version 15.3.1 ##

**Maintenance release to include necessary Oracle libraries.**

*   ![bug](bug.png) [15.3.1] Include the Oracle database `oaclepki.jar`, `osdt_cert.jar`, and `osdt_core.jar`
    libraries, which were omitted from the previous release.
    These files are needed to implemnt Oracle Wallet.

## Changes in Version 15.3.0 ##

**Maintenance release to fix HydroBase diversion filling, add NRCS AWDB Rest API support, and improve data viewing tools.**

*   ![bug](bug.png) [15.3.0] Fix some right-click mouse actions that were not working after updating to Java 11.
    For example, right-clicking on a graph for pop-up menus might zoom the graph.
*   ![bug](bug.png) [15.3.0] Fix the [`If`](../command-ref/If/If.md) command:
    +   The `DataStoreIsNotOk` check was not working.  It has been fixed. 
*   ![change](change.png) [15.3.0] Update the time series product to have the `RasterGraphLayout` graph property,
    which allows forcing the multiple time series layout even if only one time series is output.
*   ![change](change.png) [15.3.0] The `NrcsAwdb` datastore configuration has changed:
    +   The `NrcsAwdb` datastore configuration file that is distributed with TSTool now uses the NRCS AWDB REST API
        and will become the only option in the future.
    +   The `NrcsAwdbSOAP` datastore configuration file that is distributed with TSTool uses the SOAP API,
        which will be discontinued at some point in the future.
    +   The `NrcsAwdb` datastore is listed in the main datastore list for interactive time series queries
        (the `NrcsAwdbSoap` datastore is not listed).
*   ![change](change.png) [15.3.0] Update the [`ListFiles`](../command-ref/ListFiles/ListFiles.md) command:
    +   Enable property syntax for the `Folder` parameter.
*   ![change](change.png) [15.3.0] Update the [`ReadNrcsAwdb`](../command-ref/ReadNrcsAwdb/ReadNrcsAwdb.md) command:
    +   Allow using the `NrcsAwdb` (REST API) or `NrcsAwdbSOAP` (SOAP API) datastores.
    +   Add new command parameters that are supported by the REST API:
        -   `StationNames` - to filter on station names
        -   `StationTriplets` - to filter on station triplets
        -   `OutputYearType` - to differentiate between calendar and water year for year-interval data
    +   Add the ***REST API*** tab with additional new command parameters:
        -   `InsertOrUpdateBeginDate` - to read data values that have been modified since a date
        -   `ActiveOnly` - to control whether retired stations are included
        -   `ReturnOriginalValues` - to control whether original values (or processed data) are returned
        -   `ReturnSuspectData` - to control whether suspect data values are returned
*   ![change](bug.png) [15.3.0] Update the [`CompareTimeSeries`](../command-ref/CompareTimeSeries/CompareTimeSeries.md) command:
    +   Add the `CompareSelected2TS` parameter to select two time series to be compared.
*   ![change](bug.png) [15.3.0] Update the [`ReadHydroBase`](../command-ref/ReadHydroBase/ReadHydroBase.md) and
    [`ReadColoradoHydroBaseRest`](../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) commands and related TSID commands:
    +   Fix so that filling monthly diversion time series when no corresponding daily time series is available will not throw an exception.
        The filling logic attempts to determine if a previous daily value was zero to apply the carry forward methodology.

## Changes in Version 15.2.0 ##

**Feature release to improve plugin and data visualization features, update to HydroBase 20251130.**

*   ![bug](bug.png) [15.2.0] Update so that the TSTool user interface shows the progress of opening datastores.
*   ![bug](bug.png) [15.2.0] Fix bug where right-clicking on a graph zooms in slightly when showing the popup menu.
*   ![bug](bug.png) [15.2.0] Fix bugs in time series graph view:
    +   The mouse tracker at the bottom of the graph window was not showing date/time to a precision <= second.
        The tracker now handles date/time precision to nanosecond.
*   ![bug](bug.png) [15.2.0] Fix bugs in time series table view related to irregular interval time series:
    +   An error creating the table view resulted in an empty window.
        Now, if an error occurs, a ***Problems*** button is shown and can be pressed to view problem details.
    +   Displaying multiple irregular interval real-time time series in the table view would result in errors
        if the date/times for the time series had different precision.
        Now, any irregular interval time series with date/time precision <= second are displayed together
        using the smallest precision to format the date/time column.
        The table's date/time column will show trailing zeros if necessary.
*   ![bug](bug.png) [15.2.0] Fix the ***Tools / Plugin Manager***:
    +   The column for whether compatible with TSTool was not populated correctly.
*   ![change](change.png) [15.2.0] Update the Microsoft SQL Server driver to version 13.2.1,
    needed to fix issues with stored procedures not working as before.
*   ![change](change.png) [15.2.0] Catch the `NoClassDefFoundError` exception when loading plugin datastores
    (previously `ClassNotFoundException` and other exceptions were implemented, which do not cover all cases).
*   ![change](change.png) [15.2.0] Update time series identifier matching:
    +   Shared code that matches time series identifier did not handle parentheses in the pattern
        because these are Java regular expression synatax.
        Parentheses are now escaped so that matches can occur,
        for example if parentheses are in any part of the time series identifier.
*   ![change](change.png) [15.2.0] Update the Jackson packages from version 2.9.10 to 2.15.4:
    +   Add support for reading XML files.
    +   Add support for reading YAML files.
    +   This version fixes an issue reading XML files that have repeated elements.
        Previously only the last element would be output in a map, but now a list of objects is output.
*   ![change](change.png) [15.2.0] Update the [`AppendFile`](../command-ref/AppendFile/AppendFile.md) command:
    +   Change to allow appending text to the output file when the input file does not exist,
        which is useful in looping.
*   ![change](change.png) [15.2.0] Update the [`FillConstant`](../command-ref/FillConstant/FillConstant.md) command:
    +   Add the `DescriptionSuffix` parameter to append to the time series description.
    +   Change so that the default behavior is to not automatically append to the description.
        Specify `DescriptionSuffix=Auto` to match the previous behavior.
*   ![change](change.png) [15.2.0] Update the [`If`](../command-ref/If/If.md) command:
    +   Add `DataStoreIsOk` and `DataStoreIsNotOk` parameters to check whether a datastore is OK.
    +   Fix `TSHasNoData` to work.
    +   Improve logging messages to help with troubleshooting.
*   ![change](change.png) [15.2.0] Update the [`ManipulateTableString`](../command-ref/ManipulateTableString/ManipulateTableString.md) command:
    +   Add the `UseEmptyStringForNullInput` parameter.
    +   Add the following operators:
        -   `Copy` - to copy the value of the input to output
        -   `ToBoolean` - to convert the input to a boolean value
        -   `ToLong` - to convert the input to a long integer value
*   ![change](change.png) [15.2.0] Update the [`NewObject`](../command-ref/NewObject/NewObject.md) command:
    +   Add initial support for reading a CSV, XML, and YAML files.
*   ![change](change.png) [15.2.0] Update the [`PDF`](../command-ref/PDF/PDF.md) command:
    +   Rename the command from `PDFMerge` to `PDF` to allow sub-commands to be added in the future.
    +   Update to use version 3.0.6 of the Apache PDFBox library.
    +   Fully enable the command (it was disabled in previous releases due to unreliable behavior).
*   ![change](change.png) [15.2.0] Update the [`NewTimeSeries`](../command-ref/NewTimeSeries/NewTimeSeries.md) command:
    +   Add the `NoData` parameter to allow creating a time series with no data, which is useful for testing.
*   ![change](change.png) [15.2.0] Update the [`ProcessRasterGraph`](../command-ref/ProcessRasterGraph/ProcessRasterGraph.md) command:
    +   Add the ability to create an HTML image map so that using the image on a website can include links to other content.
*   ![change](change.png) [15.2.0] Update the [`ReadHydroBase`](../command-ref/ReadHydroBase/ReadHydroBase.md) and
    [`ReadColoradoHydroBaseRest`](../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) commands and related TSID commands:
    +   The results for diversion records are now the same.
    +   Prior to HydroBase version 20251130, the HydroBase `vw_CDSS_AnnualAmt` view used `0.0` for no diversion and also missing values.
    +   HydroBase version 20251130 now includes null values in the view, which allows TSTool to differentiate between zero and missing values.
    +   HydroBase web services only returns values for diversion values.
*   ![change](change.png) [15.2.0] Update the [`RunCommands`](../command-ref/RunCommands/RunCommands.md) command:
    +   Add the `RunDiscovery` parameter to control whether commands in the command file run discovery when loaded.
    +   Change the default to not run discovery for the command file because interactive editing of
        the command file does not occur, will slow execution, and may result in warnings and errors that are irrelevant
*   ![change](change.png) [15.2.0] Update the [`SetPropertyFromTable`](../command-ref/SetPropertyFromTable/SetPropertyFromTable.md) command:
    +   Fully enable the `IgnoreCase` parameter (the editor did not properly handle).
    +   Add the `DecodeEmbeddedProperties` and `EmbeddedPropertyFormat` parameters to decode properties embedded in cell text.
*   ![change](change.png) [15.2.0] Update the [`StartLog`](../command-ref/StartLog/StartLog.md) command:
    +   Change so that the default `.log` extension is added only after property expansion.
    +   Change so that a log file specified with a property does not result in problem indicator when a command file is loaded.
*   ![change](change.png) [15.2.0] Update the [`TextEdit`](../command-ref/TextEdit/TextEdit.md) command:
    +   Add the `ReplaceWithFile` parameter to allow replacing text with text from a file.

## Changes in Version 15.1.0 ##

**Feature release to remove Reclamation HDB features since now in a plugin.**

*   ![remove](remove.png) [15.1.0] Remove Reclamation HDB features.
*   ![change](change.png) [15.1.0] Update the [`ReplaceValue`](../command-ref/ReplaceValue/ReplaceValue.md) command:
    +   Allow `${Property}` to be used for the `MinValue`, `MaxValue`, `NewValue`, `MatchFlag`, `SetFlag`, `SetFlagDesc`, and `Description` command parameters.
*   ![change](change.png) [15.1.0] Update the [`SetDataValue`](../command-ref/SetDataValue/SetDataValue.md) command:
    +   Allow `${Property}` to be used for the `NewValue` command parameters.
*   ![new](new.png) [15.1.0] Add the [`EvaluateExpression`](../command-ref/EvaluateExpression/EvaluateExpression.md) command:
    +   Allows evaluating arbitrary expressions.
    +   The initial version will be enhanced over time to streamline processing time series table, and other data.

## Changes in Version 15.0.0 ##

**Major release to update from Java 8 to Java 11.**

*   ![bug](bug.png) [15.0.0] Fix converting commands to/from comments to properly handle indentation.
*   ![change](change.png) [15.0.0] Update from Java 8 to Java 11:
    +   The Java Runtime Environment (JRE) shipped with the TSTool software is now Java 11.
    +   The developer documentation has been updated to describe the Java 11 development environment.
*   ![change](change.png) [15.0.0] Change the user interface:
    +   The command popup menus for ***Indent*** have been changed to ***Shift***.
*   ![new](new.png) [15.0.0] Add ***Tools / File Manager***:
    +   See the [Tools / File Manager](../tools/tools.md#file-manager) documentation.
    +   Lists temporary files, which will be deleted when a session is complete.
    +   Lists cached files, which can exist between sessions and have an expiration time.
    +   This is a preliminary implementation and future enhancements will utilize these features to improve performance.
*   ![new](new.png) [15.0.0] Add ***Tools / Plugin Manager***:
    +   See the [Tools / Plugin Manager](../tools/tools.md#plugin-manager) documentation.
    +   Lists which TSTool plugins are installed.
    +   A new default folder structure is being phased in for plugins
        to allow multiple plugin versions to be installed at the same time.
        Only the best compatible plugin version is loaded in a session.
    +   All plugins have been updated to use the new versioned folder convention.
*   ![new](new.png) [15.0.0] Add ***Tools / TSTool Installation Manager***:
    +   See the [Tools / TSTool Installation Manager](../tools/tools.md#tstool-installation-manager) documentation.
    +   Lists which versions of TSTool are installed.
*   ![new](new.png) [15.0.0] Add the `--version-date` command line parameter to
    print the date, used by the new TSTool installation manager.
