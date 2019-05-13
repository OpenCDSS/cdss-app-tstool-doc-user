# Notes on updating to major new version #

After installing TSTool 13.00.00dev, the following folders are installed:

```
C:\Users\sam\
  .tstool/
    13/
      datastores/
        ColoradoHydroBaseRest.cfg - enabled and has an ApiKey
        HydroBase.cfg - enabled and has 20180529 version
      logs/
      plugins/
      system/
```

The datastores match older `.tstool/datastore` files.
Need to confirm whether TSTool is automatically copying those forward.
Need to make it a more user-verified process.

The ***File / Open / Command File*** menu does list the history.

**Need to be careful that when TSTool is run immediately after install it is as Administrator
and files are not found.**
