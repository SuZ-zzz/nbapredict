#' Build Linear Regression Model
#'
#' Build a linear regression model to analyze factors affecting NBA player statistics.
#' The model includes age, minutes played, position, and season as predictors.
#'
#' @param data A cleaned NBA data frame (output from nba_clean_player_stats)
#' @param target A character string specifying the target variable.
#'               Default is "points". Other options include "total_rebounds", "assists", etc.
#'
#' @return A linear regression model object (class "lm")
#'
#' @examples
#' \dontrun{
#'   data(nba_stats)
#'   model <- nba_build_regression_model(nba_stats, target = "points")
#'   summary(model)
#' }
#'
#' @export
nba_build_regression_model <- function(data, target = "points") {
  # Remove rows with missing values in key variables
  data_clean <- data %>%
    dplyr::select(all_of(c(target, "age", "minutes_played", "position", "season"))) %>%
    tidyr::drop_na()

  # Build the formula
  formula <- as.formula(paste(target, "~ age + minutes_played + position + season"))

  # Fit the model
  model <- stats::lm(formula, data = data_clean)

  return(model)
}


#' Hypothesis Test: Position Differences
#'
#' Perform an ANOVA test to check if there are significant differences
#' in player statistics across different positions.
#'
#' @param data A cleaned NBA data frame (output from nba_clean_player_stats)
#' @param target A character string specifying the target variable.
#'               Default is "points". Other options include "total_rebounds", "assists", etc.
#'
#' @return An ANOVA table (class "anova")
#'
#' @details
#' The null hypothesis is that all positions have the same mean for the target variable.
#' If p-value < 0.05, we reject the null hypothesis and conclude that positions
#' have significantly different statistics.
#'
#' @examples
#' \dontrun{
#'   data(nba_stats)
#'   result <- nba_hypothesis_test(nba_stats, target = "points")
#'   print(result)
#' }
#'
#' @export
nba_hypothesis_test <- function(data, target = "points") {
  # Remove rows with missing values
  data_clean <- data %>%
    dplyr::select(all_of(c(target, "position"))) %>%
    tidyr::drop_na()

  # Build the formula
  formula <- as.formula(paste(target, "~ position"))

  # Perform ANOVA
  result <- stats::anova(stats::aov(formula, data = data_clean))

  return(result)
}
