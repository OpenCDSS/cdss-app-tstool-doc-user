# TSTool / Release Notes / Version 15 #

Release notes for specific versions are listed below.
See also the [GitHub repository issues](https://github.com/OpenCDSS/cdss-app-tstool-main/issues)
for outstanding issues and enhancement requests.
Issues may also be included in other repositories that are TSTool components.

*   [Changes in Version 15.0.0](#changes-in-version-1500)
*   [Release notes for all versions](release-notes.md)

----------

## Changes in Version 15.0.0 ##

**Major release to update from Java 8 to Java 11.**

*   ![bug](bug.png) [15.0.0] Fix converting commands to/from comments to properly handle indentation.
*   ![change](change.png) [15.0.0] Update from Java 8 to Java 11:
    +   The Java Runtime Environment (JRE) shipped with the TSTool software is now Java 11.
    +   The developer documentation has been updated to describe the Java 11 development environment.
*   ![change](change.png) [15.0.0] Change the user interface:
    +   The command popup menus for ***Indent*** have been changed to ***Shift***.
*   ![new](new.png) [15.0.0] Add ***Tools / File Manager***:
    +   See the [Tools / File Manager](../tools/tools.md#file-manager) documentation.
    +   Lists temporary files, which will be deleted when a session is complete.
    +   Lists cached files, which can exist between sessions and have an expiration time.
    +   This is a preliminary implementation and future enhancements will utilize these features to improve performance.
*   ![new](new.png) [15.0.0] Add ***Tools / Plugin Manager***:
    +   See the [Tools / Plugin Manager](../tools/tools.md#plugin-manager) documentation.
    +   Lists which TSTool plugins are installed.
    +   A new default folder structure is being phased in for plugins
        to allow multiple plugin versions to be installed at the same time.
        Only the best compatible plugin version is loaded in a session.
    +   All plugins have been updated to use the new versioned folder convention.
*   ![new](new.png) [15.0.0] Add ***Tools / TSTool Installation Manager***:
    +   See the [Tools / TSTool Installation Manager](../tools/tools.md#tstool-installation-manager) documentation.
    +   Lists which versions of TSTool are installed.
*   ![new](new.png) [15.0.0] Add the `--version-date` command line parameter to
    print the date, used by the new TSTool installation manager.
