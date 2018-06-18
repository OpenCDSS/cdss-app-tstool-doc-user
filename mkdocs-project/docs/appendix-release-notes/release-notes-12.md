# TSTool / Release Notes / Version 12 #

* [Changes in Versions 12.01.00 - 12.05.00](#changes-in-versions-120100-120500)
* [Changes in Version 12.00.00](#changes-in-version-120000)

----------

## Changes in Versions 12.01.00 - 12.05.00 ##

* ![new](new.png) [12.05.00] Initial version of [ColoradoHydroBaseRest web service datastore](../datastore-ref/ColoradoHydroBaseRest/ColoradoHydroBaseRest) features.
command and added network object as main object type in TSTool main interface.
* ![new](new.png) [12.03.00] Added the [`CreateNetworkFromTable`](../command-ref/CreateNetworkFromTable/CreateNetworkFromTable)
command and added network object as main object type in TSTool main interface.
* ![new](new.png) [12.01.00] Added experimental [plugin datastore](../datastore-ref/Plugin/Plugin)
feature to allow third-party modules to add datastore functionality.
This allows developers to add functionality to TSTool without changing the core software.
* ![change](change.png) [12.05.00] Begin changing command editor dialogs to default to relative path when files are selected via a file chooser.
* ![change](change.png) [12.05.00] Enhance the [`If`](../command-ref/If/If) command to have `contains` and
`!contains` operators for string evaluations.
* ![change](change.png) [12.05.00] Enhance the [`InsertTableColumn`](../command-ref/InsertTableColumn/InsertTableColumn) command to have
`InitialFunction` parameter to facilitate setting initial values.
* ![change](change.png) [12.05.00] Enhance the [`InsertTableRow`](../command-ref/InsertTableRow/InsertTableRow) command to have
`ColumnValues` parameter to set cell values for the inserted row.
* ![change](change.png) [12.05.00] Enhance the [`WebGet`](../command-ref/WebGet/WebGet) command to have
`ResponseCodeProperty` parameter to help handle errors in requests.
* ![new](new.png) [12.04.00] Added the [`ReadWaterML2`](../command-ref/ReadWaterML2/ReadWaterML2) command.
* ![change](change.png) [12.03.04] Enhance the [`For`](../command-ref/For/For) command to allow
`SequenceStart` and `SequenceEnd` parameters to be specified with `${Property}`.
* ![change](change.png) [12.03.00] Enhance the [`ReadTableFromDelimitedFile`](../command-ref/ReadTableFromDelimitedFile/ReadTableFromDelimitedFile) command to have
`RowCountProperty` parameter.
* ![change](change.png) [12.03.00] Enhance the [`SelectTimeSeries`](../command-ref/SelectTimeSeries/SelectTimeSeries) command to
support selection based on network downstream and upstream node list.

## Changes in Version 12.00.00 ##

* ![change](change.png) [12.00.00] Clean up the log file messages to streamline main processing messages.
Don’t print log messages for command in [`If`](../command-ref/If/If) blocks that are being skipped – improves performance.
* ![change](change.png) [12.00.00] The [`CalculateTimeSeriesStatistic`](../command-ref/CalculateTimeSeriesStatistic/CalculateTimeSeriesStatistic)
command has been updated to add `StatisticValueProperty` parameter to set a processor property.
* ![change](change.png) [12.00.00] The [`FormatStringProperty`](../command-ref/FormatStringProperty/FormatStringProperty) and
[`FormatDateTimeProperty`](../command-ref/FormatDateTimeProperty/FormatDateTimeProperty)
commands have been updated to add `PropertyType` parameter to allow control over the type of the output property that is created.
* ![change](change.png) [12.00.00] The [`Free`](../command-ref/Free/Free) command has been updated to add
`IfNotFound` parameter to allow control over actions if a time series to free is not found.
* ![change](change.png) [12.00.00] The [`If`](../command-ref/If/If) command has been updated to add
`PropertyIsNotDefinedOrIsEmpty` parameter to detect undefined/empty properties.
* ![change](change.png) [12.00.00] The [`SetProperty`](../command-ref/SetProperty/SetProperty) command has been updated to add
`Add`, `Subtract`, `Multiply`, and `Divide` parameters to perform simple math on properties.
 This allows, for example, incrementing a counter in a [`For`](../command-ref/For/For) command loop.
* ![change](change.png) [12.00.00] The [`SetPropertyFromEnsemble`](../command-ref/SetPropertyFromEnsemble/SetPropertyFromEnsemble) command has been updated to allow the
`EnembleID` parameter to be specified using wildcard `*`.
This is useful to match a single ensemble rather than having to know its identifier,
useful for graph templates.
* ![change](change.png) [12.00.00] The [`WriteReclamationHDB`](../command-ref/WriteReclamationHDB/WriteReclamationHDB) command has been updated to use
new `TS_XFER.WRITE_REAL_DATA` and `TS_XFER.WRITE_MODEL_DATA` stored procedures.
* ![change](change.png) [12.00.00] The following commands have been enhanced to work with the [`For`](../command-ref/For/For)
command and recognize `${Property}` notation (where appropriate):
[`FormatDateTimeProperty`](../command-ref/FormatDateTimeProperty/FormatDateTimeProperty),
[`Free`](../command-ref/Free/Free), [`FreeTable`](../command-ref/FreeTable/FreeTable),
[`SetProperty`](../command-ref/SetProperty/SetProperty) commands.
* ![new](new.png) [12.00.00] Add new [`ChangeTimeZone`](../command-ref/ChangeTimeZone/ChangeTimeZone) command to change the time zone in time series date/times.
* ![new](new.png) [12.00.00] Add new [`DeleteTableRows`](../command-ref/DeleteTableRows/DeleteTableRows) command to delete a row from a table.
Additional functionality will be added in the future to delete more than one row at a time.
* ![new](new.png) [12.00.00] New [`SetPropertyFromEnsemble`](../command-ref/SetPropertyFromEnsemble/SetPropertyFromEnsemble) command will
set processor properties from time series ensemble properties.
* ![new](new.png) [12.00.00] Time series graphs can now be displayed
using graph template feature in the time series results, facilitating one-click configurable graphs.
* ![new](new.png) [12.00.00] The new ***Graph - Ensemble*** graph type will automatically
convert a time series into an overlapping ensemble line graph.
* ![new](new.png) [12.00.00] Time series table displays now provide a popup menu
choice to calculate statistics for selected rows and columns.
* ![new](new.png) [12.00.00] Time series graphs now provide enhanced right-click to set y-axis limits.
