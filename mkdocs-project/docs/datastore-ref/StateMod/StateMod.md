# TSTool / Datastore Reference / StateMod #

The StateMod time series input type corresponds to the file format used by the State of Colorado's StateMod model.

*   [Overview](#overview)
*   [Standard Time Series Properties](#standard-time-series-properties)
*   [Limitations](#limitations)
*   [Water Right Files](#water-right-files)
*   [Text Output Files](#text-output-files)

------------

## Overview ##

The StateMod time series input type corresponds to the file format used by the State of Colorado's StateMod model, including:

*   standard daily, monthly, average monthly (referred to as annual in the StateMod documentation) time series file formats
*   water right input files that can be converted to cumulative decree time series
*   specific output (`*.x*`) text files, including the `*.xop` and `*.xpl` files

See also the [StateModB input type](../StateModB/StateModB.md),
which corresponds to StateMod binary output files and the StateCU input type,
which corresponds to the State of Colorado’s StateCU consumptive use model.

The following example illustrates the format of the three main standard time series file formats.
See the StateMod Documentation for a complete description of StateMod input files.
Important comments about the file format are:

*   The file is divided into a header section (top) and data section (bottom).
    Comments can occur only at the top and are lines that begin with `#`.
*   One or more time series can be stored in a file.
*   Consistency in the order and number of the stations is required for each year of data, within the file.
*   Other than comments, the file is fixed-format, compatible with Fortran applications.
    See the StateMod Documentation for field specifications.
*   The format is optimized to allow a full year of data to be read for the entire data set.
    Reading a time series for a single location for the full period requires reading through the entire file.
*   In addition to the required values, a total/average value is accepted as the far-right value on each data line.
    This value may be ignored by applications (it can be computed from the data values on the line if necessary).
*   The precision of data values may be controlled by software, resulting in more or fewer fractional digits.
    This may lead to round-off differences when comparing raw data values with the total/average in the optional end column.

```
# StateMod time series files can have 3 main forms (monthly, average monthly, daily) as
# described below.  The order of time series is important for
# some files (e.g., order of diversion time series should match order of
# diversion stations in .dds file); however, StateMod is being updated over
# time to remove this requirement).  Different StateMod input files have
# slight variations on the general format (e.g., the reservoir target file
# has two time series for each reservoir for minimum and maximum targets).
# Missing data are typically indicated by -999.
# The generic extension for StateMod time series files is .stm, although specific
# extensions are used in a StateMod data set.
#
# 1) This is an example of a StateMod monthly time series for water year data:
#
# Comments are lines at the top of the file starting with the
# character.
# The header may contain software-generated comments about the time series.
# The remainder of the file is fixed format, with the first non-comment
# line being a header with the following elements (i5,1x,i4,5x,i5,1x,i4,a5,a5):
#
# Beginning month (1=Jan)
# Beginning year (4-digit)
# Ending month
# Ending year
# Data units (AF/M, ACFT, CFS or ""), where rates are for diversions and
#   flow, and volume is for reservoir contents.  Units are not used for
#   dimensionless data (like weight or percent).
# Year type (CYR=calendar, WYR=water, IYR=irrigation)
#
# Data lines then follow with:
# Year Station 12-monthly-values year-total/average (i4, 1x, a12, 12f8, f10)
# The year value is optional and is generally not read as input but is
# computed for output.  The year in data lines corresponds to the calendar type.
# An example follows:
    10/1926  -      9/1998 ACFT  WYR
1927 08236000      1229.8   892.6   922.3   737.9   555.4   922.3  7049.4 32263.6 31000.1 14541.0  5662.9  8326.7  104104.0
1927 08235250      -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0       0.0
1927 08235700      -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0       0.0
1927 08236500      1047.3   595.1   614.9   614.9   555.4  1900.2  6769.7 31226.2 20338.8 14777.1  9465.3  4476.8   92381.5 ... 
#
# 2) This is an example of a StateMod average monthly time series for water year data:
#
# The average monthly time series is a pattern of twelve monthly values
# that are applied for each year in the period.
# The format is exactly the same as a monthly time series; however, the
# years in the header should be set to zero and year and month are ignored in data rows
# and can therefore be blank.
#
# An example follows:
    10/   0  -      9/   0 ACFT  WYR  
08236000      1229.8   892.6   922.3   737.9   555.4   922.3  7049.4 32263.6 31000.1 14541.0  5662.9  8326.7  104104.0
08235250      -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0       0.0
08235700      -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0  -999.0       0.0
08236500      1047.3   595.1   614.9   614.9   555.4  1900.2  6769.7 31226.2 20338.8 14777.1  9465.3  4476.8   92381.5 ... 
#
# 3) This is an example of a StateMod daily time series for water year data:
#
# The daily time series is similar to the monthly time series except that
# a year and month are included on the data lines and 28, 30, or 31 daily
# data values can occur on each line (end values ignored, depending on month).
# The data format is (i4, i4, 1x, a12, 31f8, f8).  The month total/average
# is optional and is generally read as input but is computed for output.
# Regardless of the calendar type in the header, the year and month in data records use
# calendar year (month 1 = January).
#
# An example follows:
    10/1926  -      9/1998 ACFT  WYR
1926  10 08236000     -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00    0.00      0.00 ...
1927   4 08236000       38.00   42.00   42.00   67.00   90.00   90.00  100.00  118.00   93.00   80.00   93.00   80.00   80.00   80.00   80.00   80.00   68.00   80.00   68.00   68.00   80.00   80.00  106.00  136.00  170.00  229.00  250.00  296.00  322.00  348.00    0.00    114.65
1927   4 08235250     -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00 -999.00    0.00      0.00 ...
```

## Standard Time Series Properties ##

The standard time series identifier for StateMod files is of the format:

```
Location...Interval~StateMod~PathToFile
```

StateMod files contain limited header information.  Time series properties are set using the following guidelines:

*   The location part of the time series identifier is taken from the identifier field in the
    data records (from the first year of data).  A change in the year indicates that all time series have been identified.
*   The data source part of the time series identifier is set to StateMod or blank.
    In the past this information was used to indicate the input type (file format) in the time series identifier;
    however, the new input type notation has a specific field for the input type and
    therefore data source can be used more appropriately.
    In the future, it may be possible to pass along the original input source but
    this information cannot currently be saved in the StateMod file format.
*   The data type is often not assigned because it is not defined in the file.
    Currently no interpretation of the file name extension occurs.
    Some specific applications (e.g., the StateMod GUI) may set the data type,
    based on reading a StateMod data set response file (and therefore knowing the specific contents of the file).
*   The data interval is assigned as Day or Month based on the file format (determined automatically).
*   The scenario is typically not assigned.  Older software may use the scenario to store the file name;
    however, the new time series identifier notation stores the file name as the input name field (see below).
*   The input type part of the time series identifier is set to StateMod, indicating the file format.
    Software will use the interval and/or examine the file contents to verify whether the data are in daily or monthly format.
*   The input name part of the time series identifier is set to the file name,
    either as the full path or a relative path to the working directory.
*   The units are assigned to those indicated in the file header.
*   The missing data value is assigned to `-999.0`.
*   The description is set to the same value as the location.
    A verbose description can typically be determined by cross-referencing the
    identifier with another StateMod data file (e.g., diversion stations).
*   The period is set based on the header information.

## Limitations ##

StateMod files have the following limitations:

*   The format of the does not facilitate extracting one time series from the file.
    Software has been optimized to perform this within current constraints.
*   Some time series properties are not explicitly included in StateMod files (e.g., data type).
    Therefore, general software like TSTool may not be able to provide default information.
    For example, a graph may show multiple time series with nearly the same
    legend text because more detailed information cannot be defaulted.
*   If two time series for the same station are stored in the same file (e.g.,
    reservoir maximum and minimum targets), there is no way to uniquely identify the two time series.
    The application or user must understand the file type and data organization.
    Some specific software (e.g., StateMod GUI) may be able to recognize the specific format.

## Water Right Files ##

StateMod water right input files can be converted to time series of cumulative decrees.
See the explanation in the in the [`ReadStateMod`](../../command-ref/ReadStateMod/ReadStateMod.md) command documentation.

## Text Output Files ##

StateMod text output files (`*.x*`) can be read by the [`ReadStateMod`](../../command-ref/ReadStateMod/ReadStateMod.md) command, with the following notes:

*   Identifiers that include period have the period replaced by underscore.
*   The file formats are different from the standard time series files and
    include additional metadata information.
    For example, information about each time series often is listed above the numerical tables of time series data.
    This information is saved as time series properties.

The `*.xpl` file has sections similar to the following where each “Plan ID” has a metadata
section and blocks of “Plan Uses” containing 12 months and a total for the year.

```
Plan Summary    ACFT
Plan Number    =     1
Plan Type      =    11 Accounting_Plan
Plan ID        = AgDSplit
Plan Name      = AgriculturalDitchSplit
Plan Source    = 0700502
River Location = AgDSplit

Use   1   ID = AgDitch.17   Admin # = 18415.00001   Name = Opr_AgDitchSplit-Accts     Opr Type =  46   Destination = CMAgPln        Status =  On
Use   2   ID = AgDitch.17   Admin # = 18415.00001   Name = Opr_AgDitchSplit-Accts     Opr Type =  46   Destination = CoorsAgPln     Status =  On
Use   3   ID = AgSpill.01   Admin # = 18415.00001   Name = Opr_AgDSplit-Spill         Opr Type =  29   Destination = NA             Status =  On

                                            Plan Uses
                                     Supply ______________________________________________________________________________________________...
Plan         River                    Total   Use 1   Use 2   Use 3   Use 4   Use 5   Use 6   ...
ID           ID           Year   Mo     N/A     (+)     (+)     (+)     (+)     (+)     (+)    ...
                                       ( 1)    ( 2)    ( 3)    ( 4)    ( 5)    ( 6)    ( 7)    ...
____________ ____________ ____ ____ _______ _______ _______ _______ _______ _______ _______ 
AgDSplit     AgDSplit     1979  NOV     0.0     0.0     0.0     0.0     0.0     0.0     0.0    ...
AgDSplit     AgDSplit     1979  DEC     0.0     0.0     0.0     0.0     0.0     0.0     0.0    ...
AgDSplit     AgDSplit     1980  JAN     0.0     0.0     0.0     0.0     0.0     0.0     0.0    ...
```

The file is handled as follows.  Plan metadata are used to form unique time series
identifiers that uniquely identify the time series and provide enough information
to be understood without referencing other data.
Each column in the output matching metadata results in a
time series and a total annual time series also is created.

*   The first month in the data section indicates the year type for the run and the
    year is always the calendar year (in the example above irrigation
    year 1980 is shown, which starts in NOV of 1979.
*   The location part of the time series is set to:
    +   Plan:Plan ID-Use:Use ID with periods replaced with underscores,
        for example `Plan:AgDSplit-Use:AgDitch_17`.
        (Need to evaluate if this and scenario part is OK.
        An alternative would be to include source and destination in the location).
    +   `Plan:Plan ID-Src:Src` ID, for example `Plan:ArvBDCRFs-Src:In_Priority`.
    +   If the detailed time series metadata are not parsed,
        then the Use ID or Src ID will be set to the column number
        (this is not desirable because it is inefficient for modelers and may result in lookup errors).
*   The data source part of the time series is set to StateMod.
*   The data type part of the time series is set to:
    +   If the detailed time series metadata are parsed: `PlanType-Description-OprType` (e.g., `11-AccountingPlan-46`)
    +   If the detailed time series metadata are not parsed or operating rule is < 0:  PlanType-Description (e.g., `11-AccountingPlan`)
*   The time series intervals for columns is Month, with Year being used for the
    annual total time series (year time series will be added if resources allow).
*   The scenario part of the time series is set to the plan source and
    destination information as appropriate (Need to evaluate if this and the location part is OK):    
    +   For plan type 1:  `Source:Plan Source-Source`, for example:  `Source:0700502-In_Priority`
    +   For plan types 3 and 4:  `Source:Plan Source`, for example:  `Source:0203910`
    +   For plan types 2, 8, 9, 10, 11 and 12:  `Source:Plan Source-Destination:Use Destination`, for example:  `Source:0700502-Destination:CMAgPln`
*   The time series description/name is set to:
    +   If the detailed time series metadata are parsed:  the Plan Name-Use Name is used, for example `AgriculturalDitchSplit-Opr_AgDitchSplit-Accts`.
    +   If the detailed time series metadata are not parsed:  the Plan Name is used, for example `AgriculturalDitchSplit`.
