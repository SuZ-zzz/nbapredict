# nbapredict: NBA Player Statistics Prediction and Analysis

An R package for analyzing and predicting NBA player statistics using both statistical methods and machine learning approaches.

## Overview

`nbapredict` provides comprehensive tools for:

- **Data Processing**: Load and clean NBA player statistics
- **Statistical Analysis**: Descriptive statistics, hypothesis testing, linear regression
- **Machine Learning**: Random forest models for prediction
- **Visualization**: Multiple plot types for data exploration
- **Model Comparison**: Compare statistical and ML approaches

## Installation

```r
# Install from source
install.packages("nbapredict_0.1.0.tar.gz", repos = NULL, type = "source")

# Load the package
library(nbapredict)
```

## Quick Start

```r
library(nbapredict)

# Load example data
data(nba_stats)

# Get descriptive statistics
nba_descriptive_stats(nba_stats)

# Build a regression model
model <- nba_build_regression_model(nba_stats, target = "points")
summary(model)

# Create a visualization
nba_plot_analysis(nba_stats, plot_type = "boxplot")
```

## Main Functions

1. **`nba_load_player_stats()`** - Load NBA data from CSV
2. **`nba_clean_player_stats()`** - Clean and standardize data
3. **`nba_descriptive_stats()`** - Calculate summary statistics by position
4. **`nba_build_regression_model()`** - Build linear regression model
5. **`nba_hypothesis_test()`** - Perform ANOVA test for position differences
6. **`nba_build_ml_model()`** - Build random forest model
7. **`nba_compare_models()`** - Compare statistical and ML models
8. **`nba_plot_analysis()`** - Create various visualizations

## Data

The package includes `nba_stats`, a cleaned dataset of NBA player statistics from 2015-2022.

## Vignette

For a comprehensive guide, see the vignette:

```r
vignette("nbapredict")
```

## Key Features

- **Mixed Methodology**: Combines statistical inference with machine learning
- **Well Documented**: Roxygen documentation for all functions
- **Tested**: Comprehensive test suite with testthat
- **Reproducible**: Example data and complete documentation

## Requirements

- R >= 3.5.0
- dplyr
- tidyr
- ggplot2
- readr
- randomForest

## Author


## License

MIT
