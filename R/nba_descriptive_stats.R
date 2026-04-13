#' Descriptive Statistics by Position
#'
#' Calculate descriptive statistics for NBA player statistics grouped by position.
#' This function provides summary statistics including mean, standard deviation,
#' and count for key performance indicators.
#'
#' @param data A cleaned NBA data frame (output from nba_clean_player_stats)
#'
#' @return A data frame with summary statistics grouped by position, including:
#'   \item{position}{Player position}
#'   \item{n}{Number of observations}
#'   \item{mean_points}{Mean points per game}
#'   \item{sd_points}{Standard deviation of points}
#'   \item{mean_rebounds}{Mean rebounds per game}
#'   \item{mean_assists}{Mean assists per game}
#'
#' @examples
#' \dontrun{
#'   data(nba_stats)
#'   stats <- nba_descriptive_stats(nba_stats)
#'   print(stats)
#' }
#'
#' @export
nba_descriptive_stats <- function(data) {
  result <- data %>%
    dplyr::group_by(position) %>%
    dplyr::summarise(
      n = dplyr::n(),
      mean_points = mean(points, na.rm = TRUE),
      sd_points = stats::sd(points, na.rm = TRUE),
      mean_rebounds = mean(total_rebounds, na.rm = TRUE),
      mean_assists = mean(assists, na.rm = TRUE),
      .groups = "drop"
    )

  return(result)
}
