# Learn GeoProcessor / Command / Comment `#` #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

Single-line comments start with `#`.
Spaces and tabs before the comment character is allowed.
Comments cannot be added after commands - comments must exist on their own command line.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
# A comment
# Another comment
     # An indented comment.
```

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/Comment).

## Troubleshooting ##

## See Also ##

* [CommentBlockStart - `/*`](../CommentBlockStart/CommentBlockStart) command
* [CommentBlockEnd - `*/`](../CommentBlockEnd/CommentBlockEnd) command
