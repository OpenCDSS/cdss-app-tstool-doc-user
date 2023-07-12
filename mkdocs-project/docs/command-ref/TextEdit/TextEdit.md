# TSTool / Command / TextEdit #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
    +   [Search and Replace Example Patterns](#search-and-replace-example-patterns)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#see-also)

-------------------------

## Overview ##

The `TextEdit` command edits a text file,
currently providing simple search and replace for literal strings.

In the future this command may be enhanced to add the following features:

*   edit an in-memory property value containing text
*   allow multiple operations in one command

The search and replace functionality is implemented using Java pattern matching and regular expressions
(see the Java [`Pattern`](https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html) class documentation).
It can be complicated to deal with special characters and patterns as they are processed
through TSTool commands and underlying Java code.
For example, some patterns pass through to the underlying code without changes whereas others
need to be transformed or "escaped" to protect from manipulation by TSTool.
The following examples illustrate how to perform common search and replace tasks.

The [`ReadPropertiesFromFile`](../ReadPropertiesFromFile/ReadPropertiesFromFile.md) command
can be used to read one or more properties from a text file
and the property values can be used to replace text in an initial file.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / General - File Handling***

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![TextEdit command editor](TextEdit.png)
</p>**

**<p style="text-align: center;">
`TextEdit` Command Editor (<a href="../TextEdit.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
TextEdit(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `InputFile`<br>**required** | The name of the input file.  Can be specified using `${Property}`. | None - must be specified. |
| `SearchFor`<br>**required** | The string to search for in the input file.  Can be specified using `${Property}`. See the examples in [Search and Replace Example Patterns](#search-and-replace-example-patterns). | None - must be specified. |
| `ReplaceWith`<br>**required** | The string to use for the replacement string in the output file.  See the examples in [Search and Replace Example Patterns](#search-and-replace-example-patterns). | None - must be specified. |
| `OutputFile`<br>**required** | The name of the output file.  Can be specified using `${Property}`. | None - must be specified. |
| `IfInputNotFound` | Indicate an action if the source file is not found:  `Ignore` (ignore the missing file and do not warn), `Warn` (generate a warning message), `Fail` (generate a failure message) | `Warn` |

### Search and Replace Example Patterns ###

The following table lists various combinations of `SearchFor` and `ReplaceWith` command parameter values.
The dollar sign has special meaning to the pattern matcher (end of line) and braces also have meaning.  Using `${ }` directly causes TSTool to try to replace with a property value.  Using backslashes in front of characters allows the string to pass through TSTool without being interpreted as a processor `${Property}` so that the pattern matcher can handle.

**<p style="text-align: center;">
Search and Replace Example Patterns
</p>**

| **`SearchFor`**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **`ReplaceWith`**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
| -- | -- | -- |
| `\r\n` | `\n` | Replace Windows end of line with Linux end of line. | 
| `\n` | `\r\n` | Replace Linux end of line Windows end of line with Linux end of line. | 
| `StationId` | `\$\{StationId}` | Replace the static string `StationId` with a property `${StationId}`. |
| `Some.*Text` | `SomeNewText` | The `*` typically cannot be used alone and therefore `.*` indicates "any character followed by one or more characters".  The example shows how intervening characters in the original string can be replaced with new text. |
| `SomeFile\..*\.ext` | `SomeFile\.ABC\.ext` | Similar to previous example except escape the period from interpretation by pattern matcher and treat literally, needed when handling filenames with extensions. |
| `\$\{StationId\}` | `1234` | Replace the string `${StationId}` with a literal string `1234`. |
| `\$\{StationId\}` | `${StationId}` | Replace the string `${StationId}` with the property value in `{StationId}`. |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/TextEdit).

## Troubleshooting ##

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`AppendFile`](../AppendFile/AppendFile.md) command
*   [`CopyFile`](../CopyFile/CopyFile.md) command
*   [`ReadPropertiesFromFile`](../ReadPropertiesFromFile/ReadPropertiesFromFile.md) command
*   [`RemoveFile`](../RemoveFile/RemoveFile.md) command
