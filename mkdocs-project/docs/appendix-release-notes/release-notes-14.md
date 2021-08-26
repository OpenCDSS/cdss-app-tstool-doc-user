# TSTool / Release Notes / Version 14 #

* [Known Limitations](#known-limitations)
* [Changes in Version 14.0.0](#changes-in-version-1400)
* [Release notes for all versions](release-notes.md)

----------

## Known Limitations

* ![limitation](limitation.png) [14.0.0] Features that were previously available for reading and writing HEC-DSS files are disabled.
Additional resources are needed to update the software to use 64-bit libraries for HEC-DSS.

## Changes in Version 14.0.0 ##

**This is the first 64-bit Java release.**

* ![change](change.png) [14.00.0] This is the first 64-bit release with new major version number 14:
	+ Installing version 14 will automatically copy a user's `.tstool` configuration files
	for previous version to this version.
	+ The HEC-DSS features are disabled.
	Additional resources are needed to update the software to use 64-bit libraries for HEC-DSS.
	+ This 64-bit version is constrained only by available memory on the computer
	and can be configured to use more memory for large datasets, if necessary.
	This is an improvement over the 32-bit version, which was constrained to
	approximately 1.2 GB of memory use.
