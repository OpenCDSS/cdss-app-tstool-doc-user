# TSTool / Datastore Reference / SHEF #

*   [Overview](#overview)
*   [Standard Time Series Properties](#standard-time-series-properties)
*   [Limitations](#limitations)

--------------

## Overview ##

SHEF (Standard Hydrologic Exchange Format) is a data exchange format commonly used by the
National Weather Service and other government agencies.
The format is typically used in real-time operations to transfer
data for many collection points and data types.
However, the format is also used to exchange time series data.

Refer to the Standard Hydrologic Exchange Format, Version 1.3.1 (or later),
Weather Service Hydrology Handbook No. 1., U.S. Department of Commerce,
National Oceanic and Atmospheric Administration, National Weather Service.

*   [SHEF Code Manual (July 5, 2012)](https://www.weather.gov/media/mdl/SHEF_CodeManual_5July2012.pdf)
*   [SHEF Code Manual (archive of July 5, 2012 version)](SHEF_CodeManual_5July2012.pdf)

## Standard Time Series Properties ##

Standard time series properties when reading or writing SHEF are handled as follows:

*   The SHEF parameter code physical element is used as is or can be mapped to a human-readable data type.
*   TSTool data interval (e.g., `1Day`) data is mapped to the SHEF parameter code duration.
    Because SHEF is designed for instantaneous data,
    the proper handling is to treat as irregular interval time series.

## Limitations ##

*   The TSTool software currently supports writing time series to SHEF .A format files on a limited basis.
    This functionality has received limited testing and is not completely integrated into TSTool as commands.
*   This documentation will be expanded as additional SHEF support is added.
