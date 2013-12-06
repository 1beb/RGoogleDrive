\name{drive.file}
\alias{drive.file}
\title{Google Drive API /files "get" method}
\usage{
  drive.file(title, download.type = "html")
}
\arguments{
  \item{download.type}{Specifies the format in which the
  file will be downloaded (html, rtf, pdf, doc or odt)}

  \item{title}{Specifies the exact title of the google
  document. If you're not sure of the exact title use
  drive.list() to search}
}
\description{
  This function searches for and retrieves files from the
  Google Drive API
}

