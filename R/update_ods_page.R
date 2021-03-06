# Generated by fusen: do not edit by hand

#' Update an ODS page with the content of an Rmd file
#' 
#' All-in-one function to fill in and update an ODS page with the content of an Rmarkdown file. 
#' 
#' @inheritParams get_body_and_style
#' @inheritParams get_ods_page
#' @inheritParams create_json
#' @inheritParams put_ods_page
#'
#' @return If request is successful (i.e. the request was successfully performed and a response with HTTP status code <400 was received), an HTTP response; otherwise it throws an error. 
#' 
#' @export
#' @examples
#' \dontrun{
#' # Temporary directory for reproducible example
#' dir_tmp <- tempfile(pattern = "proj-")
#' dir.create(dir_tmp)
#' 
#' file.copy(from = system.file("examples/example_rmd.Rmd", package = "odsrmd"), to = dir_tmp)
#' file.copy(from = system.file("examples/style.css", package = "odsrmd"), to=dir_tmp)
#' # browseURL(dir_tmp)
#' path <- paste0(dir_tmp, "/example_rmd.Rmd")
#' page_slug <- "odsrmd-example"
#' 
#' update_ods_page(path, page_slug, add_extra_css = "no", chosen_languages = "all", title = NULL,
#'   description = NULL, tags = NULL, restricted = NULL
#' )
#' }
update_ods_page <- function(path, page_slug, add_extra_css = "no", chosen_languages = "all", title = NULL,
                            description = NULL, tags = NULL, restricted = NULL){

body_and_style <- get_body_and_style(path, add_extra_css = add_extra_css)

page_elements <- get_ods_page(page_slug)

json_to_send <- create_json(page_elements, body_and_style, chosen_languages = chosen_languages, 
                        title, description, tags, restricted)

put_ods_page(page_slug, json_to_send)
}
