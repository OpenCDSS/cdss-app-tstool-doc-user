# TSTool / Command / CloseDataStore #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `CloseDataStore` command closes a datastore’s database connection.
Closing the connection will cause subsequent interactions with the datastore’s database to fail.
This command is used to simulate dropped database connections
(for example when TSTool does not read from or write to database for a period due to user inaction).
Some database datastores have been updated to auto-connect to the database when the connection is dropped.

The command can also be used with commands that dynamically open datastores, including the following commands:

*   [`NewAccessDatabase`](../NewAccessDatabase/NewAccessDatabase.md)
*   [`NewSQLiteDatabase`](../NewSQLiteDatabase/NewSQLiteDatabase.md)
*   [`OpenDataStore`](../OpenDataStore/OpenDataStore.md)

Datastores that are needed throughout a TSTool session should be configured with a datastore
configuration file to connect at startup,
which allows TSTool to initialize main user interface query filters.

The status of datastores can be shown in TSTool using the ***View / Datastores***
menu as shown in the following figure (the Status ***Message*** column on the far right,
not visible in the figure, provides additional information about the datastore):

**<p style="text-align: center;">
![View_Datastores](View_Datastores.png)
</p>**

**<p style="text-align: center;">
Datastore Information from *View/Datastores* (<a href="../View_Datastores.png">see also the full-size image</a>)
</p>**

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / Datastore Processing***

The following dialog is used to edit the command and illustrates the syntax of the command.

**<p style="text-align: center;">
![CloseDataStore](CloseDataStore.png)
</p>**

**<p style="text-align: center;">
`CloseDataStore` Command Editor (<a href="../CloseDataStore.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CloseDataStore(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`DataStore`|The name of a database datastore to read.| None – must be specified.|
|`StatusMessage`|A status message to display when the datastore information is viewed.  The status may be reset if the connection is automatically restored, for example when a subsequent database interaction occurs.|Message appropriate for closing the datastore.|

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/CloseDataStore).

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`NewAccessDatabase`](../NewAccessDatabase/NewAccessDatabase.md) command
*   [`NewSQLiteDatabase`](../NewSQLiteDatabase/NewSQLiteDatabase.md) command
*   [`OpenDataStore`](../OpenDataStore/OpenDataStore.md) command
