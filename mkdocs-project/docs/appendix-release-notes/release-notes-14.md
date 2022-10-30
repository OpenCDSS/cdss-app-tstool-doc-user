# TSTool / Release Notes / Version 14 #

* [Changes in Version 14.4.0](#changes-in-version-1440)
* [Changes in Version 14.3.0](#changes-in-version-1430)
* [Changes in Version 14.2.2](#changes-in-version-1422)
* [Changes in Version 14.2.1](#changes-in-version-1421)
* [Changes in Version 14.2.0](#changes-in-version-1420)
* [Changes in Version 14.1.1](#changes-in-version-1411)
* [Changes in Version 14.1.0](#changes-in-version-1410)
* [Changes in Version 14.0.6](#changes-in-version-1406)
* [Changes in Version 14.0.5](#changes-in-version-1405)
* [Changes in Version 14.0.4](#changes-in-version-1404)
* [Changes in Version 14.0.3](#changes-in-version-1403)
* [Changes in Version 14.0.2](#changes-in-version-1402)
* [Changes in Version 14.0.1](#changes-in-version-1401)
* [Changes in Version 14.0.0](#changes-in-version-1400)
* [Release notes for all versions](release-notes.md)

----------

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
        - [`CreateDataStoreDataDictionary`](../command-ref/CreateDataStoreDataDictionary/CreateDataStoreDataDictionary.md)
        - [`DeleteDataStoreTableRows`](../command-ref/DeleteDataStoreTableRows/DeleteDataStoreTableRows.md)
        - [`ReadTableFromDataStore`](../command-ref/ReadTableFromDataStore/ReadTableFromDataStore.md)
        - [`ReadTimeSeriesFromDataStore`](../command-ref/ReadTimeSeriesFromDataStore/ReadTimeSeriesFromDataStore.md)
        - [`RunSql`](../command-ref/RunSql/RunSql.md)
        - [`WriteTableToDataStore`](../command-ref/WriteTableToDataStore/WriteTableToDataStore.md)
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
