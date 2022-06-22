#!/bin/bash
#
# Copy the MkDocs site/* contents to the CO DNR GCP website:
# - replace all the files on the web with local files

# Supporting functions, alphabetical.

# Build the MkDocs 'site' folder.
buildMkDocsSite() {
  cd ${mkdocsProjectFolder}
  ${mkdocsExe} build --clean
}

# Make sure the MkDocs version is consistent with the documentation content:
# - require that at least version 1.0 is used because of use_directory_urls = True default
# - must use "file.md" in internal links whereas previously "file" would work
# - it is not totally clear whether version 1 is needed but try this out to see if it helps avoid broken links
checkMkdocsVersion() {
  # Required MkDocs version is at least 1.
  requiredMajorVersion="1"
  # On Cygwin, mkdocs --version gives:  mkdocs, version 1.0.4 from /usr/lib/python3.6/site-packages/mkdocs (Python 3.6)
  # On Debian Linux, similar to Cygwin:  mkdocs, version 0.17.3
  if [ "${operatingSystem}" = "cygwin" -o "${operatingSystem}" = "linux" ]; then
    mkdocsVersionFull=$(mkdocs --version)
  elif [ "${operatingSystem}" = "mingw" ]; then
    mkdocsVersionFull=$(py -m mkdocs --version)
  else
    echo ""
    echo "Don't know how to run on operating system ${operatingSystem}"
    exit 1
  fi
  echo "MkDocs --version:  ${mkdocsVersionFull}"
  mkdocsVersion=$(echo ${mkdocsVersionFull} | cut -d ' ' -f 3)
  echo "MkDocs full version number:  ${mkdocsVersion}"
  mkdocsMajorVersion=$(echo ${mkdocsVersion} | cut -d '.' -f 1)
  echo "MkDocs major version number:  ${mkdocsMajorVersion}"
  if [ "${mkdocsMajorVersion}" -lt ${requiredMajorVersion} ]; then
    echo ""
    echo "MkDocs version for this documentation must be version ${requiredMajorVersion} or later."
    echo "MkDocs mersion that is found is ${mkdocsMajorVersion}, from full version ${mkdocsVersion}."
    exit 1
  else
    echo ""
    echo "MkDocs major version (${mkdocsMajorVersion}) is OK for this documentation."
  fi
}

# Determine the operating system that is running the script:
# - mainly care whether Cygwin or MINGW
checkOperatingSystem() {
  if [ ! -z "${operatingSystem}" ]; then
    # Have already checked operating system so return.
    return
  fi
  operatingSystem="unknown"
  os=$(uname | tr [a-z] [A-Z])
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

# Check the source files for issues:
# - the main issue is internal links need to use [](file.md), not [](file)
checkSourceDocs() {
  # Currently don't do anything but could check the above.
  # Need one line to not cause an error.
  :
}

# Get the version modifier:
# - for example, from "12.00.00dev", "12.00.00 dev", 12.00.00beta", or "12.00.00 beta"
# - the first function argument is the full version, possibly including a space
# - the modifier is echoed, so capture by assigning in the calling code
getVersionModifier() {
  local fullVersion
  fullVersion="$1"
  # grep will print each found character on a separate line so concatenate output.
  tstoolVersionModifier=$(echo ${fullVersion} | grep -o -E '[[:alpha:]]' | tr -d '\n' | tr -d ' ')
  echo ${modifier}
}

# Parse the command parameters.
parseCommandLine() {
  local d h l opt
  while getopts :dhl opt; do
    #echo "Command line option is ${opt}"
    case $opt in
      d) # Indicate that this should be copied to the latest release and version.
        dryrun="-n"
        ;;
      h) # Usage.
        printUsage
        exit 0
        ;;
      l) # Indicate that this should be copied to the latest release and version.
        copyToLatest="yes"
        ;;
      \?)
        echo "Invalid option:  -${OPTARG}" >&2
        exit 1
        ;;
      :)
        echo "Option -${OPTARG} requires an argument" >&2
        exit 1
        ;;
    esac
  done
}

# Print the usage.
printUsage() {
  echo ""
  echo "Usage:  $0"
  echo ""
  echo "Copy the site files to the latest website folder if -l specified:  ${gsFolderLatest}"
  echo "Copy the site files to the versioned website folder:  ${gsFolderVersion}"
  echo ""
  echo "-d dry run (print actions but don't execute upload)"
  echo "-h print usage"
  echo "-l copy to latest folder in addition to auto-detected version folder"
  echo ""
}

# Set the MkDocs executable to use, depending operating system and PATH:
# - sets the global ${mkdocsExe} variable
# - return 0 if the executable is found, exit with 1 if not
setMkDocsExe() {
  if [ "${operatingSystem}" = "cygwin" -o "${operatingSystem}" = "linux" ]; then
    # Is usually in the PATH.
    mkdocsExe="mkdocs"
    if hash py 2>/dev/null; then
      echo "mkdocs is not found (not in PATH)."
      exit 1
    fi
  elif [ "${operatingSystem}" = "mingw" ]; then
    # This is used by Git Bash:
    # - calling 'hash' is a way to determine if the executable is in the path
    if hash py 2>/dev/null; then
      mkdocsExe="py -m mkdocs"
    else
      # Try adding the Windows folder to the PATH and rerun:
      # - not sure why C:\Windows is not in the path in the first place
      PATH=/C/Windows:${PATH}
      if hash py 2>/dev/null; then
        mkdocsExe="py -m mkdocs"
      else
        echo 'mkdocs is not found in C:\Windows.'
        exit 1
      fi
    fi
  fi
  return 0
}

# Sync the files to the cloud:
# - if copyToLatest="yes", also sync to latest folder
syncFiles() {
  local exitStat
  exitStat=0
  # Change to script folder.
  cd ${scriptFolder}

  # Now sync the local files up to Google Cloud:
  # - the -m option causes operations to run in parallel, which can be much faster
  # - the -d option means delete extra files in destination
  # - the -r option means recursive to sync the whole folder tree
  # For now always upload to the versioned copy.
  echo ""
  echo "Copying the documentation to the versioned folder:"
  echo "  from: ${siteFolder}"
  echo "    to: ${gsFolderVersion}"
  read -p "Continue with upload (Y/n)? " answer
  if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
    # Continue with copy to versioned folder.
    gsutil.cmd -m rsync -d -r ${dryrun} ${siteFolder} ${gsFolderVersion}
    exitStat=$?
    if [ ${exitStat} -ne 0 ]; then
      return ${exitStat}
    fi
    if [ ${copyToLatest} = "yes" ]; then
      echo ""
      echo 'Copying the documentation to the "latest" folder:'
      echo "  from: ${siteFolder}"
      echo "    to: ${gsFolderLatest}"
      read -p "Continue with upload (Y/n)? " answer
      if [ -z "${answer}" -o "${answer}" = "Y" -o "${answer}" = "y" ]; then
        # Also copy to the latest.
        gsutil.cmd -m rsync -d -r ${dryrun} ${siteFolder} ${gsFolderLatest}
        exitStat=$?
        return ${exitStatus}
      fi
    else
      echo ""
      echo 'Remember to run with -l option to also upload to the "latest" folder.'
      echo ""
    fi
  fi
  return ${exitStatus}
}

# Entry point for the script.

# Check the operating system.
checkOperatingSystem

# Set the MkDocs executable:
# - will exit if MkDocs is not found
setMkDocsExe

# Make sure the MkDocs version is OK.
checkMkdocsVersion

# Check the source files for issues.
checkSourceDocs

# Get the location where this script is located since it may have been run from any folder.
scriptFolder=$(cd $(dirname "$0") && pwd)
gitRepoFolder=$(dirname "${scriptFolder}")
gitReposFolder=$(dirname "${gitRepoFolder}")
mkdocsProjectFolder=${gitRepoFolder}/mkdocs-project
siteFolder=${mkdocsProjectFolder}/site
# Need the following to extract the TSTool version.
projectFolder="${gitReposFolder}/cdss-app-tstool-main"
srcFolder="${projectFolder}/src"
srcMainFolder="${srcFolder}/DWR/DMI/tstool"
tstoolFile="${srcMainFolder}/TSToolMain.java"
if [ -f "${tstoolFile}" ]; then
  tstoolVersion=$(cat ${tstoolFile} | grep -m 1 'PROGRAM_VERSION' | cut -d '=' -f 2 | cut -d '(' -f 1 | tr -d " " | tr -d '"')
  tstoolModifierVersion=$(getVersionModifier "${tstoolVersion}")
else
  echo "Cannot determine TSTool version because file not found:  ${tstoolFile}"
  exit 1
fi
if [ -z "${tstoolVersion}" ]; then
  echo "Cannot determine TSTool version by scanning:  ${tstoolFile}"
  exit 1
fi
echo "scriptFolder=${scriptFolder}"
echo "gitRepoFolder=${gitRepoFolder}"
echo "gitReposFolder=${gitReposFolder}"
echo "mkdocsProjectFolder=${mkdocsProjectFolder}"
echo "projectFolder=${projectFolder}"
echo "srcFolder=${srcFolder}"
echo "srcMainFolder=${srcMainFolder}"
echo "tstoolFile=${tstoolFile}"
echo "tstoolVersion=${tstoolVersion}"

# Set --dryrun to test before actually doing
dryrun=""
gsFolderLatest="gs://opencdss.state.co.us/tstool/latest/doc-user"
gsFolderVersion="gs://opencdss.state.co.us/tstool/${tstoolVersion}/doc-user"

# Whether to copy to latest in addition to the specific version
# - default to no because the script can be run on any version, and can't assume latest
copyToLatest="no"

# Parse the command line
parseCommandLine $@

if [ ! -z "${tstoolVersionModifier}" -a "${copyToLatest}" = "yes" ]; then
  # The version contains "dev" or "beta" so don't allow to be used for "latest"
  echo "TSTool version ${tstoolVersion} contains modifier - not copying to latest."
  copyToLatest="no"
fi

# First build the site so that the "site" folder contains current content:
# - "mkdocs serve" does not do this
buildMkDocsSite

# Sync the files to the cloud.
syncFiles

exit $?
