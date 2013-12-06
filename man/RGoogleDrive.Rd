\docType{package}
\name{RGoogleDrive}
\alias{RGoogleDrive}
\alias{RGoogleDrive-package}
\title{RGoogleDrive provides access to the Google Drive SDK from R}
\description{
  This package provides access in R to the /files and /get
  methods for listing and downloading google documents,
  spreadsheets through the new
  \href{https://developers.google.com/drive/v2/reference/}{Google
  Drive SDK}
}
\details{
  Google's reliance on OAuth 2.0 makes it impossible to use
  simple authentication this means that you must create
  your own app, with it's own secret key.

  \itemize{ \item{Go to
  \href{https://cloud.google.com/console#/project}{Google's
  API Console}} \item{Create a new project} \item{Turn on
  the Google Drive SDK for that project and save the app
  url, and secret key} }

  Respectively, the following options will need to be set
  before you can proceed to authentication:

  \code{ options(drive.app =
  "107...5.apps.googleusercontent.com")
  options(drive.secret = "YOUR_SECRET")}

  By default, the drive.scope is read only and is set by an
  .onLoad function. However, you can adjust the scope by
  changing the following setting:

  \code{options(drive.scope =
  "https://www.googleapis.com/auth/drive.readonly")}

  If you should desire it you can implement other methods
  supported by the
  \href{https://developers.google.com/drive/v2/reference/}{Google
  Drive SDK} by using the following nomenclature:

  \code{ POST(
  "https://www.googleapis.com/upload/drive/v2/files",
  getOption("drive.auth"), body = list(y =
  upload_file(system.file("pathtoyourfile"))) )}

  The \code{httr} package provides a useful set of tools
  for dealing directly with RESTFUL APIs: \link[httr]{GET},
  \link[httr]{DELETE}, \link[httr]{PATCH},
  \link[httr]{POST}, and \link[httr]{PUT}
}

