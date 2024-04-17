# TSTool / Release Notes / Version 14 #

Release notes for specific versions are listed below.
See also the [GitHub repository issues](https://github.com/OpenCDSS/cdss-app-tstool-main/issues)
for outstanding issues and enhancement requests.
Issues may also be included in other repositories that are TSTool components.

*   [Changes in Version 14.9.4](#changes-in-version-1494)
*   [Changes in Version 14.9.3](#changes-in-version-1493)
*   [Changes in Version 14.9.2](#changes-in-version-1492)
*   [Changes in Version 14.9.1](#changes-in-version-1491)
*   [Changes in Version 14.9.0](#changes-in-version-1490)
*   [Changes in Version 14.8.6](#changes-in-version-1486)
*   [Changes in Version 14.8.5](#changes-in-version-1485)
*   [Changes in Version 14.8.4](#changes-in-version-1484)
*   [Changes in Version 14.8.3](#changes-in-version-1483)
*   [Changes in Version 14.8.2](#changes-in-version-1482)
*   [Changes in Version 14.8.1](#changes-in-version-1481)
*   [Changes in Version 14.8.0](#changes-in-version-1480)
*   [Changes in Version 14.7.0](#changes-in-version-1470)
*   [Changes in Version 14.6.0](#changes-in-version-1460)
*   [Changes in Version 14.5.4](#changes-in-version-1454)
*   [Changes in Version 14.5.3](#changes-in-version-1453)
*   [Changes in Version 14.5.2](#changes-in-version-1452)
*   [Changes in Version 14.5.1](#changes-in-version-1451)
*   [Changes in Version 14.5.0](#changes-in-version-1450)
*   [Changes in Version 14.4.0](#changes-in-version-1440)
*   [Changes in Version 14.3.0](#changes-in-version-1430)
*   [Changes in Version 14.2.2](#changes-in-version-1422)
*   [Changes in Version 14.2.1](#changes-in-version-1421)
*   [Changes in Version 14.2.0](#changes-in-version-1420)
*   [Changes in Version 14.1.1](#changes-in-version-1411)
*   [Changes in Version 14.1.0](#changes-in-version-1410)
*   [Changes in Version 14.0.6](#changes-in-version-1406)
*   [Changes in Version 14.0.5](#changes-in-version-1405)
*   [Changes in Version 14.0.4](#changes-in-version-1404)
*   [Changes in Version 14.0.3](#changes-in-version-1403)
*   [Changes in Version 14.0.2](#changes-in-version-1402)
*   [Changes in Version 14.0.1](#changes-in-version-1401)
*   [Changes in Version 14.0.0](#changes-in-version-1400)
*   [Release notes for all versions](release-notes.md)

----------

## Changes in Version 14.9.4 ##

**Maintenance release to improve table comparison and enable command notifications.**

*   ![bug](bug.png) [14.9.4] Update the
    [`ReadTableFromJSON`](../command-ref/ReadTableFromJSON/ReadTableFromJSON.md) command:
    +    Fix so that the table that is created is listed in other command editors.
*   ![change](change.png) [14.9.4] Add command notifications:
    +    The `@fixme` and `@todo` [`Comment`](../command-ref/Comment/Comment.md) comment annotations
         will cause a blue marker to be shown in the command list
         as a visual notification that action should be take to improve the command file.
    +    The `@sourceUrl` [`Comment`](../command-ref/Comment/Comment.md) comment annotation
         will show a blue marker if the available source copy of the command file is different from the current version.
*   ![change](change.png) [14.9.4] Update the
    [`CompareTables`](../command-ref/CompareTables/CompareTables.md) command:
    +    Add the `ExcludeColumns2` parameter to provide more control over which columns are compared.
*   ![change](change.png) [14.9.4] Update the
    [`SortTable`](../command-ref/SortTable/SortTable.md) command:
    +    Add the `OrderColumns` parameter to recorder columns.

## Changes in Version 14.9.3 ##

**Maintenance release to improve table comparison and math, and time series comparison.**

*   ![bug](bug.png) [14.9.3] Update Excel workbook commands to always internally use `/` in paths
    when tracking open worksheets, to handle workflows that use forward and back slashes.
*   ![bug](bug.png) [14.9.3] Update the ***Where*** filter choices to handle boolean data,
    which is needed by some datastores.
*   ![bug](bug.png) [14.9.3] Update the
    [`TableMath`](../command-ref/TableMath/TableMath.md) command:
    +   Handle input table columns of type long integer.
*   ![change](change.png) [14.9.3] The time series identifier editor dialog now has wider input fields.
*   ![change](change.png) [14.9.3] For irregular interval time series graph view,
    default the `LineConnectAllowedGap` value so that time series with long gaps relative to the
    interval precision do not connect points.
*   ![change](change.png) [14.9.3] Update the [`Add`](../command-ref/Add/Add.md) command:
    +   The `HandleMissingHow` parameter now defaults to blank in the editor (`IgnoreMissing` is the default).
    +   The `HandleDataFlagsHow` parameter has been added to control how data flags are handled.
*   ![change](change.png) [14.9.3] Update the [`AppendTable`](../command-ref/AppendTable/AppendTable.md) command:
    +   Add the `AppendRowNumbers` parameter to append specific row numbers.
*   ![change](change.png) [14.9.3] Update the
    [`CompareTimeSeries`](../command-ref/CompareTimeSeries/CompareTimeSeries.md) command:
    +   If comparing two time series and the second is not available,
        add a record to the difference table indicating this rather than just generating a warning.
        Otherwise, it may not be obvious that there is a difference.
*   ![change](change.png) [14.9.3] Update the
    [`CompareTables`](../command-ref/CompareTables/CompareTables.md) command:
    +   The `AnalysisMethod` parameter has been added to allow simple and advanced analysis,
        where the advanced analysis will shift rows in the output to align matching table rows
    +   Output HTML has been enhanced to add more colors to provide more granularity in the comparison,
        and the page title matches the difference table ID.
    +   The `RowNumberColumn` parameter has been added to include the row number in output,
        to simplify lookup of orginal input rows
    +   The `NewTableID` and `OutputFile` command parameters have been renamed to support new advanced analysis.
        Old parameter names are still supported.  See the command documentation.
    +   The `OutputRows` parameter has been added to allow outputting all, different, or same rows.
    +   The `DiffRowCountProperty`, `DiffCellCountProperty`, `SameRowCountProperty`, and `SameCellCountProperty`
        parameters have been added to set processor properties for the number of different/same
        rows and cells, useful for testing and logic checks.
    +   Parameters that specify table identifiers, columns, output files, and properties
        allow `${Property}` notation, as documented.
*   ![change](change.png) [14.9.3] Update the [`EndIf`](../command-ref/EndIf/EndIf.md) command:
    +   Warn if no `For` commands are found prior to the insert location, rather than a general exception message.
*   ![change](change.png) [14.9.3] Update the [`EndIf`](../command-ref/EndIf/EndIf.md) command:
    +   Warn if no `If` commands are found prior to the insert location, rather than a general exception message.
*   ![change](change.png) [14.9.3] Update the
    [`If`](../command-ref/If/If.md) command:
    +   Add a warning if a property name is used in the condition statement without surrounding `${  }`
        and the property exists (this helps with troubleshooting).
    +   Add `TsHasData` and `TsHasNoData` parameters in the ***Time Series Exists?*** tab to
        allow handling time series that have no data.
*   ![change](change.png) [14.9.3] Update the
    [`InsertTableRow`](../command-ref/InsertTableRow/InsertTableRow.md) command:
    +   The `TableID`, `InsertRow`, and `InsertCount` parameters can now be specified using `${Property}`.
*   ![change](change.png) [14.9.3] Update the
    [`NewTable`](../command-ref/NewTable/NewTable.md) command:
    +   The `Columns` parameter can now be specified using `${Property}`.
*   ![change](change.png) [14.9.3] Update the
    [`SelectTimeSeries`](../command-ref/SelectTimeSeries/SelectTimeSeries.md) command:
    +   The `HasData` parameter has been added to only select time series with data.
        This can avoid problems in later commands that attempt to process the time series.
*   ![change](change.png) [14.9.3] Update the [`Subtract`](../command-ref/Subtract/Subtract.md) command:
    +   The `HandleMissingHow` parameter now defaults to blank in the editor (`IgnoreMissing` is the default).
*   ![new](new.png) [14.9.3] Update the [`Comment`](../command-ref/Comment/Comment.md) command:
    +   The `@docExample` annotation tag is now supported to help with TSTool documentation maintenance.

## Changes in Version 14.9.2 ##

**Maintenance release to enable step graph.**

*   ![change](change.png) [14.9.2] Enable step graphs:
    +   Add the `LineConnectType` property to [time series products](../appendix-tsview/tsview.md)
        to indicate how points are connected when drawing.
    +   Add the `LineConnectAllowedGap` property to [time series products](../appendix-tsview/tsview.md)
        to indicate the largest date/time interval between points that can be connected with a line,
        used with irregular interval time series (regular interval time series rely on missing values for gaps).
    +   Enable the above properties for `Line`, `Area`, and `AreaStacked` graph types.

## Changes in Version 14.9.1 ##

**Maintenance release to enhance plugin integration and fix workflow issues.**

*   ![bug](bug.png) [14.9.1] Fix the bug in the raster graph for multiple time series:
    +   Time series with missing data at the end of a row were being shown with the last non-missing value.
        This has been fixed.
*   ![change](change.png) [14.9.1] Update the ***Results / Time Series*** heading to indicate how many time series have no data.
*   ![change](change.png) [14.9.1] Re-enable previously available time series edit features in the graph:
    +   Use the [`SetTimeSeriesProperty`](../command-ref/SetTimeSeriesProperty/SetTimeSeriesProperty.md) command
        to set the time series to editable.
    +   Use the [`ProcessTSProduct`](../command-ref/ProcessTSProduct/ProcessTSProduct.md) command
        and set the default save file, which can save the edit results.
    +   Graphing the time series will enable the editing toolbar.
        These features are experimental and will be enhanced over time.
    +   Add the `XYAxes` tracker type for time series graphs.
        This shows a crosshair that spans the entire graph in both directions and is useful during editing.
*   ![change](change.png) [14.9.1] Update the
    [`DeselectTimeSeries`](../command-ref/DeselectTimeSeries/DeselectTimeSeries.md) command:
    +   Add the `IfNotFound` parameter to allow more control if no time series are matched.
    +   Add the `SelectedCountProperty` parameter to set a property for how many time series are selected.
    +   Add the `UnselectedCountProperty` parameter to set a property for how many time series are unselected.
*   ![change](change.png) [14.9.1] Update the
    [`SetConstant`](../command-ref/SetConstant/SetConstant.md) command:
    +   Add the `SetFlag` and `SetFlagDescription` parameters to allow setting the data flag
        when values are set.
    +   Allow only the flag to be set without setting numerical values.

## Changes in Version 14.9.0 ##

**Feature release to use OpenJDK 8, enable additional plotting symbols, map view fixes.**

*   ![bug](bug.png) [14.9.0] The ***View / Map*** features were not working for
    `UniqueValues` classification type.  This has been fixed.
*   ![bug](bug.png) [14.9.0] Update the
    [`CopyTimeSeriesPropertiesToTable`](../command-ref/CopyTimeSeriesPropertiesToTable/CopyTimeSeriesPropertiesToTable.md) command:
    +    Fix to handle boolean properties.
*   ![change](change.png) [14.9.0] Switch the Java version to OpenJDK 8.
    OpenJDK is free and open source whereas Oracle requires a fee for newer Java versions.
    Future updates will implement newer versions of Java.
*   ![change](change.png) [14.9.0] Improve handling of `HeadlessException` when trying to display
    an interactive graph window when running in headless mode.
*   ![change](change.png) [14.9.0] Enable additional plotting symbols:
    +   `Ellipse-Horizontal-Filled`
    +   `Ellipse-Horizontal-Hollow`
    +   `Ellipse-Vertical-Filled`
    +   `Ellipse-Vertical-Hollow`
    +   `Rectangle-Horizontal-Filled`
    +   `Rectangle-Horizontal-Hollow`
    +   `Rectangle-Vertical-Filled`
    +   `Rectangle-Vertical-Hollow`
*   ![change](change.png) [14.9.0] Fix the following plotting symbols,
    which were not drawing the bottom line:
    +   `Triangle-Down-Filled-BotLine`
    +   `Triangle-Down-Hollow-BotLine`
*   ![change](change.png) [14.8.4] Update to allow multiple `--disable-datastores` and `--enable-datastores`
    command parameters to be specified in sequence to control which datastores are enabled.
    This allows, for example, disabling all datastores and then enabling only the datastore(s)
    that are needed for a batch workflow.
    See the TSTool [command line parameters](../appendix-running/running.md#tstool-command-line-parameters).
    The parameters have also been renamed from previous `--disabled-datastores` and `--enabled-datastores` parameters.

## Changes in Version 14.8.6 ##

**Maintenance release to improve time zone handling.** 

*   ![change](change.png) [14.8.6] Phase out some support for old-style time zones (e.g., `MST`, `MDT`)
    due to ambiguity with current conventions that are more granular (e.g., use `America/Denver` instead, which includes daylight saving).
    Some command files may need to be updated.
*   ![change](change.png) [14.8.6] The time series table view has been updated to improve handling
    time series with different time zones:
    +   the date/time column will not show time zone
    +   the time zone will be shown in the time series value column heading
    +   column tool tips provide additional details about the time zone and other time series metadata
*   ![change](change.png) [14.8.6] Update the [`ChangeTimeZone`](../command-ref/ChangeTimeZone/ChangeTimeZone.md) command:
    +   Add the `ShiftTime` parameter to control whether the date/times in the time series are shifted using
        the difference between the old and new time zones.
    +   Add the `OldTimeZone` parameter to specify the old time series for the time series,
        for cases where the time series being modified does not specify the time zone.

## Changes in Version 14.8.5 ##

**Maintenance release to enhance plugin integration.** 

*   ![change](change.png) [14.8.5] Improve plugin integration with the documentation viewer.
    Plugins can now view documentation for a specific version.
    Plugins will need to be updated to use this feature.
*   ![change](change.png) [14.8.5] Improve handling of timeout for web service requests
    to allow plugin data requests to timeout.
    Plugins will need to be updated to use this feature.

## Changes in Version 14.8.4 ##

**Maintenance release to fix issues when processing text files.** 

*   ![change](change.png) [14.8.4] Update the [`AppendFile`](../command-ref/AppendFile/AppendFile.md) command:
    +   The `IncludeText` and `ExcludeText` parameters can now include `${Property}` syntax.
*   ![change](change.png) [14.8.4] Update the [`Copy`](../command-ref/Copy/Copy.md) command:
    +   The history of the original time series was being updated with a note that a copy was made,
        instead of a note in the new copy.
*   ![change](change.png) [14.8.4] Update the [`ReplaceValue`](../command-ref/ReplaceValue/ReplaceValue.md) command:
    +   Add the `RemoveMissing` action for irregular interval time series.
    +   Change to not automatically append to the time series description.
        The new `Description` command parameter can be used to change the description.
    +   Fix a bug that was causing time series modified by this command to not display correctly in the table view.
*   ![change](change.png) [14.8.4] Update the
    [`SetTimeSeriesPropertiesFromTable`](../command-ref/SetTimeSeriesPropertiesFromTable/SetTimeSeriesPropertiesFromTable.md) command:
    +   The following command parameters now accept `${Property}` notation:  `TSID`, `TableID`, `EnsembleID`, `TableInputColumns`, `TableTSIDColumn`.
*   ![change](change.png) [14.8.4] Add the following command parameters to control which datastores are
    enabled/disabled at run-time, useful for optimizing batch workflows.
    +   `--enabled-datastores=dastore1,datastore2`
    +   `--disabled-datastores=dastore1,datastore2`
    +   See the TSTool [command line parameters](../appendix-running/running.md#tstool-command-line-parameters).

## Changes in Version 14.8.3 ##

**Maintenance release to enable raster graphs for hour and minute interval time series.** 

*   ![change](change.png) [14.8.3] Update the [`ProcessRasterGraph`](../command-ref/ProcessRasterGraph/ProcessRasterGraph.md) command:
    +   Enable 1-hour and N-minute interval time series.
    +   Improve tick mark rendering for raster graphs.

## Changes in Version 14.8.2 ##

**Maintenance release to fix raster graphs when no time series data.** 

*   ![bug](bug.png) [14.8.2] Update the [`ProcessRasterGraph`](../command-ref/ProcessRasterGraph/ProcessRasterGraph.md) command:
    +   Handle case where a time series is completely missing or has no data.
        This allows the raster graph to be used on large datasets that may have missing data.
    +   Improve error handling when reading the symbol table file for raster graphs.

## Changes in Version 14.8.1 ##

**Maintenance release to support the new Zabbix plugin.**

*   ![bug](bug.png) [14.8.1] Update the [`WebGet`](../command-ref/WebGet/WebGet.md) command
    to improve handling of the payload, including allowing a payload for the `GET` HTTP method.
*   ![change](change.png) [14.8.1] TSTool has been tested with the new Zabbix web services plugin.
    See the [Plugins Reference](../plugin-ref/overview.md).

## Changes in Version 14.8.0 ##

**Feature release to improve dataset publishing and visualization.
Remove the requirement for administrator privileges to install on Windows.**

*   ![bug](bug.png) [14.8.0] Update the time series table view to copy to the clipboard for irregular interval time series.
*   ![change](change.png) [14.8.0] **Remove the requirement for administrator privileges to install on Windows.**
*   ![change](change.png) [14.8.0] Enhance the [`Delta`](../command-ref/Delta/Delta.md) command
    to improve handling of rollover:
    +   Add the `CopyDataFlags`, `AutoRestFlag`, `RolloverFlag`, and `ManualResetFlag` parameters
        to allow setting flags to check the output.
    +   Add the `RolloverDeltaLimit` parameter to control whether a rollover should
        be handled as a manual rese.
*   ![change](change.png) [14.8.0] Enhance the [`DeleteTableRows`](../command-ref/DeleteTableRows/DeleteTableRows.md) command:
    +   Add `First` and `Last` parameters to simplify deleting table rows at the start and end of a table.
    +   Add `DeleteCountProperty` and `RowCountProperty` parameters to allow checking
        that the delete happened as expected
*   ![change](change.png) [14.8.0] Enhance the [`ListFiles`](../command-ref/ListFiles/ListFiles.md) command:
    +   Update to list folders in addition to files as controlled by the `ListFiles` and `ListFolders` parameters.
    +   Add the `ListScope` parameter to allow listing files in the specified folder or also all subfolders.
    +   Add additional information to the output table including type as `File` or `Folder`, `Size`, `Owner`, `ParentFolder`,
        `LastModified` time.
    +   Change the output table column `FileName` to `Name` to handle files and folders.
    +   Change the `IncludeFiles` parameter to `IncludeNames` to handle files and folders.
    +   Change the `ExcludeFiles` parameter to `ExcludeNames` to handle files and folders.
    +   The command parameter defaults match previous functionality.
*   ![change](change.png) [14.8.0] Enhance the
    [`NewStatisticYearTS`](../command-ref/NewStatisticYearTS/NewStatisticYearTS.md) command:
    +   Add the `YearStartTime` and `YearEndTime` parameters to control how midnight
        is interpreted when determining the sample data.
        These parameters only apply when the input time series has data interval with time (less than a day).
    +   Change the default behavior when handling input time series with time in the interval so
        that `YearStartTime=AfterMidnight` and `YearEndTime=Midnight`,
        which is consistent with the TSTool convention that the date/time matches the interval end.
        Previously midnight was not included as the year-ending time.
    +   The `TestValue` parameter has been removed and `Value` should be used instead.
        The command will automatically convert `TestValue` to `Value1`.
        This transition should not impact recent workflows because `Value1` has been the default for a while.
    +   The `AllowMissingCount` parameter is not checked for irregular interval input time series
        because irregular interval data often do not store missing values.
    +   New `OutputYearType` parameter values support all 12-month variations in a general way,
        similar to old `WaterYear`.
*   ![change](change.png) [14.8.0] Enhance the
    [`ProcessRasterGraph`](../command-ref/ProcessRasterGraph/ProcessRasterGraph.md) command:
    +   If a single time series is processed,
        the time series interval must be day or month and the graph will
        have dates on both axes (this is the same functionality as before).
    +   If multiple time series are processed,
        the time series must have consistent time intervals and any regular interval can be processed.
        Each time series is listed on the y-axis and the time period is displayed on the x-axis.
        The period must be short enough that each interval can be displayed as a "pixel" of color.
        The x-axis can be zoomed to show more detail.
    +   The ***Results / Graph - Raster Graph*** view has been updated to behave similarly.
*   ![change](change.png) [14.8.0] Enhance the
    [`ReadPropertiesFromFile`](../command-ref/ReadPropertiesFromFile/ReadPropertiesFromFile.md) command:
    +   Add support for the `INI` file format.
    +   Change the `IncludeProperty` parameter to `IncludeProperties` (plural) to reflect command functionality.
        The old parameter name is automatically changed to the new name.
    +   Add the `ExcludeProperties` parameter to control which properties are read.
    +   Add the `IgnoreCase` parameter to control whether property names are compared by considering or ignoring case.
    +   Add the `ExpandProperties` parameter to control whether file properties
        are expanded if `${Property}` notation is found in property values.
    +   Add support for `PARENT_FOLDER` and `PARENT_PARENT_FOLDER` property values.

## Changes in Version 14.7.0 ##

**Feature release to improve the experience for new TSTool users.**

*   ![change](change.png) [14.7.0] The ***Datastore*** tab in the ***Input/Query Options***
    area of the main TSTool window is now selected by default.
    The ***Input Type*** tab can be selected if necessary.
    The use of web service datastores and plugin datastores is increasing and therefore
    the ***Datastore*** tab is the new default.
*   ![change](change.png) [14.7.0] TSTool is configured by default to show the ***Select HydroBase*** dialog at startup.
    HydroBase is enabled by default because of TSTool's use by the State of Colorado.
    Most users do not install a local version of HydroBase and therefore the dialog is not relevant,
    shows no HydroBase databases, and slows startup because TSTool searches for HydroBase databases.
    Using the ***Cancel*** button on the HydroBase selection dialog
    now shows an additional dialog explaining how to disable HydroBase.
*   ![change](change.png) [14.7.0] Update the command reference documentation to indicates the menu
    in which a command editor is found.
*   ![change](change.png) [14.7.0] Update the documentation for web accessibility compliance
    and site review checks:
    +   Links are now shown as underlined.
    +   Images use human-readable "alt text".
    +   The Troubleshooting documentation for each command now links to the main TSTool troubleshooting.
*   ![change](change.png) [14.7.0] TSTool has been tested with the new Synoptic data web services plugin.
    See the [Plugins Reference](../plugin-ref/overview.md).
*   ![bug](bug.png) [14.7.0] Many commands that include `TableID` and similar parameters
    provide a drop-down choice in the command editor to select a table.
    These parameters can often be specified with `${Property}` syntax by typing into the form,
    to allow for flexibility in workflows
    and because it may be difficult to provide an accurate list of tables from previous commands.
    Previously, typing into the editor field did not update the commmand shown at the bottom of the editor.
    This has been fixed.
*   ![bug](bug.png) [14.7.0] Fix the [`NewPatternTimeSeries`](../command-ref/NewPatternTimeSeries/NewPatternTimeSeries.md) command editor
    to enable the `IrregularInterval` parameter when the `NewTSID` use `${Property}` and any occurrence of `IRR`, ignoring case.
*   ![bug](bug.png) [14.7.0] Fix a minor bug in
    [`ReadTimeSeriesList`](../command-ref/ReadTimeSeriesList/ReadTimeSeriesList.md) where the `ReadData`
    parameter was not being handled in the command editor.
*   ![change](change.png) [14.7.0] The [`Delta`](../command-ref/Delta/Delta.md) command has been enhanced:
    +   The `ResetType` parameter indicate the reset type for cumulative time series.
    +   The `ResetType=Auto` parameter automatically handles data with resets.
    +   The `ResetType=Rollever` parameter handles data with rollover at a maximum value.
    +   Additional checks have been implemented to help with review of data
        such as cumulative precipitation.
    +   Data problems that are detected can be output to a table to help with data quality control.
*   ![new](new.png) [14.7.0] The [`SetPropertyFromDataStore`](../command-ref/SetPropertyFromDataStore/SetPropertyFromDataStore.md)
    command has been added to set a processor property from a datastore configuration property.

## Changes in Version 14.6.0 ##

**Feature release to implement command indentation.**

*   ![bug](bug.png) [14.6.0] Fix the
    [`ReadColoradoHydroBaseRest`](../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) command:
    +   Several `Where` filters, when selected, did not update the command parameters,
        including county, latitude, and longitude.
*   ![new](new.png) [14.6.0] Add command indentation:
    +   Added the ***Indent Right*** and ***Indent Left*** popup menu choices
        to indent and unindent commands that are selected in the ***Commands*** area.
        Select one or more commands and then right-click to use the popup menu to change indentation.
    +   The default indentation is 4 spaces.
    +   All commands have been updated to enable indentation.
    +   Commands are automatically indented based on the previous commands' indentation and
        whether the inserted command follows an [`If`](../command-ref/If/If.md) or
        [`For`](../command-ref/For/For.md) command.
    +   TSTool plugins must be updated to newer versions to utilize indentation
        (refer to the release notes for the plugins).
*   ![change](change.png) [14.6.0] Update all command parameters to use double quotes.
    +   This provides consistency for all commands.
    +   Previously, parameters that did not need to be quoted such as numbers were not quoted.
    +   The new convention also ensures that parameter values that use `${Property}` are handled for complex syntax.
*   ![change](change.png) [14.6.0] Editor dialogs that use `Where` parameters and input filters
    have been updated so that typing characters into text fields immediately updates the command
    shown in the bottom of command editors.
*   ![change](change.png) [14.6.0] The graph warning about incompatible units
    will now display on the TSTool window when multiple computer displays are used
    so the warning is more obvious.

## Changes in Version 14.5.4 ##

**Maintenance release to improve plugin integration and automated testing.**

*   ![bug](bug.png) [14.5.4] Fix bugs in the [`TSID`](../command-ref/TSID/TSID.md) command:
    +   Adding a new TSID command now shows the editor whereas previously the generic command editor was shown.
    +   The TSID editor now properly shows single quotes in TSIDs (previously they were not displayed even when present in the command).
    +   TSID strings where a part included single-quoted subparts were not being parsed correctly.
        For example, a data type `'part1'-'part2'` was not being parsed correctly.  This has been fixed.
*   ![bug](bug.png) [14.5.4] Fix the ***Command Status*** window to center on the screen
    where the TSTool main window is visible, rather than the first screen in multi-screen workstations.
*   ![change](change.png) [14.5.4] Increase the speed of parsing command strings when reading, editing, and running command files.
*   ![change](change.png) [14.5.4] Convert startup messages to debug messages to reduce information in the log file.
    Debug can be turned on with the `-d` command line parameter if necessary to view the messages.
*   ![change](change.png) [14.5.4] Command editor dialogs for editing parameters that are
    maps (`key:value,key:value,...`) and delimited lists (`value1,value2,...`) have been updated to provide
    more functionality including inserting and removing rows.
    These editors will be phased into more command editors.
*   ![change](change.png) [14.5.4] The [`CompareFiles`](../command-ref/CompareFiles/CompareFiles.md) command has been updated:
    +   The `CommentLineChar` property now allows `<!--` for HTML comments.
*   ![change](change.png) [14.5.4] The [`SetPropertyFromTable`](../command-ref/SetPropertyFromTable/SetPropertyFromTable.md) command
    has been updated:
    +   The `RowCountProperty` and `ColumnCountProperty` parameters have been added to allow
        setting processor properties for the table size,
        which is useful for automated testing and workflow checks.
*   ![new](new.png) [14.5.4] The [`RemoveFolder`](../command-ref/RemoveFolder/RemoveFolder.md) command
    has been added to remove a folder.

## Changes in Version 14.5.3 ##

**Maintenance release to improve plugin integration.**

*   ![change](change.png) [14.5.3] Update the time series properties view to show the time series identifier parts in separate text fields.
    This facilitates troubleshooting.
*   ![change](change.png) [14.5.3] Time series library code has been updated to improve plugin integration.
    The changes allow better error handling when reading time series.
    Existing plugins that read time series will not work with this version of TSTool and will need to be recompiled.

## Changes in Version 14.5.2 ##

**Maintenance release to improve JSON object features, and fix HydroBase web service issue.**

*   ![bug](bug.png) [14.5.2] Fix the [Colorado HydroBase REST web service datastore](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md):
    +   Fix issue where telemetry station time series could not be copied from the time series list to the command area.
*   ![remove](remove.png) [14.5.2] Remove the unused legacy State of Colorado Satellite Monitoring System library from development files.
    The latest HydroBase web services have replaced this old library.
*   ![change](change.png) [14.5.2] Update the copyright notice for 2023.
*   ![change](change.png) [14.5.2] Update the [`NewObject`](../command-ref/NewObject/NewObject.md) and
    [`WriteObjectToJSON`](../command-ref/WriteObjectToJSON/WriteObjectToJSON.md) commands and the main interface to support 
    JSON files that have `[ ]` array at the top level.
*   ![new](new.png) [14.5.2] TSTool has been tested with the [Kisters WISKI (KiWIS) plugin](../plugin-ref/overview.md).

## Changes in Version 14.5.1 ##

**Maintenance release to improve cloud integration, JSON object features, and HydroBase web service diversion record handling.**

*   ![bug](bug.png) [14.5.1] Fix the [Colorado HydroBase REST web service datastore](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)
    handling of diversion records:
    +   Previously, some monthly values were read as missing values,
        with results being different than time series read from a HydroBase database, which contained zeroes instead of missing.
        This has been fixed, as described below.
    +   Monthly diversion records from web services now reflect application of the carry forward fill algorithm.
        Missing months where the previous month's last daily record was a zero are set to zero and carried forward in the irrigation year.
        The results should match monthly records red from HydroBase.
        Implementing this logic requires reading the daily time series so retrieving monthly data is slower than before.
    +   The period for time series is internally set to full irrigation years to support the carry forward algorithm.
        After filling, the period is set to the requested period, if provided by read commands.
    +   The carry forward fill logic is the default for web service diversion record time series identifiers
        and the [`ReadColoradoHydroBaseRest`](../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md) command.
*   ![change](bug.png) [14.5.1] Update the [`ReadHydroBase`](../command-ref/ReadHydroBase/ReadHydroBase.md) command:
    +   The period for time series is internally set to full irrigation years to support the carry forward algorithm.
        After filling, the period is set to the requested period, if provided by read commands.
    +   Fix so that if filling with diversion comments and the fill flag is defaulted,
        it sets the flag in the result.  Previously it was not setting the flag in output if for default parameters.
*   ![bug](bug.png) [14.5.1] Fix the
    [Colorado HydroBase REST web service datastore](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) query filters:
    +   Climate stations can now be filtered by station name and site identifier.
    +   Surface water stations can now be filtered by station abbreviation.
*   ![change](change.png) [14.5.1] The processor property `UserHomeDir` has been changed to have the value of the home directory.
    Previously it ended in `\.tstool` on Windows and `/.tstool` on Linux, which is not consistent with the user's home folder.
    The new property `UserTstoolDir` has been added to include the trailing `.tstool`.
*   ![change](change.png) [14.5.1] The [`ReadTableFromJSON`](../command-ref/ReadTableFromJSON/ReadTableFromJSON.md) command has been updated:
    +   Empty strings in the JSON that are used as input for non-string output result in null values.
    +   Add the `Append` parameter to allow appending output to an existing table.
    +   Add the `ObjectID` parameter to allow reading JSON from an object.
    +   Add the `RowCountProperty` parameter to allow checking the size of the output table.
*   ![change](change.png) [14.5.1] The [`WebGet`](../command-ref/WebGet/WebGet.md) command has been updated:
    +   Add the `Cookies` parameter.
    +   Add tabs to the command editor to group related parameters.
*   ![new](new.png) [14.5.1] Add the [`SetPropertyFromObject`](../command-ref/SetPropertyFromObject/SetPropertyFromObject.md) command
    to set a processor property from an object property.

## Changes in Version 14.5.0 ##

**Feature release to improve cloud and JSON object integration and various fixes.**

*   ![bug](bug.png) [14.5.0] The ***Results / Objects*** output has been fixed to only show the object JSON. 
    Previously the internal TSTool object was shown, which wraps the original object and adds The JSON object identifier used by TSTool.
*   ![change](change.png) [14.5.0] The TSTool main user interface code has been made more modular
    to split out code for different data sources to improve maintainability.
    The class names shown in the log file may have changed.
*   ![change](change.png) [14.5.0] The syntax for specifying a date/time, for example in
    the [`SetInputPeriod`](../command-ref/SetInputPeriod/SetInputPeriod.md) command now supports rounding to week using
    the following syntax, which is useful to automate weekly scheduled workflows:
    `CurrentToDay.RoundToDayOfWeek(Wednesday).RoundDirection(>)`
*   ![change](change.png) [14.5.0] The [`ManipulateTableString`](../command-ref/ManipulateTableString/ManipulateTableString.md)
    command has been updated:
    +   The substring operator now supports negative positions to extract substrings at the end of a string.
    +   The substring operator will now extract partial strings if the starting position is within the string
        but the ending position is past the end of the string.
*   ![change](change.png) [14.5.0] The [`WriteTableToMarkdown`](../command-ref/WriteTableToMarkdown/WriteTableToMarkdown.md) command has been updated:
    +   Columns values that start with `http` are automatically formatted as links.
    +   The `LinkColumns` command parameter has been added to specify the link text (default is to show the link URL).
*   ![new](new.png) [14.5.0] Update the documentation organization:
    +   Add a "Processing" chapter with pages for each group of commands that process various data.
        This provides background and help with training.
        Examples will be added over time.
        Previous content for spatial data and spreadsheet processing have been moved to sections of this chapter and
        the documentation may be further reorganized once initial documentation content is added.
    +   Add the [Reference - Plugins](../plugin-ref/overview.md) documentation to list known TSTool plugins.
*   ![new](new.png) [14.5.0] Add features to track command file versions and improve attribution and documentation,
    which helps with command file maintenance and collaboration:
    +   The [`# comment`](../command-ref/Comment/Comment.md) annotations now include `@author`,
        `@version`, `@versionDate`, `@sourceUrl`, and `@docUrl`.
    +   The ***Tools / Commands*** menu has been added with tools to check for updates to the command file
        and allow comparison of the current commands to the original source.
*   ![new](new.png) [14.5.0] The [`SetObjectProperty`](../command-ref/SetObjectProperty/SetObjectProperty.md)
    command has been added to set object property values.

## Changes in Version 14.4.0 ##

**Feature release to improve cloud integration, fix HEC-DSS, add support for object data type,
and various fixes.**

*   ![new](new.png) [14.4.0] The primary TSTool development environment is now Windows 11 using 64-bit Java 8.
*   ![new](new.png) [14.4.0] Verify integration of the [TSTool AWS Plugin](https://software.openwaterfoundation.org)
    from the Open Water Foundation in production workflows to publish datasets to the cloud.
*   ![new](new.png) [14.4.0] Add general objects as a top-level data construct:
    +   Add a new ***Commands / Object Processing*** menu.
    +   Add a new ***Results / Objects*** tab for results.
*   ![new](new.png) [14.4.0] Add new commands to process objects:
    +   [`NewObject`](../command-ref/NewObject/NewObject.md) - create a new object from JSON text or file
    +   [`FreeObject`](../command-ref/FreeObject/FreeObject.md) - free an object
    +   [`SetObjectPropertiesFromTable`](../command-ref/SetObjectPropertiesFromTable/SetObjectPropertiesFromTable.md) - set object
        properties from a table
    +   [`WriteObjectToJSON`](../command-ref/WriteObjectToJSON/WriteObjectToJSON.md) - write an object to a JSON file
*   ![bug](bug.png) [14.4.0] Fix so that the `TSTool.cfg` `DiffProgram` property handles a comma-separated list
    to allow for multiple candidate difference programs to be specified, and handle in the
    main program and the [`CompareFiles`](../command-ref/CompareFiles/CompareFiles.md) command.
    The default configuration file has been updated to handle multiple KDiff3 installation folders.
*   ![bug](bug.png) [14.4.0] Fix the HEC-DSS features:
    +   [`ReadHecDss`](../command-ref/ReadHecDss/ReadHecDss.md) and the [`WriteHecDss`](../command-ref/WriteHecDss/WriteHecDss.md) commands
        and interactive browsing had been broken since TSTool was updated to 64-bit architecture.
    +   Update the [`ReadHecDss`](../command-ref/ReadHecDss/ReadHecDss.md) command to have `CloseAfterRead` parameter
        to help with file locking.
*   ![bug](bug.png) [14.4.0] Fix the [`CompareTables`](../command-ref/CompareTables/CompareTables.md) command
    to detect tables of different lengh (previously the number of rows in the first table controlled the comparison)
*   ![change](change.png) [14.4.0] Update configuration and documentation to use `https` where possible.
*   ![change](change.png) [14.4.0] The time series table view header now shows units in parentheses
    and minor formatting cleanup avoids headers ending in a comma.
*   ![change](change.png) [14.4.0] Commands that provide a choice on time series interval now include
    precision on irregular time series (e.g., `IrregSecond`).
    This allows for better handling of date/time precision in workflows.
*   ![change](change.png) [14.4.0] The
    [`Cumulate`](../command-ref/Cumulate/Cumulate.md) command has been updated:
    +   The default value for the `ResetValue` parameter (used with `Reset` parameter)
        has been changed to `DataValue`.
        The previous value of `0` causes the first value in the new year to always be zero,
        even if a non-zero data value is present at that date/time,
        which causes a value to be ignored and the cumulative value to be shorted by the ignored value.
        This is more of an issue for monthly time series where 1 out of 12 values is ignored.
*   ![change](change.png) [14.4.0] The
    [`If`](../command-ref/If/If.md) command has been updated:
    + Added the `FileExists` and `FileDoesNotExist` parameters to test whether a file exists.
    + Added the `ObjectExists` and `ObjectDoesNotExist` parameters to test whether an object exists.
    + Added the `TableExists` and `TableDoesNotExist` parameters to test whether a table exists.
    + Added the `TSDoesNotExist` parameter to test whether a table does not exist.
*   ![change](change.png) [14.4.0] The
    [`ReadDelimitedFile`](../command-ref/ReadDelimitedFile/ReadDelimitedFile.md) command has been updated
    to list additional data interval for irregular time series.
    The intervals include the precision that should be used for date/times, for example `IrregSecond`.
*   ![change](change.png) [14.4.0] The
    [`ReadPropertiesFromFile`](../command-ref/ReadPropertiesFromFile/ReadPropertiesFromFile.md) command has been updated:
    +   Added the `Value` file type, to allow reading a file's contents into a property,
        which is useful when manipulating text files,
        such as with the
        [`TextEdit`](../command-ref/TextEdit/TextEdit.md) command.
*   ![change](change.png) [14.4.0] Update the [`WriteDelimitedFile`](../command-ref/WriteDelimitedFile/WriteDelimitedFile.md) command
    to have the `DataFlagColumns` parameter to optionally output data flag column(s)

## Changes in Version 14.3.0 ##

**Feature release to improve automated testing, cloud integration, and reenable Microsoft Access support.**

*   ![new](new.png) [14.3.0] The
    [Comment](../command-ref/Comment/Comment.md) command has been updated:
    +   Added `@enabledif` annotation similar to `@require` that disables a command file test for automated testing
        when a requirement is not met.
    +   Fixed bug where `@require` was not being properly handled when checking the HydroBase version,
        when run in a test suite.
*   ![bug](bug.png) [14.3.0] Fix the [`ColoradoHydroBaseRest`](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) datastore:
    +   Null date/time objects, for example in the `porStart` and `porEnd` for data types
        were causing the `HydroBaseWeb` datastore to not initialize when TSTool starts.
        This may be due to changes in how the State publishes data.
    +   Null date/times are now passed through as nulls, which may cause problems later in processing.
*   ![bug](bug.png) [14.3.0] Fix to support Microsoft Access databases again for
    [`GenericDatabaseDatastore`](../datastore-ref/GenericDatabase/GenericDatabase.md):
    +   Direct use of ODBC data source names was dropped in Java 8 (TSTool 12).
    +   Implement the [UcanAccess](https://ucanaccess.sourceforge.net/site.html#home) software with pure Java JDBC connection to Access instead.
    +   Add Access support in the [`OpenDataStore`](../command-ref/OpenDataStore/OpenDataStore.md) command
        and add the `ConnectionProperties` command parameter to allow additional connection priperties.
    +   Add the [`NewAccessDatabase`](../command-ref/NewAccessDatabase/NewAccessDatabase.md) command.
*   ![bug](bug.png) [14.3.0] Fix the
    [`ProcessTSProduct`](../command-ref/ProcessTSProduct/ProcessTSProduct.md) command to parse time series product file colors
    that use format `#ffffff`.
*   ![bug](bug.png) [14.3.0] Fix the
    [`ReadTableFromDelimitedFile`](../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md) command to determine
    floating point number column precision even if the values are quoted.
    The `DoubleColumns` command parameter allow such values to be read as numbers, and precision is used for displays after reading.
*   ![bug](bug.png) [14.3.0] Fix the
    [`WebGet`](../command-ref/WebGet/WebGet.md) command:
    +   Handle URL with query values that have equal sign in the parameter value.
    +   Improve handling of supported HTTP methods.
*   ![bug](bug.png) [14.3.0] Fix the
    [`WriteTableToGeoJSON`](../command-ref/WriteTableToGeoJSON/WriteTableToGeoJSON.md) command editor so that the `Append` parameter
    field does not overwrite other fields.
*   ![change](change.png) [14.3.0] Add built-in processor properties:
    +   `RunTimeMs` - number of milliseconds for commands to run.  This is useful for performance evaluation.
    +   `WarningCount` - number of warning messages from commands in the last run.  This is useful for workflow success checks.
    +   `FailureCount` - number of failure messages from commands in the last run.  This is useful for workflow success checks.
*   ![change](change.png) [14.3.0] Update the
    [`CompareFiles`](../command-ref/CompareFiles/CompareFiles.md) command:
    +   Allow the input file(s) to be specified with a URL, to compare web-hosted file(s).
    +   Add the `WaitUntil` and related parameters to allow repeated comparison of files until the condition
        of same or different files is met.
*   ![change](change.png) [14.3.0] Update the
    [`ReadDateValue`](../command-ref/ReadDateValue/ReadDateValue.md) command:
    +   Add the `IfNotFound` parameter to ignore reading if the file does not exist,
        which is useful for reading files during troubleshooting.
*   ![change](change.png) [14.3.0] Update the
    [`ReadNrcsAwdb`](../command-ref/ReadNrcsAwdb/ReadNrcsAwdb.md) command:
    +   Allow `${Property}` in state.
    +   Increase speed at startup when using properties.
*   ![change](change.png) [14.3.0] Update the
    [`RunCommands`](../command-ref/RunCommands/RunCommands.md) command:
    +   Handle `@enabledif` annotations.
    +   Add the `AppendOutputFiles` parameter to append the command's output files to the main output file list.
    +   Add the `WarningCountProperty` and `FailureCountProperty` parameters to allow handling errors in the command file that is run.
*   ![change](change.png) [14.3.0] Update the [`TableMath`](../command-ref/TableMath/TableMath.md) command:
    +   Add `Max` and `Min` operators.
    +   Change so that the precision of floating point output columns is the maximum of the input columns.
*   ![change](change.png) [14.3.0] Update the
    [`WriteDateValue`](../command-ref/WriteDateValue/WriteDateValue.md) command:
    +   The `WriteDataFlags` parameter has been added to control whether data flags are written.
    +   The `WriteSeparateFiles` parameter has been added to control whether one or separate output files for each time series are written.
    +   The `WriteHeaderComments` and `HeaderComments` parameters have been added to control how output file header comments are written.
*   ![change](change.png) [14.3.0] Update the
    [`WriteDelimitedFile`](../command-ref/WriteDelimitedFile/WriteDelimitedFile.md) command:
    +   The `WriteSeparateFiles` parameter has been added to control whether one or separate output files for each time series are written.
    +   The `WriteHeaderComments` and `HeaderComments` parameters have been added to control how output file header comments are written.

## Changes in Version 14.2.2 ##

**Maintenance release to address issues found in the HydroBase REST web services datastore.**

*   ![bug](bug.png) [14.2.2] Fix issues identified while implementing the
    [ColoradoHydroBaseRest](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) datastore:
    +   Tested with HydroBase 20200330 version.
    +   Fixed issue where HydroBase database `SnowDepth` data type was returning `-2147483648` for missing values
        because the database changed from integer to floating number type.
*   ![bug](bug.png) [14.2.2] Fix bug where ***View / Data Units*** resulted in an error.

## Changes in Version 14.2.1 ##

**Maintenance release to disable real-time data in HydroBase database datastore, other cleanup for recent releases.**

*   ![remove](remove.png) [14.2.1] Remove real-time data in HydroBase datastore and input type since
    no longer supported in the current HydroBase approach and data are available in the
    [ColoradoHydroBaseRest](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md) datastore.
    The `Irregular` interval (timestep) has been removed from the following data types,
    and the data type has also been removed if real-time interval was the only choice:
    +   `AdminFlow - AdminFlow` (`Day` and `Month` remain)
    +   `Hardware - Battery` (real-time only)
    +   `Climate - Precip` (`Day` and `Month` remain)
    +   `Climate - Temp` (has real-time only)
    +   `Reservoir - PoolElev` (has real-time only)
    +   `Reservoir - Release` (has real-time only)
    +   `Reservoir - Stage` (has real-time only)
    +   `Reservoir - Storage` (has real-time only)
    +   `Stream - WatTemp` (has real-time only)
    +   `Well - WellLevel` (has multiple intervals but have been phasing out for years so remove)
    +   `Well - WellLevelElev` (has real-time only)
*   ![bug](bug.png) [14.2.1] Fix the graphing tool to show mouse tracker when irregular
    time series do not have fully-overlapping periods.
    Also add the tracker option ***NearestWithId*** to show the time series identifier on the tracker,
    which is useful when many time series are shown.
*   ![bug](bug.png) [14.2.1] Fix bug where sub-second precision dates were truncating when read
    if the fractional digits did not match a handled interval.
    For example, 4 digits would truncate to milliseconds.
    The software will now use the next highest precision if the number of digits being parsed is
    not an exact match for hundredths, milli, micro, or nanoseconds,
    and additional zeros will be added at the end.
*   ![bug](bug.png) [14.2.1] Fix the
    [`Cumulate`](../command-ref/Cumulate/Cumulate.md) command so an error is not shown for the `Reset`
    parameter if not specified (the parameter is optional).
*   ![change](change.png) [14.2.1] Update the
    [`WebGet`](../command-ref/WebGet/WebGet.md) command to have `HttpHeaders` parameter to pass
    HTTP header properties with the request.

## Changes in Version 14.2.0 ##

**Feature release to add HydroBase REST web services for historical climate and surface water stations,
and add support for sub-second time.**

*   ![new](new.png) [14.2.0] The [ColoradoHydroBaseRest](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest.md)
    web service has new functionality:
    +   Historical climate station time series can now be read.
    +   Historical surface water station time series (streamflow) can now be read.
    +   The [`ReadColoradoHydroBaseRest`](../command-ref/ReadColoradoHydroBaseRest/ReadColoradoHydroBaseRest.md)
        command has been updated to read the above historical time series.
    +   Time series identifier commands for the datastore read the above historical time series.
    +   The datastore documentation has been significantly updated.
*   ![bug](bug.png) [14.2.0] The Agriculture/NASS `CropArea` data type was listed for HydroBase;
    however, time series that were listed could not be transferred to the command list.
    This has been fixed.
*   ![remove](remove.png) [14.2.0] Code for DIADvisor input type has been removed.
    The software features had not been used for many years and were unsupported.
*   ![change](change.png) [14.2.0] Internal date/time objects have been updated to support sub-second precision, as follows:
    +   Nanonsecond, microsecond, millisend, and hundredths of second fractional seconds are supported
        and are handled automatically during date/time parsing and formatting.
        Previously only hundredths of seconds was supported.
    +   Begin phasing in precision for irregular time series time interval.
        For example `IrregSecond` is used for irregular time series with date/times that use precision to second.
        High precision time is handled, for example to track exact measurement times for real-time data values.
    +   Several commands listed below have been updated to utilize the new functionality and additional features will be updated over time.
*   ![change](change.png) [14.2.0] Time series now have a built-in data precision property that is used for output if specified,
    which will override the precision determined from data units.
    Use the ***Results / Time Series Properties*** menu to view a time series' precision.
*   ![change](change.png) [14.2.0] Update the
    [`CreateTimeSeriesEventTable`](../command-ref/CreateTimeSeriesEventTable/CreateTimeSeriesEventTable.md) command to
    support analysis of time series data to determine events.
*   ![change](change.png) [14.2.0] Update the
    [`FormatTableDateTime`](../command-ref/FormatTableDateTime/FormatTableDateTime.md) command to allow
    incremental time offset to use floating-point number with fractional intervals.
    For example, fractional minutes can be processed.
*   ![change](change.png) [14.2.0] Update the
    [`TableToTimeSeries`](../command-ref/TableToTimeSeries/TableToTimeSeries.md) command to support sub-second
    precision for irregular interval time series.
    The `IrregularIntervalPrecision` now accepts `HSecond`, `Millisecond`, `Microsecond`, and `Nanosecond`. 

## Changes in Version 14.1.1 ##

**Maintenance release to fix features used in automated testing.**

*   ![bug](bug.png) [14.1.1] Handling of the `--datastore-substitute` behavior was not consistent
    across multiple testing environments.  Fixes were implemented and documentation was updated.
    Fix the ***View / Datastores*** table to more clearly indicate when a datastore is involved in a substitute.

## Changes in Version 14.1.0 ##

**Feature release to format table as Markdown and improve file handling.**

*   ![new](new.png) [14.1.0] Add the
    [`SetTableColumnProperties`](../command-ref/SetTableColumnProperties/SetTableColumnProperties.md)
    command to set table column properties, used when formatting output.
*   ![new](new.png) [14.1.0] Add the
    [`WriteTableToMarkdown`](../command-ref/WriteTableToMarkdown/WriteTableToMarkdown.md)
    command to write a table to a Markdown format file.
*   ![change](change.png) [14.1.0] Update the [`AppendFile`](../command-ref/AppendFile/AppendFile.md) command:
    +   The output file can be the same as an input file (input file will be overwritten).
    +   Input files can now be specified as a comma-separated-value list of filenames or patterns.
    +   Filename pattern handling has been enhanced.
    +   The `AppendText` parameter has been added to append text to a file.
    +   Increase flexibility of wildcard (glob) pattern matching.
*   ![change](change.png) [14.1.0] Update the
    [`StartRegressionTestResultsReport`](../command-ref/StartRegressionTestResultsReport/StartRegressionTestResultsReport.md) command
    to output a report with `nonum` in the name.
    The file is the same as the normal output but with test numbers removed,
    which is useful for comparing one test suite output to another.
*   ![change](change.png) [14.1.0] Update the
    [`Cumulate`](../command-ref/Cumulate/Cumulate.md) command `Reset` parameter to allow `${Property}` notation.
*   ![change](change.png) [14.1.0] Update the
    [`FormatFile`](../command-ref/FormatFile/FormatFile.md) command to allow overwriting the input file.

## Changes in Version 14.0.6 ##

**Maintenance release for to improve `@require` functionality.**

*   ![change](change.png) [14.0.6] Updated the
    [`@require` Comment](../command-ref/Comment/Comment.md) command:
    +   Improve the `@require` software design to allow datastores more flexibility in
        implementing requirements.
    +   Add the datastore type to `@require` command status messages to
        improve troubleshooting.

## Changes in Version 14.0.5 ##

**Maintenance release for testing and to update the `log4j` library.**

*   ![bug](bug.png) [14.0.5] Update the `Log4J` library to version 2.17.1 for security patches.
*   ![change](change.png) [14.0.5] Updated the
    [`FormatStringProperty`](../command-ref/FormatStringProperty/FormatStringProperty.md) command:
    +   Add the `IntegerFormat`, `Endianness`, `Delimiter`, and `NumBytes` parameters to format
        integer properties as hex code string, which is useful for automated testing.

## Changes in Version 14.0.4 ##

**Maintenance release to update training materials and respond to "Log4Shell" vulnerability.**

*   ![bug](bug.png) [14.0.4] Update the `log4j` library to version 2.17.0 in response to the "Log4Shell" security vulnerability.
    See the [Apache Log4J Vulnerability Guidance](https://www.cisa.gov/uscert/apache-log4j-vulnerability-guidance) documentation.
*   ![bug](bug.png) [14.0.4] Fix a bug introduced in the previous release that broke transfer of time series
    identifiers from the time series list to TSID commands.
    This bug was due to new features that handle datastore aliases used in software testing.
    The bug mainly impacts the case where the HydroBase input type is used with TSID commands.
    If version 14.0.3 is used, the work-around is to configure a HydroBase datastore named `HydroBase`.
*   ![change](change.png) [14.0.4] Training materials that are distributed in the `doc/training` folder have
    been updated to be compatible with the latest software features.
    Additional training presentations will be added in the future as training materials are updated.
    The [Training](../training/overview.md) documentation now links to online training materials.
*   ![change](change.png) [14.0.4] Updated the
    [`WebGet`](../command-ref/WebGet/WebGet.md) command to handle redirects.

## Changes in Version 14.0.3 ##

**Maintenance release for Reclamation Linux version.**

*   ![change](change.png) [14.0.3] Updated the
    [`CompareTimeSeries`](../command-ref/CompareTimeSeries/CompareTimeSeries.md)
    command to have `AllowedDiff` parameter
*   ![change](change.png) [14.0.3] Minor changes to ReclamationHDB commands based on testing.

## Changes in Version 14.0.2 ##

**Maintenance release with changes to address issues and features needed for automated testing.**

*   ![bug](bug.png) [14.0.2] Fix bug related to substitute datastore features:
    +   was causing an exception editing commands that operate on datastores, fixed in the following commands:
        -   [`CreateDataStoreDataDictionary`](../command-ref/CreateDataStoreDataDictionary/CreateDataStoreDataDictionary.md)
        -   [`DeleteDataStoreTableRows`](../command-ref/DeleteDataStoreTableRows/DeleteDataStoreTableRows.md)
        -   [`ReadTableFromDataStore`](../command-ref/ReadTableFromDataStore/ReadTableFromDataStore.md)
        -   [`ReadTimeSeriesFromDataStore`](../command-ref/ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore.md)
        -   [`RunSql`](../command-ref/RunSql/RunSql.md)
        -   [`WriteTableToDataStore`](../command-ref/WriteTableToDataStore/WriteTableToDataStore.md)
    +   substitute datastore name was not being used to form time series identifiers in the man user interface - the
        selected datastore (which may be a substitute) is now used to create TSID commands
*   ![bug](bug.png) [14.0.2] Fix the [`TableToTimeSeries`](../command-ref/TableToTimeSeries/TableToTimeSeries.md) command
    so that irregular interval data outside the requested period are not set in the time series.
*   ![change](change.png) [14.0.2] Change the
    [`ReadTableFromDelimitedFile`](../command-ref/AppendFile/AppendFile.md) command `IncludeText` and `ExcludeText`
    parameters to automatically convert `*` wildcard to Java `.*` to simplify wildcard use and be consistent with other commands.
*   ![change](change.png) [14.0.2] Update the
    [`ReadTableFromDelimitedFile`](../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md) command:
    +   allow `*` in the filename
    +   fix the `HeaderLines` parameter to work
*   ![change](change.png) [14.0.2] Update commands to improve handling database functions and procedures:
    +   [`ReadTableFromDataStore`](../command-ref/ReadTableFromDataStore/ReadTableFromDataStore.md)
    +   [`RunSql`](../command-ref/RunSql/RunSql.md)
*   ![new](new.png) [14.0.2] Add `--ui-titlemod=TitleMod` TSTool program parameter to specify
    a string to use in the TSTool main UI title bar, to specifically identify the TSTool session .

## Changes in Version 14.0.1 ##

**Maintenance release with minor changes to address issues and features needed for automated testing.**

*   ![bug](bug.png) [14.0.1] Fix command processing so that if a command has an error,
    the command's output files will be listed in the ***Results / Output Files***.
    Previously, a command with an error would not list its output files.
*   ![bug](bug.png) [14.0.1] Fix problem with command documentation not finding latest documentation
    if versioned documentation does not exist and update documentation URLs to `https`.
*   ![bug](bug.png) [14.0.1] Fix the [`CompareTimeSeries`](../command-ref/CompareTimeSeries/CompareTimeSeries.md) command
    to properly handle comparing two files or ensembles.
*   ![bug](bug.png) [14.0.1] Fix bug where command with `#@expectedStatus` comment that, when run returned a different status,
    was not resulting in a failure indication in the user interface.
*   ![change](change.png) [14.0.1] Add a ***Cancel*** button to the ***Tools / Diagnostics*** dialog
    and clarify the tooltips on buttons related to setting diagnostics properties.
*   ![change](change.png) [14.0.1] Add `TSTool.cfg` configuration properties `DiffProgram.Windows` and
    `DiffProgram.Linux` to allow configuring visual difference program for each environment
    without having to change the single `DiffProgram` configuration property,
    and default to KDiff3 as an example of typical use. 
*   ![change](change.png) [14.0.1] Update the following commands to list datastores opened with
    [`OpenDataStore`](../command-ref/OpenDataStore/OpenDataStore.md) command, used in automated testing
    (previously only listed datastores that are opened at startup, which limited the ability to edit command parameters):
    +   [`CloseDataStore`](../command-ref/CloseDataStore/CloseDataStore.md)
    +   [`CreateDataStoreDataDictionary`](../command-ref/CreateDataStoreDataDictionary/CreateDataStoreDataDictionary.md)
    +   [`DeleteDataStoreTableRows`](../command-ref/DeleteDataStoreTableRows/DeleteDataStoreTableRows.md)
    +   [`ReadTableFromDataStore`](../command-ref/ReadTableFromDataStore/ReadTableFromDataStore.md)
    +   [`ReadTimeSeriesFromDataStore`](../command-ref/ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore.md)
    +   [`RunSql`](../command-ref/RunSql/RunSql.md)
    +   [`WriteTableToDataStore`](../command-ref/WriteTableToDataStore/WriteTableToDataStore.md)
    +   [`WriteTimeSeriesToDataStore`](../command-ref/WriteTimeSeriesToDataStore/WriteTimeSeriesToDataStore.md)
*   ![change](change.png) [14.0.1] Message dialogs now show text that can be highlighted and copied.
*   ![change](change.png) [14.0.1] Update the [`CreateRegressionTestCommandFile`](../command-ref/CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md) command:
    +   Improve how test suites are handled with `IncludeTestSuite` and `ExcludeTestSuite`.  The behavior is now intuitive.
    +   Add support for `@os linux`, which is equivalent to `@os UNIX`.
    +   Allow the `SearchFolder` parameter to list more than one folder
*   ![change](change.png) [14.0.1] Update the [`FormatTableDateTime`](../command-ref/FormatTableDateTime/FormatTableDateTime.md) command
    to support seconds for `IncrementBaseUnit` parameter.
*   ![change](change.png) [14.0.1] Update the [`Message`](../command-ref/Message/Message.md) command to
    have `PromptActions` parameter, which enables interactive prompts to confirm message in command workflows,
    for example to prompt for confirmation for destructive actions such as removing files and folders.
*   ![change](change.png) [14.0.1] Update the [`ReadStateModB`](../command-ref/ReadStateModB/ReadStateModB.md) command
    to have `OutputVersion` parameter, which allows converting old data files to current format.
*   ![change](change.png) [14.0.1] Update the [`ReadTableFromDataStore`](../command-ref/ReadTableFromDataStore/ReadTableFromDataStore.md) command:
    +   allow newline character in `Sql` parameter to format multi-line SQL
    +   default floating point column precision to 6 digits for SQLite databases
    +   add `OutputProperties` parameter to set output properties when a single row is returned
*   ![change](change.png) [14.0.1] Update the [`ReadTableFromDelimitedFile`](../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile.md) command
    to accept space for `Delimiter` parameter, using `\s` notation.
*   ![change](change.png) [14.0.1] Update the [`RunCommands`](../command-ref/RunCommands/RunCommands.md) command
    to have `StdoutProperty` parameter.
*   ![change](change.png) [14.0.1] Fix the [`Wait`](../command-ref/Wait/Wait.md) command to properly handle small wait time specified as decimal fraction of second.
*   ![change](change.png) [14.0.1] Update the [`WriteTableToDelimitedFile`](../command-ref/WriteTableToDelimitedFile/WriteTableToDelimitedFile.md) command
    to have `IncludeColumns` and `ExcludeColumns` parameters.
*   ![new](new.png) [14.0.1] Add `--datastore-substitute=datastore,substitute` TSTool program parameter to specify
    substitute datastore name, useful for automated testing.

## Changes in Version 14.0.0 ##

**This is the first 64-bit Java release.
See also many new features that were added in the last [13.x releases](release-notes-13.md).**

*   ![change](change.png) [14.0.0] This is the first 64-bit release with new major version number 14:
    +   Installing version 14 will automatically copy a user's `.tstool` configuration files
        for previous version to this version.
    +   The HEC-DSS features are disabled.
        Additional resources are needed to update the software to use 64-bit libraries for HEC-DSS.
    +   This 64-bit version is constrained only by available memory on the computer
        and can be configured to use more memory for large datasets, if necessary.
        This is an improvement over the 32-bit version, which was constrained to
        approximately 1.2 GB of memory use.
*   ![change](change.png) [14.0.0] Enhance the raster graph:
    +   The [`ProcessRasterGraph`](../command-ref/ProcessRasterGraph/ProcessRasterGraph.md) command
        `TSProductFile` and `OutputFile` parameters can now be specified using `${Property}` syntax.
    +   Time series product file now accepts a `Data` property `SymbolTablePath`,
        which specifies the path to a symbol table,
        which describes the colors for the raster graph.
        If not specified, the raster graph uses deciles, after rounding the minimum and maximum values.
    +   The `Data` property `RasterGraphLegendPosition` has been added,
        and currently always defaults to `Right`.
        A color legend is always shown.
    +   An optional mouse tracker can be enabled in the graph window.
    +   Improved the mouse position information to include the symbol table range,
        consistent with the symbol table for colors.
    +   Improve the handling of colors.
    +   Attempting to zoom cased errors.  Zoom is now disabled.
*   ![change](change.png) [14.0.0] Update the
    [`CompareTimeSeries`](../command-ref/CompareTimeSeries/CompareTimeSeries.md) command:
    +   The `WarnIfDifferent` and `WarnIfSame` parameters have been changed to
        `IfDifferent` and `IfSame` to provide more flexibility, similar to other commands.
    +   The `CreateDiffTS` parameter has been updated to provide `IfDifferent` option,
        which will only create the difference time series for cases where a difference
        is detected.  This significantly reduces the number of output time series
        and increases processing speed.
    +   Add `DifferenceFile` parameter to indicate a file listing the difference counts
        for all time series.  The output was previously always saved in the log file,
        which led to large log files.
    +   Add `SummaryFile` parameter to indicate a file listing the summary of time series with
        differences.  Time series without differences are not included in the summary.
        The output was previously always saved in the log file.
    +   Add `MatchAlias` parameter to match time series alias.
    +   Improve error checks and warnings when a time series cannot be matched.
    +   Improve performance.
*   ![change](change.png) [14.0.0] Update the
    [`ReadStateCUB`](../command-ref/ReadStateCUB/ReadStateCUB.md) command:
    +   Added the `OutputVersion` parameter to allow old binary files to be translated to
        latest format, necessary to minimize differences when testing.
*   ![change](change.png) [14.0.0] Update the
    [`ReadStateModB`](../command-ref/ReadStateModB/ReadStateModB.md) command:
    +   Ignores parameter with name `NA`, which are placeholders that don't have data.
    +   Handle the case where `b44` (reservoir) file contains no reservoir stations.
    +   Add `IfFileNotFound` parameter to provide more control over error handling.
*   ![change](change.png) [14.0.0] Add the `--java-xmx` parameter to the Linux `tstool` shell script
    to set the maximum computer memory to use for TSTool Java Runtime Environment.
*   ![new](new.png) [14.0.0] Added the `--space-replacement` TSTool command line parameter
    to help with commands lines that include spaces in parameters.
