# nbapredict: NBA Player Statistics Prediction and Analysis

An R package for analyzing, visualizing, and predicting NBA player statistics using statistical methods and machine learning approaches.

## Overview

`nbapredict` provides tools for:

- **Data Processing**: Load and clean NBA player statistics
- **Statistical Analysis**: Generate descriptive statistics and perform hypothesis testing
- **Visualization**: Create plots for exploring player performance by position
- **Prediction Modeling**: Build linear regression and random forest models
- **Model Comparison**: Compare statistical and machine learning model performance

## Installation

You can install the package from the local source folder:

```r
# In RStudio, open the nbapredict project folder first
devtools::install()
```

Then load the package:

```r
library(nbapredict)
```

For development, you can also use:

```r
devtools::load_all()
```

## Quick Start

```r
library(nbapredict)

# Load the included dataset
data("nba_stats")

# View the data
head(nba_stats)

# Get descriptive statistics by player position
desc <- nba_descriptive_stats(nba_stats)
desc

# Create a visualization
nba_plot_analysis(nba_stats, plot_type = "boxplot")

# Prepare data for modeling
prepared <- nba_prepare_data(nba_stats)

# Use a smaller sample for demonstration
set.seed(123)
demo_data <- prepared[sample(nrow(prepared), 1000), ]

# Build a linear regression model
stat_model <- nba_build_regression_model(demo_data, target = "points")
summary(stat_model)

# Build a random forest machine learning model
ml_model <- nba_build_ml_model(demo_data, target = "points", ntree = 10)
ml_model

# Compare model performance
comparison <- nba_compare_models(stat_model, ml_model, demo_data)
comparison

# Perform hypothesis testing
test_result <- nba_hypothesis_test(demo_data, target = "points")
test_result
```

## Main Functions

- `nba_load_player_stats()` - Load NBA player statistics from a CSV file
- `nba_clean_player_stats()` - Clean and standardize NBA player statistics
- `nba_descriptive_stats()` - Calculate descriptive statistics by player position
- `nba_plot_analysis()` - Create visualizations for NBA player statistics
- `nba_prepare_data()` - Prepare player statistics for modeling
- `nba_build_regression_model()` - Build a linear regression model
- `nba_build_ml_model()` - Build a random forest machine learning model
- `nba_compare_models()` - Compare statistical and machine learning models
- `nba_hypothesis_test()` - Perform an ANOVA hypothesis test by player position

## Data

The package includes `nba_stats`, a cleaned dataset of historical NBA player statistics.

The dataset contains player-level season statistics such as:

- season
- player name
- position
- age
- team
- games played
- minutes played
- points
- rebounds
- assists
- points per game

## Example Workflow

A typical workflow with `nbapredict` is:

1. Load the included `nba_stats` dataset
2. Generate descriptive statistics by position
3. Visualize points per game distributions
4. Prepare the data for modeling
5. Build a linear regression model
6. Build a random forest model
7. Compare model performance
8. Conduct a hypothesis test

## Requirements

- R >= 4.1.0
- dplyr
- tidyr
- ggplot2
- readr
- randomForest
- testthat

## Package Check

The package has been checked using `devtools::check()` and passes with:

```text
0 errors | 0 warnings | 1 note
```

The remaining note is related to verifying the system time and is environment-related.

## Authors

- Haoming Wu
- Zhou Su

## License

MIT
