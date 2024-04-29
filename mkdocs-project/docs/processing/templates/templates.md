# TSTool / Processing / Templates #

This documentation provides information about processing templates.

*   [Introduction](#introduction)
*   [Commands](#commands)
*   [TSTool User Interface](#tstool-user-interface)
*   [Examples](#examples)

---------------------

## Introduction ##

TSTool can be used to automate processing using templates.
Templates are text files that contain placeholders (variables) that can be dynamically replaced.
Templates can include:

*   command files
*   time series product (graph) configurations
*   content such as HTML and Markdown

Example use cases include:

*   expand a command file using the template looping syntax,
    which uses [Freemarker](https://freemarker.apache.org/) - an alternate
    approach is to use the [`For`](../../command-ref/For/For.md) command to iterate
*   expanding a template time series product graph configuration file for specific time series
*   expand web page content given an in put list such as stations or time series

Template files are an advanced technique that can be used to implement advanced workflows.

## Commands ##

Template processing commands are found in the ***Commands / Template Processing*** menu.

The [`ExpandTemplateFile`](../../command-ref/ExpandTemplateFile/ExpandTemplateFile.md)
command is used to expand files containing FreeMarker syntax.

## TSTool User Interface ##

The ***Results / Output Files*** tab lists output files that are created when processing commands,
such as files expanded from templates.
Click on an output file to view.

## Examples ##

See the ***Examples*** section of command documentation.
