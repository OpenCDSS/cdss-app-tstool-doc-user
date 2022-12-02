# TSTool / Table Processing #

This documentation provides information about table processing.

*   [Introduction](#introduction)
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

## Commands ##

Because tables are a common data representation that require many commands,
table processing commands are found in the ***Commands(Table)*** menu
and follow an organization similar to the main ***Commands*** menu.
Commands are provided to read tables from various sources,
manipulate tables, and output tables in various formats.

Tables have unique identifiers, which are selected in commands using the `TableID` or similar parameter.

The [`For`](../../command-ref/For/For.md) command can be used to iterate over table rows,
for example to provide information necessary to read time series from a datastore or file.

## TSTool User Interface ##

The ***Results / Tables*** tab lists tables that are created when processing commands.
Click on a table to view and right-click to view table properties.

## Examples ##

See the ***Examples*** section of command documentation.
