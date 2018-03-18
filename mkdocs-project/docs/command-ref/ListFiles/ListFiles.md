# Learn GeoProcessor / Command / ListFiles #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

The `ListFiles` command lists the files and folders within a folder or a URL. 

* Can specify to list only files, only folders or  both files and folders. 
* Output is a list assigned to a [GeoProcessor property](../../introduction/#geoprocessor-properties-property). Requires a property name. 
* Can specify [glob-style patterns](https://en.wikipedia.org/wiki/Glob_(programming)) to include or exclude items within the output list.

## Command Editor ##

The following dialog is used to edit the command and illustrates the command syntax.

**Need to implement UI.**

## Command Syntax ##

The command syntax is as follows:

```text
ListFiles(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| **Description** | **Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| --------------|-----------------|----------------- |
|`Folder` <br>  *see Default*|The path of the folder of interest (relative or absolute). | **_Required_** if `URL` parameter is not specified. |
|`URL` <br> *see Default*| The URL of interest. | **_Required_** if `Folder` parameter is not specified. |
|`ListProperty`<br> **_required_**|A [property](../../introduction/#geoprocessor-properties-property) name to hold the output list.|None - must be specified.|
|`IncludePatterns`<br> *optional*|A list of comma-separated [glob-style patterns](https://en.wikipedia.org/wiki/Glob_(programming)) that filter which items to include in the output list. |`*` <br> All files/folders are included.|
|`ExcludePatterns`<br> *optional*|A list of comma-separated [glob-style patterns](https://en.wikipedia.org/wiki/Glob_(programming)) that filter which items to exclude in the output list.|`''` <br>No files/folders are excluded.|
|`ListFiles`<br> *optional*|Boolean <br><br> If `True`, files will be listed. <br> If `False`, files will *not* be listed.|`True`|
|`ListFolders`<br> *optional*|Boolean <br><br> If `True`, folders will be listed. <br> If `False`, folders will *not* be listed.|`True`|
|`IfPropertyExists`<br> *optional*|The action that occurs if the `ListProperty` is already an existing property. <br><br> `Replace` : The existing property value is overwritten with the output list. No warning is logged.<br><br> `ReplaceAndWarn`: The existing property value is overwritten with the output list. A warning is logged. <br><br> `Warn` : The existing property keeps its original value. A warning is logged. <br><br> `Fail` : The existing property keeps its original value. A fail message is logged. | `Replace` | 


## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/owf-app-geoprocessor-python-test/tree/master/test/commands/ListFiles).

## Troubleshooting ##

## See Also ##

- The source content of the URL is read using the the Python [urllib2](https://docs.python.org/2/library/urllib2.html) library.