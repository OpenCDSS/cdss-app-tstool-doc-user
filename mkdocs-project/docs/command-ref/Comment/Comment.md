# TSTool / Command / Comment `#` #

* [Overview](#overview)
    + [Annotations](#annotations)
    + [Best Practices](#best-practices)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

Single-line comments start with `#`, for example as shown below.
Single line comments have the advantage that each line is clearly a comment
and comment lines can be easily copied, moved, and deleted.

```
# This is one comment.
# This is another comment.
```

Spaces and tabs before the comment character are currently not allowed.
Comments cannot be added after commands (comments must exist on their own command line).
Commands can be converted to and from `#` comments by right-clicking on a command in TSTool
and selecting ***Convert selected commands to # comments*** and
***Convert selected commands from # comments*** from the popup menu.

See also the [`/*`](../CommentBlockStart/CommentBlockStart.md) and [`*/`](../CommentBlockEnd/CommentBlockEnd.md)
comment block commands, which are used to comment multiple commands, for example as shown below.
Block comments have the disadvantage that badly closed blocks can result in confusing errors
as software tries to interpret the input.
Block comments are useful for temporarily commenting out multiple commands, such as during troubleshooting a workflow.
The [`Exit`](../Exit/Exit.md) command can also be used to stop processing and skip commands
that follow the [`Exit`](../Exit/Exit.md) command.

```
/*
Comment line 1.
Comment line 2.
OneCommand()
AnotherCommand()
*/
```

### Annotations

Annotations are special comments that provide additional information to software.
Whereas commands execute some action, annotations provide additional information that can
be checked without depending on the results of commands.
Software can read annotations from comments,
perform checks before a command file is processed,
and provide diagnostic messages that ensure that a command file is OK to run.

Examples of annotation use include:

* indicate whether the command file is read-only
* indicate whether the command file is a template that requires expansion before processing
* indicate the expected status for a command file used in testing, which allows success and failure conditions to be handled
* indicate input requirements for the command file, such as software and datastore characteristics,
including version and configuration properties
* indicate whether a root/admin user is required to run the command file,
useful when testing system-level software on Linux

The following examples illustrate typical annotation syntax.
In some cases, annotations have no parameters and in other cases parameters may be optional or required.

```
#@readOnly
#@expectedStatus Failure
```

Annotation comments can be added by editing the `#` comment block or use the ***Commmands / General - Comments*** menu.
Annotations that are more complex, such as datastore requirements, must be edited with general
comment editor, referring to the datastore documentation to review annotation syntax.
Badly-formatted annotation comments may result in a warning or error for the comment.

The following table lists annotation tags that can be placed in comments to provide additional
information to software that processes the commands.

**<p style="text-align: center;">
`#` Comment Command Annotation Tags
</p>**

|**Annotation Tag**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Command/Component That Uses**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|----------------|--------------------------|----------------- |
|`@enabled False`| Command processor.| **Used in automated tests.** Used to disable a command file.  For example, use this annotation in a test command file when the test is not ready for use in the software release process.|
|`@enabledif ...` | Command processor. | **Used in automated tests.** This is a planned enhancement to help control which command files are included in testing in a specific environment.  The syntax may be similar to `@require`.  For example, only attempt to run a test if conditions are met, such as a datastore with an appropriate version being available. |
|`@expectedStatus Failure`<br>`@expectedStatus Warning`|[`RunCommands`](../RunCommands/RunCommands.md) command| **Used in automated tests.** Used to help the test framework know if an error or warning is expected, in which case a passing test can occur even if the command status is not “success”.  If the actual status from a command file (most severe status of all commands) does not match the expected status, the user interface will indicate a failure. |
|`@fixme ...`|| Indicate something to fix, such as a bug in the command file logic.  A comment typically has the form `#@fixme user date Comment`, for example: `#@fixme smalers 2021-06-14 Need to fix the following input file`. A future TSTool enhancement is planned to list such annotations. |
|`@os Windows`<br>`@os UNIX`|[`CreateRegressionTestCommandFile`](../CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md) command| **Used in automated tests.** Used to filter out test command files that are not appropriate for the operating system.  Linux is included in UNIX.  **May be replaced by `@require` in the future.**|
|`@readOnly`| TSTool main interface and command editors| **Used to restrict command file editing.** Indicates that the command file should not be edited.  TSTool will update old command syntax to current syntax when a command file is loaded.  However, this tag will cause the software to warn the user when saving the command file, so that they can cancel.  This tag is often used with templates to protect the template from mistakenly being edited and saved in TSTool (TSTool does not currently allow editing templates within the interface).|
|`@require application TSTool version >= NN.NN.NN` | Command processor | **Used to ensure compatibility.** Indicate that an application version (in this case for TSTool software) is required to run the command file.  The operator can be `>`, `>=`, `=`, `<`, or `<=`.  The version should be specified using [Semantic versioning](https://semver.org/), for example `13.03.00`. Each part of the version is checked numerically and leading zeros are ignored; therefore `03` evaluates to `3`. If specified for automated tests, a test will only be run if the criteria are met, which allows tests to be developed for specific versions of the software.  If the criteria are not met during normal runs, an error is generated. Use multiple `@require` comments if necessary for multiple criteria checks. |
|`@require datastore HydroBase version >= YYYYMMDD` | Command processor | **Used to ensure compatibility.** The syntax after the datastore name depends on the features implemented for a datastore (see the datastore's documenation).  Indicate that a datastore version (in this case for datastore named `HydroBase`) is required to run the command file.  The operator can be `>`, `>=`, `=`, `<`, or `<=`. The version string must be consistent with what is expected for a datastore.  For example, HydroBase versions use the `YYYYMMDD` syntax, whereas other datastores use semantic versions or other date strings. Refer to the datastore reference documentation for version format information.  Not all datastores support version checks. If specified for automated tests, the test will only be run if the criteria are met, which allows tests to be developed for specific versions of the software.  If the criteria are not met during normal runs, an error is generated. Use multiple `@require` comments if necessary for multiple criteria checks. |
|`@require user == name`<br>`@require user != name` | Command processor | **Used to ensure compatibility.** Indicate whether the command file is restricted to a certain user.  This has mainly been used to ensure that automated tests are run as the correct user.  Tests can be grouped by user using a test suite.  A user requirement that fails causes command processing to exit. For example: `@require user == root` |
|`@template`| TSTool main interface | **Used with template processing.** Indicates a template command file that is intended to be expanded with the [`ExpandTemplateFile`](../ExpandTemplateFile/ExpandTemplateFile.md) command.  Currently, a text file editor may need to be used to edit template files because the TSTool user interface checks commands for final syntax and may generate warnings for template files.| The command file is not a template. |
|`@testSuite ABC`|[`CreateRegressionTestCommandFile`](../CreateRegressionTestCommandFile/CreateRegressionTestCommandFile.md) command| **Used in automated tests**. Used to filter out test command files that are not appropriate for the operating system. |
|`@todo ...`|| Indicate something to do, such as a future enhancement to the command file. A comment typically has the form `#@todo user date Comment`, for example: `#@todo smalers 2021-06-14 Need to fill the following time series`. A future TSTool enhancement is planned to list such annotations. |

## Best Practices

Comments can be used to improve communication and maintainability, thereby reducing costs.

Because command files are text, they can be maintained in a version control system such as GitHub.
Version control systems allow comments to be inserted with each version that is committed.
However, such comments should not be totally relied upon to document the purpose or history of a command file.
Similar to other products, it may be appropriate to add author, and release notes or history to a command file.

Comments can also be used to indicate the main processing steps in a command file so that
it is easier to understand workflow logic.

The following example illustrates a few best practices that can be implemented using comments.

```
StartLog(...)
#
# This command file does something (explanation).
#
# Author: Person creating or maintaining the command file.
#
# History:
# 2022-02-04 Added best practices discussion.
# 2021-01-03 Added annotations examples.
#
# Requirements and other metadata:
# @require application TSTool version >= 1.2.3
# @require datastore SomeDatastore version >= 3.4.5
# @todo smalers 2022-02-04 Add more error checking.
#
# ==========================================================
# Step 1 - initialize properties
#
# Explanation of the step...
# ==========================================================
SetProperty(...)
SetProperty(...)
# ==========================================================
# Step 2 - read data
# ==========================================================
Read...
# ==========================================================
# Step 3 - perform analysis
# ==========================================================
Command...
Command...
#
# Step 3b - some step... 
```

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![Comment](Comment.png)
</p>**

**<p style="text-align: center;">
`#` Command Editor (<a href="../Comment.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows.
See also the [Annotations](#annotations) section above for annotation syntax.

```text
# A comment
# Another comment
```

## Examples ##

See the [automated tests](https://github.com/OpenCDSS/cdss-app-tstool-test/tree/master/test/commands/Comment).

## Troubleshooting ##

## See Also ##

* [`/*`](../CommentBlockStart/CommentBlockStart.md) comment block start command
* [`*/`](../CommentBlockEnd/CommentBlockEnd.md) comment block end command
