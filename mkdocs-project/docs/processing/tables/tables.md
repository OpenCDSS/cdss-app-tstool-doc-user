# TSTool / Processing / Tables #

This documentation provides information about table processing.

*   [Introduction](#introduction)
    +   [Condition Evaluation for Rows](#condition-evaluation-for-rows)
*   [Commands](#commands)
*   [TSTool User Interface](#tstool-user-interface)
*   [Examples](#examples)

---------------------

## Introduction ##

TSTool can be used to automate processing tables that
have been read from files, Excel workbooks, databases, or created from other sources.
Time series and spatial data layer properties (attributes) can be stored as tables.

Example use cases include:

*   read tables from a database and process with TSTool commands
*   read tables to control a workflow, such as processing time series for a list of stations
*   save time series analysis results in a table and output as a spatial data layer
*   use table commands to automate testing, for example to compare database contents

Tables in TSTool are implemented as a generic data object that is based on columns and rows,
and can be used to integrate data processing with the following:

*   database tables
*   binary database files
*   Excel worksheets (spreadsheets)
*   delimited and fixed-format files
*   JSON file object arrays
*   time series data (as table)
*   spatial data layer attribute table

Tables have the following design features:

*   Each column must have a consistent data type,
    which allows commands and formatting to be handled consistently.
    The table column type can be viewed by right-clicking on the table in the TSTool ***Results*** area
    and selecting the ***Table properties*** menu item.
*   Tables each have an identifier, which is used to access the table during processing.
*   Columns are named and rows have number 1+.
    The table column heading that contains the name are not considered to be a part of the table data.
*   Missing data depend on the data type and are handled internally as:
    +   `null` (generally)
    +   empty string (for strings)
    +   `NaN` (for floating point values)
*   Tables can be read from various formats and output to various formats.
*   Table columns have properties including type and, depending on type,
    width and output precision (for floating point numbers).

### Condition Evaluation for Rows ###

Some commands provide a `Condition` parameter to limit which rows will be processed by the command.
For example, see:

*   [`DeleteTableRows`](../../command-ref/DeleteTableRows/DeleteTableRows.md)
*   [`TableMath`](../../command-ref/TableMath/TableMath.md)

The `Condition` parameter is restricted to a simple format and comparison.
More complex evaluations may be implemented over time.
A condition is defined as follows:

```
ColumnName operator Value
```

The `ColumnName` matches a table column name.
The operator is described below.
The `Value` is specified as a constant value consistent with the column type and can be specified with
`${Property}` that evaluates to a primitive type.
The data value from the indicated column is compared to `Value`.
Values can have the following type:

* integer
* double (floating point number)
* string

The operator is one of the following.

*   `<`
*   `<=`
*   `>`
*   `>=`
*   `==` (use this to test equality – do not use a single equal sign)
*   `!=`
*   `contains` (only for string comparison)
*   `!contains` (only for string comparison)
*   `isempty` (only for string comparison, and `Value` should not be specified)
*   `!isempty` (only for string comparison, and `Value` should not be specified)

Additional criteria for strings include:

*   For `<` and `>` comparisons, `A` is less than `Z`, etc. as per the [ASCII table](https://www.asciitable.com/).
*   Comparisons are case-specific.  Support for case-independent comparisons may be added in the future.
*   Null string is treated as empty string for `isempty` and `!isempty` operators.

## Commands ##

Because tables are a common data representation that requires many commands,
table processing commands are found in the ***Commands(Table)*** menu
and follow an organization similar to the main ***Commands*** menu.
Commands are provided to read tables from various sources,
manipulate tables, and output tables in various formats.

Tables have unique identifiers, which are selected in commands using the `TableID` or similar parameter.

The [`For`](../../command-ref/For/For.md) command can be used to iterate over table rows,
for example to provide information necessary to read time series from a datastore or file.

## TSTool User Interface ##

The ***Results / Tables*** tab lists tables that are created when processing commands.
Left-click on a table to view.  Right-click to view table properties and find tables by searching the list of tables.

## Examples ##

See the ***Examples*** section of each table command's documentation.
