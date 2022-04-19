# CDSS / TSTool #

This documentation provides resources to learn how to use
[Colorado's Decision Support Systems (CDSS)](https://cdss.colorado.gov/) TSTool software,
which automates processing time series, data tables, and other data.
This documentation is generally referred to as the **"User Documentation"** in contrast to
**"Developer Documentation"**, which is relevant to software developers.

* [How to Use this Documentation](#how-to-use-this-documentation)
* [Acknowledgements](#acknowledgements)
* [Colorado's Decision Support Systems](#colorados-decision-support-systems)
* [About the Open Water Foundation](#about-the-open-water-foundation)
* [License](#license)
* [Source Repository on GitHub](#source-repository-on-github)
* [Release Notes](appendix-release-notes/release-notes-14.md) - **this documentation is for TSTool version 14.3.0**

----------------

## How to Use this Documentation ##

The documentation is organized in order of information and tasks necessary to install and use the TSTool software.
Chapters (web pages) are provided for major topics related to software use and application.
References are provided for TSTool [commands](command-ref/overview.md) and [datastores](datastore-ref/overview.md).
Training modules are also provided in the [Training](training/overview.md) section.

Use the navigation menu provided on the left side of the page to navigate the documentation sections within the full document.
Use the navigation menu provided on the right side of the page to navigate the documentation sections with a page.
The navigation menus may not be displayed if the web browser window is narrow or if viewing on a mobile device,
in which case look for a menu icon to access the menus.
Use the search feature to find documentation matching the search words.

## Acknowledgements

TSTool has been developed by the Open Water Foundation (OWF) with significant
funding provided by the Colorado Water Conservation Board (CWCB)
in coordination with the Division of Water Resources (DWR),
as part of Colorado’s Decision Support Systems (CDSS).

Additional enhancement to TSTool have been funded by various organizations including:

* Open Water Foundation
* US Bureau of Reclamation
* Tennessee Valley Authority
* and others

TSTool software users are encouraged to provide feedback using the
[GitHub Issues page](https://github.com/OpenCDSS/cdss-app-tstool-main/issues).

### Software Components

The following components are used in TSTool and require or request attribution:

* [Material Theme icons](https://material.io/icons/) - these icons are used in documentation
* More information will be added here as the open source license is finalized.

## Colorado's Decision Support Systems ##

Colorado's Decision Support Systems (CDSS, [https://cdss.colorado.gov/](https://cdss.colorado.gov/))
has been developed to answer important questions about Colorado's water resources.
CDSS efforts are led by the [Colorado Water Conservation Board (CWCB)](http://cwcb.state.co.us)
and [Colorado Division of Water Resources (DWR)](http://water.state.co.us).

![CDSS Website](index-images/CDSS-website.png)

CDSS has been under development since 1994, with progress occurring via a series of basin
decision support systems (DSS), starting with the Colorado River DSS (CRDSS).
Other focused DSS were also developed, such as the CWCB's Instream Flow DSS.
Each DSS resulted in enhancements to the core CDSS tools,
which are envisioned as a general platform of data and tools to help with water supply planning.

The TSTool software was originally developed in CDSS to process time series and other data
from Colorado's HydroBase database into into water resources model data files.
Since the initial development, TSTool has been significantly enhanced to use additional data sources,
add commands with new functionality, and add new functionality to facilitate interactive
and automated data processing.

In late 2016, the Open Water Foundation began the effort to move TSTool and other CDSS software to open source licensing
and establish open source software projects, referred to as "OpenCDSS".
The OpenCDSS project is resulting in a significant evolution in how CDSS software development occurs,
such as implementing version control with Git/GitHub and modernizing the development environment and documentation.
See the [OpenCDSS Website](http://opencdss.state.co.us/opencdss/) for more information.

## About the Open Water Foundation ##

The [Open Water Foundation](http://openwaterfoundation.org) is a nonprofit social enterprise that focuses
on developing and supporting open source software for water resources,
so that organizations can make better decisions about water.
OWF also works to advance open data tools and implementation.
OWF staff have been the primary TSTool developers on State of Colorado and other projects.

## License ##

This TSTool documentation is licensed using the
[Creative Commons Attribution International 4.0 (CC BY 4.0) license](https://creativecommons.org/licenses/by/4.0/).

The TSTool software is licensed using the GPL 3 license (see the [TSTool software repository](https://github.com/OpenCDSS/cdss-app-tstool-main)).

## Source Repository on GitHub ##

The source files for this documentation are maintained in a GitHub repository:
[cdss-app-tstool-doc-user](https://github.com/OpenCDSS/cdss-app-tstool-doc-user).

This user documentation is maintained in a repository that is separate from TSTool code
in order to facilitate contributions by non-programmers.
