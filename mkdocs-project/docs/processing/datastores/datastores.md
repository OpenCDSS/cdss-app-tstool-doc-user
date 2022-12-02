# TSTool / Datastore Processing #

This documentation provides information about datastore processing.

*   [Introduction](#introduction)
*   [Commands](#commands)
*   [TSTool User Interface](#tstool-user-interface)
*   [Examples](#examples)

---------------------

## Introduction ##

TSTool implements "datastores" as data sources that provide time series and other data.
A datastores may provide integration with a databases, web services, or other data souces.
See the [Datastores Overview](../../datastore-ref/overview.md) for an overview.
TSTool datastore features include interactive data browsing and commands to automate processing.

Example use cases include:

*   downloading time series and other data from web services
*   running SQL statements on a database and creating and manipulating databases
*   creating SQLite databases to distribute data
*   comparing the contents of datastores
*   creating an HTML data dictionary for a database

## Commands ##

Datastore processing commands are found in the ***Commands / Datastore Processing*** menu.

Some commands, such as [`ReadTableFromDataStore`](../../command-ref/ReadTableFromDataStore/ReadTableFromDataStore.md)
are useful for querying database into tables,
which can then be processed using [Table Processing](../../processing/tables/tables.md) commands.

The [`NewSQLiteDatabase`](../../command-ref/NewSQLiteDatabase/NewSQLiteDatabase.md)
and [`RunSql`](../../command-ref/RunSql/RunSql.md) commands
can be used to publish a database, such as a collection of time series and other data.

## TSTool User Interface ##

Datastore information can be listed using the ***View / Datastores*** menu.

Because datastores are used as input, there is no corresponding tab in the ***Results*** area.

## Examples ##

See the ***Examples*** section of command documentation.
