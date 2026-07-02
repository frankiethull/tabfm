.pkg_env <- new.env()

.pkg_env$tabfm <- NULL

.onLoad <- function(...) {
  reticulate::py_require(
    "tabfm[jax]@https://github.com/google-research/tabfm.git"
  )
  .pkg_env$tabfm <- reticulate::import(
    "tabfm",
    delay_load = TRUE
  )
}
