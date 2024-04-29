# TSTool / Processing / Ensembles #

This documentation provides information about time series ensemble processing.

*   [Introduction](#introduction)
*   [Commands](#commands)
*   [TSTool User Interface](#tstool-user-interface)
*   [Examples](#examples)

---------------------

## Introduction ##

TSTool can be used to automate processing ensembles of time series.
Time series in an ensemble are represented as individual time series
with the same time series identifier, but having a different sequence identifier,
for example the historical year representing a simulation input.
The ensemble also has a unique identifier, which is used in commands.

Example use cases include:

*   convert a historical time series into overlapping "traces" that form an ensemble
*   process an ensemble of model runs, for example representing different climate or hydrology scenarios
*   create a visualization of exceedence probabilities based on an ensemble

## Commands ##

Ensemble processing commands are found in the ***Commands / Ensemble Processing*** menu.

Many time series processing commands allow an ensemble of time series to be processed
by selecting the `TSList=EnsembleID` and `EnsembleID` command parameters.

Some commands such as [`ReadRiverWare`](../../command-ref/ReadRiverWare/ReadRiverWare.md)
support reading ensembles from input formats that can represent ensembles.

The [`CreateEnsembleFromOneTimeSeries`](../../command-ref/CreateEnsembleFromOneTimeSeries/CreateEnsembleFromOneTimeSeries.md)
command can be used to convert a historical time series into an ensemble for analysis and visualization,
for example to use with other commands that can process ensembles.

## TSTool User Interface ##

The ***Results / Ensembles*** tab lists time series ensembles that are created by running commands.
Right-click on an ensemble to graph.

## Examples ##

See the ***Examples*** section of command documentation.
