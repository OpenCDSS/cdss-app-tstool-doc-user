# TSTool / Release Notes / Version 14 #

* [Known Limitations](#known-limitations)
* [Changes in Version 14.0.0](#changes-in-version-1400)
* [Release notes for all versions](release-notes.md)

----------

## Known Limitations

* ![limitation](limitation.png) [14.0.0] Features that were previously available for reading and writing HEC-DSS files are disabled.
Additional resources are needed to update the software to use 64-bit libraries for HEC-DSS.

## Changes in Version 14.0.0 ##

**This is the first 64-bit Java release.  See also many new features that were added in the last 13.x releases.**

* ![change](change.png) [14.0.0] This is the first 64-bit release with new major version number 14:
	+ Installing version 14 will automatically copy a user's `.tstool` configuration files
	for previous version to this version.
	+ The HEC-DSS features are disabled.
	Additional resources are needed to update the software to use 64-bit libraries for HEC-DSS.
	+ This 64-bit version is constrained only by available memory on the computer
	and can be configured to use more memory for large datasets, if necessary.
	This is an improvement over the 32-bit version, which was constrained to
	approximately 1.2 GB of memory use.
* ![change](change.png) [14.0.0] Enhance the raster graph:
	+ Time series product file now accepts a `Data` property `SymbolTablePath`,
	which specifies the path to a symbol table,
	which describes the colors for the raster graph.
	If not specified, the raster graph uses deciles, after rounding the minimum and maximum values.
	+ The `Data` property `RasterGraphLegendPosition` has been added,
	and currently always defaults to `Right`.
	A color legend is always shown.
	+ An optional mouse tracker can be enabled in the graph window.
	+ Improved the mouse position information to include the symbol table range,
	consistent with the symbol table for colors.
	+ Improve the handling of colors.
	+ Attempting to zoom cased errors.  Zoom is now disabled.
* ![change](change.png) [14.0.0] Update the
[`CompareTimeSeries`](../command-ref/CompareTimeSeries/CompareTimeSeries.md) command:
	+ The `WarnIfDifferent` and `WarnIfSame` parameters have been changed to
	`IfDifferent` and `IfSame` to provide more flexibility, similar to other commands.
	+ The `CreateDiffTS` parameter has been updated to provide `IfDifferent` option,
	which will only create the difference time series for cases where a difference
	is detected.  This significantly reduces the number of output time series
	and increases processing speed.
	+ Add `DifferenceFile` parameter to indicate a file listing the difference counts
	for all time series.  The output was previously always saved in the log file,
	which led to large log files.
	+ Add `SummaryFile` parameter to indicate a file listing the summary of time series with
	differences.  Time series without differences are not included in the summary.
	The output was previously always saved in the log file.
* ![change](change.png) [14.0.0] Update the
[`ReadStateCUB`](../command-ref/ReadStateCUB/ReadStateCUB.md) command:
	+ Added the `OutputVersion` parameter to allow old binary files to be translated to
	latest format, necessary to minimize differences when testing.
