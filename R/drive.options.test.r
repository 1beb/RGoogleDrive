#' Tests if RGoogleDrive options are set
#' 
#' Tests if RGoogleDrive options are set and if not, tells you which one has not been set. 
#' 
#' @export drive.options.test

drive.options.test <- function() {
  
  any.not.set <-  any(
    is.null(getOption("drive.app")),
    is.null(getOption("drive.secret")),
    is.null(getOption("drive.scope"))
  )
  
  all.set <- !any.not.set
  
  drive.app.not.set <- is.null(getOption("drive.app"))
  drive.secret.not.set <- is.null(getOption("drive.secret"))
  if(drive.app.not.set) warning("drive.app not set in options, RGoogleDrive will not be able to authenticate.")
  if(drive.secret.not.set) warning("drive.secret not set in options, RGoogleDrive will not be able to authenticate.")  

  return(all.set)
}