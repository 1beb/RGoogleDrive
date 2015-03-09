#' Google Drive API /files "get" method
#' 
#' This function searches for and retrieves files from the Google Drive API
#' @param download.type Which-ever format is appropriate for your document type
#' @param title The exact title of the document you wish to download
#' @export drive.file

drive.file <- function(title,download.type="txt") {

  file.listing <- drive.list(title,show.titles=FALSE)
  
  if(nrow(file.listing) > 1) { 
    stop("More than one file is being returned by your title. Please use the exact text. If you are using the exact text, check to make sure that there are not documents with the same name")
  }
  if(!is.null(download.type)) { 
    file.listing$Link <- gsub("txt",download.type,file.listing$Link)
  }

  response <- GET(file.listing$Link,config(token = getOption("drive.auth")))
  
  
  if(download.type == "html") { 
    file.data <- content(response, as="text")
  } else { 
    file.data <- content(response, as="parsed")
  }
  
  return(file.data)
}