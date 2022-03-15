# odsrmd 0.1.0

## Enhancements

`get_body_and_style()` now handles css files mentioned in the the Rmarkdown yaml header. 

`create_json()` now handles several languages. By default, the `chosen_language` parameter is set to "all", meaning that all language versions of the page are updated by `create_json()`.        


## New features

A new function called `update_ods_page()` combines all the steps from knitting the Rmarkdown document to an html document, and preparing the html and css elements, to sending them on an OpenDataSoft platform. It gives the opportunity to perform the whole process in one command.       


# odsrmd 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
