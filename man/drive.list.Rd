\name{drive.list}
\alias{drive.list}
\title{Google Drive API /files "list" method}
\usage{
  drive.list(search.term = NULL, show.titles = TRUE,
    download.type = "txt")
}
\arguments{
  \item{search.term}{A full title or search term}

  \item{show.titles}{If \code{TRUE}, displays a list of
  titles found by the search term or a list of all titles
  if no search term was provided}

  \item{download.type}{The format in which you wish to
  download the document, spreadsheet or presentation.}
}
\value{
  returns a \code{data.frame} that includes all documents,
  spreadsheets or presentations that match the search
}
\description{
  This function searches for a file or presents a list of
  files in your Google Drive
}

