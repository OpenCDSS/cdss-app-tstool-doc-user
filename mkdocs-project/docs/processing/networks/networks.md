# TSTool / Network Processing #

This documentation provides information about network processing.

*   [Introduction](#introduction)
*   [Commands](#commands)
*   [TSTool User Interface](#tstool-user-interface)
*   [Examples](#examples)

---------------------

## Introduction ##

TSTool can be used to automate processing data associated with networks.
A network in TSTool is an upstream to downstream converging network represented by "nodes",
similar to stream networks that have confluence points and converging streams.
Each node has properties and a downstream node.

Example use cases include:

*   performing a point flow analysis for a network,
    which is a mass balance analysis of a system
*   using the network to select time series,
    for example to select precipitation or other water supply
    time series above a node in order to determine total upstream precipitation

A network can be constructed from a table, for example read from a spreadsheet or model file.

## Commands ##

Network processing commands are found in the ***Commands / Network Processing*** menu.

The [`CreateNetworkFromTable`](../../command-ref/CreateNetworkFromTable/CreateNetworkFromTable.md) command
can be used to construct a network from a simple table of node data.

The [`SelectTimeSeries`](../../command-ref/SelectTimeSeries/SelectTimeSeries.md) command
can be used to select time series based on association with network nodes,
and then the `TSList=SelectedTS` command parameter can be used in other commands to process all selected time series.

## TSTool User Interface ##

The ***Results / Networks*** tab lists networks created by processing commands.
Right-click on a network to view its properties.

## Examples ##

See the ***Examples*** section of command documentation.
