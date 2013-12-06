#' RGoogleDrive provides access to the Google Drive SDK from R
#' 
#' This package is largely a wrapper for Hadley Wickham's \pkg{httr}, built with the 
#' specific intention of providing access to the 
#' \href{https://developers.google.com/drive/v2/reference/}{Google Drive SDK} from within R. 
#' 
#' Google's updated API relies on OAuth 2.0 making it impossible to use simple 
#' authentication past the deprecation date of the first API (Scheduled for April 2015). 
#' This means that you must register your own app, with it's own secret key.  
#' 
#' \itemize{
#' \item{Go to \href{https://cloud.google.com/console#/project}{Google's API Console}}
#' \item{Create a new project}
#' \item{Turn on the Google Drive SDK for that project and save the app url, and
#' secret key}
#' }
#'
#' Respectively, the following options will need to be set before you can proceed
#' to authentication:
#' 
#' \code{options(drive.app = "107...5.apps.googleusercontent.com")}
#' \code{options(drive.secret = "YOUR_SECRET")}
#' 
#' By default, the drive.scope is read only and is set by an .onLoad function. However, you can adjust the scope
#' by changing the following setting:
#' 
#' \code{options(drive.scope = "https://www.googleapis.com/auth/drive.readonly")}
#' 
#' If you should desire it you can implement other methods supported by the 
#' \href{https://developers.google.com/drive/v2/reference/}{Google Drive SDK} by using the following nomenclature:
#' 
#' \code{
#' POST(
#'      "https://www.googleapis.com/upload/drive/v2/files",
#'      getOption("drive.auth"), 
#'      body = list(y = upload_file(system.file("pathtoyourfile")))
#'      )}
#' 
#' The \pkg{httr} package provides a useful set of tools for dealing directly with RESTFUL APIs: supporting typical 
#' http methods \link[httr]{GET}, like \link[httr]{DELETE}, \link[httr]{PATCH}, \link[httr]{POST}, and 
#' \link[httr]{PUT}
#' 
#' @import httr XML
#' @docType package
#' @name RGoogleDrive

NULL

#' On Load Messaging 
#' 
#' Loads messaging about RGoogleDrive library settings

.onLoad <- function(libname=find.package("RGoogleDrive"),pkgname="RGoogleDrive") {

  options(drive.scope = "https://www.googleapis.com/auth/drive.readonly")
  drive.options.test()
}
