# TSTool / Command / ReadPropertiesFromFile #

*   [Overview](#overview)
    +   [Property File Formats](#property-file-formats)
    +   [Special Property Values](#special-property-values)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `ReadPropertiesFromFile` command reads the values of one or properties from a file,
which can then be used in workflows using `${Property}` syntax.
The corresponding [`WritePropertiesToFile`](../WritePropertiesToFile/WritePropertiesToFile.md)
command can be used to write properties to a file.
Processor properties include built-in global defaults such as `InputStart`, `InputEnd`,
`OutputStart`, `OutputEnd`, `OutputYearType`, `WorkingDir`,
and also user-defined properties set with the [`SetProperty`](../SetProperty/SetProperty.md) command.
Internally, properties have a name and a value, which is of a certain type
(`Double`, `String`, `Integer`, `DateTime`, etc.).  Examples of using the command include:

*   creating tests to verify that properties are being set
*   passing information from TSTool to another program, such as a Python script
*   storing persistent information for later use, such as the date/time that data were last downloaded from a web service
*   reading text from a file to merge into a file

### Property File Formats ###

The following table lists supported property file formats.
General guidelines include:

*  lines beginning with `#` are treated as comments
*  property values can be surrounded by matching single or double quotes,
   for example to better encapsulate strings that include spaces

**<p style="text-align: center;">
Property File Formats
</p>**

| **Format**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
|-----------------------|-----------------|
| `INI`                 | Configuration file format (see [Wikipedia article](https://en.wikipedia.org/wiki/INI_file)). This command treats lines starting with `#` and `;` (semi-colon) as comments. If the property is defined after a `[Section]` has been defined, the property name will include the section name as follows:  `Section.PropertyName`.  Properties in a section defined with `${Property}` can refer to properties in the same section without prefixing with the section; however, `${Section.PropertyName}` must be used to refer to properties in a different section. Global properties that are defined before the first `[Section]` can be referenced using a property name without a section. |
| `NameValue`           | Simple format, all properties handled as text:<br><br>`PropertyName=PropertyValue`<br>`PropertyName="Property value, quoted if necessary"` |
| `NameTypeValue`       | Same as `NameValue` format, with non-primitive objects treated as simple constructors:<br><br>`PropertyName=PropertyValue`<br>`DateTimeProperty=DateTime("2010-10-01 12:30")`<br><br>This is mainly used for `DateTime` objects and more types will be added in the future, as necessary. |
| `NameTypeValuePython` | Similar to the `NameTypeValue` format; however, objects are represented using “Pythonic” notation, to allow the file to be used directly by Python scripts:<br><br>`PropertyName="PropertyValue"`<br>`DateTimeProperty=DateTime(2010,10,1,12,30)`<br><br>This is mainly used for `DateTime` objects and support for more types will be added in the future, as necessary.  |
| `Value`               | Read the entire contents of a file into a property. |

The command attempts to create objects of the proper type but if this is an issue,
it may be necessary to use the formats that include property type.

## Special Property Values ##

The following table liss special property names.
If necessary, use `..` in property values for file and folder paths to navigate to other parent levels, for example:

```
root_folder = PARENT_FOLDER
root_parent_folder = ${root_folder}/..
```

**<p style="text-align: center;">
Special Property Values
</p>**

| **Value**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
|-----------------------|-----------------|
| `PARENT_FOLDER`       | The value will be set to the folder in which the property file exists, which is useful for creating portable configuration files. | 
| `PARENT_PARENT_FOLDER`| The value will be set to the parent of the folder in which the property file exists, which is useful for creating portable configuration files. |

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / General - Running and Properties***

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![ReadPropertiesFromFile command editor](ReadPropertiesFromFile.png)
</p>**

**<p style="text-align: center;">
`ReadPropertiesFromFile` Command Editor (<a href="../ReadPropertiesFromFile.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ReadPropertiesFromFile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`InputFile`<br>**required**|The property file to read, as an absolute path or relative to the command file.  Can be specified using `${Property}`.|None – must be specified.|
|`FileFormat`|Format of the properties file (see descriptions in the above [Property File Formats](#property-file-formats) table):<ul><li>`INI`</li><li>`NameValue`</li><li>`NameTypeValue`</li><li>`NameTypeValuePython`</li><li>`Value`</li></ul>|`NameValue`|
|`IncludeProperties`<br>(`IncludeProperty` prior to TSTool 14.8.0) |The names of properties to read, separated by commas.  Can be specified using `${Property}`. Use `*` as a wildcard. |If not specified, all properties will be read.|
|`ExcludeProperties` |The names of properties to ignore, separated by commas.  The exclusions are considered after `IncludeProperties` is considered.  Can be specified using `${Property}`. Use `*` as a wildcard. |If not specified, all properties indicated by `IncludeProperties` will be read.|
|`IgnoreCase` | If `True`, ignore upper/lower case when comparing property names for `IncludeProperties` and `ExcludeProperties`. If `False`, the property names much match exactly. | `False` |
|`ExpandProperties`| Indicate whether string property values read from the file that contain `${Property}` are expanded (`True`) or not (`False`). If `FileFormat=INI`, properties within the section are matched (without the `Section.` prefix) and then processor properties are matched (INI properties from other sections must use `Section.` prefix in the property name when referenced).  Properties must be defined in an order that allows the expansion to occur. | `True` |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/ReadPropertiesFromFile).

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`SetProperty`](../SetProperty/SetProperty.md) command
*   [`SetPropertyFromTimeSeries`](../SetPropertyFromTimeSeries/SetPropertyFromTimeSeries.md) command
*   [`WritePropertiesToFile`](../WritePropertiesToFile/WritePropertiesToFile.md) command
