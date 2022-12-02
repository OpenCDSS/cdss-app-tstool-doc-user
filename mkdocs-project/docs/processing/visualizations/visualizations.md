# TSTool / Visualization Processing #

This documentation provides information about processing data visualizations.

*   [Introduction](#introduction)
*   [Commands](#commands)
*   [TSTool User Interface](#tstool-user-interface)
*   [Examples](#examples)

---------------------

## Introduction ##

The TSTool user interface can visualize data interactively and with automated processing.

Example use cases include:

*   automate creating graph image files
*   automate creating raster graph files (heatmaps)
*   create views of time series grouped by location

## Commands ##

Visualization processing commands are found in the ***Commands / Visualization Processing*** menu.

The [`ProcessTSProduct`](../../command-ref/ProcessTSProduct/ProcessTSProduct.md) command
automates creating graph image files
using configuration information from time series graph ***Save*** button.

The [`ProcessRasterGraph`](../../command-ref/ProcessRasterGraph/ProcessRasterGraph.md) command
automates creating raster graph image files.

The [`NewTreeView`](../../command-ref/NewTreeView/NewTreeView.md) command creates a
tree view that organizes time series for viewing,
for example to group or show in geographic order rather than processing order or sorted by identifier.

The [TSView Time Series Viewing Tools](../../appendix-tsview/tsview.md) appendix
describes configuration files for graphs.

## TSTool User Interface ##

The ***Results / Time Series*** tab lists time series that are created when processing commands.
Right-click on a time series to visualize the time series.

The ***Results / Views*** tab lists views created by the
The [`NewTreeView`](../../command-ref/NewTreeView/NewTreeView.md) command,
which provides a way to select time series for viewing.

## Examples ##

See the ***Examples*** section of command documentation.
