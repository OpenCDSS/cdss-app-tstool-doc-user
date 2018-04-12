# CDSS / Learn TSTool #

This documentation provides resources to learn how to use
Colorado's Decision Support Systems (CDSS) TSTool software,
which automates processing of time series, tabular, and other data.

**The TSTool documentation has in the past been maintained in Microsoft Word and PDF
and is being migrated to Markdown/MkDocs in order to provide a better user experience.
The general organization of the documentation will remain the same; however,
some consolidation is expected beause linked documentation presents opportunities to remove duplicate information.
Most of the migration has been completed, except for a few sections.
The [datastore](datastore-ref/overview) and
[command reference](command-ref/overview#command-list) overview sections provide an
inventory of documentation to indicate which sections still need to be migrated.
Notes within documents also indicate the status of the migration.
If necessary, refer to the PDF version that is distributed with software.**

* [How to Use this Documentation](#how-to-use-this-documentation)
* [Acknowledgements](#acknowledgements)
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
[GitHub Issues page](https://github.com/OpenWaterFoundation/cdss-app-tstool-main/issues).

Feedback specific to CDSS functionality (e.g.,
[HydroBase](datastore-ref/CO-HydroBase/CO-HydroBase],
[StateMod](datastore-ref/StateMod),
[StateModB](datastore-ref/StateModB), and
[StateCU](datastore-ref/StateCU) input types and other features)
can be provided using the [CDSS email address](mailto:cdss@state.co.us).

### Software Components

The following components are used in TSTool and require or request attribution:

* [Material Theme icons](https://material.io/icons/) - these icons are used in documentation
* More information will be added here as the open source license is finalized.

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

In late 2016, the Open Water Foundation began the effort to move TSTool and other CDSS software to open source licensing
and establish open source software projects, referred to as "OpenCDSS".
The OpenCDSS project is resulting in a significant evolution in how CDSS software development occurs,
such as implementing version control with Git/GitHub and modernizing the development environment and documentation.
See the [OpenCDSS Website](http://learn.openwaterfoundation.org/cdss-website-opencdss/) for more information.

## About the Open Water Foundation ##

The [Open Water Foundation](http://openwaterfoundation.org) is a 501(c)3 nonprofit social enterprise that focuses
on developing and supporting open source software for water resources,
so that organizations can make better decisions about water.
OWF also works to advance open data tools and implementation.
OWF staff have been the primary TSTool developers on State of Colorado and other projects.

## License ##

The TSTool software open source license is being determined in the OpenCDSS project.

The TSTool documentation is also being determined but is expected to be a Creative Commons license of some type.

## Source Repository on GitHub ##

The source files for this documentation are maintained in a GitHub repository:
[cdss-app-tstool-doc-user](https://github.com/OpenWaterFoundation/cdss-app-tstool-doc-user).

This user documentation is currently maintained in a repository that is separate from TSTool code
in order to avoid confusion with the legacy documentation and to facilitate updates.

## Release Notes ##

See the [release notes](appendix-release-notes/release-notes) section of this documentation.
