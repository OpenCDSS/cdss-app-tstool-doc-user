# TSTool / Datastore Reference / NWSCard #

*   [Overview](#overview)
*   [Standard Time Series Properties](#standard-time-series-properties)
*   [Limitations](#limitations)

--------------

## Overview ##

**NWS Card format was used with the legacy National Weather Service River Forecat System (NWSRFS).
However, the NWS has migrated to newer technologies.
This documentation is retained for reference and may be removed in the future.**

The NWSCard time series file format (also referred to as NWS DATACARD) can be used to store 1 to 24 hour time series data for:

*   A single time series, referred to as the “NWS Card single time series” format.
*   One or more time series traces, as written by the ESPADP software, referred to as the “NWS Card trace” format.
    In this case, additional header information is included in the file and the remainder of
    the file contains a sequence of sections consistent with the single time series format.
    The initial header is used to allocate the memory for the time series,
    while the subsequent headers indicate historical trace years that are identified with a sequence number after reading.

The format has been developed by the National Weather Service and the single time
series format is often used with the NWSRFS (National Weather Service River Forecast System)
for historical data (e.g., for model calibration).
The examples below shows the format of the single time series and trace files.
Important comments about the file format are:

*   The file is divided into a header section (top) and data section (bottom).
    Comments can occur only at the top and are lines that begin with `$`.
    (For the trace file, comments can occur throughout the file, before each trace.)
    The `#` comments shown below are for illustration.
*   If possible, all header information should be included.
    Header information is displayed by applications like TSTool to allow selection of time series before the data section is read.
    Omitting station descriptions can lead to confusion when reviewing output.
*   The data units and dimension (e.g., `L3/T`) are NWS standards and help general applications
    like TSTool determine how to convert units and display data to appropriate precision.
*   Formatting information in the file was originally implemented to help FORTRAN software read the files.
    This information is key to interpreting the fixed-format data records.

The following example illustrates the format of an NWSCard single time series file.

```
#NWSCard
#
# This is an example of a typical National Weather Service (NWS) CARD format
# time series, which can be used for hourly data (1-24 hours).  This format
# is commonly used by the NWS.  The NWS Card file uses hours 1 to 24 whereas
# in-memory time series storage uses 0-23.  The translation of date/times
# from the CARD file to in-memory time series occurs as follows as the file
# is read (using a single 31-day month).  The inverse occurs when writing.
#
# Data     | CARD         | Time Series | CARD          | Time Series
# Interval | Start        | Start       | End           | End
# ---------|--------------|-------------|---------------|--------------------
# 6-Hour   | Day 1, Hr 6  | Day 1, Hr 6 | Day 31, Hr 24 | Mon 2, Day 1, Hr 0
# 24-Hour  | Day 1, Hr 24 | Day 2, Hr 0 | Day 31, Hr 24 | Mon 2, Day 1, Hr 0
#
# If, for example, a DateValue time series is read and then is written as a
# CARD file, then use a 1Day interval DateValue file and don't specify hour
# in the dates, OR, use an hourly file and specify hours in the date/times.
# Otherwise, the precision of the input data may not translate correctly.
#
# An example file is as follows and conforms to the following guidelines:
# * Only one time series per file.
# * The sequence number in data lines (field 3) has a maximum value of 9999.
# * Full months are included, with missing values as needed.
# * See the header below for more information.
# * Data are fixed format.
# * Comments in the file start with $ (these #-comments are for illustration
#   only)
# * Data lines are printed using the specified format.
# * Data lines have station, month, year (2 digit), count, data values.
#
$  IDENTIFIER=STATIONX       DESCRIPTION=RIVER Y BELOW Z
$  PERIOD OF RECORD=08/1978 THRU 11/1995
$  SYMBOL FOR MISSING DATA=-999.00   SYMBOL FOR ACCUMULATED DATA=-998.00
$  TYPE=SQIN   UNITS=CMS    DIMENSIONS=L3/T   DATA TIME INTERVAL= 6 HOURS
$  OUTPUT FORMAT=(3A4,2I2,I4,6F10.2)
DATACARD      SQIN L3/T CMS   6    26433
 8  1984 10   1984  6   F10.2
STATIONX     884   1     91.66     88.95     86.24     83.53     81.14     78.74
STATIONX     884   2     76.35     73.96     73.00     72.04     71.07     70.11
...
STATIONX     884  20    299.88    296.23    273.81    251.39    228.97    206.55
STATIONX     884  21    192.56    178.56    164.57    150.57
STATIONX     984   1    145.28    139.99    134.70    129.41    123.45    117.50
STATIONX     984   2    111.54    105.58    102.26     98.94     95.63     92.31
STATIONX     984   3    163.89    235.48    307.07    378.65   1032.13   1685.60
...
```

The following example illustrates the format of an NWSCard trace file.

```
$
$ OUTPUT FROM THE ESPADP TRACEFILE EXPORT COMMAND
$  VERSION 0.00
$  SEGID=TDAO3    TSID=TDAO3W    DTYPE=SQIN  IDT=24  UNITS=CFS
$  SIMFLAG=0  (CONDITIONAL SIMULATION)
$  CREATION TIME=04/20/2005 01:12:43.00
$  HISTORICAL RUN PERIOD= 4/18/2005 24 - 11/30/2005 24
$  NUMBER OF TRACES=44
$  MONTHS PER TRACE=0
$  INDIVIDUAL TRACE DATA FOLLOWS
$  -----------------------------
$
$  IDENTIFIER=TDAO3W   DESCRIPTION=ESP TRACE YEAR 1949
$  PERIOD OF RECORD =  4/1949 THRU 11/1949
$  SYMBOL FOR MISSING DATA = -999.00, SYMBOL FOR ACCUMULATED DATA = -998.00
$  TYPE=SQIN  UNITS=CFS  DIMENSIONS=L3/T  DATA TIME INTERVAL=24 HOURS
$  OUTPUT FORMAT=(A12,2I2,I4, 1F9.0)
$
DATACARD      SQIN L3/T CFS  24   TDAO3W      ESP TRACE YEAR 1949
 4  1949 11   1949  1   F9.0
TDAO3W       449   1     -999
TDAO3W       449   2     -999
TDAO3W       449   3     -999
TDAO3W       449   4     -999
TDAO3W       449   5     -999
TDAO3W       449   6     -999
TDAO3W       449   7     -999
TDAO3W       449   8     -999
… additional data records omitted…
TDAO3W      1149 242    99012
TDAO3W      1149 243   132273
TDAO3W      1149 244   141764
$
$  IDENTIFIER=TDAO3W   DESCRIPTION=ESP TRACE YEAR 1950
$  PERIOD OF RECORD =  4/1950 THRU 11/1950
$  SYMBOL FOR MISSING DATA = -999.00, SYMBOL FOR ACCUMULATED DATA = -998.00
$  TYPE=SQIN  UNITS=CFS  DIMENSIONS=L3/T  DATA TIME INTERVAL=24 HOURS
$  OUTPUT FORMAT=(A12,2I2,I4, 1F9.0)
$
DATACARD      SQIN L3/T CFS  24   TDAO3W      ESP TRACE YEAR 1950
 4  1950 11   1950  1    F9.0
TDAO3W       450 245     -999
TDAO3W       450 246     -999
TDAO3W       450 247     -999
TDAO3W       450 248     -999
TDAO3W       450 249     -999
TDAO3W       450 250     -999
TDAO3W       450 251     -999
TDAO3W       450 252     -999
TDAO3W       450 253     -999
TDAO3W       450 254     -999
TDAO3W       450 255     -999
TDAO3W       450 256     -999
TDAO3W       450 257     -999
TDAO3W       450 258     -999
TDAO3W       450 259     -999
TDAO3W       450 260     -999
TDAO3W       450 261     -999
TDAO3W       450 262   132719
TDAO3W       450 263   144539
...remainder of file omitted…
```

Note that the period indicated for each historical trace uses the historical period
(i.e., the historical period used to generate an ESP forecast trace in NWSRFS).
However, when reading the file for analysis or visualization,
the traces should be aligned using the `HISTORICAL RUN PERIOD` information in the main header.
The historical traces are treated as sequential data, regardless of the specific dates.
In particular, differences due to leap year are ignored.
Consequently, the sequence of values from the starting date in `HISTORICAL RUN PERIOD` is used to generate a trace.

## Standard Time Series Properties ##

The standard time series identifier for NWSCard single time series files is of the form:

```
Location..DataType.Interval~NWSCard~PathToFile
```

The standard time series identifier for NWS Card trace files is of the form:

```
Location..DataType.Interval[Year]~NWSCard~PathToFile
```

Most standard time series properties can be properly assigned from an NWSCard file:

*   The identifier is used for the location.
*   For the time series identifier, the data source is left blank.
*   The data type and interval are determined from the file header.
*   For trace files, the first year in the historical trace is used for the sequence number (`[Year]` in the above example).
*   `NWSCard` is used for the input type.
*   The filename is used for the input name.

## Limitations ##

NWSCard files have the following limitations:

*   Only hourly data can be saved.
    Daily data can be saved by treating as 24-hour values but can cause confusion due to the hour 24/0 conversion issue.
    For example, hour 24 of day N is automatically converted to hour 0 of day N + 1 when reading the file.
*   The identifier is used for the location part of the time series identifier and should not
    contain '.' characters because this conflicts with the time series identifier standards.
*   NWSCard data are often used with the NWSRFS.
    The NWSRFS uses Zulu (GMT) time to store data in its database.
    However, historical and real-time data are often viewed as local time.
    Additionally, systems may be defined where, although the data interval is 6 hour,
    the start of the computational day may be shifted so that it starts at 8 AM local time (or local standard time).
    All of these factors can complicate managing time series data.
    Unfortunately, the NWSCard file format does not support specifying a time zone.
    Therefore, the end-user must understand how the times in the file relate to the current use of the data.
*   Only one time series can be saved per file, unless the file contains traces.
    In other words, a card file is not suitable for storing multiple time series (e.g., time series at different locations).
*   Years within the body of the file are not 4-digit (the header does use 4-digit years).
    To increase processing speed and avoid converting to 4-digit values,
    years within the body of the file are ignored (the sequence is used to store data).
    Therefore, errors in the dates in the data section may result in data values being placed in the wrong dates in the result.
*   A record count is included in each record after the date.
    When writing large files, the record count should be limited to less than or equal to `9999` because of a 4-digit limit in the field.
*   Trace files have often been noted to contain formatting that is different from the documented NWSCard standard.
    Files may need to be edited to allow software to read the files.
