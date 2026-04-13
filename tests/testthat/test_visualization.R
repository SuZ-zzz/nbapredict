test_that("plot function returns ggplot object", {
  p <- nba_plot_analysis(nba_stats, plot_type = "boxplot")
  expect_true(class(p)[1] == "gg")
})

test_that("boxplot works", {
  p <- nba_plot_analysis(nba_stats, plot_type = "boxplot")
  expect_true(class(p)[1] == "gg")
  expect_true(!is.null(p$labels$title))
})

test_that("scatter plot works", {
  p <- nba_plot_analysis(nba_stats, plot_type = "scatter")
  expect_true(class(p)[1] == "gg")
  expect_true(!is.null(p$labels$title))
})

test_that("histogram works", {
  p <- nba_plot_analysis(nba_stats, plot_type = "histogram")
  expect_true(class(p)[1] == "gg")
  expect_true(!is.null(p$labels$title))
})

test_that("invalid plot type raises error", {
  expect_error(nba_plot_analysis(nba_stats, plot_type = "invalid"))
})
