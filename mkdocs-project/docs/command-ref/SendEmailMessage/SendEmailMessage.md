# Learn TSTool / Command / SendEmailMessage #

* [Overview](#overview)
* [Command Editor](#command-editor)
* [Command Syntax](#command-syntax)
* [Examples](#examples)
* [Troubleshooting](#troubleshooting)
* [See Also](#see-also)

-------------------------

## Overview ##

**This command is under development.  Do not use in production.**

The `SendEmailMessage` command sends an email message.

## Command Editor ##

The following dialog is used to edit the command and illustrates the syntax of the command.
<a href="../SendEmailMessage.png">See also the full-size image.</a>

![SendEmailMessage](SendEmailMessage.png)

**<p style="text-align: center;">
`SendEmailMessage` Command Editor
</p>**

## Command Syntax ##

The command syntax is as follows:

```text
SendEmailMessage(Parameter="Value",...)
```
**<p style="text-align: center;">
Command Parameters
</p>**

|**Parameter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Description**|**Default**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|--------------|-----------------|-----------------|
|`From`<br>**required**|From email address, can be specified with `${Property}`|None - must be specified.|

## Examples ##

See the [automated tests](https://github.com/OpenWaterFoundation/cdss-app-tstool-test/tree/master/test/regression/commands/general/SendEmailMessage).

## Troubleshooting ##

## See Also ##

* [`Message`](../Message/Message) command
