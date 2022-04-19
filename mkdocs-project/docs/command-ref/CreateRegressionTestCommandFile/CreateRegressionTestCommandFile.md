# TSTool / Command / CreateRegressionTestCommandFile #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
    + [`@enabledif` Comment](#enabledif-comment)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `CreateRegressionTestCommandFile` command is used for software testing and validation of workflow processes.
The command creates a command file that includes a
[`StartRegressionTestResultsReport`](../StartRegressionTestResultsReport/StartRegressionTestResultsReport.md) command and multiple
[`RunCommands`](../RunCommands/RunCommands.md) commands,
each of which runs a test command file.
A starting search folder is provided and all files that match the given pattern (by convention `Test_*.TSTool` and `test-*.tstool`)
are assumed to be command files that can be run to test the software.
The resulting command file is a test suite comprised of all the individual tests and can be used
to verify software before release.

The goal is to have all tests pass before software is released and not retain broken tests in the test repository.
A passing test normally means that software is able to produce a result; however,
it may mean that software is unable to achieve a result,
and such a failure is expected and handled (see the `#@expectedStatus` annotation below).

The following table lists tags (annotations) that can be placed in `#` comments in command files to provide information for testing, for example:

```
#@expectedStatus Failure
```


**<p style="text-align: center;">
`#` Comment Annotations used by `CreateRegressionTestCommandFile` Command
</p>**

| **Comment Tag**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** |
|-----------------------|-----------------|
| `#@enabled False` | The `RunCommands` command will by default run the command file that is provided.  However, if the `@enabled False` tag is specified in a comment in the command file, `RunCommands` will skip the command file.  This is useful to disable a test that needs additional work. |
| `@enabledif ...` | Indicate requirements that must be met as a pre-condition in order to enable the command file. See the [`@enabledif` Comment](#enabledif-comment) discussion below. |
| `#@expectedStatus Failure`<br>`#@expectedStatus Warning` | The `RunCommands` command `ExpectedStatus` parameter is by default `Success`.  Using the comment in the original command file will result in a corresponding `RunCommands(ExpectedStatus=...)` parameter to indicate how to handle overall test status.  A status can be specified if it is expected that a command file will result in Warning or Failure and still be a successful test.  For example, if a command is obsolete and should generate a failure, the expected status can be specified as `Failure` and the test will pass.  Another example is to test that the software properly treats a missing file as a failure.  **In the future, the expected status from the command file being run by `RunCommands` may be detected without needing to use a `RunCommands(ExpectedStatus=...`) parameter.** |
| `#@order ...` | Control the order of command files, used to check dependencies (**under development**). | |
| `#@os Windows`<br>`#@os UNIX`<br>`#@os linux` | The test is designed to work only on the specified platform and will be included in the test suite only if the `IncludeOS` parameter includes the corresponding operating system (OS) type.  This is primarily used to test specific features of the OS and similar but separate test cases should be implemented for both OS types.  If the OS type is not specified as a tag in a command file, the test is always included (see also the handling of included test suites).  `UNIX` is equivalent to `linux` and can also be used for Apple computers.  **This may be replaced with `require` in the future.** |
| `@readOnly` |Indicates that the command file should not be edited.  TSTool will update old command syntax to current syntax when a command file is loaded.  However, this tag will cause the software to warn the user when saving the command file, so that the save can be canceled.|
| `@testSuite ABC` |Indicate that the command file should be considered part of the specified test suite, as specified with the `IncludeTestSuite` and `ExcludeTestSuite` parameters.  The test is included in all test collections if the tag is not specified; therefore, for general tests, do not specify a test suite.  This tag is useful if a group of tests require special setup, for example connecting to a database.  The suite names should be decided upon by the test developer.  An alternative approach is to use separate folders to store test command files and then process each folder as a suite. |

### `@enabledif` Comment

The `@require` annotation was previously used to indicate when a test could not be run due to dependency issues.
However, this approach is no longer recommended for testing and instead the `@enabledif` annotation has been implemented for testing.
The `@require` annotation should be used in production workflows to ensure that requirements are met and will indicate an error if requirements are not met.

One or more `@enabledif` comments can be used to check whether requirements are met and allow a test to be enabled in a test suite.
See the [`# Comment`](../Comment/Comment.md) documentation for full `@enabledif` syntax.
Datastores may implement their own check to handle the version syntax for the datastore.
For example, the [State of Colorado's HydroBase](../../datastore-ref/CO-HydroBase/CO-HydroBase.md) uses a version formatted as a date (`YYYYMMDD`).

This command evaluates `@enabledif` annotation requirements and ONLY includes the test in the test suite if requirements are met.
This allows, for example, multiple versions of tests to be created that each work with different database and TSTool software versions.
Otherwise, tests would be included when they should not and failed tests could be included that result in time wasted on troubleshooting.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**<p style="text-align: center;">
![CreateRegressionTestCommandFile](CreateRegressionTestCommandFile.png)
</p>**

**<p style="text-align: center;">
`CreateRegressionTestCommandFile` Command Editor (<a href="../CreateRegressionTestCommandFile.png">see also the full-size image</a>)
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
CreateRegressionTestCommandFile(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

| **Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `SearchFolder`<br>**required** | One or more folders to search for regression test command files, separated by commas.  All subfolders will also be searched.  Can use `${Property}`. The order of files for processing is as follows:<ol><li>Search folders are in the order specified in the parameter.</li><li>Matched files within a top-level search folder are sorted alphabetically.</li><li>The `#@order` annotations are evaluated and order adjusted accordingly (under development).</li></ol>| None - must be specified. |
| `OutputFile`<br>**required** | The name of the command file to create, enclosed in double quotes if the file contains spaces or other special characters.  A path relative to the command file containing this command can be specified.  Can specify using `${Property}`.| None - must be specified.|
| `SetupCommandFile` |  The name of a TSTool command file that supplies setup commands, and which will be prepended to output.  Use such a file to open database connections and set other global settings that apply to the entire test run.  Can specify using `${Property}`. | Do not include setup commands.|
| `TestResultsFile` | The `OutputFile` for the [`StartRegressionTestResultsReport`](../StartRegressionTestResultsReport/StartRegressionTestResultsReport.md) file containing test results.  The path will be relative to the `OutputFile` folder from this `CreateRegressionTestCommandFile` command. | `OutputFile` + `.out.txt` |
| `EndCommandFile` | The name of a TSTool command file that supplies end commands, and which will be appended to the output.  Use such a file to output the test results table to a delimited file or Excel.  See `TestResultsTableID`.  Can specify using `${Property}`. | Do not include end commands.|
| `FilenamePattern` | Pattern(s) to find TSTool command files, using `*` wildcards, separated by commas. | `Test_*.TSTool` and `test-*.tstool`, ignoring case. |
| `Append` | Indicate whether to append to the output file (`True`) or overwrite (`False`).  This allows multiple directory trees to be searched for tests, where the first command typically specifies `False` and additional commands specify `True`. | `True` |
| `IncludeTestSuite` |If `*`, all tests that match `FilenamePattern` and `IncludeOS` are included.  If a test suite is specified, only include tests that have `@testSuite` tag values that match a value in `IncludeTestSuite`.  One or more tags can be specified, separated by commas.| `*` - include all test suites.|
| `ExcludeTestSuite` | List of test suites, separated by commas, to exclude, after considering `IncludeTestSuite`.  Tests that have matching `@testSuite` tag values will be excluded. | Include all test suites.|
| `IncludeOS` |If `*`, all tests that match `FilenamePattern` and `IncludeTestSuite` are included.  If an OS is specified, only include tests that have `@os` tag values that match a value in `IncludeTestSuite`.  This tag is typically specified once or not at all. | `*` - include all test cases. |
| `UseOrder` | Indicate whether `@order` annotations should be processed to control the order of command files: `False` or `True`.  It may be simpler to create a command file that naturally sorts, for example place a setup command file in a folder starting with `0` that sorts before other test folders. | `True` |
| `TestResultsTableID` |The identifier of an output table to be created.  The table will be passed to the [`StartRegressionTestResultsReport`](../StartRegressionTestResultsReport/StartRegressionTestResultsReport.md) command. | No table will be output. |

## Examples ##

* See the [command files used to generate general tests](https://github.com/OpenCDSS/cdss-app-tstool-test/blob/master/test/test-suites/commands-general/create).

See the [Quality Control chapter](../../quality-control/quality-control.md) for how to set up a regression test.

An example of the output file from running the tests is:

```
# File generated by...
# program:      TSTool 10.20.00 (2013-04-10)
# user:         sam
# date:         Sat Apr 20 13:36:05 MDT 2013
# host:         AMAZON
# directory:    C:\Develop\TSTool_SourceBuild\TSTool\test\regression\TestSuites\commands_general\run
# command line: TSTool
#  -home test/operational/CDSS
#
# Command file regression test report from StartRegressionTestResultsReport() and RunCommands()
#
# Explanation of columns:
#
# Num:
#   Running count of the tests.
#   Use a text file without numbers to compare differences.
# Enabled:
#   Default is TRUE.
#   FALSE if "#@enabled False" anywhere in the command file.
#   FALSE if any "#@enabledif ..." criteria are not met for the command file.
# Run Time:
#    Run time in milliseconds.
#    Use table output to see this column.
# Test Pass/Fail:
#    The test status below may be PASS or FAIL (or blank if disabled).
#    A test will pass if the command file actual status matches the expected status.
#    Disabled tests are not run and do not count as PASS or FAIL.
#    Search for *FAIL* to find failed tests.
# Commands Expected Status:
#    Default is SUCCESS.
#    "#@expectedStatus Warning|Failure" comment in the command file overrides the default.
# Commands Actual Status:
#    The most severe status (Success|Warning|Failure) for each command file.
#
#    |       |Test  |Commands  |Commands   |
#    |       |Pass/ |Expected  |Actual     |
# Num|Enabled|Fail  |Status    |Status     |Command File
#----+-------+------+----------+-----------+----------------------------------------------------------------------------------------
    1| TRUE  | PASS |SUCCESS   |SUCCESS    |C:\Develop\TSTool_SourceBuild\TSTool\test\regression\commands\general\ARMA\Test_ARMA_Day.TSTool
    2| TRUE  | PASS |SUCCESS   |SUCCESS    |C:\Develop\TSTool_SourceBuild\TSTool\test\regression\commands\general\ARMA\Test_ARMA_Legacy.TSTool
    3| TRUE  | PASS |SUCCESS   |SUCCESS    |C:\Develop\TSTool_SourceBuild\TSTool\test\regression\commands\general\ARMA\Test_ARMA_Legacy_Ast.TSTool
    4| TRUE  | PASS |SUCCESS   |SUCCESS    |C:\Develop\TSTool_SourceBuild\TSTool\test\regression\commands\general\ARMA\Test_ARMA_Legacy…
...
#----+-------+------+----------+-----------+----------------------------------------------------------------------------------------
FAIL count     =     0,   0.000%
PASS count     =    17, 100.000%
Disabled count =     1
#--------------------------------
Total          =    18
```

## Troubleshooting ##

## See Also ##

* [`RunCommands`](../RunCommands/RunCommands.md) command
* [`StartRegressionTestResultsReport`](../StartRegressionTestResultsReport/StartRegressionTestResultsReport.md) command
* [`WriteCommandSummaryToFile`](../WriteCommandSummaryToFile/WriteCommandSummaryToFile.md) command
