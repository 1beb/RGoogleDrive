\name{drive.auth}
\alias{drive.auth}
\title{Google Drive API Authentication}
\usage{
  drive.auth(drive.app = NULL, drive.secret = NULL,
    drive.scope = NULL)
}
\arguments{
  \item{drive.app}{The link to your app, if NULL looks for
  option(drive.app)}

  \item{drive.secret}{Your secret key, if NULL looks for
  option(drive.secret)}

  \item{drive.scope}{The scope, if NULL looks for
  option(drive.scope)}
}
\description{
  This function sets an option that contains authentication
  credentials to utilize the Google Drive API
}

