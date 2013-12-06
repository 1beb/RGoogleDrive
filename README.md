# RGoogleDrive

This package is largely a wrapper for Hadley Wickham's 
[httr](https://github.com/hadley/httr), built with the 
specific intention of providing access to the 
[Google Drive SDK](https://developers.google.com/drive/v2/reference/) 
from within R.

Google's updated API relies on OAuth 2.0 making it
impossible to use simple authentication past the
deprecation date of the first API (Scheduled for April
2015). This means that you must register your own app,
with it's own secret key.

1. Go to [Google's API Console](https://cloud.google.com/console#/project)
2. Turn on the Google Drive SDK for that project and save the app url, and secret key

The following options will need to be set before you can proceed to authentication:

```
options(drive.app ="107...5.apps.googleusercontent.com")
options(drive.secret = "YOUR_SECRET")
```