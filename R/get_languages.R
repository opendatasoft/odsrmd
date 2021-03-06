# Generated by fusen: do not edit by hand

#' Get all languages available on the ODS platform
#' 
#' Retrieve all languages available on the ODS platform from the information contained in page_elements.
#' 
#' @param page_elements List object from get_page(). Contains the title, description, template, language, content, tags and level of restriction of the page. 
#' @param verbose A logical TRUE/FALSE indicating if the function should output a message listing the languages available on the platform.   
#'
#' @return A vector of characters. 
#' @importFrom glue glue_collapse glue
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
#' all_languages <- get_languages(page_elements)
get_languages <- function(page_elements, verbose = TRUE) {
  all_languages <- names(page_elements$content$html)
  all_languages_list <- glue_collapse(all_languages, sep = ", ") %>% toupper()

  if (verbose) {
    message(glue("Languages available on the platform: {all_languages_list}."))
  }

  all_languages
}
