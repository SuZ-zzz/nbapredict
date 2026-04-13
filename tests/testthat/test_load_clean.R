test_that("load function returns data frame", {
  expect_true(is.data.frame(nba_stats))
  expect_true(nrow(nba_stats) > 0)
})

test_that("load function has required columns after cleaning", {
  expect_true("player_name" %in% names(nba_stats))
  expect_true("points" %in% names(nba_stats))
  expect_true("position" %in% names(nba_stats))
  expect_true("age" %in% names(nba_stats))
  expect_true("minutes_played" %in% names(nba_stats))
})

test_that("clean function removes index columns", {
  expect_false("...1" %in% names(nba_stats))
  expect_false("Unnamed: 0" %in% names(nba_stats))
})
