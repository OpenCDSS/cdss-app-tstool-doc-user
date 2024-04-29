# TSTool / Processing / Objects #

This documentation provides information about general object processing.

*   [Introduction](#introduction)
*   [Commands](#commands)
*   [TSTool User Interface](#tstool-user-interface)
*   [Examples](#examples)

---------------------

## Introduction ##

TSTool can be used to automate processing "objects".
Currently objects are associated with [JSON files](https://www.json.org/json-en.html),
which can represent complex hierarchical data.  Example use cases include:

*   reading GeoJSON files and adding properties with values from time series analysis
*   editing JSON files, for example to update a date corresponding to dataset publication
*   reading a data table from a JSON file

JSON files are used as input to and are created by workflows.
Files can be maintained using version control repositories such as with GitHub.

## Commands ##

Object processing commands are found in the ***Commands / Object Processing*** menu.

Use the [`NewObject`](../../command-ref/NewObject/NewObject.md) command to create a new object by reading a JSON file.

Use the [`SetObjectPropertiesFromTable`](../../command-ref/SetObjectPropertiesFromTable/SetObjectPropertiesFromTable.md) command
to set or add object properties using matching table data.

## TSTool User Interface ##

Use the ***Results / Objects*** tab for a list of objects created by processing commands.
Right-click an object to view as indented JSON text.

## Examples ##

See the ***Examples*** section of command documentation.
