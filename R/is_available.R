# Generated by fusen: do not edit by hand

#' Check language availability
#' 
#' Check if a given language is available on the ODS platform from the list of languages contained in page_elements. 
#' 
#' @param language Character string. 
#' @param page_elements List object from get_page(). Contains the title, description, template, language, content, tags and level of restriction of the page. 
#'
#' @importFrom glue glue
#' 
#' @export
#' @examples
#' # Temporary directory for reproducible example
#' dir_tmp <- tempfile(pattern = "proj-")
#' dir.create(dir_tmp)
#' 
#' file.copy(from = system.file("examples/page_elements_example", package = "odsrmd"), to = dir_tmp)
#' page_elements <- readRDS(paste0(dir_tmp, "/page_elements_example"))
#' 
#' is_available("EN", page_elements)
is_available <- function(language, page_elements) {
  if (!tolower(language) %in% get_languages(page_elements, verbose = FALSE)) {
    stop(
      glue("Language '{language}' is not available on the platform. To add more languages to your platform, please contact your administrator or Opendatasoft support.")
    )
  }
}
