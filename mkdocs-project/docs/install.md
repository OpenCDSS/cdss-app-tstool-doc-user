# Learn GeoProcessor / Install GeoProcessor #

The GeoProcess installation requires that the following components are installed:

* [GeoProcessor Versions](#geoprocessor-versions)
* [Install QGIS](#install-qgis)
* [Install Python (Optional)](#install-python-optional)
* [Install GeoProcessor](#install-geoprocessor)

----------------------

## GeoProcessor Versions ##

The GeoProcessor is distributed in two versions:

* **Full GeoProcessor/QGIS version**:
	+ Used for geospatial data processing.
	+ Uses Python packaged with QGIS.
	+ GeoProcessor run program:
		- ![Windows](images/windows-32.png) Windows: `gp.bat`
		- ![Linux](images/linux-32.png) Linux: `gp.sh`
	+ Install GeoProcessor `geoprocessor` package in folders that are searched by QGIS Python:
		- ![Windows](images/windows-32.png) Windows: Install from `gp-sitepackage.zip`
		- ![Linux](images/linux-32.png) Linux: Install from `gp-sitepackage.tar.gz`
* **Test framework version (no QGIS)**:
	+ Includes the GeoProcessor test framework, which is used to test the GeoProcessor itself.
	+ Can be used to automate tests for software and processing workflows.
	+ Can be used without QGIS, using run program:
		- ![Windows](images/windows-32.png) Windows: `gptest.bat`
		- ![Linux](images/linux-32.png) Linux: `gptest.sh`
	+ See the [Developer Documentation](http://learn.openwaterfoundation.org/owf-app-geoprocessor-python-doc-dev/dev-tasks/#functional-tests)
	for how to use the software to implement functional tests.
	+ Install GeoProcessor `geoprocessor` package in folders that are searched by Python:
		- ![Windows](images/windows-32.png) Windows: Install from `gptest-sitepackage.zip`
		- ![Linux](images/linux-32.png) Linux: Install from `gptest-sitepackage.tar.gz`

## Install QGIS ##

The full GeoProcessor installation requires that QGIS is installed.
See the [Resources](resources#QGIS) information for how to install QGIS.
It is recommended that the current QGIS version is installed in the default location to minimize configuration issues.
As of March, 2018, the default QGIS installer installs QGIS 3.x,
which does not appear to be ready for full production use, and the GeoProcessor relies on QGIS 2.x and Python 2.
Therefore, when installing the current QGIS, use the ***Advanced Install*** feature of the installer and
select the "stable long-term release (LTR)" for installation.
This will install the latest stable QGIS 2 in addition to the QGIS 3 version.
The GeoProcessor will then automatically run using the Python 2 QGIS in the LTR release.

The QGIS installation procedure is likely to change as QGIS 3 becomes more stable.

## Install Python (Optional) ##

The GeoProcessor requires Python 2.7+.
The `gp` program (see next section) that runs the GeoProcessor typically uses the Python distributed with QGIS.

In the future the GeoProcessor may be distributed with a Python virtual environment.
However, this is currently not complete because of dependence on the QGIS installation.
**Advice on this topic from the developer community is welcomed.**

## Install GeoProcessor ##

The GeoProcessor installation does not currently use the standard Python `pip` or `pipenv`
installation tools (this will be implemented in the future).
Currently a manual installation process is used:

### Install GeoProcessor `geoprocessor` Python Package ###

The GeoProcessor Python modules need to be installed in a folder where the Python interpreter can find the files.
Candidate locations will vary depending on how Python 2 is installed on the computer.

1. Download GeoProcessor package installer (**standard download website needs to be implemented - for
now files may be distributed by email**).
	1. ![Windows](images/windows-32.png) Windows, typically will be saved to user's `Downloads` folder:
		1. `gp-sitepackage.zip` - full QGIS GeoProcessor
		2. `gptest-sitepackage.zip` - test framework GeoProcessor (no QGIS)
	2. ![Linux](images/linux-32.png) Linux, may be saved to users' `Downloads` folder or `/tmp`:
		1. `gp-sitepackage.tar.gz` - full QGIS GeoProcessor
		2. `gptest-sitepackage.tar.gz` - test framework GeoProcessor (no QGIS)
2. Determine candidate install locations:
	1. ![Windows](images/windows-32.png) Windows QGIS version:
		1. For QGIS 2.18 (or similar), is typically `C:\OSGeo4W64\apps\Python27\Lib\site-packages`.
	2. ![Cygwin](images/cygwin-32.png) Linux test framework version:
		1. For Cygwin, is typically `/usr/lib/python2.7/site-packages`.
	3. ![Linux](images/linux-32.png) Linux test framework version:
		2. For Debian Linux, is typically `/usr/local/lib/python2.7/dist-packages`.
3. Remove previous installation.  Delete the `geoprocessor` folder from the location determined in the previous step.
4. Install the GeoProcessor package (`geoprocessor` folder and everything included in that folder).
	1. ![Windows](images/windows-32.png) Windows QGIS version:
		1. Use Windows Explorer to copy the contents of the zip file (not the zip file itself) to the above folder.
	2. ![Linux](images/linux-32.png) Linux test framework version:
		1. Change to the installation folder and then install the files, for example:  `sudo tar -xzvf ~/Downloads/gptest-site-package.tar.gz` 

### Install GeoProcessor Run Programs ###

Simple scripts are provided for Windows (`gp.bat` and `gptest.bat`) and Linux (`gp.sh` and `gptest.sh`)
to configure the GeoProcessor Python environment and run the GeoProcessor.
The programs should be installed in a location that facilitates running the GeoProcessor.
The Windows `gp.bat` and Linux `gp.sh` scripts assume a location for the QGIS install and its embedded Python.
The Windows `gptest.bat` and Linux `gptest.sh` scripts check for Python 2 on the system
(because QGIS Python is not used).
If the location of the Python interpreter does not match the location in the script,
then the script may need to be edited to specify the actual Python interpreter location.

Potential locations to install the run scripts include:

* Standard GeoProcessor software installation folder, accessed using system menus:
	+ **This is not yet enabled but will be the default when the user interface is implemented.**
* Run the script manually from wherever it is installed.
* Check the `PATH` environment variable to see what folders are searched to find software, and
copy the programs to one of the folders.  Determine the folders in the path by running the follows command
in a shell:
	+ ![Windows](images/windows-32.png) Windows command shell: `echo %PATH%`
	+ ![Linux](images/linux-32.png) Linux shell window: `echo $PATH`
* If the full QGIS version, install in the QGIS `bin` folder, for example as shown below.
However, this folder may not be in the `PATH` because QGIS may be run from its user interface via system menus.
	+ ![Windows](images/windows-32.png) Windows: `C:\OSGeo4W64\bin`
* User-defined folder in `PATH`.
	+ ![Linux](images/linux-32.png) Linux user programs, for example: `$HOME/user/bin`

The `gp.py` file is run by all the scripts and specifies the Python GeoProcessor module to run
using the `-m geoprocessor.app.gp` Python command line parameter.
If the GeoProcessor package was installed in a folder (such as `site-packages`) that is known to the
Python interpreter, the GeoProcessor software will be found and will run.
Otherwise, an error will be displayed about the module not being found and installation locations need to be reviewed.
