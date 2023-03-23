# TSTool / Datastore Reference / Delft Fews PI XML #

*   [Overview](#overview)
*   [Standard Time Series Properties](#standard-time-series-properties)
*   [Limitations](#limitations)

--------------

## Overview ##

The Delft FEWS public interface (PI) XML file format stores one or more time series
associated with the Delft FEWS hydrologic forecasting and warning software
(see: [Delft-FEWS Published Interface - PI documentation](https://publicwiki.deltares.nl/display/FEWSDOC/Delft-FEWS+Published+interface+-+PI)).
FEWS software is used by the National Weather Service (NWS) to produce deterministic
(forecast based on previous conditions) and ensemble forecasts (sequence of forecasts as discussed below).
The PI XML format can be used to store one or more time series, as well as ensembles of related time series.

This format is disabled by default in TSTool and must be enabled in the TSTool installation or user `TSTool.cfg` configuration file with:

```
[TSTool]

DelftFewsEnabled = true
```

The Ensemble Streamflow Prediction (ESP) system is that portion of the NWS system
that provides the capability of making long-range probabilistic
forecasts of streamflow and streamflow related variables.
ESP uses conceptual hydrologic/hydraulic models to forecast future
streamflow using the current soil moisture, river, and reservoir conditions,
with historical meteorological data as input.
The ESP procedure assumes that meteorological events that occurred in the past
are representative of events that may occur in the future.
Each year of historical meteorological data is assumed to be a possible
representation of the future and is used to simulate a streamflow trace.
ESP produces a probabilistic forecast for each streamflow variable and period of interest.
Although often applied to streamflow, the ESP approach and data format can be utilized for other time series data types.
Ensemble files may contain collections of input data or model-generated results.

The PI XML format is described on the following website (note that this documentation
may not match the current version of the XML schema referenced in the <TimeSeries> element of the XML).

*   [The Delft-FEWS Published Interface (PI)](https://publicwiki.deltares.nl/display/FEWSDOC/The+Delft-Fews+Published+interface+(PI))

*   [The Delff-FEWS Published Interface timeseries Format (PI) Import](https://publicwiki.deltares.nl/display/FEWSDOC/Delft-Fews+Published+Interface+timeseries+Format+%28PI%29+Import)

The following example illustrates the PI XML file (PI XML version is 1.9):

```
<?xml version="1.0" encoding="UTF-8"?>
<TimeSeries xmlns="http://www.wldelft.nl/fews/PI" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.wldelft.nl/fews/PI http://fews.wldelft.nl/schemas/version1.0/pi-schemas/pi_timeseries.xsd" version="1.9">
    <timeZone>0.0</timeZone>
    <series>
        <header>
            <type>instantaneous</type>
            <locationId>DKKC2</locationId>
            <parameterId>QINE INSTANTANEOUS</parameterId>
            <ensembleId>ESP</ensembleId>
            <ensembleMemberIndex>1949</ensembleMemberIndex>
            <timeStep unit="second" multiplier="21600"/>
            <startDate date="2016-01-04" time="18:00:00"/>
            <endDate date="2016-09-30" time="12:00:00"/>
            <forecastDate date="2016-01-04" time="12:00:00"/>
            <missVal>NaN</missVal>
            <stationName>DKKC2: DRAKE CO</stationName>
            <lat>40.43333435058594</lat>
            <lon>-105.33944702148438</lon>
            <x>-105.33944702148438</x>
            <y>40.43333435058594</y>
            <z>1880.615966796875</z>
            <units>CFS</units>
        </header>
        <event date="2016-01-04" time="18:00:00" value="9.60559" flag="2"/>
        <event date="2016-01-05" time="00:00:00" value="9.60559" flag="2"/>
        <event date="2016-01-05" time="06:00:00" value="9.358386" flag="2"/>
        <event date="2016-01-05" time="12:00:00" value="9.252442" flag="2"/>
        <event date="2016-01-05" time="18:00:00" value="9.252442" flag="2"/>
        <event date="2016-01-06" time="00:00:00" value="9.252442" flag="2"/>
        <event date="2016-01-06" time="06:00:00" value="9.252442" flag="2"/>
        <event date="2016-01-06" time="12:00:00" value="9.252442" flag="2"/>
        <event date="2016-01-06" time="18:00:00" value="9.252442" flag="2"/>
        <event date="2016-01-07" time="00:00:00" value="9.252442" flag="2"/>
        <event date="2016-01-07" time="06:00:00" value="9.252442" flag="2"/>
        … etc …
    </series>
    <series>
        … another time series…
    </series>
</TimeSeries>
```

## Standard Time Series Properties ##

TSTool does not currently recognize a TSID for the PI XML format because only the
[`ReadDelftFewsPiXml`](../../command-ref/ReadDelftFewsPiXml/ReadDelftFewsPiXml.md) command is implemented to read time series.
The time series identifier for PI XML as constructed by this command is:

```
LocationID.DataSource.DataType.Interval[Trace]~DelfFewsPiXml~PathToFile
```

where the following file elements are used for the above:

*   `LocationID` is specified by the `<locationId>` element value.
*   `DataSource` defaults to FEWS and can be overridden by the
    [`ReadDelftFewsPiXml`](../../command-ref/ReadDelftFewsPiXml/ReadDelftFewsPiXml.md) command `DataSource` parameter – it is
    for information only (may be able to use a `<qualifierId>` if conventions are standardized).
*   `DataType` defaults to the `<parameterId>` element value and can be overridden by the
    [`ReadDelftFewsPiXml`](../../command-ref/ReadDelftFewsPiXml/ReadDelftFewsPiXml.md) command `DataType` parameter,
    for example to specify `QINE` rather than the file value `QINE INSTANTANEOUS`.
    In order to implement full TSID support such that time series can be matched in the file, the override may not be allowed.
*   `Interval` is determined from the `<timeStep>` element value – seconds are converted to
    typical TSTool conventions (e.g., `unit=”second”` and `multiplier=”21600”` are converted to `6Hour`).
*   `[Trace]` is set to the `<ensembleMemberIndex>` element value – trace
    identifiers are only used when ensembles are detected in the file.

The following additional conventions are implemented:

*   All `<header>` child elements are set as properties on the time series,
    using an object type that is appropriate.
    In addition, some elements are used to set standard time series properties, as discussed below.
    The index property is set to the trace index 0+ and index1 is set to the trace index `1+`.
*   The `<ensembleId>` and `<ensembleMemberId>` elements if detected are used to process ensembles.
    All time series with the same `<ensembleId>` are assumed to be in the same ensemble.
*   The `<forecastDate>` element is treated as a simple property and has no effect on the output.
    In the future functionality may be enabled to start output at the forecast date.
*   The `<missingVal>` element is used to set the missing value in time series.
    Floating point numbers and NaN are handled.
    Strings are not handled for missing data but were not encountered in test examples.
*   The time series description is set to the `<stationName>` element value by
    default and can be overridden with command parameters.
*   The `<units>` element value is used to set the units on the time series.
*   The `<event>` date and time are assumed to indicate time of observation for
    instantaneous values and interval-ending time for accumulated or mean values.
*   Precision of date/time elements are set based on the `<timeStep>`.
    If date/time elements include more precision, that information is ignored.
*   Delft FEWS internal time zone is always GMT.
    The following describes how timezone is handled in the PI XML file:
    +   The `<timeZone>0.0</timeZone>` element means that there is no offset from GMT.
    +   The `<timeZone>2.0</timeZone>` element means that the date/times in the file are
        offset by two hours to represent local time (all times will have two hours added, for example GMT=12, local=14).

## Limitations ##

Delft FEWS PI XML files have the following limitations as implemented in TSTool:

*   Only `NHour` interval has been tested.  An error will result if the `<timeStep>`
    corresponds to minute, month, etc.  `<timeStep multipler=”nonequidistant”>` is treated as Irregular interval in TSTool.
*   Although an attempt was made to handle all PI XML elements,
    examples and documentation were limited in some cases and therefore the following are not fully supported
    +   `<TimeSeries><timezone>` is read but time zone is not assigned to the time series from the file – TSTool commands can provide the time zone
    +   `<qualifierId>` - handled as a single value, not list of values (last encountered will be used)
    +   `<series><properties>` are not read – this may be useful for indicating `DataSource`
    in the time series identifier, but documentation and examples were lacking
*   It is unclear how many time series and/or ensembles can be stored in one PI XML file.
    At the current time all time series will be processed but only the first ensemble in a file is available when read.
