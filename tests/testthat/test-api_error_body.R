# Generated by fusen: do not edit by hand

test_that("api_error_body works", {
  expect_true(inherits(api_error_body, "function")) 
})

# Temporary directory for reproducible example
dir_tmp <- tempfile(pattern = "proj-")
dir.create(dir_tmp)

file.copy(from = system.file("examples/example_rmd.Rmd", package = "odsrmd"), to = dir_tmp)
file.copy(from = system.file("examples/style.css", package = "odsrmd"), to = dir_tmp)
file.copy(from = system.file("examples/example_flexdashboard.Rmd", package = "odsrmd"), to = dir_tmp)
file.copy(from = system.file("examples/example_pagedown.Rmd", package = "odsrmd"), to = dir_tmp)
# browseURL(dir_tmp)
path1 <- paste0(dir_tmp, "/example_rmd.Rmd")
path2 <- paste0(dir_tmp, "/example_flexdashboard.Rmd")
path3 <- paste0(dir_tmp, "/example_pagedown.Rmd")

test_that("detect_unsupported_format works", {
  expect_true(inherits(detect_unsupported_format, "function"))
  expect_silent(detect_unsupported_format(path1))
  expect_error(detect_unsupported_format(path2))
  expect_error(detect_unsupported_format(path3))
})

# Temporary directory for reproducible example
dir_tmp <- tempfile(pattern = "proj-")
dir.create(dir_tmp)

file.copy(from = system.file("examples/example_rmd.Rmd", package = "odsrmd"), to = dir_tmp)
file.copy(from = system.file("examples/style.css", package = "odsrmd"), to = dir_tmp)
file.copy(from = system.file("examples/example_rmd_wo_css.Rmd", package = "odsrmd"), to = dir_tmp)
# browseURL(dir_tmp)
path1 <- paste0(dir_tmp, "/example_rmd.Rmd")
path2 <- paste0(dir_tmp, "/example_rmd_wo_css.Rmd")

test_that("add_css works", {
  expect_true(inherits(add_css, "function"))
  expect_type(add_css(path1), "character")
  expect_error(add_css(path2))
})
