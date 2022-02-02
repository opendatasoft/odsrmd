
<!-- README.md is generated from README.Rmd. Please edit that file -->

# odsrmd

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of {odsrmd} is to give the possibility to R users to add
Rmarkdown files as pages on an Opendatasoft platform. It knits an
Rmarkdown file to html, format it to JSON and send it via the management
API on an Opendatasoft platform.  
Note that you cannot include scripts on a classic page from the
Opendatasoft platform. Interactive libraries such as {plotly} or
{highcharter} produce script nodes when the document is knitted to html.
Hence they cannot be used in Rmarkdown documents that you intend to
display as a page on an Opendatasoft platform. For the same reasons,
{bookdown} and {flexdashboard} are not compatible with {odsrmd}.

## Installation

You can install the development version of odsrmd like so:

``` r
# remotes::install_github("odsrmd")
```

## Authentication

To use this package, you must be granted credentials to access an
Opendatasoft platform. These credentials should be stored in your
.Renviron file.

Open the .Renviron file:

``` r
usethis::edit_r_environ()
```

Add the following environment variables: `ODS_DOMAIN_ID`, `ODS_USERNAME`
and `ODS_PASSWORD`. The `ODS_DOMAIN_ID` variable corresponds to the
domain ID of your Opendatasoft domain. `ODS_USERNAME` and `ODS_PASSWORD`
correspond respectively to your username and password to access the
platform.  
Be very careful to not display such information in a script and add the
.Renviron file to your .gitignore file.

``` r
usethis::use_git_ignore(ignores = ".Renviron")
```

## Example

Here is a minimal example on how to use the {odsrmd} package.

First, login on your Opendatasoft platform, go to the backoffice and
create a classic page and write “test” as the page URL. Then, add your
credentials and domain ID to the .Renviron file. Now run the example
below.

``` r
library(odsrmd)

# Create a temporary directory for reproducible example
dir_tmp <- tempfile(pattern = "proj-")
dir.create(dir_tmp)

# Use example Rmd from the {odsrmd} library
file.copy(from = system.file("data/example_rmd.Rmd", package = "odsrmd"), to=dir_tmp)
path <- paste0(dir_tmp, "/example_rmd.Rmd")

# Here the page to modify on the Opendatasoft platform is named "test"   
page_slug <- "test"

# Knit the Rmarkdown file
body_and_style <- get_body_and_style(path)

# Get elements from the page on the Opendatasoft platform
page_elements <- get_ods_page(page_slug)

# Prepare elements to send on the page on the Opendatasoft platform
json_to_send <- create_json(page_elements, body_and_style, language = NULL, 
                        title = NULL, description = NULL, template = NULL, 
                        tags = NULL, restricted = NULL)

# Send elements to the page on the Opendatasoft platform
put_ods_page(page_slug, json_to_send)
```

## Code of Conduct

Please note that the odsrmd project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.