test_that("descriptive_stats returns correct structure", {
  result <- nba_descriptive_stats(nba_stats)
  expect_true(is.data.frame(result))
  expect_true(nrow(result) > 0)
  expect_true("mean_points" %in% names(result))
  expect_true("position" %in% names(result))
})

test_that("descriptive_stats has correct columns", {
  result <- nba_descriptive_stats(nba_stats)
  expected_cols <- c("position", "n", "mean_points", "sd_points", "mean_rebounds", "mean_assists")
  expect_true(all(expected_cols %in% names(result)))
})

test_that("regression model builds successfully", {
  model <- nba_build_regression_model(nba_stats)
  expect_true(class(model)[1] == "lm")
  expect_true(length(coef(model)) > 0)
})

test_that("regression model has expected coefficients", {
  model <- nba_build_regression_model(nba_stats)
  coef_names <- names(coef(model))
  expect_true("age" %in% coef_names)
  expect_true("minutes_played" %in% coef_names)
})

test_that("hypothesis test returns ANOVA table", {
  result <- nba_hypothesis_test(nba_stats)
  expect_true(class(result)[1] == "anova")
  expect_true(nrow(result) > 0)
})

test_that("hypothesis test has p-value", {
  result <- nba_hypothesis_test(nba_stats)
  expect_true("Pr(>F)" %in% names(result))
})
