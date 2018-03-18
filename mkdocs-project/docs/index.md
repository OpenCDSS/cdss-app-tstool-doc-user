# CDSS / Learn TSTool #

This documentation provides resources to learn how to use
Colorado's Decision Support Systems (CDSS) TSTool software,
which automates processing of time series, tabular, and other data.

**The TSTool documentation has in the past been maintained in Microsoft Word and PDF
but is being migrated to Markdown using MkDocs.
Due to the significant amount of documentation, this process will take some time.
All documentation is listed in this web version, and notes are provided to indicate the status of
the migration.  If necessary, refer to the PDF version that is distributed with software.**

* [How to Use this Documentation](#how-to-use-this-documentation)
* [Colorado's Decision Support Systems](#colorados-decision-support-systems)
* [About the Open Water Foundation](#about-the-open-water-foundation)
* [License](#license)
* [Source Repository on GitHub](#source-repository-on-github)
* [Release Notes](#release-notes)

----------------

## How to Use this Documentation ##

The documentation is organized in order of information and tasks necessary to install and use the TSTool software.
Chapters (web pages) are provided for major topics related to software use and application.
References are provided for TSTool [commands](command-ref/overview) and [datastores](datastore-ref/overview).
Training modules are also provided in the [Lessons](lessons/overview) section.

Use the navigation menu provided on the left side of the page to navigate the documentation sections within the full document.
Use the navigation menu provided on the right side of the page to navigate the documentation sections with a page.
The navigation menus may not be displayed if the web browser window is narrow or if viewing on a mobile device,
in which case look for a menu icon to access the menus.
Use the search feature to find documentation matching the search words.

## Colorado's Decision Support Systems ##

Colorado's Decision Support Systems (CDSS, [cdss.state.co.us](http://cdss.state.co.us))
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

In late 2016, the Open Water Foundation began the effort to move StateMod and other CDSS software to open source licensing
and establish open source software projects, referred to as "OpenCDSS".
The OpenCDSS project is resulting in a significant evolution in how CDSS software development occurs,
such as implementing version control with Git/GitHub and modernizing the development environment and documentation.
See the following website for more information.

[OpenCDSS Website](http://learn.openwaterfoundation.org/cdss-website-opencdss/)

## About the Open Water Foundation ##

The [Open Water Foundation](http://openwaterfoundation.org) is a 501(c)3 nonprofit social enterprise that focuses
on developing and supporting open source software for water resources,
so that organizations can make better decisions about water.
OWF also works to advance open data tools and implementation.
OWF is currently the lead entity on TSTool development with staff that have been involved in TSTool
development for over 20 years.

See also other [OWF learning resources](http://learn.openwaterfoundation.org).

## License ##

The TSTool software open source license is being determined in the OpenCDSS project.

The TSTool documentation is licensed under the
[Creative Commons Attribution 2.0 Generic License (CC BY 2.0)](https://creativecommons.org/licenses/by/2.0/).
Please appropriately attribute uses of this documentation.

## Source Repository on GitHub ##

The source files for this documentation are maintained in a GitHub repository:
[cdss-app-tstool-doc-user](https://github.com/OpenWaterFoundation/cdss-app-tstool-doc-user).

This user documentation is currently maintained in a separate repository in order to avoid
confusion with the legacy documentation and to facilitate updates.

## Release Notes ##

See the [Release Notes in the GitHub repository README](https://github.com/OpenWaterFoundation/owf-app-tstool-doc-user#release-notes).
The documentation is typically published after any changes have been made.
