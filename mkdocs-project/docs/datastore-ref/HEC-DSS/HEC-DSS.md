# TSTool / Datastore Reference / HEC-DSS #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)

--------------

## Overview ##

HEC-DSS input type refers to the United States Army Corps of Engineers’
Hydrologic Engineering Center (HEC) Data Storage System (DSS).
Refer to the following web sites for more information:

* [HEC Main website](http://www.hec.usace.army.mil)

* [HEC software website](http://www.hec.usace.army.mil/software/)

## Standard Time Series Properties ##

HEC-DSS identifies time series using a “pathname” containing the following parts:

```
/Apart/Bpart/Cpart/Dpart/Epart/Fpart/
```

For example:

```
/APART1/BPART1/CPART1/01DEC1999/20MIN/FPART1/
/APART1/BPART1/CPART1/01DEC1999/6HOUR/FPART1/
/APART2/BPART2/CPART2/01JAN1999/1DAY/DAILY DATA/
/APART3/BPART3/CPART3/01JAN1990/1MON/MONTHLY DATA/
	/APART4/BPART4/CPART4/01JAN1900/1YEAR/YEARLY DATA/
/GREEN RIVER/WALNUT/STORAGE/01MAY1992/1HOUR/OBS/
```

The standard time series identifier used with TSTool and other software is of the form:

```
   [LocationType:]Location.DataSource.DataType.Interval.Scenario~InputType~PathToFile
```

The implementation of the identifier for HEC-DSS files is of the form:

```
Apart:Bpart.HEC-DSS.Cpart.Epart.Fpart~HEC-DSS~PathToFile
```

HEC-DSS time series identifier information is taken from the A-F “pathname parts”
used to identify HEC-DSS time series.  The following assignments are made:

* The location type part of the identifier is set to the A-part.
* The location identifier part of the identifier is set to the B-part.
This retains the original HEC-DSS location information.
**The colon and period characters cannot be used in the original HEC-DSS A- and B- parts
because they conflict with the identifier implementation described above.
Instead, it is recommended that dashes, underscores,
and other delimiting characters are used within the parts if the
HEC-DSS data will be used extensively with TSTool.**
* The data source part of the identifier by default is set to
HEC-DSS to indicate that “HEC-DSS” is the provider of the data.
In the future this could be used to store the data source (data provider) such as “USGS”, “NWS”, etc.,
if such information could be obtained from the HEC-DSS time series pathname or supplemental data.
* The data type is set to the C-part.  In HEC-DSS, this is referred to as the “parameter”.
 In HEC-DSS the term “type” is used to indicate whether a time series is instantaneous, mean, or accumulated.
**The period character cannot be used in the original HEC-DSS C-part when used with TSTool.**
* The data interval is set to the E-part.
**The period character cannot be used in the original HEC-DSS E-part when used with TSTool.
Currently the irregular interval is not supported, but will be added in the future.**
* The scenario is set to the F-part.
**The period character cannot be used in the original HEC-DSS E-part when used with TSTool.**
* The data units are determined from time series information.
* The D-part is initially used to assign the time series period,
but is reset with information from the time series data records, if available.
The D-part dates are of the form `DDMonYYYY` or `DDMMYYYY` – `DDMonYYYY`.
A single date indicates the start of a data block in the HEC-DSS data management scheme
(see the HEC-DSS documentation referenced above).
Two dates indicates the starting and ending data blocks for a condensed catalog (list of time series);
however, in this case the ending date is actually the start of the last data block.
The size of each data block depends on the time series interval (e.g.,
year interval data are stored in blocks of centuries).
The HEC-DSS standards for block size are used in conjunction with the time series interval to set the time series end date as appropriate.
* The missing data value is assigned to the internal representation for HEC-DSS files (a large negative number).
* The description is by default set to the location, a comma, followed by the data type.

## Limitations ##

The following limitations are known with the HEC-DSS input type:

* A- and B- parts that include colons will cause an error when
converting HEC-DSS identifiers to/from the convention described
above – avoid using colons in the A- and B- parts.
* A-, B-, C-, E-, and F- parts that include periods will cause an error when converting
to/from HEC-DSS identifiers to the convention described above – avoid using colons in the location identifier.
If encountered, the alias for the time series is set to the full identifier with periods.
The periods are then removed before setting the full identifier.
* Irregular data are not fully implemented but are supported by the software architecture – they will be enabled in the future.
* Paired data are not currently read – the data are envisioned to be read into the table objects supported by TSTool.
* Access to supplemental data such as station comments is not implemented but is supported by the software architecture.
* Data units from HEC-DSS time series are read and used with the time series.
However, conversion between units may not be supported if the units are not
included in the data units file used by software.
Additional data unit definitions can be added if necessary to facilitate conversions.
* HEC-DSS can store the observation date/time for data to a higher precision than the time series data interval.
For example, the observation date/time for an annual value may be July 30, 2400 of the year.
The additional precision is ignored when read.
An observation time at the end of an interval that might result in a different
base date/time (e.g., hour 2400 causing the day to increment for daily interval data),
is handled to prevent the rollover.
* Plotting capabilities do not recognize the data scale (instantaneous, mean, accumulated) – line
graphs are always drawn as if data were instantaneous.
This could be addressed by enhancing the software to utilize a data type file and
display styles to determine when data types are instantaneous, mean, or accumulated.
