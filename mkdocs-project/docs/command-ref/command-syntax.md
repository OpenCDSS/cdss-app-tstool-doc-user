# TSTool / Command Syntax #

This documentation provides information about command syntax and other
syntax that may be used in command files.

*   [Introduction](#introduction)
*   [Commands](#commands)
    +   [Basic Command Syntax](#basic-command-syntax)
    +   [Referring to Command Parameters](#referring-to-command-parameters)
    +   [Comment Commands](#comment-commands)
    +   [Command Indentation](#command-indentation)
    +   [Processor Properties](#processor-properties)
*   [Time Series](#time-series)
    +   [Time Series Identifiers](#time-series-identifiers)
    +   [Time Series Properties](#time-series-properties)
    +   [Time Series Data Flags](#time-series-data-flags)
*   [Date/Time](#datetime)
*   [Regular Expressions](#regular-expressions)
*   [Tables](#tables)
    +   [Table Identification](#table-identification)
    +   [Tables Properties](#table-properties)
*   [Templates](#templates)
*   [Configuration Files](#configuration-files)
    +   [TSTool Configuration File](#tstool-configuration-file)
    +   [Datastore Configuration File](#datastore-configuration-file)
    +   [Time Series Product Files](#time-series-product-files)

-----------------

## Introduction ##

TSTool commands use a number of syntax (notation) conventions that have been
implemented over time in response to functionality requirements.
This appendix provides a summary of the syntax as a guide for users and future software development.
Syntax standards listed here should be used where possible to ensure consistency in software features.

Where appropriate, notation has been selected based on other efforts.
For example, date/time formatting is patterned after the [C language strftime() function](https://man7.org/linux/man-pages/man3/strftime.3.html),
which has been available for over 30 years and has been implemented in various programming languages.
In cases where notation is specific to TSTool,
an attempt has been made to consider common notation standards that can be adapted for TSTool.
In cases where one or more existing standards are in place,
the most common or relevant standard for TSTool has been selected, with an option to implement additional standards in the future.

Although standard notation is utilized in the software design,
support for notation in commands may be incomplete because some commands use older code.
For example, the ability to use properties to specify command parameters
is implemented only for commands that have specifically required such functionality.
Future software enhancements will continue to update code to universally provide standard features.

TSTool uses the concept of "scope".  For example, properties may have a scope of the command (e.g., command parameters)
time series (time series properties), or other scope.
The scope is handled by default based on the context but in some cases may require notation to indicate the scope.
For example, the general `${Property}` notation refers to processor properties
and the notation `${ts:something}` refers to a time series property.

The following sections are ordered roughly in the order that topics are likely to be encountered,
with sections grouped according to major TSTool design elements.

## Commands ##

Commands are used to implement workflows and are saved to command files with `.tstool` file extension.
Command files are text files and are designed to be human-readable and support
integration with other tools, version control, etc.

### Basic Command Syntax ##

The syntax for commands adheres to the following syntax:

```
CommandName(Parameter1=”Value1”,Parameter2=”Value2”)
```

The `CommandName` matches a command from the TSTool Commands menu and as
documented in the [Command Reference](overview.md) documentation, which describes command parameters.

The following are guidelines for commands:

1.  Commands always follow the convention of command name at start with a list of named parameters in parentheses.
    The only exceptions are:
    1.  Comments starting with [`#`](Comment/Comment.md).
    2.  Block comments [`/*`](CommentBlockStart/CommentBlockStart.md) and
        [`*/`](CommentBlockEnd/CommentBlockEnd.md) that surround one or more command lines.
    3.  Command such as [`Exit`](Exit/Exit.md), which will always have empty list of parameters in the parentheses.
2.  Commands are generally not case-specific although the TSTool software enforces standards.
3.  Command and parameter names use mixed case where the first letter of each word is capitalized.
4.  Parameter values by default (as of TSTool 14.6.0) are surrounded by double quotes, regardless of type:
    1.  Double quotes are required in some cases to protect spaces and other characters within quotes.
    2.  TSTool versions prior to 14.6.0 formatted command parameters based on parameter type and
        quotes may not have been used.
    3.  Older versions of TSTool will not use double quotes for some parameters when editing.
5.  Each command must exist on a single line.
6.  As of TSTool 14.6.0, commands can be indented with spaces:
    1.  4 spaces per level is the default, similar to Python.
    2.  Older versions of TSTool will strip the indentation when reading the command file.
7.  Empty (blank) lines are allowed and will be handled as [`Empty`](Empty/Empty.md) commands.
8.  Unknown commands are handled as [`UnknownCommand`](UnknownCommand/UnknownCommand.md) commands.

###  Referring to Command Parameters ###

In some cases it is necessary to set one command parameter using the value of another command parameter.
This capability has been implemented for a small number of commands,
for example [`NewStatisticEnsemble`](../command-ref/NewStatisticEnsemble/NewStatisticEnsemble.md).
To reference a command parameter in another parameter, use the notation:

```
CommandName(Parameter1=Value1,Parameter2=”${c:Parameter1},...”)
```

This notation uses `c:` to provide a “command scope”,
similar to how the `ts:` notation provides a scope for time series properties (discussed below).

**Might need to change the above to `${commandParameter:Parameter1}` to be more explicit and verbose to allow for more flexibility.**

### Comment Commands ###

Command files use comments to disable commands without deleting them.
A [`#`](Comment/Comment) character at the start of a line indicates a one-line comment.
A group of lines that start with [`/*`](CommentBlockStart/CommentBlockStart.md) and end with
[`*/`](CommentBlockEnd/CommentBlockEnd.md) indicate a block of comments and all intervening commands will be ignored in processing.

### Command Indentation ###

As of TSTool version 14.6.0, commands can be indented with spaces to indicate logic such as with the
[`If`](If/If.md) and [`For`](For/For.md) command blocks.

*   Indentation by default uses 4 spaces similar to Python
    and multiples of 4 spaces are used for indenting multiple levels.
*   Indentation occurs automatically for commands that follow
    [`If`](If/If.md) and [`For`](For/For.md) commands,
    until closing
    [`EndIf`](EndIf/EndIf.md) and [`EndFor`](EndFor/EndFor.md) commands are encountered.
*   The popup menu for commands provides the
    ***Indent Right*** menu to increase indentation and ***Indent Left*** menu to decrease indentation.
*   Command editors typically do not show the indentation but the indentation will be retained in the command list
    after a command is edited.
*   TSTool versions prior to 14.6.0 will strip indentation from command files when read.
    Saving the command file with the same name will overwrite the previous indentations.

### Processor Properties ###

TSTool commands are processed, and data managed, by a “processor”.
The processor interacts with all commands and is controlled with properties
that initially have internal defaults (e.g., the default is to read all
available data rather than a specified input period).

Built-in properties that control the processor are set with specific commands (e.g.,
[`SetInputPeriod`](SetInputPeriod/SetInputPeriod.md)) and user-supplied
properties can be set with the
[`SetProperty`](SetProperty/SetProperty.md) command.
For example, it is common to use properties to manage
file locations and dates used in processing
so that the property can be defined once.

Processor properties can be used to specify parameters for commands using the following notation:

```
Command(ParameterName="${Property}",...)
```

Properties internally have a specific data type.
For example the input start and end use a “DateTime” object type supported by TSTool.
All properties will convert to strings, for example when saved to a properties file.
Some care may need to be taken to use properties of an appropriate type but a
general rule is that properties used in file names or similar can simply be handled as strings.

Refer to command documentation to determine if properties are supported for command parameters.
See the TSTool ***Results / Properties*** list for built-in properties that are available for use.

## Time Series ##

Time series are a complex object that internally have data and properties.
TSTool allows properties to be extracted from and set in time series.
The following sections describe syntax related to time series.

### Time Series Identifiers ###

Time series identifiers (TDIDs) uniquely identify time series and
are discussed in detail in the [Introduction](../introduction/introduction.md) chapter.
TSID commands, which match the syntax discussed below,
are created when using the data browsing features of the TSTool main interface,
are specified by some commands.
TSID commands are essentially automatic “read” commands that use default parameters
(e.g., the global input period and do not assign an alias).

There are two main forms of TSIDs:

```
Location.DataSource.DataType.Interval[.Scenario]~DataStore[~FileName]
```

```
Location.DataSource.DataType.Interval[.Scenario]
```

The first form of the TSID is a unique identifier for a time series,
similar to a Universal Resource Indicator (URI) for a web page,
and allows software to locate the data for reading.
The datastore (or “input type” and corresponding filename) after the tilde (`~`)
allows TSTool to determine which software component should read the time series from its source.

The second form of the TSID is a unique identifier for a time series within TSTool and is used after reading the data.
An original source or output location is not needed.
In cases where more than one time series will have the same TSID after reading,
an alias can be assigned (see the [Introduction chapter](../introduction/introduction.md) and the
[Time Series Properties](#time-series-properties) section below).

TSIDs may be more complex if, for example, the data type requires the use of multiple parts for uniqueness.
In this case, a dash may be used (e.g., `Streamflow-Max`).
The datastore appendices describe how time series properties from the original source are mapped into TSID notation.

### Time Series Properties ###

Time series properties are specific to individual time series.
Some internal properties are handled as built-in data values (e.g.,
data units are a string associated with a time series) whereas
user-assigned properties are assigned to the time series as a list (see the
[`SetTimeSeriesProperty`](SetTimeSeriesProperty/SetTimeSeriesProperty.md) command).

Time series properties are used by some commands to control the command functionality and output.
For example, many commands that create time series allow the alias to be assigned using time series properties.
The following notation is used when dealing with time series properties:

*   `%` formatting – Many commands that create time series allow the Alias
    or other parameters to be assigned using % formatters.
    For example, `Alias=”%L”` indicates that the time series alias should be
    assigned to the location part of the time series identifier.
    Format specifiers are provided for fundamental time series data properties
    that are required for each time series (units, location, data type, etc.).
*   `${ts:Property}` reference – Some command parameters need to specify a time
    series property by reference but the above formatting notation is inappropriate.
    In this case, the following design is used:
    +   `${ts:PropertyName}`

The latter notation allows a time series property to be specified using a notation similar to processor properties
where the `ts:` prefix differentiates the property from the more generic processor notation.

Note that using time series properties in commands in some cases must be limited
because TSTool uses a “discovery mode” to partially read/create time series so
that they can be listed in “downstream” commands.
The command editor in discovery mode can display the property syntax but may not
be able to provide a list of choices because the values are not determined until the commands are run.

### Time Series Data Flags ###

Time series data values (measurements, observations, etc.) are managed internally
as lists of date/time, value, and flag data.
A data flag is a string that is assigned a value based on one of the following cases:

* missing data value with a flag
* non-missing data value and no data flag
* non-missing data value with a flag

Data flags are useful for indicating the quality of a data value (e.g., `E` might indicate estimated)
and for tracking how specific data values are manipulated
(e.g., append to the data flag as specific actions are taken).
TSTool generally does not implement a standard for data flags because flags used in input data may vary.
However, some commands allow setting flags based on simple rules.
For example fill commands generally have a `FillFlag` parameter to set the data flag for filled values.
The following table lists notation that is used to provide flexibility in setting data flags.
The first notation option is used by most commands and the other
options are being phased in (refer to command documentation to confirm available data flag functionality).

**<p style="text-align: center;">
Command Parameter Notation Used When Setting Data Flag
</p>**

|**Notation**|**Description**|
|--|--|
|`x`|Set the data flag to x regardless of whether it has already been set.|
|`+x`|If the flag has not been set, set to `x`.  If the flag has been set, append `x`.  This notation is useful when there are no concerns about the order of characters in multi-character flags.|
|`+,x`|If the flag has not been set, set to `x`.  If the flag has been set, append `,x`.  This notation is useful when flags are set for each step in a process.|
|`Auto`|Some commands allow Auto or another string as the flag.  In this case, the command will decide the flag value that is assigned, based on some condition.  For example, the flag may be assigned based on which time series was used to fill the value.|

Data points in graphs can be labeled in various ways to facilitate interpretation of the data.
For example, each data point can be labeled with the data value, flag, or other information.
Similar to time series property formatting, the notation `%q` in graph
data point labels indicates that the points should be labeled with the data flag.

## Date/Time ##

Date/time notation is ubiquitous when dealing with time series, and includes use for the following:

*   date/time associated with specific data values
*   date/time pair that indicates data period or subset of the full data period
*   date/time pair indicating a window within each year

In most cases TSTool will default to displaying date/time using the [ISO 8601 specification](https://en.wikipedia.org/wiki/ISO_8601),
which is essentially `YYYY-MM-DD hh:mm:ss`.  Not only does this implement a global standard,
but it also ensures that date/times are formatted in a way that allows sequential sorting.
The precision of formatted date/times is generally consistent with the time series data interval
(e.g., monthly time series will have dates that are by default formatted as `YYYY-MM`).

It may be desirable or necessary to specify the format of date/times,
for example to indicate the format for output or parsing.
When this is necessary, the notation utilizes an optional format type prefix and the format itself, as follows:

*   The default is to parse the date/time string by matching ISO or other common
    formats (this works most of the time).  The default output format is the ISO format.
*   `C:%m%d%y` – Indicates that a C-style format is being used, where the formats match the
    UNIX [strftime() function](https://man7.org/linux/man-pages/man1/date.1.html) syntax.
    See the [`FormatDateTimeProperty`](FormatDateTimeProperty/FormatDateTimeProperty.md) command documentation.
*   In the future support for Microsoft Excel or other notation may be added (e.g., `MM-YYYY`).

## Regular Expressions ##

Regular expressions are strings that indicate how to match patterns,
for example to match file names or time series identifiers
(see: [regular expressions on WikiPedia](https://en.wikipedia.org/wiki/Regular_expression)).
Many software tools and programming languages implement regular
expressions to facilitate efficient data processing;
however, the notation can be confusing, especially if not used on a regular basis.
Within TSTool the following regular expression notations are used:

*   “globbing” – This notation was popularized by UNIX and in simple terms relies on the
    `*` character to indicate “match zero or more characters”.
     For example, it can be used to match a list of comma-separated-value files using the expression `*.csv`.
*   Regular expression syntax – True regular expression syntax provides much more power than globbing notation,
    but also introduces complexity in notation.  TSTool is written in Java and internally relies on Java’s regular expression syntax.

In most cases, TSTool commands and configuration files use the simpler globbing notation
because it is easier to use and explain.
However, in some cases the more powerful regular expression syntax is needed.
Where confusion may result, the command documentation clearly indicates the syntax that is supported,
and commands may accept the notation `glob:xxxx` or `java:xxxx` to indicate the type of regular expression that is being specified.

## Tables ##

TSTool includes significant functionality to process tables.

Internally, tables are managed using a flexible in-memory storage structure
that consists of metadata and data space.
Tables currently must consistent of columns containing the same data type (similar to database tables).
A list of table rows (or records) is maintained, and each row contains a list of objects corresponding to the columns.
Metadata is associated with the columns, such as column type,
width and precision (for data types that support width and precision).

Very large tables can cause TSTool to run out of memory.
Consequently, care should be taken when processing tables, such as using the
[`FreeTable`](FreeTable/FreeTable.md) command when needed.
Tables, when used with [`For`](For/For.md) command,
can result in compact command files, meaning that a few commands can perform significant processing work.

### Table Identification ###

Each table has an identifier, commonly called the “TableID” in TSTool, and a name.
The `TableID` should be unique and is used to reference tables during processing.

### Table Properties ###

Some table properties are built-in using metadata (such as column type, width, and precision)
and are not typically needed by other processing commands.
However, it is useful to property notation to retrieve table values,
in particular when used as command parameters to configure processing.
The following properties are enabled for some commands that process tables.

**<p style="text-align: center;">
Command Parameter Notation Used With Tables
</p>**

|**Table Property Notation**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|
|--|--|
|`${tablecolumnvalue:columnName}`|Indicates that the table column value for the specified column should be accessed/processed.  For example, this notation is used in graph annotations to indicate that rows in the annotation table should be used to provide data values for the annotation.|

## Templates ##

Template files are used when processing is automated to iterate over one or more lists of input data.
For example, the same 10 commands may be executed for each of 100 time series.
TSTool uses the [FreeMarker template library](https://freemarker.apache.org/) to process templates.
See the [`ExpandTemplateFile`](ExpandTemplateFile/ExpandTemplateFile.md) command documentation for an explanation of syntax.

TSTool provides the [`If`](If/If.md) and [`For`](For/For.md) commands to control command logic.
Therefore, template files are more suitable for formatting TSTool input (e.g., time series product files for graphs)
and output (e.g., repetitive website content).

## Configuration Files ##

Various configuration files are used with TSTool.
Where possible, simple and standard formats are used.

### TSTool Configuration File ###

The TSTool configuration file uses a simple notation to assign properties:

```text
[Section]

Property = Value
```

The `[Section]` notation is internally used as a prefix on the property name (e.g., `Section.Property = Value`).
Comments are lines that start with #.  Property values can be surrounded by double quotes.

### Datastore Configuration File ###

Datastore configuration files use the simple notation:

```text
Property = Value
Property = "Value"
```

Comments are lines that start with `#`.  Property values can be surrounded by double quotes.
The specific property values are described in [TSTool datastore appendices](../datastore-ref/overview.md).

### Time Series Product Files ###

Time series product configuration file uses a simple notation to assign properties:

```
[Section]

Property = Value
```

The `[Section]` notation is internally used as a prefix on the property name (e.g., `Section.Property = Value`).
Comments are lines that start with `#`.  Property values can be surrounded by double quotes.
See also the [TSView Time Series Viewing Tools appendix](../appendix-tsview/tsview.md).
