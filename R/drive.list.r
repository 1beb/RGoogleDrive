#' Google Drive API /files "list" method
#' 
#' This function searches for a file or presents a list of files in your Google Drive
#'  
#' @param search.term A full title or search term
#' @param show.titles If \code{TRUE}, displays a list of titles found by the search term or 
#' a list of all titles if no search term was provided
#' @param download.type The format in which you wish to download the document, spreadsheet or presentation.
#' @return returns a \code{data.frame} that includes all documents, spreadsheets or 
#' presentations that match the search
#' @export drive.list

drive.list <- function(search.term=NULL, show.titles=TRUE, download.type="txt") {
  
  drive.options.test()
  
  if(is.null(getOption("drive.auth"))) {
    stop("You are not currently authorized")
  }
  
  raw.list <- GET(
    "https://www.googleapis.com/drive/v2/files?maxResults=100000", 
    config(token = getOption("drive.auth"))
  )
  
  parsed.list <- content(raw.list, as="parsed")
  
  if(raw.list$status != 200) {
    stop(paste(
      "Unable to download file listing, server returned status", 
      raw.list$status,
      ". Google's reason:",
      parsed.list$error$errors[[1]]$message))
  }
  
  file.listing <- data.frame(Title = 1,Type = 1,ID = 1, PLACE=1)
  
  for(x in 1:length(parsed.list$items)) {
    if(is.null(parsed.list$items[[x]]$mimeType)) { 
      next 
    }
    file.listing <- rbind(file.listing,
                          c(parsed.list$items[[x]]$title,
                            parsed.list$items[[x]]$mimeType, 
                            parsed.list$items[[x]]$id,x))
  }
  
  file.types <- c("application/vnd.google-apps.spreadsheet",
                  "application/vnd.google-apps.document",
                  "application/vnd.google-apps.presentation")
  
  file.listing <- file.listing[file.listing$Type %in% file.types,]
  
  file.listing$Format <- gsub("^*.*spreadsheet","spreadsheets",file.listing$Type)
  file.listing$Format <- gsub("^*.*document","documents",file.listing$Format)
  file.listing$Format <- gsub("^*.*presentation","presentations",file.listing$Format)
  
  file.link <- 1
  for(x in 1:length(file.listing$Format)) {
    if(file.listing$Format[x] == "spreadsheets") {
      file.link[x] <- paste0(
        "https://docs.google.com/feeds/download/",
        file.listing$Format[x],
        "/Export?key=",
        file.listing$ID[x],
        "&exportFormat=",
        download.type)
    } else {
      file.link[x] <- paste0(
        "https://docs.google.com/feeds/download/",
        file.listing$Format[x],
        "/Export?id=",
        file.listing$ID[x],
        "&exportFormat=",
        download.type)
    }
  }
  
  file.listing$Link <- file.link
  
  if(!is.null(search.term)) {
    
    file.listing <- file.listing[grep(search.term,file.listing$Title),]
    
    if(nrow(file.listing) == 0) { 
      stop("Your search term did not return any results")
    }
    
    if(length(file.listing$Title) > 1) {
      message("More than one document matched your search...")
      if(show.titles) print(file.listing$Title)
    } else { 
      message("One document matches your search")
      if(show.titles) print(file.listing$Title)
    }
  }
  
  if(is.null(search.term) & length(file.listing$Title > 1)) {
      message("No search terms were specified, returning a list of the most recent documents")
      if(show.titles) print(file.listing$Title)
  }
      
  return(invisible(file.listing))
}