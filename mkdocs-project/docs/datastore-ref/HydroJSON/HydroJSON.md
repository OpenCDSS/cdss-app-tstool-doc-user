# TSTool / Datastore Reference / HydroJSON #

**This format is a prototype. It is unclear whether it will become a production standard.**

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)
* [Examples](#examples)

------------------

## Overview ##

The HydroJSON time series format is designed to facilitate exchange of time series data.
The file format specification and additional information are available on the following website:

[HydroJSON GitHub repository](https://github.com/gunnarleffler/hydroJSON)

Example HydroJSON can be found at:

[Example Army Corps site](http://www.nwd-wc.usace.army.mil/dd/common/web_service/webexec/getjson?query=[%22dwr%20flow%22]&backward=7d)

HydroJSON can be written by the TSTool [`WriteTimeSeriesToHydroJSON`](../../command-ref/WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON)
command but currently cannot be browsed within TSTool.  An overview of the format from the TSTool perspective is as follows:

* The file follows standard JSON conventions.
Nice formatting of the file is provided as an option by TSTool;
however, for web data exchange formatting is typically minimized to improve performance.
* JSON does not allow comments.  Refer to the specification to understand the data format.
* Many HydroJSON data properties in the specification do not directly translate to internal time series properties.
Therefore software must translate or omit some features.  For example, the TSTool
[`WriteTimeSeriesToHydroJSON`](../../command-ref/WriteTimeSeriesToHydroJSON/WriteTimeSeriesToHydroJSON)
command provides features to map internal time series data to the HydroJSON specification.
* The data are organized by stations first, and then time series within the stations.

## Standard Time Series Properties ##

This section is important when reading HydroJSON files.
Currently TSTool does not provide a `ReadTimeSeriesFromHydroJSON` command.
Additional detail will be added in the future.

The standard time series identifier for HydroJSON files is as follows:

```
Location.DataSource.DataType.Interval.Scenario~DateValue~PathToFile.
```

## Limitations ##

HydroJSON files have the following limitations:

* Need to understand the specification better in order to document limitations.
* Should the HydroJSON version number be included in the file?

## Examples ##

The following is an example file for day interval data.
Highlights indicate questions that need to be resolved in the TSTool implementation of the format.
The TSTool implementation attempted to follow the standard illustrated in the following link, but some things are not fully explained:

See [Example on GitHub](https://github.com/gunnarleffler/hydroJSON/blob/master/hydroJSON.json)
