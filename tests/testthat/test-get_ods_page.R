# Generated by fusen: do not edit by hand

page_slug <- "odsrmd-example"
page_elements <- get_ods_page(page_slug)

test_that("get_ods_page works", {
  expect_true(inherits(get_ods_page, "function"))
  expect_type(page_elements, "list")
  expect_length(page_elements, 13)
  expect_error(get_ods_page(page_slug = ""))
  expect_identical(names(page_elements), c("slug", "title", "description", "template", "content",
                                           "tags", "restricted", "pushed_by_parent", 
                                           "has_subdomain_copies", "created_at", "last_modified",
                                           "last_modified_user", "author"))
  expect_type(page_elements$title, "list")
  expect_type(page_elements$content, "list")
  expect_type(page_elements$tags, "list")
  expect_type(page_elements$last_modified_user, "list")
  expect_type(page_elements$author, "list")
})

