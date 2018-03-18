# Learn TSTool / Command / Comment Block Start `/*` #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `/*` command starts a multi-line comment block and is useful for inserting long comments or
temporarily commenting out blocks of commands.
See also the [`*/`](../CommentBlockEnd/CommentBlockEnd) and [`#`](../Comment/Comment) commands.
Commands between the `/*` and `*/` are not converted to comments but are skipped during processing.
See also the [`#`](../Comment/Comment) comment documentation for information about comment @ annotations.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.
<a href="../CommentBlockStart.png">See also the full-size image.</a>

![CommentBlockStart](CommentBlockStart.png)

**<p style="text-align: center;">
`/*` Command Editor
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
ACommand(...)
AnotherCommand(...)
/*
ACommentedCommand(...)
AnotherCommentedCommand(...)
*/
```

The commands between `/*` and `*/` lines will be recognized as commands but will not be run.

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/CommentBlock).

## Troubleshooting ##

## See Also ##

* [`#`](../Comment/Comment) comment command
* [`*/`](../CommentBlockEnd/CommentBlockEnd) comment block end command
