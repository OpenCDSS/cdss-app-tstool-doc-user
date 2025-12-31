# TSTool / Release Notes / Version 15 #

Release notes for specific versions are listed below.
See also the [GitHub repository issues](https://github.com/OpenCDSS/cdss-app-tstool-main/issues)
for outstanding issues and enhancement requests.
Issues may also be included in other repositories that are TSTool components.

*   [Changes in Version 15.2.0](#changes-in-version-1520)
*   [Changes in Version 15.1.0](#changes-in-version-1510)
*   [Changes in Version 15.0.0](#changes-in-version-1500)
*   [Release notes for all versions](release-notes.md)

----------

## Changes in Version 15.2.0 ##

**Feature release to improve plugin and data visualization features.**

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
*   ![change](change.png) [15.2.0] Update the [`NewTimeSeriess`](../command-ref/NewTimeSeriess/NewTimeSeriess.md) command:
    +   Add the `NoData` parameter to allow creating a time series with no data, which is useful for testing.
*   ![change](change.png) [15.2.0] Update the [`ProcessRasterGraph`](../command-ref/ProcessRasterGraph/ProcessRasterGraph.md) command:
    +   Add the ability to create an HTML image map so that using the image on a website can include links to other content.
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
