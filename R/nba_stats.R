#' NBA Player Statistics Data
#'
#' A prepared dataset of NBA player season statistics used for analysis
#' and modeling in the `nbapredict` package.
#'
#' The dataset is derived from the original NBA player statistics CSV file
#' and includes cleaned variables for player performance and derived
#' points per game (`ppg`).
#'
#' @format A data frame with multiple rows and 31 variables:
#' \describe{
#'   \item{season}{Season year}
#'   \item{player_name}{Player name}
#'   \item{position}{Player position}
#'   \item{age}{Player age}
#'   \item{team}{Team abbreviation}
#'   \item{games_played}{Number of games played}
#'   \item{games_started}{Number of games started}
#'   \item{minutes_played}{Total minutes played}
#'   \item{field_goals}{Field goals made}
#'   \item{field_goal_attempts}{Field goal attempts}
#'   \item{field_goal_pct}{Field goal percentage}
#'   \item{three_points}{Three-point field goals made}
#'   \item{three_point_attempts}{Three-point attempts}
#'   \item{three_point_pct}{Three-point percentage}
#'   \item{two_points}{Two-point field goals made}
#'   \item{two_point_attempts}{Two-point attempts}
#'   \item{two_point_pct}{Two-point percentage}
#'   \item{effective_field_goal_pct}{Effective field goal percentage}
#'   \item{free_throws}{Free throws made}
#'   \item{free_throw_attempts}{Free throw attempts}
#'   \item{free_throw_pct}{Free throw percentage}
#'   \item{offensive_rebounds}{Offensive rebounds}
#'   \item{defensive_rebounds}{Defensive rebounds}
#'   \item{total_rebounds}{Total rebounds}
#'   \item{assists}{Assists}
#'   \item{steals}{Steals}
#'   \item{blocks}{Blocks}
#'   \item{turnovers}{Turnovers}
#'   \item{personal_fouls}{Personal fouls}
#'   \item{points}{Total points scored}
#'   \item{ppg}{Points per game}
#' }
#'
#' @source NBA Player Stats dataset.
"nba_stats"
