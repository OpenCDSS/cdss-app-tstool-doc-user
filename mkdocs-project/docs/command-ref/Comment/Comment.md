# TSTool / Command / Comment `#` #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

Single-line comments start with `#`.
Spaces and tabs before the comment character are currently not allowed.
Comments cannot be added after commands - comments must exist on their own command line.
Commands can be converted to and from `#` comments by right-clicking on a command in TSTool
and selecting ***Convert selected commands to # comments*** and
***Convert selected commands from # comments*** from the popup menu.
See also the [`/*`](../CommentBlockStart/CommentBlockStart.md) and [`*/`](../CommentBlockEnd/CommentBlockEnd.md)
comment block commands, which are used to comment multiple commands.

The following table lists annotation tags that can be placed in comments to provide additional
information to software that processes the commands, using notation similar to the following:

```
#@expectedStatus Failure
```

Special comments can be added by editing the `#` comment block or use the ***Commmands / General - Comments*** menu.

**<p style="text-align: center;">
`#` Comment Command Annotation Tags
</p>**

|**Annotation Tag**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Command/Component That Uses**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|----------------|--------------------------|----------------- |
|`@enabled False`| TSTool command processor.| **Used in automated tests.** Used to disable a command file.  For example, use this annotation in a test command file when the test is not ready for use in the software release process.|
|`@expectedStatus Failure`<br>`@expectedStatus Warning`|[`RunCommands`](../RunCommands/RunCommands.md)| **Used in automated tests.** Used to help the test framework know if an error or warning is expected, in which case a passing test can occur even if the command status is not “success”.|
|`@fixme`|| Indicate something to fix, such as a bug in the command file logic.  A comment typically has the form `#@fixme user date Comment`, for example: `#@fixme smalers 2021-06-14 Need to fix the following input file`.|
|`@os Windows`<br>`@os UNIX`|[`CreateRegressionTestCommandFile`](../CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md)| **Used in automated tests.** Used to filter out test command files that are not appropriate for the operating system.  Linux is included in UNIX.|
|`@readOnly`| TSTool main interface and command editors| **Used to restrict command file editing.** Indicates that the command file should not be edited.  TSTool will update old command syntax to current syntax when a command file is loaded.  However, this tag will cause the software to warn the user when saving the command file, so that they can cancel.  This tag is often used with templates to protect the template from mistakenly being edited and saved in TSTool (TSTool does not currently allow editing templates within the interface).|
|`@require application TSTool >= NN.NN.NN` | Command processor | **Used to ensure compatibility.** Indicate that an application version (in this case for TSTool software) is required to run the command file.  The operator can be `>`, `>=`, `=`, `<`, or `<=`.  The version should be specified using [Semantic versioning](https://semver.org/), for example `13.03.00`. Each part of the version is checked numerically and leading zeros are ignored; therefore `03` evaluates to `3`. If specified for automated tests, a test will only be run if the criteria are met, which allows tests to be developed for specific versions of the software.  If the criteria are not met during normal runs, an error is generated. Use multiple `@require` comments if necessary for multiple criteria checks. |
|`@require datastore HydroBase >= YYYYMMDD` | Command processor | **Used to ensure compatibility.** Indicate that a datastore version (in this case for datastore named `HydroBase`) is required to run the command file.  The operator can be `>`, `>=`, `=`, `<`, or `<=`. The version string must be consistent with what is expected for a datastore.  For example, HydroBase versions use the `YYYYMMDD` syntax, whereas other datastores use semantic versions or other date strings. Refer to the datastore reference documentation for version format information.  Not all datastores support version checks. If specified for automated tests, the test will only be run if the criteria are met, which allows tests to be developed for specific versions of the software.  If the criteria are not met during normal runs, an error is generated. Use multiple `@require` comments if necessary for multiple criteria checks. |
|`@template`| TSTool main interface | **Used with template processing.** Indicates a template command file that is intended to be expanded with the [`ExpandTemplateFile`](../ExpandTemplateFile/ExpandTemplateFile.md) command.  Currently, a text file editor may need to be used to edit template files because the TSTool user interface checks commands for final syntax and may generate warnings for template files.| The command file is not a template. |
|`@testSuite ABC`|[`CreateRegressionTestCommandFile`](../CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md)| **Used in automated tests**. Used to filter out test command files that are not appropriate for the operating system. |
|`@todo`|| Indicate something to do, such as a future enhancement to the command file. A comment typically has the form `#@todo user date Comment`, for example: `#@todo smalers 2021-06-14 Need to fill the following time series`. |

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![Comment](Comment.png)
</p>**

**<p style="text-align: center;">
`#` Command Editor (<a href="../Comment.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
# A comment
# Another comment
```

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/regression/commands/general/Comment).

## Troubleshooting ##

## See Also ##

* [`/*`](../CommentBlockStart/CommentBlockStart.md) comment block start command
* [`*/`](../CommentBlockEnd/CommentBlockEnd.md) comment block end command
