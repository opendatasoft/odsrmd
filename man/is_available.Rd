% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_available.R
\name{is_available}
\alias{is_available}
\title{Check language availability}
\usage{
is_available(language, page_elements)
}
\arguments{
\item{language}{Character string.}

\item{page_elements}{List object from get_page(). Contains the title, description, template, language, content, tags and level of restriction of the page.}
}
\description{
Check if a given language is available on the ODS platform from the list of languages contained in page_elements.
}
\examples{
# Temporary directory for reproducible example
dir_tmp <- tempfile(pattern = "proj-")
dir.create(dir_tmp)

file.copy(from = system.file("examples/page_elements_example", package = "odsrmd"), to = dir_tmp)
page_elements <- readRDS(paste0(dir_tmp, "/page_elements_example"))

is_available("EN", page_elements)
}
