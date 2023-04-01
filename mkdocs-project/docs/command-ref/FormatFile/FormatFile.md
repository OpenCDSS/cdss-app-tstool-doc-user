# TSTool / Command / FormatFile #

*   [Overview](#overview)
*   [Command Editor](#command-editor)
*   [Command Syntax](#command-syntax)
*   [Examples](#examples)
*   [Troubleshooting](#troubleshooting)
*   [See Also](#See Also)

-------------------------

## Overview ##

The `FormatFile` command formats an input file to create a modified output file.
The input file should be created using previous commands.
Examples of use include:

*   add header and/or footer to the file because the original creator did not provide such functionality
*   wrap the file for output as HTML web page
*   wrap the file for output as CGI web server file

The wrapper content can be provided as separate "prepend" and "append" files or can be auto-generated based on
the type of input and output files.
The "prepend" and "append" files are automatically expanded to substitute processor properties
specified with `${Property}` notation.
For example, an input text file can be converted to CGI format by automatically adding the content type
at the top of the file.

## Command Editor ##

The command is available in the following TSTool menu:

*   ***Commands / General - File Handling***

The following dialog is used to edit the command and illustrates the syntax for the command.
If the `DiffProgram` property has been defined in the TSTool configuration file and input and output files exist,
the ***View Diff*** button will be enabled to display a visual difference.
The KDiff3 software is one option for a visual difference program.

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![FormatFile command editor](FormatFile.png)
</p>**

**<p style="text-align: center;">
`FormatFile` Command Editor (<a href="../FormatFile.png">see full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CompareFiles(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `InputFile`<br>**required** | The name of the input file to format.  Can be specified using `${Property}`. | None - must be specified. |
| `PrependFile` | The name of a file to prepend to the input file during formatting.  Can be specified using `${Property}`.  Properties in the file specified using `${Property}` notation will be replaced with processor properties.  The file will be ignored if `AutoFormat=True`. | |
| `AppendFile` | The name of a file to append to the input file during formatting.  Can be specified using `${Property}`.  Properties in the file specified using `${Property}` notation will be replaced with processor properties.  The file will be ignored if `AutoFormat=True`. | |
| `ContentType` | The content type of the input file, which generally indicates how to process the input:  <ul><li>`Csv` - comma separated value (typically a data file).</li><li>`Image` - an image file (e.g., `*.png`) - **not fully supported**</li><li>`Json` - JSON file (typically a data file)</li><li>`Text` - text file (e.g., a formatted report)</li></ul>. | `Text` |
| `AutoFormat` | If `True`, the `PrependFile` and `AppendFile` parameters are ignored and the input file is automatically formatted into the output file using default formatting. For example, this is useful for CGI formatting and basic HTML formatting. | `False` |
| `OutputType` | The output type, used to guide auto-formatting and whether to include the input file in output.  In some cases, the input file content is included in the output file and in other cases the output file may include a reference to the input file.  Output types are:<ul><li>`Cgi` - CGI file (content provide by a web server)</li><li>`Html` - HTML file (web page)</li><li>`Text` - text file</li></ul> | `Text` |
| `OutputFile`<br>**required** | The name of the output file, or `stdout` to output to standard output (e.g., for CGI). | None - must be specified. |

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/FormatFile).

## Troubleshooting ##

Not all combinations of parameters are fully supported, pending additional testing.
For example, it should be possible to encode an image file as CGI output, but this is not fully implemented.

See the main [TSTool Troubleshooting](../../troubleshooting/troubleshooting.md) documentation.

## See Also ##

*   [`WriteTableToHTML`](../WriteTableToHTML/WriteTableToHTML.md) command
