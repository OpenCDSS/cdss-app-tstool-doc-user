# Learn TSTool / Troubleshooting #

**Need to integrate "Chapter 8 Troubleshooting" from TSTool Word documentation.**

TSTool is a Java desktop application that uses many software components,
some of which are tightly integrated with TSTool software code,
and some of which are third-party components.
TSTool can call other software programs.
TSTool also interfaces with databases and web services that are implemented
in different technologies that are maintained at different locations (other computers).
Consequently, errors can occur in various software components.
The following are general suggestions for troubleshooting issues.
Specific troubleshooting guidance is also provided in the documentation for each command.

* [Background and Terminology](#background-and-terminology)
	+ [Automated Testing](#automated-testing)
	+ [Logging](#logging)
	+ [Severity Levels for Issues](#severity-levels-for-issues)
	+ ["Exceptions"](#exceptions)
* [Log File](#log-file)
* [Command Status/Log](#command-statuslog)
* [Specific Issues](#specific-issues)

------------------

## Background and Terminology ##

This section provides background on troubleshooting and related terminology.

Troubleshooting fundamentally boils down to investigation to determine the location and cause of
a problem, and then fixing the problem.
The person doing the troubleshooting will benefit from skills and experience with the technologies
that are involved and this is typically the first barrier to troubleshooting.
Problems can occur for many reasons, for example shown below,
listed in approximate order of typical investigation:

* user tries to use the software in an incorrect way
(user error, such as using wrong feature for a task)
* user provides incorrect input (input error)
* user has tried to do too much with the software (software limitation)
* user does not properly interpret or respond to a valid warning (user error)
* data access permission issue
* internet resource has an issue so can't get to data (service unavailable)
* software version incompatibility (computer or software issue)
* software has a logic problem (bug)
* something that has not been seen before (perhaps a combination of the above)

### Logging ###

Logging output is one of the fundamental tools to use in troubleshooting.

"Logging" means that "log messages" from software are output to help software users and developers
troubleshoot issues, typically to a "log file" or software window,
Most software components can log messages to one or more output forms.
Logging systems typically allow messages of different type (e.g., debug, status, warning, error, critical)
to be output.
Software will often use some type of run-time option or configuration file to control
how much logging output is generated.
The amount output by default will typically be small because generating log messages
slows down software and can create large log files.

Unfortunately, log messages may be written for technical people and even then may be
difficult to understand.  One goal of open source software projects such as TSTool is to improve logging messages
based on user feedback so the messages are as useful as possible.

See the [Log File](#log-file) section below for more information about using the TSTool log file.

### Severity Levels for Issues ###

Issues generated by software can have different severity levels.
Implementation of levels in different software can be a subject of great debate among software developers and users.
For example, is a problem an "error" or a "failure" or a "failure error"?
Too many levels leads to confusion and allows for too much interpretation.
Too few levels misses an opportunity to gracefully handle problems.
In TSTool, the following levels are used.
TSTool will try to run all commands, rather than stopping at the first issue.
This allows users to troubleshoot all the issues rather than fix one and then run again,
which can be very inefficient.

* **Warning** - an issue occurred that may have negative impacts,
but the software can generally continue with additional processing, for example:
	+ missing data in an analysis, which will impact the analysis
	+ missing file when a command is first edited - more checks are done at run time
* **Failure** - an issue occurred that likely has serious impacts on results and should be resolved,
	for example:
	+ critical input data are missing that prevent processing to occur
	+ critical input data are missing that will render output inaccurate

Either of the above cases should be investigated by users and resolved.
TSTool provides features to help users be aware of processing issues.
If any of those issues are due to software limitations,
they should be brought to the attention of the TSTool software maintainers,
for example via the GitHub issues. 

### "Exceptions" ###

Software programming languages handle errors in different ways.
This section focuses on background that will help users understand why they
see error messages presented as they are.

Most languages use an "exception" concept, as in:

```
try {
    some logic here
}
catch SomeExceptionType {
    some code to handle the exception
}
```

The "try" block wraps code that may generate an "exception" to normal conditions and the
"catch" block provides steps to deal with the exception.
Quite often, multiple try/catch blocks are nested within each other.

Languages define many types of standard exceptions, such as `FileNotFoundException`,
`InvalidParameterException`, `OutOfMemoryException` and `SecurityException`.
The specific exception types are used to let the software specifically handle
issues and give users more specific feedback on those issues.
Such handling can greatly increase the length and complexity of software.
However, without exception handling, software is much less robust.

Logging messages often present information about exceptions using the word "exception"
or show the specific exception type.
Exception messages also often are shown as an "exception stack", which
shows the list of code modules involved in an issue, from closest to the issue
to the start of the program.  This information is useful to software developers.

There are also different exception handling philosophies.
Some software may check for bad input before trying to use the input,
in which case more code is written on the front end.
Other software may have limited input checks and instead warn users when such
input causes an exception.
Both options are valid but result in different experience for users.
TSTool implements both approaches.
For examples, command parameters are checked for basic validity when a command is
edited in the user interface and when initial runtime processing occurs.
Common up-front checks include:

* Invalid number (such as negative when number should be greater than or equal to zero) or decimal number
when an integer is expected results in a failure (needs to be fixed).
* Missing input file may result in a warning during initial command setup (wait and see).

Common run-time checks include:

* Missing input file at runtime is often a failure (can't process data).
* Data read from a datastore has too much missing data to allow analysis (may or may not be OK).

Some TSTool commands also provide command parameters to allow users to control the level
of error handling.  For example, the [`RemoveFile`](comand-ref/RemoveFile/RemoveFile)
command provides the ability to ignore the case if the file to be removed does not exist.
The default behavior is often conservative (warn) and requires the user to make a decision.

### Automated Testing ###

One goal of software developers is to ensure that users are able to successfully
use software with as few issues as possible.
Software developers tend to dislike repetitive tasks and wasting time.
Therefore, automated testing is an important part of verifying that software is working as expected.
If a problem occurs, a software developer will often try running an existing test
or add a new test if no test exists for the issue.
Tests are often implemented at different levels, for example:

* unit tests - run small software code blocks, often used in a software development environment
* functional tests - run tests using functional software,
can be used in deployed and development environments
* system tests - run larger datasets to evaluate interaction of components,
can be used in deployed and development environments

For TSTool, thousands of functional tests have been developed to validate commands,
using a built-in testing framework.
These tests can be run by TSTool users and developers and serve as a starting point for troubleshooting,
for example to try a smaller example before testing a full dataset or more complicated process.

See the TSTool automated tests:

* [TSTool tests GitHub repository](https://github.com/OpenWaterFoundation/cdss-app-tstool-test)
* [Quality Control chapter of this documentation](quality-control) - explains how to use TSTool for testing

## Log File ##

TSTool currently uses custom logging features to create a log file that is helpful to troubleshoot issues.
In the future a standard Java logging library may be implemented, such as [SLF4J](https://www.slf4j.org/);
however, this will require rework of the existing code.

The log file records data processing actions in the sequence that they are performed.
The level of messages various depending on software component, software programmer decisions,
and run-time settings, such as the ***Tools / Diagnostics*** menu and
[`SetDebugLevel`](../command-ref/SetDebugLevel/SetDebugLevel) command.
Although log files may be helpful to software developers and technical users,
they can be difficult for others to understand.
The log file exists in the following locations and can be edited with a text file editor:

* User's home folder TSTool files, for example:
	+ Windows: `C:\Users\user\.tstool\log\tstool_user.log`
	+ Linux:  `/home/user/.tstool/log/tstool_user.log`
	+ Cygwin:  `/cygdrive/C/Users/user/.tstool/log/tstool.log` (different files from Windows)
	+ Git Bash (MinGW):  `/c/Users/user/.tstool/log/tstool.log` (same files as Windows)
* File specified by the TSTool [StartLog](../command-ref/StartLog/StartLog) command.
* Log file in software installation folder:
	+ Windows: `C:\CDSS\TSTool-version\logs\tstool_user.log`
	(this was used in older versions of TSTool and has been phased out because
	writing to the folder often requires administrator privileges)

The log file contains a sequential record of log messages for application startup followed by
output from interacting with the TSTool user interface and running the commands,
as shown in the following example.
The first part of the line indicates the message type, which can be one of the following,
shown in increasing severity and therefore decreasing frequency:  `Debug`, `Status`, `Warning`, `Error`.
In other words, one should expect very few and ideally no `Error` messages.
Any message of level `Warning` or `Error`
should be dealt with because they can lead to a proliferation of problems in later commands.
TSTool's built-in logging allows a numeric level within the above categories,
with the following general convention:

* `<= 0` - no message
* `1` - human-facing messages used in main interfaces such as graphical user interfaces
* `2` - important messages in the main application intended for the log file
* `3` - important messages in commands intended for the log file 
* `10` - intermediate level messages intended for the log file
* `100` - very detailed messages intended for the log file

Using a higher number can result in significantly more output and consequently larger log files.
To facilitate viewing log files, use the TSTool **Tools / Diagnostics... View Log File** menu.
The following is an example of a log file.

```txt
Status[1]: Opened log file "C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\commands\general\FillInterpolate\Results/Test_FillInterpolate_FillStart,FillEnd.TSTool.log".  Previous messages not in file.
#
# C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\commands\general\FillInterpolate\Results/Test_FillInterpolate_FillStart,FillEnd.TSTool.log - TSTool log file
#
# File generated by...
# program:      TSTool 12.00.00 (2017-04-24)
# user:         sam
# date:         Mon Apr 24 23:48:43 America/Denver 2017
# host:         colorado
# directory:    C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\TestSuites\commands_general\run
# command line: TSTool
#
Status[2]: <- Done processing command "StartLog(LogFile="Results/Test_FillInterpolate_FillStart,FillEnd.TSTool.log")" (2 of 9 commands, 4 ms runtime)
Status[2]: -> Start processing command 3 of 9: "RemoveFile(InputFile="Results/Test_FillInterpolate_FillStart,FillEnd_out.dv",IfNotFound=Ignore)"
Status[2](RemoveFile_Command.runCommand): Removed file "C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\commands\general\FillInterpolate\Results/Test_FillInterpolate_FillStart,FillEnd_out.dv".
Status[2]: <- Done processing command "RemoveFile(InputFile="Results/Test_FillInterpolate_FillStart,FillEnd_out.dv",IfNotFound=Ignore)" (3 of 9 commands, 1 ms runtime)
Status[2]: -> Start processing command 4 of 9: "NewPatternTimeSeries(Alias="ts1_day",NewTSID="ts1...Day",Description="test data 1",SetStart="2000-01-01",SetEnd="2003-05-13",PatternValues="1,2,3,2,1,-999,5,1,-999,-999,-999,1,3,5")"
Status[2](TSEngine.setTimeSeries): Setting time series "ts1...Day" at position 1 (internal [0])
Status[2]: <- Done processing command "NewPatternTimeSeries(Alias="ts1_day",NewTSID="ts1...Day",Description="test data 1",SetStart="2000-01-01",SetEnd="2003-05-13",PatternValues="1,2,3,2,1,-999,5,1,-999,-999,-999,1,3,5")" (4 of 9 commands, 0 ms runtime)
Status[2]: -> Start processing command 5 of 9: "FillInterpolate(TSList=AllMatchingTSID,TSID="ts1_day",MaxIntervals=0,FillStart="2002-01-15",FillEnd="2002-11-15",FillFlag="X")"
Status[2](FillInterpolate_Command.runCommand): Filling "ts1...Day" by interpolating.
Status[2]: <- Done processing command "FillInterpolate(TSList=AllMatchingTSID,TSID="ts1_day",MaxIntervals=0,FillStart="2002-01-15",FillEnd="2002-11-15",FillFlag="X")" (5 of 9 commands, 1 ms runtime)
Status[2]: -> Start processing command 6 of 9: "# Uncomment the following command to regenerate expected results."
Status[2]: -> Start processing command 7 of 9: "# WriteDateValue(OutputFile="ExpectedResults/Test_FillInterpolate_FillStart,FillEnd_out.dv")"
Status[2]: -> Start processing command 8 of 9: "WriteDateValue(OutputFile="Results/Test_FillInterpolate_FillStart,FillEnd_out.dv")"
Status[2](WriteDateValue_Command.runCommand): Writing DateValue file "C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\commands\general\FillInterpolate\Results/Test_FillInterpolate_FillStart,FillEnd_out.dv"
Status[2]: <- Done processing command "WriteDateValue(OutputFile="Results/Test_FillInterpolate_FillStart,FillEnd_out.dv")" (8 of 9 commands, 12 ms runtime)
Status[2]: -> Start processing command 9 of 9: "CompareFiles(InputFile1="ExpectedResults/Test_FillInterpolate_FillStart,FillEnd_out.dv",InputFile2="Results/Test_FillInterpolate_FillStart,FillEnd_out.dv",IfDifferent=Warn)"
Status[2](CompareFiles_Command.runCommand): There are 0 lines that are different, 0.00% (compared 1241 lines).
Status[2]: <- Done processing command "CompareFiles(InputFile1="ExpectedResults/Test_FillInterpolate_FillStart,FillEnd_out.dv",InputFile2="Results/Test_FillInterpolate_FillStart,FillEnd_out.dv",IfDifferent=Warn)" (9 of 9 commands, 10 ms runtime)
Status[1]: Retrieved 1 time series.
Status[1]: Processing took 28 ms, 0.0280 seconds
Status[2](RunCommands_Command.runCommand): ...done processing commands from file.
Status[2]: <- Done processing command "RunCommands(InputFile="..\..\..\commands\general\FillInterpolate\Test_FillInterpolate_FillStart,FillEnd.TSTool")" (419 of 1847 commands, 35 ms runtime)
Status[2]: -> Start processing command 420 of 1847: "RunCommands(InputFile="..\..\..\commands\general\FillInterpolate\Test_FillInterpolate_Legacy_Ast.TSTool")"
Status[2](RunCommands_Command.runCommand): Processing commands from file "C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\commands\general\FillInterpolate\Test_FillInterpolate_Legacy_Ast.TSTool" using command file runner.
Status[2](TSCommandProcessor.setInitialWorkingDir): Setting the initial working directory to "C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\commands\general\FillInterpolate"
Status[2](TSCommandProcessor.resetWorkflowProperties): Resetting workflow properties.
Status[2](TSEngine.processCommands): InitialWorkingDir=C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\commands\general\FillInterpolate
Status[2](TSEngine.processCommands): CreateOutput=null => true
Status[2](TSEngine.processCommands): Recursive=null => false
Status[2](TSEngine.processCommands): AppendResults=null => false
Status[1]: Processing 11 commands...
Status[2]: -> Start processing command 1 of 11: "#@readOnly"
Status[2]: -> Start processing command 2 of 11: "# Test filling all matching TSID because of *"
Status[2]: -> Start processing command 3 of 11: "StartLog(LogFile="Results/Test_FillInterpolate_Legacy_Ast.TSTool.log")"
Status[2](StartLog_Command.runCommand): Logfile full path is "C:\Users\sam\cdss-dev\TSTool\git-repos\cdss-app-tstool-test\test\regression\commands\general\FillInterpolate\Results/Test_FillInterpolate_Legacy_Ast.TSTool.log"
```

## Command Status/Log ##

The TSTool user interface displays command-specific warning messages,
which indicate problems that need to be resolved.
A command flagged with red X or yellow warning symbol can be reviewed to determine problems.

**Need to link to other documentation that discusses this.**

## Specific Issues ##

**Need to insert here troubleshooting information for specific issues as such issues are identified.**

See also the Troubleshooting section in each command's documentation,
which may provide more detailed information. 