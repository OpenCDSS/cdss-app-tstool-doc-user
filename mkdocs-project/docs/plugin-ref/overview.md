# TSTool / Plugin Reference / Overview #

*   [Introduction](#introduction)
*   [Plugin List](#plugin-list)
*   [Plugin Installation and Configuration](#plugin-installation-and-configuration)

-----

## Introduction ##

This reference section of the documentation provides information about plugins.

The core TSTool software provides general functionality and "built-in" features,
such as [commands](../command-ref/overview.md) and [datastores](../datastore-ref/overview.md).
A built-in feature generally meets the following criteria:

*   has been included in the core software for many years; therefore,
    it may be undesirable to change the software feature
*   is useful in Colorado, since TSTool was originally developed for the State of Colorado
    and continues to be maintained as part of [OpenCDSS](https://opencdss.state.co.us)
*   has general applicability, such as general-purpose commands and datastores for federal data sources
    that provide data for the entire United States

However, as TSTool features have been added over time, it has become clear that not all features can or should be
built into the core software product.
Doing so would result in an overwhelming number of menus and tools and only a subset of these features may be
of interest to the typical TSTool user.
Consequently, a "plugin" design has been implemented that allows features to be dynamically enabled based on
software that is installed in addition to the core software.
Plugins are suitable in the following cases:

*   plugin features are specific to a system,
    for example integrating with a specific database that is used by a relatively small number of users
*   plugin software is developed and maintained independent of the core TSTool software
*   plugin software has a large footprint such as many software files and dependencies
*   plugin features are experimental and MAY be incorporated into the core TSTool product at some point in the future

Plugins have technical challenges, which must be addressed by plugin developers
and will continue to be considered by core product developers:

*   documentation for plugins is separate from the core product documentation
*   plugin downloads must be hosted by third parties
*   there is currently no "plugin registry" or TSTool software feature to notify TSTool users about plugin updates
*   plugin support and maintenance is provided by third parties and may require funding to use the plugin
*   compatibility issues may arise as the core TSTool product is enhanced,
    which may limit plugin usability to certain TSTool versions

## Plugin List ##

The following plugins are known to have been developed.
Contact the appropriate entity for information about the plugins.
This list will be expanded over time.

**<p style="text-align: center;">
Available TSTool Plugins
</p>**

| **Plugin** | **Description** | **Contact** |
|--|--|--|
| [Amazon Web Services](https://software.openwaterfoundation.org/) | Commands to integrate with AWS. | [Open Water Foundation](mailto:steve.malers@openwaterfoundation.org?subject=TSTool AWS plugin) |
| [TriLynx Systems NovaStar](https://trilynx.systems/) | Datastores and commands to integrate with the TriLynx NovaStar system for environmental data and flood warning. | [TriLynx Systems](mailto:steve.malers@trilynx.systems?subject=TSTool NovaStar plugin) |
| [National Weather Service MADIS](https://trilynx.systems/) | Datastores and commands to integrate with the National Weather Service MADIS system (under development). | [TriLynx Systems](mailto:steve.malers@trilynx.systems?subject=TSTool NWS plugin) |
| [Kisters WISKI web services](https://software.openwaterfoundation.org/) | Datastores and commands to integrate with the Kisters WISKI system web services (under development). | [Open Water Foundation](mailto:steve.malers@openwaterfoundation.org?subject=TSTool Kisters WISKI plugin) |

## Plugin Installation and Configuration ##

The TSTool installation results in "installation files" and "user files".
The "installation files" are located in a shared location (typically `C:\CDSS\TSTool-version` on Windows) and the "user files"
are located in a user's files (e.g., `C:\Users\user\.tstool\NN`, where `NN` is the major version, for example `14`).

A `plugins` folder exists in the installation files and users files.
Plugin software that is available (see previous section) can be installed in these folders and TSTool will automatically detect and load,
resulting in one or more of the following being available:

*   datastore features being enabled,
    which can be accessed if a proper datastore configuration file is created in the `datastores` folder
*   commands being listed in the ***Commands(Plugin)*** menu

It is generally recommended to install plugins and corresponding datastore configuration files
in user files to allow for more flexibility and to avoid the need for administrator privileges.

Plugins generally consist of a Java `jar` file, which contains various software modules and files.
The providers of plugins will provide documentation that explains installation and datastore configuration.
Plugins can be installed once in user files and will be recognized for all TSTool versions within a common major version.

Plugin software are updated on a frequency that is independent of the core TSTool product,
although some coordinated releases may be required if the plugin integration requirements change.
In the future, a plugin manager tool may be added to the TSTool interface
to help with notification about available software updates.
