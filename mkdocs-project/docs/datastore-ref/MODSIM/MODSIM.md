# TSTool / Datastore Reference / MODSIM #

* [Overview](#overview)
* [Standard Time Series Properties](#standard-time-series-properties)
* [Limitations](#limitations)

--------------------

## Overview ##

The [MODSIM model](http://modsim.engr.colostate.edu/) developed at Colorado State University
that is used for water allocation modeling.
MODSIM uses several time series formats for input and output.
The MODSIM input type for TSTool is the output file format, which normally
contains model output time series and an echo of input time series.
This file format is used with MODSIM version 7 output.
To generate version 7 output in MODSIM version 8,
check the output control option ***MODSIM / Output Control / Enable MODSIM Version 7*** Output (it is not enabled by default).

The example below shows the format of a MODSIM output file.  Important comments about the file format are:

* The file extension for MODSIM output time series files indicate the contents of the file.
Contents are specific to model feature types (nodes or links).
	+ The `FLO` file contains flow link information.
	+ The `RES` file contains reservoir information.
	+ The `DEM` file contains demand information.
	+ The `GW` file contains ground water information.
	+ The `ACC` file contains link account (storage) information.
* The first column in the file is either `LINK` or `NODE`, depending on the feature type.
* The node/link number is assigned automatically by MODSIM and should not be used externally because the order can change.
* The name corresponds to that shown in the graphical user interface, input, and output.
* A monthly data file has columns for `YEAR` and `MONTH`, which correspond to the model years
and therefore may be water years, calendar years, irrigation years, etc.
A daily data file has columns for `WEEK` and `DAY`.
Monthly and daily data have columns for `CALENDAR_YEAR`, `CALENDAR_MONTH`, `and CALENDAR_DATE`.
For monthly data, the `CALENDAR_DATE` may be the mid- (for flow data) or end-month (for storage data) position.
Five date columns will be present in any case.
* The seventh and greater columns contain time series data.
* Each node/link is listed for the first model year’s data.
This pattern is repeated for each model year.
Therefore, it is necessary to scan the entire file to read the full period for any time series.

```
"LINK", "NAME", "YEAR", "MONTH", "CALENDAR_YEAR", "CALENDAR_MONTH", "CALENDAR_DATE", "FLOW", "LOSS", "NATFLOW"
1, "", 1990, 1, 1989, 11, 15, 3500, 0, 3500
1, "", 1990, 2, 1989, 12, 15, 0, 0, 0
1, "", 1990, 3, 1990, 1, 15, 0, 0, 0
1, "", 1990, 4, 1990, 2, 14, 0, 0, 0
1, "", 1990, 5, 1990, 3, 15, 0, 0, 0
1, "", 1990, 6, 1990, 4, 15, 0, 0, 0
1, "", 1990, 7, 1990, 5, 15, 0, 0, 0
1, "", 1990, 8, 1990, 6, 15, 0, 0, 0
1, "", 1990, 9, 1990, 7, 15, 0, 0, 0
1, "", 1990, 10, 1990, 8, 15, 0, 0, 0
1, "", 1990, 11, 1990, 9, 15, 0, 0, 0
1, "", 1990, 12, 1990, 10, 15, 0, 0, 0
...
80, "HGLOVE", 1990, 1, 1989, 11, 15, 474, 0, 474
80, "HGLOVE", 1990, 2, 1989, 12, 15, 485, 0, 485
80, "HGLOVE", 1990, 3, 1990, 1, 15, 481, 0, 481
80, "HGLOVE", 1990, 4, 1990, 2, 14, 456, 0, 456
80, "HGLOVE", 1990, 5, 1990, 3, 15, 540, 0, 540
80, "HGLOVE", 1990, 6, 1990, 4, 15, 540, 0, 540
80, "HGLOVE", 1990, 7, 1990, 5, 15, 579, 0, 579
80, "HGLOVE", 1990, 8, 1990, 6, 15, 562, 0, 562
80, "HGLOVE", 1990, 9, 1990, 7, 15, 579, 0, 579
80, "HGLOVE", 1990, 10, 1990, 8, 15, 389, 0, 389
80, "HGLOVE", 1990, 11, 1990, 9, 15, 378, 0, 378
80, "HGLOVE", 1990, 12, 1990, 10, 15, 548, 0, 548
```

## Standard Time Series Properties ##

The standard time series identifier for MODSIM data files is of the form:

```
Location..DataType.Interval~MODSIM~PathToFile
```

MODSIM files contain limited information to assign to standard time series properties.  The following assignments are made:

* The location part of the identifier is assigned to the node/link name.
In cases where the name is an empty string (e.g., for internal nodes and links)
or cases where the node/link name contains a period, the name is assigned to `Node_#` or `Link_#`,
where `#` is the node/link number.
This identifier is used to uniquely identify locations but should not be used extensively
because node and link numbers can be changed in the MODSIM data set changes.
Using node/link identifiers without periods in a MODSIM data set will
avoid conflict with the standard time series identifier convention, which uses periods. 
* The source part of the identifier is left blank.
* The data type is taken from the column name.
* The data interval is determined from the file header.
If the header contains `WEEK`, it is assumed that the data are daily and the interval is set to `Day`.
Otherwise, monthly data are assumed.
* The units are not set.
* The missing data value is set to `–999`.
* The description is set to the location, a comma, followed by the data type.

## Limitations ##

MODSIM files have the following limitations:

* The files contain the full period of output for all time series, organized by model year.
It is somewhat inefficient to extract a single time series from the file.
* Some internal node/link names are set to blank and therefore it may be
difficult to associate the time series data with the model feature.
* Units are not indicated in the files.
* Time series properties like the description and data source are not available in the file.
