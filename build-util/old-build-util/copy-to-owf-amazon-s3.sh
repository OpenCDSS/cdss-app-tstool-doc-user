#!/bin/sh
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is required
# The above line ensures that the script can be run on Cygwin/Linux even with Windows CRNL
#
# Copy the site/* contents to the learn.openwaterfoundation.org website
# - replace all the files on the web with local files
# - must specify Amazon profile as argument to the script

# Supporting functions, alphabetized

# Make sure the MkDocs version is consistent with the documentation content
# - require that at least version 1.0 is used because of use_directory_urls = True default
# - must use "file.md" in internal links whereas previously "file" would work
# - it is not totally clear whether version 1 is needed but try this out to see if it helps avoid broken links
checkMkdocsVersion() {
	# Required MkDocs version is at least 1
	requiredMajorVersion="1"
	# On Cygwin, mkdocs --version gives:  mkdocs, version 1.0.4 from /usr/lib/python3.6/site-packages/mkdocs (Python 3.6)
	if [ "$operatingSystem" = "cygwin" -o "$operatingSystem" = "linux" ]; then
		mkdocsVersionFull=$(mkdocs --version)
	elif [ "$operatingSystem" = "mingw" ]; then
		mkdocsVersionFull=$(py -m mkdocs --version)
	else
		echo ""
		echo "Don't know how to run on operating system $operatingSystem"
		exit 1
	fi
	echo "MkDocs --version:  $mkdocsVersionFull"
	mkdocsVersion=$(echo $mkdocsVersionFull | cut -d ' ' -f 3)
	echo "MkDocs full version number:  $mkdocsVersion"
	mkdocsMajorVersion=$(echo $mkdocsVersion | cut -d '.' -f 1)
	echo "MkDocs major version number:  $mkdocsMajorVersion"
	if [ "$mkdocsMajorVersion" -lt $requiredMajorVersion ]; then
		echo ""
		echo "MkDocs version for this documentation must be version $requiredMajorVersion or later."
		echo "MkDocs mersion that is found is $mkdocsMajorVersion, from full version ${mkdocsVersion}."
		exit 1
	else
		echo ""
		echo "MkDocs major version ($mkdocsMajorVersion) is OK for this documentation."
	fi
}

# Determine the operating system that is running the script
# - mainly care whether Cygwin or MINGW
checkOperatingSystem()
{
	if [ ! -z "${operatingSystem}" ]; then
		# Have already checked operating system so return
		return
	fi
	operatingSystem="unknown"
	os=`uname | tr [a-z] [A-Z]`
	case "${os}" in
		CYGWIN*)
			operatingSystem="cygwin"
			;;
		LINUX*)
			operatingSystem="linux"
			;;
		MINGW*)
			operatingSystem="mingw"
			;;
	esac
}

# Check the source files for issues
# - the main issue is internal links need to use [](file.md), not [](file)
checkSourceDocs() {
	# Currently don't do anything but could check the above
	# Need one line to not cause an error
	:
}

# Entry point into the script

# Check the operating system
checkOperatingSystem

# Make sure the MkDocs version is OK
checkMkdocsVersion

# Check the source files for issues
checkSourceDocs

# Set --dryrun to test before actually doing
dryrun=""
#dryrun="--dryrun"
s3Folder="s3://learn.openwaterfoundation.org/cdss-app-tstool-doc-user"

# Folder for script
scriptFolder=`cd $(dirname "$0") && pwd`

if [ "$1" == "" ]
	then
	echo ""
	echo "Usage:  $0 AmazonConfigProfile"
	echo ""
	echo "Copy the site files to the Amazon S3 static website folder:  $s3Folder"
	echo ""
	exit 0
fi

awsProfile="$1"

# First build the site so that the "site" folder contains current content.
# - "mkdocs serve" does not do this

cd "$scriptFolder"
cd ../../mkdocs-project
if [ "$operatingSystem" = "cygwin" -o "$operatingSystem" = "linux" ]; then
	mkdocs build --clean
elif [ "$operatingSystem" = "mingw" ]; then
	py -m mkdocs build --clean
else
	echo ""
	echo "Don't know how to run on operating system $operatingSystem"
	exit 1
fi

cd ../build-util/old-build-util

# Now sync the local files up to Amazon S3
if [ "$operatingSystem" = "cygwin" -o "$operatingSystem" = "linux" ]; then
	# aws is in a standard location such as /usr/bin/aws
	aws s3 sync ../../mkdocs-project/site ${s3Folder} ${dryrun} --delete --profile "$awsProfile"
elif [ "$operatingSystem" = "mingw" ]; then
	# For Windows Python 3.7, aws may be installed in Windows %USERPROFILE%\AppData\Local\Programs\Python\Python37\scripts
	# - use Linux-like path to avoid backslash issues
	# - TODO smalers 2019-01-04 could try to find if the script is in the PATH
	# - TODO smalers 2019-01-04 could try to find where py thinks Python is installed but not sure how
	awsScript="$HOME/AppData/Local/Programs/Python/Python37/scripts/aws"
	if [ -f "$awsScript" ]; then
		$awsScript s3 sync ../../mkdocs-project/site ${s3Folder} ${dryrun} --delete --profile "$awsProfile"
	else
		echo ""
		echo "Can't find aws script"
		exit 1
	fi
else
	echo ""
	echo "Don't know how to run on operating system $operatingSystem"
	exit 1
fi

exit $?
