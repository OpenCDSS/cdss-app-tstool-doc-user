# TSTool / Processing / Properties #

This documentation provides information about processing properties.

*   [Introduction](#introduction)
    +   [Command Processor Properties](#command-processor-properties)
    +   [Time Series, Table, and other Properties](#time-series-table-and-other-properties)
*   [Commands](#commands)
*   [TSTool User Interface](#tstool-user-interface)
*   [Examples](#examples)
*   [See Also](#see-also)

---------------------

## Introduction ##

TSTool can automate processing "properties",
which are values that can be set to control processing logic and can be included in output.
Commands are available to set and manipulate properties.
Other commands set properties to describe command output,
for example the number of rows in a table.

Programming languages typically use syntax similar to:

```
Variable = Value
```

However, because the TSTool command processor does its work using commands,
commands like [`SetProperty`](../../command-ref/SetProperty/SetProperty.md) are used to set a command processor property value
using command parameters.

### Command Processor Properties ###

Internally, properties are managed in the command processor using a "map", also called a "dictionary".
Each property is defined by the following:

*   Name - uniquely identifies the property:
    +   Should not include spaces or special characters.
    +   Use a convention that is appropriate for a workflow and an organization.
    +   For example, can use `MixedCase`, `camelCase`, `lowercase`, or `UPPERCASE` naming conventions.
*   Type - indicates the internal object type:
    +   `Boolean` - a boolean value true or false
    +   `DateTime` - a date/time
    +   `Double` - a floating point number (requires formatting information to control the number of decimal point values)
    +   `Integer` - an integer number
    +   `String` - a string, used for text
*   Value - the value for the property:
    +   A text representation during editing and in command files.
    +   Internally, an object created from the text of the corresponding type.
    +   Special values such as `NaN` (not a number), `null` (not defined), and special characters (newline, etc.) are supported by some commands.

Properties can be referenced in command parameters and input data using the syntax:

*   `${Property}`
    +   simple property reference
*  `${{Property}Something}`
    +   nested property where the name depends on another property

If a property name cannot be matched, the original `${Property}` text is included in output as a visual indicator that the property is not defined.

Commands like [`ExpandTemplateFile`](../../command-ref/ExpandTemplateFile/ExpandTemplateFile.md) and
[`TextEdit`](../../command-ref/TextEdit/TextEdit.md) can replace `${Property}` with the property value.

### Time Series, Table, and other Properties ###

In addition to command processor properties, objects may also have properties.
For example, each time series object has a list of built-in properties and user-defined properties.
Each table also has a list of properties.
Object-scope properties can be used to set command processor properties
(e.g., using the [`SetPropertyFromTimeSeries`](../../command-ref/SetPropertyFromTimeSeries/SetPropertyFromTimeSeries.md) command),
and command processor properties can be set in objects
(e.g., using the [`SetTimeSeriesProperty`](../../command-ref/SetTimeSeriesProperty/SetTimeSeriesProperty.md) command using `${Property}`).

In some cases, special notation is used to avoid confusion between the different properties by indicating the scope of a property.
For example, `${ts:TimeSeriesProperty}` can be used with some commands to retrieve a time series property
whereas `${Property}` is used for command processor properties.

## Commands ##

Property processing commands are found in the ***Commands / Running and Properties*** menu.
For example, use the [`SetProperty`](../../command-ref/SetProperty/SetProperty.md) command to set a property value.

## TSTool User Interface ##

Properties that are used in command parameters are typically shown using `${Property}` syntax in command editors
because the properties are not expanded until run time.
For example, if a table name for a command is specified using `${SomeTableID}`,
later commands will show the same `${SomeTableID}` in table selection choices.
If a specific property value needs to be matched, such as a dynamically-created time series identifier or alias,
the specific value can be entered as a command parameter.

Use the ***Results / Properties*** tab for a list of properties created by commands.

## Examples ##

See the ***Examples*** section of command documentation.

## See Also ##

*   [`ExpandTemplateFile`](../../command-ref/ExpandTemplateFile/ExpandTemplateFile.md) command
*   [`SetProperty`](../../command-ref/SetProperty/SetProperty.md) command
*   [`SetPropertyFromTimeSeries`](../../command-ref/SetPropertyFromTimeSeries/SetPropertyFromTimeSeries.md) command
*   [`SetTimeSeriesProperty`](../../command-ref/SetTimeSeriesProperty/SetTimeSeriesProperty.md) command
*   [`TextEdit`](../../command-ref/TextEdit/TextEdit.md) command
