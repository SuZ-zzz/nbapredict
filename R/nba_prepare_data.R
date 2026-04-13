#' Prepare NBA Data for Analysis
#'
#' This function prepares the NBA data by:
#' 1. Calculating points per game (PPG) from total points
#' 2. Filtering out players with insufficient playing time
#' 3. Removing rows with missing critical values
#'
#' @param data A cleaned NBA data frame
#' @param min_minutes Minimum minutes played to include (default: 100)
#'
#' @return A prepared data frame ready for analysis
#' @export
nba_prepare_data <- function(data, min_minutes = 100) {
  prepared_data <- data %>%
    # Calculate points per game
    dplyr::mutate(
      ppg = dplyr::if_else(games_played > 0, points / games_played, 0)
    ) %>%
    # Filter out players with insufficient playing time
    dplyr::filter(minutes_played >= min_minutes) %>%
    # Remove rows with missing critical values
    tidyr::drop_na(ppg, age, position, season) %>%
    # Remove any negative or extreme values
    dplyr::filter(ppg >= 0, ppg <= 50, age >= 18, age <= 50)

  return(prepared_data)
}
