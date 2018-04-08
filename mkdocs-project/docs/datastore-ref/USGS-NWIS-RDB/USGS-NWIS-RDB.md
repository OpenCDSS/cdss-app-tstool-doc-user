# TSTool / Datastore Reference / USGS-NWIS-RDB #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)

----

## Overview ##

The UsgsNwisRdb time series input type corresponds to the
United States Geological Survey (USGS) National Water Information System (NWIS) RDB format.
A number of RDB variations are available but currently only the surface
water daily format is supported.  Data files can be created by saving USGS NWIS
website data to a text file or use the TSTool [`WebGet`](../../command-ref/WebGet/WebGet) command.
The example below shows the format of a daily surface water file.
Important comments about the file format are:

* The file is divided into a header section (top) and data section (bottom).
Comments can occur only at the top and are lines that begin with #.
* Optional data flags are saved with the data values, if available (e.g., e indicates estimated data).
* HTML remnants may be present at the end of the file.  These lines are stripped out as the file is processed.

```
#
# U.S. Geological Survey
# National Water Information System
# Retrieved: 2002-01-28 13:35:25 EST
#
# This file contains published daily mean streamflow data.
#
# This information includes the following fields:
#
#  agency_cd   Agency Code
#  site_no     USGS station number
#  dv_dt       date of daily mean streamflow
#  dv_va       daily mean streamflow value, in cubic-feet per-second
#  dv_cd       daily mean streamflow value qualification code
#
# Sites in this file include:
#  USGS 03451500 FRENCH BROAD RIVER AT ASHEVILLE, NC
#
#
agency_cd	site_no	dv_dt	dv_va	dv_cd
5s	15s	10d	12n	3s
USGS	03451500	1895-10-01	740	
USGS	03451500	1895-10-02	740	
...
USGS	03451500	1985-01-20	1100	e
USGS	03451500	1985-01-21	1100	e
USGS	03451500	1985-01-22	1100	e
...
USGS	03451500	2000-09-28	675
USGS	03451500	2000-09-29	597
USGS	03451500	2000-09-30	550
 <font face="Arial" size=2>
<p>Microsoft VBScript runtime </font> <font face="Arial" size=2>error '800a01a8'</font>
<p>
<font face="Arial" size=2>Object required: 'db'</font>
<p>
<font face="Arial" size=2>/ctp_workgroup/cgi-bin/includes/Inc_htm_utils.asp</font>
<font face="Arial" size=2>, line 217</font>  <font face="Arial" size=2>
<p>Microsoft VBScript runtime </font> <font face="Arial" size=2>error '800a01a8'</font>
<p><font face="Arial" size=2>Object
```
 
## Standard Time Series Properties ##

The standard time series identifier for USGS NWIS RDB time series is of the form:

```
Location.DataSource.DataType.Interval~UsgsNwisRdb~PathToFile
```

The limited support of this file format assumes the following:

* The location part of the time series identifier is taken from the second field (`site_no`) in the data records.
* The data source part of the time series identifier is taken from the first field (`agency_cd`) in the data records.
* The data type is assigned as Streamflow (interpretation of the verbose `dv_va` field in the header is not implemented).
* The data interval is assigned as 1Day (interpretation of the verbose `dv_va` field in the header is not implemented).
* The input type is set to `UsgsNwisRdb` (USGSNWIS was used in the past) indicating the format of input.
* The input name is set to the absolute or relative path to the file.
* The units are assigned as `CFS`.
* The missing data value is assigned to `-999.0` (gaps in data records will result in this value).
* The description is set to the information after the Sites in this file include: line.
It is assumed that only one time series per file is used.

## Limitations ##

USGS NWIS RDB files have the following limitations:

* Currently only the daily surface water format has been tested.  Additional support will be added in the future.
* Although data flags are read, no standard flag values are enforced
(the software user will need to know the meaning of the flags to use them properly).
