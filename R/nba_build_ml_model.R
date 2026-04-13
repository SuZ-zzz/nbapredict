#' Build Random Forest Model
#'
#' Build a random forest model for predicting NBA player statistics.
#' This machine learning approach can capture non-linear relationships
#' and interactions between variables.
#'
#' @param data A cleaned NBA data frame (output from nba_clean_player_stats)
#' @param target A character string specifying the target variable.
#'               Default is "points". Other options include "total_rebounds", "assists", etc.
#' @param ntree Number of trees to grow. Default is 100.
#'
#' @return A random forest model object (class "randomForest")
#'
#' @examples
#' \dontrun{
#'   data(nba_stats)
#'   model <- nba_build_ml_model(nba_stats, target = "points")
#'   predictions <- predict(model, newdata = nba_stats[1:10, ])
#' }
#'
#' @export
nba_build_ml_model <- function(data, target = "points", ntree = 100) {
  # Remove rows with missing values in key variables
  data_clean <- data %>%
    dplyr::select(all_of(c(target, "age", "minutes_played", "position", "season"))) %>%
    tidyr::drop_na()

  # Build the formula
  formula <- as.formula(paste(target, "~ age + minutes_played + position + season"))

  # Fit the random forest model
  model <- randomForest::randomForest(formula, data = data_clean, ntree = ntree)

  return(model)
}


#' Compare Statistical and Machine Learning Models
#'
#' Compare the performance of linear regression and random forest models
#' using various evaluation metrics (RMSE, MAE, R-squared).
#'
#' @param stat_model A linear regression model (output from nba_build_regression_model)
#' @param ml_model A random forest model (output from nba_build_ml_model)
#' @param test_data Test data for evaluation
#'
#' @return A list containing comparison metrics:
#'   \item{stat_rmse}{RMSE of statistical model}
#'   \item{ml_rmse}{RMSE of machine learning model}
#'   \item{stat_mae}{MAE of statistical model}
#'   \item{ml_mae}{MAE of machine learning model}
#'   \item{stat_r2}{R-squared of statistical model}
#'   \item{ml_r2}{R-squared of machine learning model}
#'
#' @details
#' RMSE (Root Mean Squared Error): Lower is better
#' MAE (Mean Absolute Error): Lower is better
#' R-squared: Higher is better (0-1 scale)
#'
#' @examples
#' \dontrun{
#'   data(nba_stats)
#'   stat_model <- nba_build_regression_model(nba_stats)
#'   ml_model <- nba_build_ml_model(nba_stats)
#'   test_data <- nba_stats %>% dplyr::slice(1:500)
#'   comparison <- nba_compare_models(stat_model, ml_model, test_data)
#'   print(comparison)
#' }
#'
#' @export
nba_compare_models <- function(stat_model, ml_model, test_data) {
  # Get target variable name from the model formula
  target <- all.vars(stats::formula(stat_model))[1]

  # Make predictions
  stat_pred <- stats::predict(stat_model, newdata = test_data)
  ml_pred <- stats::predict(ml_model, newdata = test_data)

  # Get actual values
  actual <- test_data[[target]]

  # Remove NA values
  valid_idx <- !is.na(stat_pred) & !is.na(ml_pred) & !is.na(actual)
  stat_pred <- stat_pred[valid_idx]
  ml_pred <- ml_pred[valid_idx]
  actual <- actual[valid_idx]

  # Calculate metrics
  stat_rmse <- sqrt(mean((stat_pred - actual)^2, na.rm = TRUE))
  ml_rmse <- sqrt(mean((ml_pred - actual)^2, na.rm = TRUE))

  stat_mae <- mean(abs(stat_pred - actual), na.rm = TRUE)
  ml_mae <- mean(abs(ml_pred - actual), na.rm = TRUE)

  # Calculate R-squared
  ss_res_stat <- sum((stat_pred - actual)^2)
  ss_res_ml <- sum((ml_pred - actual)^2)
  ss_tot <- sum((actual - mean(actual))^2)

  stat_r2 <- 1 - (ss_res_stat / ss_tot)
  ml_r2 <- 1 - (ss_res_ml / ss_tot)

  # Return comparison results
  result <- list(
    stat_rmse = stat_rmse,
    ml_rmse = ml_rmse,
    stat_mae = stat_mae,
    ml_mae = ml_mae,
    stat_r2 = stat_r2,
    ml_r2 = ml_r2
  )

  return(result)
}
