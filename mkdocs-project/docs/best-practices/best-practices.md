# TSTool / Best Practices

*   [Overview](#overview)
*   [Time Series Identifiers](#time-series-identifiers)

-----------

## Overview ##

This documentation describes best practices when using TSTool.

## Time Series Identifiers ##

The main function of TSTool is to process time series and other data:

1.  Read data.
2.  Process/manipulate data.
3.  Write data. 

Each time series being processed is assigned a unique identifier (time series ID or TSID)
and commands that process time series
typically have a `TSList` and/or `TSID` parameter (or variations if multiple time series are processed).
The `TSID` is the means by which a command communicates with the TSTool processor to retrieve a time series to manipulate.

Because the TSID can be long and cumbersome, TSTool also allows an alias to be assigned to time series.

### Time Series Identifier Requirements ###

*  **need to link to other documentation**

### Recommended TSID Convention ###

**need to link to other documentation**

### Examples ###

**need to complete**
