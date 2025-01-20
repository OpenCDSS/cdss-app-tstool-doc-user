# TSTool / Command / CopyTimeSeriesPropertiesToTable #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `CopyTimeSeriesPropertiesToTable` command copies time series properties to a table.
Properties consist of dynamic properties set as output from a workflow
and built-in properties (e.g., `datatype`, `units`) that are automatically set
(see the documentation for [time series properties](../../introduction/introduction.md#time-series-properties)).

A common use case is to read multiple time series using a `Read` command.
Read commands can implement a `ReadData=False` parameter to only read time series metadata,
which will improve performance.  Then:

*   use the [`CopyTable`](../CopyTable/CopyTable.md) command to further filter the initial table
*   use the table for iteration using the [`For`](../For/For.md) command
*   output a list of time series

Properties can be copied to an existing table, or a new table can be created.
Time series properties are typically set in the following ways:

1.  Location and time series metadata from original data (e.g., database or web service) are set as properties when the time series are read.
2.  The [`SetTimeSeriesProperty`](../SetTimeSeriesProperty/SetTimeSeriesProperty.md) command sets a property.
3.  Other commands set properties as a bi-product of processing.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands(Table) / Table, Time Series Processing***

The following dialog is used to edit the command and illustrates the command syntax
(in this case the full time series identifier is used to match the time series in the table).

**<p style="text-align: center;">
![CopyTimeSeriesPropertiesToTable command editor](CopyTimeSeriesPropertiesToTable.png)
</p>**

**<p style="text-align: center;">
`CopyTimeSeriesPropertiesToTable` Command Editor (<a href="../CopyTimeSeriesPropertiesToTable.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CopyTimeSeriesPropertiesToTable(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`TSList`|Indicates the list of time series to be processed, one of:<br><ul><li>`AllMatchingTSID` – all time series that match the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`AllTS` – all time series before the command.</li><li>`EnsembleID` – all time series in the ensemble will be processed (see the EnsembleID parameter).</li><li>`FirstMatchingTSID` – the first time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`LastMatchingTSID` – the last time series that matches the TSID (single TSID or TSID with wildcards) will be processed.</li><li>`SelectedTS` – the time series are those selected with the [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command.</li></ul> | `AllTS` |
|`TSID`|The time series identifier or alias for the time series to be processed, using the `*` wildcard character to match multiple time series.  Can be specified using `${Property}`.|Required if `TSList=*TSID`|
|`EnsembleID`|The ensemble to be processed, if processing an ensemble. Can be specified using `${Property}`.|Required if `TSList=*EnsembleID`|
|`IncludeProperties`|A list of user-defined (dynamic) time series property names for properties to be copied to the table, separated by commas.  Specify with `*` wildcard characgers to match multiple properties.  Can be specified using `${Property}`. |Copy all dynamic properties.|
|`ExcludeProperties`|A list of user-defined (dynamic) time series property names for properties to **not** be copied to the table, separated by commas, which will modify the `IncludeProperties` list.  Specify with `*` wildcard characters to match multiple properties.  Can be specified using `${Property}`. |Copy all dynamic properties.|
|`IncludeBuiltInProperties`|A list of built-in time series property names for properties to be copied to the table, separated by commas.  Use `*` for all properties. Specify with `*` wildcard characters to match multiple properties. Can be specified using `${Property}`.  See the documentation for [time series properties](../../introduction/introduction.md#time-series-properties) (e.g., use `units` as the property name). | Copy no built-in properties.|
|`ExcludeBuiltInProperties`|A list of built-in time series property names for properties to **not** be copied to the table, separated by commas, which will modify the `IncludeBuiltInProperties` list.  Specify with `*` wildcard characters to match multiple properties. Specify with `*` wildcard characters to match multiple properties. Can be specified using `${Property}`.  See the documentation for [time series properties](../../introduction/introduction.md#time-series-properties) (e.g., use `units` as the property name). | Copy no built-in properties.|
|`TableID`|The identifier for the existing or new table to receive properties.  Can specify using processor `${Property}`.|None – must be specified.|
|`TableTSIDColumn`|Table column name that is used to match the time series identifier for processing, to select the row.  Can be specified using `${Property}`. |None – must be specified.|
|`TableTSIDFormat`|The specification to format the time series identifier to match the `TSID` column.  Use the format choices and other characters to define a unique identifier.|Time series alias if available, or otherwise the time series identifier.|
|`AllowDuplicates`|Allow duplicate TSID rows in the output:<ul><li>`False` – match `TSID`, intended for cases where `TSID` are distinct</li><li>`True` – add new rows regardless, for cases where multiple time series having the same `TSID` are processed and should each have a row in the output table.|`False` (if `TSID` is matched, set the properties for that row).|
|`NameMap`|A map of time series property name to table column name in format `PropertyName1:ColumnName,PropertyName2:ColumnName2,...`. Can be specified using `${Property}`. Only time series property names are mapped to the new name (existing table columns will remain). | Time series property name is used for the table column name. |
|`TableOutputColumns`| **The `NameMap` parameter should be used instead of this older parameter.  This parameter has been removed as of TSTool version 14.10.0.** The name(s) of the column(s) to receive properties for the matching time series.  Separate column names with commas.  If a column name is specified as `*`, the property name is used for the column name.  Can be specified using `${Property}`. | If not specified, use `IncludeProperties`.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/CopyTimeSeriesPropertiesToTable).

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`CopyTable`](../CopyTable/CopyTable.md) command
*   [`For`](../For/For.md) command
*   [`SelectTimeSeries`](../SelectTimeSeries/SelectTimeSeries.md) command
*   [`SetTimeSeriesProperty`](../SetTimeSeriesProperty/SetTimeSeriesProperty.md) command
