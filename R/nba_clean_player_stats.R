#' Clean NBA Player Season Statistics
#'
#' This function cleans NBA player season statistics by removing
#' unnecessary columns and renaming important variables.
#'
#' @param data A data frame containing raw NBA player season statistics.
#'
#' @return A cleaned data frame.
#' @export
nba_clean_player_stats <- function(data) {
  clean_data <- data |>
    dplyr::select(-dplyr::any_of(c("...1", "Unnamed: 0"))) |>
    dplyr::rename(
      season = Season,
      player_name = Player,
      position = Pos,
      age = Age,
      team = Tm,
      games_played = G,
      games_started = GS,
      minutes_played = MP,
      field_goals = FG,
      field_goal_attempts = FGA,
      field_goal_pct = `FG%`,
      three_points = `3P`,
      three_point_attempts = `3PA`,
      three_point_pct = `3P%`,
      two_points = `2P`,
      two_point_attempts = `2PA`,
      two_point_pct = `2P%`,
      effective_field_goal_pct = `eFG%`,
      free_throws = FT,
      free_throw_attempts = FTA,
      free_throw_pct = `FT%`,
      offensive_rebounds = ORB,
      defensive_rebounds = DRB,
      total_rebounds = TRB,
      assists = AST,
      steals = STL,
      blocks = BLK,
      turnovers = TOV,
      personal_fouls = PF,
      points = PTS
    )
  
  return(clean_data)
}
