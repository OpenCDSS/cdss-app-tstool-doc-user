# Learn TSTool / Getting Started #

This page explains how to get started using TSTool.
It is assumed that the software has been installed as per the [Install TSTool](install) documentation.

**The original Word version of TSTool documentation "Chapter 3 Getting Started" needs to be integrated here.**

The following are basic tasks to use the TSTool:

* [Conceptualize a Workflow](#conceptualize-a-workflow)
* [Create a Command File](#create-a-command-file)
	+ [Best Practices for Command Files](#best-practices-for-command-files)
* [Run the Command File using TSTool](#run-the-command-file-using-tstool)
* [TSTool Program Options](#tstool-program-options)

---------------

## Conceptualize a Workflow ##

TSTool is fundamentally a tool for automating data processing workflows.
Therefore, to define a workflow, it is necessary to first define what work is to be done.
This effort should result in a conceptual workflow.
It is best to conceptualize the workflow without thinking about software limitations.
For example, the following workflow describes a common task:

1. Create a list of every stream gage in a basin
2. Read in a monthly streamflow volume time series for the gages
3. Analyze the data for statistics such as current year compare to mean
4. Generate graphs and tables with the results.

## Create a Command File ##

Once the conceptual workflow has been determined, corresponding TSTool
commands can be used to do the work by creating a "command file" that can be run by TSTool.
Refer to the [Command Reference](../command-ref/overview) to learn which
commands to use for specific work tasks.  For example, the following commands
are suitable to perform the above conceptual work tasks (documentation is being migrated from Word to this documentation):

1. `ReadTableFromExcel` - to read the list of stations
2. [`For`](http://learn.openwaterfoundation.org/cdss-app-tstool-doc-user/command-ref/For/For/) - to loop over the stations in the table
3. `ReadHydroBase` (to read monthly data directly) and ReadUsgsNwisDaily (will need to process daily data into monthly using `ChangeInterval` command)
4. `NewRunningStatisticTimeSeries` or `CalculateTimeSeriesStatistic` (creates a table)
5. `WriteTableToExcel` (output tabular form) and `ProcessTSProduct` (output graphs)

The command file is created using the TSTool graphical user interface.

**Need to integrate existing exmaples here.**

### Best Practices for Command Files ###

Best practices for command files are:

1. Document command files with sufficient comments.
2. Consider using version control, such as GitHub to track changes to command files.
3. Organize data files logically, for example, put data into a `data` folder.
4. Organize process files logically, for example, if multiple command files are used,
consider creating multiple folders, with numbers to cause the folders to sort in sequential order.
5. Use relative paths for file references, for example `data/somefile` and `../data/somefile`.
The command file folder will be set as the working folder (working directory) when the command file is read.
All other file locations should be specified relative to that folder.
This allows the files to be shared with others without having to change file paths.
6. Name TSTool command files with `.TSTool` or `.tstool` file extension.
7. Use the [`StartLog`](command-ref/StartLog/StartLog) command to troubleshoot.
This creates a local log file that is managed with command file and related files.
The command can be commented out if it significantly slows down processing or creates a large log file.

## Run the Command File Using TSTool ##

TSTool is typically run using the graphical user interface.

## TSTool Program Options ##

The TSTool program recognize the following command line parameters that control how the software runs:

**Need to insert the full list of command parmaeters.**

**<p style="text-align: center;">
TSTool Program Options
</p>**

| **Option**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
| `--commands command-file` | The command file to run. A path relative to current folder can specified or specify an absolute path. | Start the interactive command shell. |
