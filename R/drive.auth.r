#' Google Drive API Authentication
#' 
#' This function sets an option that contains authentication 
#' credentials to utilize the Google Drive API
#' 
#' @param drive.app The link to your app, if NULL looks for option(drive.app)
#' @param drive.secret Your secret key, if NULL looks for option(drive.secret)
#' @param drive.scope The scope, if NULL looks for option(drive.scope)
#' @import httr 
#' @export drive.auth

drive.auth <- function(drive.app=NULL,drive.secret=NULL,drive.scope=NULL) {
  
  if(!drive.options.test()) {
    stop()
  }
    
  if(is.null(drive.app)) {
    drive.app <- getOption("drive.app")
    if(is.null(drive.app)) stop("Drive app not set.")
  }
  
  if(is.null(drive.secret)) {
    drive.secret <- getOption("drive.secret")
    if(is.null(drive.secret)) stop("Drive secret not set")
  }
  
  if(is.null(drive.scope)) {
    drive.scope <- getOption("drive.scope")
    if(is.null(drive.scope)) stop("Drive scope not set")
  }
  
  google <- oauth_endpoint(NULL,"auth","token",
                           base_url = "https://accounts.google.com/o/oauth2"
  )
  
  myapp <- oauth_app("google",key = drive.app, secret = drive.secret)
  
  cred <- oauth2.0_token(google, myapp,scope = drive.scope,use_oob=TRUE)
  
  if(is.null(cred)) {
    stop("Something went wrong, no credentials were returned")
  }
  
  if("redirect_uri_mismatch" %in% ls(cred)) {
    stop("Please upgrade to the development version of httr. You can use the following to do so: `devtools::install_github(\"httr\")")
  }
  
  # google_sig <- sign_oauth2.0(cred$access_token) # This is deprecated
  
  options(drive.auth = cred)
  if(!is.null(getOption("drive.auth"))) {
    message("Authentication successful.")
  }
}
