# cdss-app-tstool-doc-user #

This repository contains the user documentation for Colorado's Decision Support Systems (CDSS) TSTool software.

See the deployed [CDSS / TSTool](http://learn.openwaterfoundation.org/cdss-app-tstool-doc-user/) documentation.
This documentation is currently hosted on the Open Water Foundation website
while the OpenCDSS server is being configured.  See the following online resources:

* [Colorado's Decision Support Systems (CDSS)](http://cdss.state.co.us)
* [OpenCDSS](http://learn.openwaterfoundation.org/cdss-website-opencdss/) - currently hosted on Open Water Foundation website while OpenCDSS server is configured
* [TSTool software main repository](https://github.com/OpenCDSS/cdss-app-tstool-main)
* [TSTool Developer Documentation](http://learn.openwaterfoundation.org/cdss-app-tstool-doc-dev/) - currently hosted on Open Water Foundation website while OpenCDSS server is configured

See the following sections on this page:

* [TSTool Software Overview](#tstool-software-overview)
* [Repository Contents](#repository-contents)
* [Development Environment](#development-environment)
* [Editing and Viewing Content](#editing-and-viewing-content)
* [Deploying the Documentation](#deploying-the-documentation)
* [Style Guide](#style-guide)
* [License](#license)
* [Contributing](#contributing)
* [Maintainers](#maintainers)
* [Release Notes](#release-notes)

---------------------------

## TSTool Software Overview ##

The TSTool software is a Java application that automates time series processing:

1. Command-based workflow language.
2. General commands including file manipulation, logic controls such as `For` and `If` commands,
and support for processor properties to allow dynamic scripting.
3. Time series data processing commands for:
	1. Reading time series from files, databases, and web services
	2. Creating time series
	3. Setting time series data
	4. Filling time series data
	5. Manipulating time series data (add, multiply, etc.)
	6. Analyzing time series
	7. Models that use time series (e.g., routing)
	8. Writing time series to files and databases
	9. Checking time series
4. Table processing commands:
	1. Create tables
	2. Read tables
	3. Table/time series transfer
	4. Manipulate tables
	5. Analyze tables
	6. Write tables
5. Other data processing commands:
	1. Datastores (databases)
	2. Ensembles (groups of time series)
	3. Network
	4. Spatial data
	5. Spreadsheet
	6. Templates
	7. Visualization
6. General commands
	1. Comments
	2. File handling
	3. Logging
	4. Run control
	5. Testing
7. General commands:
8. Built-in test framework, which is used to run functional tests, suitable for software developers and also
non-programmers who want to validate processing workflows.
9. Multiple run modes including batch, command shell interpreter, user interface, HTTP server.
10. Integration with other tools to leverage the strengths of those tools.

## Repository Contents ##

The repository contains the following:

```text
.github/              Files specific to GitHub such as issue template.
.gitattributes        Typical Git configuration file for repository attributes.
.gitignore            Typical Git configuration file for ignored file list.
README.md             This file.
build-util/           Useful scripts to view, build, and deploy documentation.
mkdocs-project/       Typical MkDocs project for this documentation.
  mkdocs.yml          MkDocs configuration file for website.
  docs/               Folder containing source Markdown and other files for website.
    css/              Custom CSS to augment MkDocs theme.
    markdown files    Files and folders containing Markdown documentation.
  site/               Folder created by MkDocs containing the static website - ignored using .gitignore.

```

The repository can be cloned into the recommended standard CDSS development folder structure,
shown below.  Each of the component libraries have README files that indicate
dependencies.

```text
C:\Users\user\                            Windows:  User's files.
/home/user/                               Linux:  User's files.
/cygdrive/C/Users/user/                   Cygwin:  User's files.
  cdss-dev/                               Main development location for CDSS products.
    TSTool/                               TSTool software development files.
      git-repos/                          Git repositories for TSTool software.
        cdss-app-tstool-doc/              Legacy user and developer documentation, primarily in Word/PDF.
        cdss-app-tstool-doc-dev/          Developer documentation using Markdown/MkDocs.
        cdss-app-tstool-doc-user/         User documentation using Markdown/MkDocs.
        cdss-app-tstool-main/             Main TSTool application, primarily the main UI.
        cdss-app-tstool-test/             Functional tests that run command files.
        cdss-lib-cdss-java/               Shared CDSS code.
        cdss-lib-common-java/             Shared general utility code.
        cdss-lib-dmi-hydrobase-java/      State of Colorado's HydroBase API.
        cdss-lib-dmi-nwsrfs-java/         Legacy National Weather Service API.
        cdss-lib-dmi-riversidedb-java/    Legacy RiversideDB database API.
        cdss-lib-dmi-satmonsys-java/      Colorado Satellite Monitoring System API.
        cdss-lib-models-java/             CDSS StateCU and StateMod model API.
        cdss-lib-processor-ts-java/       Core TSTool processing library.
        cdss-util-buildtools/             Utilities to build and deploy TSTool.
```

## Development Environment ##

The development environment for contributing to this documentation requires
installation of Python, MkDocs, and Material MkDocs theme.
Python 3 and Markdown 1+ has been used for development.
See the [OWF / Learn MkDocs](http://learn.openwaterfoundation.org/owf-learn-mkdocs/)
documentation for information about installing MkDocs.

## Editing and Viewing Content ##

If the development environment is properly configured, edit and view content as follows:

1. Edit content in the `mkdocs-project/docs` folder and update `mkdocs-project/mkdocs.yml` as appropriate.
2. Run the `build-util/run-mkdocs-serve-8000.sh` script (Git Bash/Cygwin/Linux) or equivalent.
Any issues should be resolved by updating the run script to support as many environments as possible.
3. View content in a web browser using URL `http://localhost:8000`.

## Deploying the Documentation ##

The documentation is currently deployed to two locations by running the following scripts in
Git Bash:

1. `build-util/copy-to-co-dnr-gcp.sh` - copies the MkDocs-generated static website
to the State of Colorado's Google Cloud Platform, currently being configured.
This requires installing the Google Cloud Platform `gcloud` command line tool and being authenticated.
2. `build-util/old-build-util/copy-to-owf-amazon-s3.sh` - copies the MkDocs-generated
static website to
[TSTool Developer Documentation on the Open Water Foundation website](http://learn.openwaterfoundation.org/cdss-app-tstool-doc-user/).
This requires installing the Amazon Web Services command line tool and being authenticated.
Use the `-l` option with the script to also copy to the latest version (default is to copy to version folder).

## Style Guide ##

The following are general style guide recommendations for this documentation,
with the goal of keeping formatting simple in favor of focusing on useful content:

* Use the Material MkDocs theme - it looks nice, provides good navigation features, and enables search.
* Follow MkDocs Markdown standards - use extensions beyond basic Markdown when useful.
* Show files and program names as `code (tick-surrounded)` formatting.
* Where a source file can be linked to in GitHub, provide a link so that the most current file can be viewed.
* Use triple-tick formatting for code blocks, with language specifier.
* Use ***bold italics*** when referencing UI components such as menus.
* Use slashes surrounded by spaces to indicate ***Menu / SubMenu*** (slashes in
	menus can be indicated with no surrounding spaces).
* Images are handled as follows:
	+ Where narrative content pages are sufficiently separated into folders,
	image files exist in those folder with names that match the original TSTool Word documentation.
	This approach has been used for the most part, for example command reference.
	+ If necessary, place images in an `images` folder.
	+ When using images in the documents, consider providing a link to view the full-sized
	image (see [examples in this command reference document](https://github.com/OpenCDSS/cdss-app-tstool-doc-user/blob/master/mkdocs-project/docs/command-ref/NewTimeSeries/NewTimeSeries.md)).
* Minimize the use of inlined HTML elements, but use it where Markdown formatting is limited.
* Although the Material theme provides site and page navigation sidebars,
provide in-line table of contents on pages, where appropriate, to facilitate review of page content.
Use a simple list at the top of the page with links to sections on the page.

## License ##

This documentation is copyrighted by the Colorado Department of Natural Resources.

This TSTool documentation is licensed using the
[Creative Commons Attribution International 4.0 (CC BY 4.0) license](https://creativecommons.org/licenses/by/4.0/).

The TSTool software is licensed using the GPL 3 license.
See the [TSTool software repository](https://github.com/OpenCDSS/cdss-app-tstool-main).

## Contributing ##

Contribute to the documentation as follows:

1. Use GitHub repository issues to report minor issues.
Fill out the template issue.
2. Use GitHub pull requests.
3. A member of the core development team will follow up to issues and pull requests.

## Maintainers ##

This repository is maintained by the OpenCDSS team.

## Release Notes ##

The following release notes indicate major updates for the documentation.
Refer to the [GitHub issues](https://github.com/OpenCDSS/cdss-app-tstool-doc-user/issues)
for change history and see also the
[TSTool release notes](http://learn.openwaterfoundation.org/cdss-app-tstool-doc-user/appendix-release-notes/release-notes/).

* 2019-01-06 - Update documentation for full OpenCDSS release and MkDocs 1.
* 2018-09-14 - Review documentation for TSTool 12.06.00 release.
* 2018-04-22 - Majority of content transferred from Word/PDF to Markdown/MkDocs
except for a few commands and datastores.
* 2018-03-16 - Initial content in Markdown/MkDocs format.
