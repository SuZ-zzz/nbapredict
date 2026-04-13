#' Plot Analysis Results
#'
#' Create various types of plots to visualize NBA player statistics and analysis results.
#' Supports boxplots, scatter plots, and histograms.
#'
#' @param data A cleaned NBA data frame (output from nba_clean_player_stats)
#' @param plot_type Type of plot to create. Options are:
#'   \describe{
#'     \item{"boxplot"}{Boxplot of points by position (default)}
#'     \item{"scatter"}{Scatter plot of points vs age, colored by position}
#'     \item{"histogram"}{Histogram of points distribution}
#'   }
#'
#' @return A ggplot2 object that can be printed or further customized
#'
#' @examples
#' \dontrun{
#'   data(nba_stats)
#'   # Boxplot
#'   nba_plot_analysis(nba_stats, plot_type = "boxplot")
#'
#'   # Scatter plot
#'   nba_plot_analysis(nba_stats, plot_type = "scatter")
#'
#'   # Histogram
#'   nba_plot_analysis(nba_stats, plot_type = "histogram")
#' }
#'
#' @export
nba_plot_analysis <- function(data, plot_type = "boxplot") {
  # Remove rows with missing values in key variables
  data_clean <- data %>%
    dplyr::select(position, points, age) %>%
    tidyr::drop_na()

  if (plot_type == "boxplot") {
    p <- ggplot2::ggplot(data_clean, ggplot2::aes(x = position, y = points)) +
      ggplot2::geom_boxplot(fill = "steelblue", alpha = 0.7) +
      ggplot2::geom_jitter(width = 0.2, alpha = 0.3, size = 1) +
      ggplot2::labs(
        title = "Points Distribution by Position",
        x = "Position",
        y = "Points per Game",
        subtitle = "Box plot with individual data points"
      ) +
      ggplot2::theme_minimal() +
      ggplot2::theme(
        plot.title = ggplot2::element_text(size = 14, face = "bold"),
        axis.title = ggplot2::element_text(size = 12)
      )

  } else if (plot_type == "scatter") {
    p <- ggplot2::ggplot(data_clean, ggplot2::aes(x = age, y = points, color = position)) +
      ggplot2::geom_point(alpha = 0.6, size = 2) +
      ggplot2::geom_smooth(method = "loess", se = TRUE, alpha = 0.2) +
      ggplot2::labs(
        title = "Points vs Age by Position",
        x = "Age",
        y = "Points per Game",
        color = "Position",
        subtitle = "Scatter plot with LOESS smoothing"
      ) +
      ggplot2::theme_minimal() +
      ggplot2::theme(
        plot.title = ggplot2::element_text(size = 14, face = "bold"),
        axis.title = ggplot2::element_text(size = 12),
        legend.position = "right"
      )

  } else if (plot_type == "histogram") {
    p <- ggplot2::ggplot(data_clean, ggplot2::aes(x = points)) +
      ggplot2::geom_histogram(bins = 30, fill = "steelblue", alpha = 0.7, color = "black") +
      ggplot2::labs(
        title = "Distribution of Points per Game",
        x = "Points per Game",
        y = "Frequency",
        subtitle = "Histogram of player scoring"
      ) +
      ggplot2::theme_minimal() +
      ggplot2::theme(
        plot.title = ggplot2::element_text(size = 14, face = "bold"),
        axis.title = ggplot2::element_text(size = 12)
      )

  } else {
    stop("Invalid plot_type. Choose from 'boxplot', 'scatter', or 'histogram'.")
  }

  return(p)
}
