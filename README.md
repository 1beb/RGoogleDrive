# RGoogleDrive

This R package is largely a wrapper for Hadley Wickham's 
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

## Installation

```
library(devtools)
install_github("RGoogleDrive","1beb") # install
```


## Basic Usage



First, authenticate:

```
library(RGoogleDrive)
drive.auth()
```

Then, search for the file that you're interested in accessing by title, the library will provide you with guidance if more than one document is returned in your search: 

```
drive.list("My Document")
```

Once you know the exact title of the document you wish to download, you can specify the name and format of the content you wish to receive, for example:

```
drive.file("My Document",download.type="txt") # Returns flat text
drive.file("My Spreadsheet",download.type="csv") # Returns a data.frame
drive.file("My Document",download.type="html") # Returns GDocs HTML
```