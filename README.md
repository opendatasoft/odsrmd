
<!-- README.md is generated from README.Rmd. Please edit that file -->

# odsrmd

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=plastic)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![License](https://img.shields.io/badge/license-MIT-blue?style=plastic)](./LICENSE.md)
![GitHub R package
version](https://img.shields.io/github/r-package/v/opendatasoft/odsrmd?style=plastic)
<!-- badges: end -->

The goal of {odsrmd} is to give the possibility to R users to add
Rmarkdown files as pages on an
[Opendatasoft](https://www.opendatasoft.com/) platform. It knits an
Rmarkdown file to html, format it to JSON and send it via the
[management
API](https://help.opendatasoft.com/management-api/#introduction) on an
Opendatasoft platform.  
Note that you cannot include scripts on a classic page from the
Opendatasoft platform. Interactive libraries such as {plotly} or
{highcharter} produce script nodes when the document is knitted to html.
Hence they cannot be used in Rmarkdown documents that you intend to
display as a page on an Opendatasoft platform. For the same reasons,
{bookdown} and {flexdashboard} are not compatible with {odsrmd}.

## Installation

You can install the development version of {odsrmd} like so:

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

First, login on your Opendatasoft platform, go to the backoffice,
[create a classic
page](https://help.opendatasoft.com/platform/en/creating_content/01_creating_content_page/creating_page.html)
and write ???odsrmd-example??? as the page URL. Then, add your credentials
and domain ID to the .Renviron file. Now run the example below.

``` r
library(odsrmd)

# Create a temporary directory for reproducible example
dir_tmp <- tempfile(pattern = "proj-")
dir.create(dir_tmp)

# Use example Rmd from the {odsrmd} library
file.copy(from = system.file("examples/example_rmd.Rmd", package = "odsrmd"), to=dir_tmp)
file.copy(from = system.file("examples/style.css", package = "odsrmd"), to=dir_tmp)
path <- paste0(dir_tmp, "/example_rmd.Rmd")

# Here the page to modify on the Opendatasoft platform is named "odsrmd-example"   
page_slug <- "odsrmd-example"

# Send elements to the page on the Opendatasoft platform
update_ods_page(path, page_slug, add_extra_css = "no", chosen_languages = "all", title = NULL,
  description = NULL, tags = NULL, restricted = NULL
)
```

## Getting help

First, we suggest to try some general troubleshooting strategies:  
- Check that you added your credentials to the .Renviron file. Check
that you use a plain Rmarkdown file (no {flexdashboard}, no
{pagedown}).  
- Try to find out what the specific problem is, notably by identifying
what is *not* causing the problem.  
- ???Unplug and plug it back in???: restart R, close and reopen R.

You can also [submit an issue on
Github](https://github.com/opendatasoft/odsrmd/issues) if your question
is directly related to the package {odsrmd}. Please indicate your
version of R and of {odsrmd}, and provide a minimal version of the
Rmarkdown document you would like to publish as a page on your platform.

Your question concerns your platform, your credentials etc? Please
contact the Opendatasoft support or get in touch with your Customer
Success Manager.

## Code of Conduct

Please note that the {odsrmd} project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
