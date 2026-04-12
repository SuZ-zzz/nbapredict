#' Load NBA Player Season Statistics
#'
#' This function reads NBA player season statistics from a CSV file.
#'
#' @param file_path A character string giving the path to the CSV file.
#'
#' @return A data frame containing NBA player season statistics.
#' @export
nba_load_player_stats <- function(file_path = "data-raw/NBA Player Stats(1950 - 2022).csv") {
  if (!file.exists(file_path)) {
    stop("File does not exist. Please check the file path.")
  }

  data <- readr::read_csv(file_path, show_col_types = FALSE)

  return(data)
}
