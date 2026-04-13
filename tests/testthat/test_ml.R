test_that("ML model builds successfully", {
  model <- nba_build_ml_model(nba_stats, ntree = 10)
  expect_true(class(model)[1] == "randomForest")
})

test_that("ML model can make predictions", {
  model <- nba_build_ml_model(nba_stats, ntree = 10)
  test_data <- nba_stats %>% dplyr::slice(1:10)
  predictions <- predict(model, newdata = test_data)
  expect_true(length(predictions) == 10)
  expect_true(all(!is.na(predictions)))
})

test_that("model comparison returns list", {
  stat_model <- nba_build_regression_model(nba_stats)
  ml_model <- nba_build_ml_model(nba_stats, ntree = 10)
  test_data <- nba_stats %>% dplyr::slice(1:100)
  result <- nba_compare_models(stat_model, ml_model, test_data)
  expect_true(is.list(result))
})

test_that("model comparison has all metrics", {
  stat_model <- nba_build_regression_model(nba_stats)
  ml_model <- nba_build_ml_model(nba_stats, ntree = 10)
  test_data <- nba_stats %>% dplyr::slice(1:100)
  result <- nba_compare_models(stat_model, ml_model, test_data)
  expected_metrics <- c("stat_rmse", "ml_rmse", "stat_mae", "ml_mae", "stat_r2", "ml_r2")
  expect_true(all(expected_metrics %in% names(result)))
})

test_that("model comparison metrics are numeric", {
  stat_model <- nba_build_regression_model(nba_stats)
  ml_model <- nba_build_ml_model(nba_stats, ntree = 10)
  test_data <- nba_stats %>% dplyr::slice(1:100)
  result <- nba_compare_models(stat_model, ml_model, test_data)
  expect_true(is.numeric(result$stat_rmse))
  expect_true(is.numeric(result$ml_rmse))
})
