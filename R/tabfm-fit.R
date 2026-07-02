#' Fit tabfm Tabular Foundation Model
#'
#' @param X x training data
#' @param y y training data
#' @param problem_type either "classification" or "regression"
#' @param ... for tabfm additional hyperparameters
#'
#' @returns a tabfm fit
#'
#' @export
tabfm_fit <- \(
  X,
  y,
  problem_type = "classification",
  ...
) {
  ckpt <- .pkg_env$tabfm$tabfm_v1_0_0_jax$load()
  if (problem_type == "classification") {
    cls <- .pkg_env$tabfm$TabFMClassifier(ckpt, ...)

    fit <- cls$fit(
      X,
      y
    )
  } else if (problem_type == "regression") {
    reg <- .pkg_env$tabfm$TabFMRegressor(ckpt, ...)

    fit <- reg$fit(
      X,
      y
    )
  }

  return(fit)
}
