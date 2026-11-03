# DATA 621 — Soccer Regression Project

## Project Overview

**Beyond Possession: Do Traditional Soccer Statistics Really Explain Goal Scoring?**

This project examines the relationships between traditional soccer statistics and goals scored across five European domestic leagues during the 2017–2018 season.

Using exploratory data analysis and regression modeling, we aim to understand how passing activity, pass accuracy, shot attempts, and home-field advantage relate to goal scoring, and whether these relationships differ across teams and leagues.

## Dataset

The cleaned dataset contains:

- **1,826 matches**
- **3,652 team-match observations**
- **98 teams**
- **Five leagues:** England, Spain, Italy, Germany, and France
- **16 variables** covering match information, goals, shots, passing, and home/away status

Each observation represents one team's performance in one match. Every match contributes exactly two observations, one for each participating team.

The dataset has been validated for missing values, duplicate team-match records, match consistency, and team-name encoding issues.

## Repository Structure

```text
d621/
└── final/
    ├── DATA621_Final_Data_Preparationd.Rmd
    ├── DATA621_Soccer_Final_Project_Team_Plan.docx
    ├── ideas.md
    ├── matches.zip
    │
    └── processed_data/
        ├── README.md
        ├── soccer_team_match_2017_18.csv
        ├── soccer_data_dictionary.csv
        ├── soccer_home_away_summary.csv
        ├── soccer_match_validation.csv
        ├── soccer_numeric_summary.csv
        ├── soccer_shot_type_audit.csv
        └── starter_regression.R
```

## Files and Descriptions

### Main Dataset

**`processed_data/soccer_team_match_2017_18.csv`**

The primary cleaned dataset for exploratory data analysis (EDA) and regression modeling. This is the main file team members should use for their analysis.

**`processed_data/soccer_data_dictionary.csv`**

Definitions and descriptions of the 16 variables in the cleaned dataset.

### Supporting Data and Validation

**`processed_data/soccer_home_away_summary.csv`**

Descriptive statistics comparing home and away team performance across leagues.

**`processed_data/soccer_numeric_summary.csv`**

Summary statistics for numeric variables, including goals, shots, and passing metrics.

**`processed_data/soccer_match_validation.csv`**

Match-level validation results confirming the consistency of the processed data.

**`processed_data/soccer_shot_type_audit.csv`**

Summary of shot categories and Wyscout accuracy tags used to assess the shot-on-target proxy.

### Code and Documentation

**`DATA621_Final_Data_Preparationd.Rmd`**

R Markdown code documenting the original data preparation, cleaning, aggregation, validation, and export process.

**`processed_data/starter_regression.R`**

Initial code for baseline OLS, team fixed-effects, league interaction, and Poisson regression models. These are starting specifications and will be refined during the modeling phase.

**`DATA621_Soccer_Final_Project_Team_Plan.docx`**

Team project plan outlining the research objectives, responsibilities, and timeline.

## Getting Started in R

Team members do **not** need to download or process the original Wyscout ZIP files to begin their analysis.

### Step 1: Clone or download the repository

Download the repository from GitHub and open the `final` folder in RStudio.

### Step 2: Load the cleaned dataset

Set your working directory to the `final` folder and run:

```r
library(readr)
library(dplyr)

soccer_data <- read_csv(
  "processed_data/soccer_team_match_2017_18.csv",
  show_col_types = FALSE
)

glimpse(soccer_data)
summary(soccer_data)
```

### Step 3: Verify the dataset

```r
# Dataset dimensions
dim(soccer_data)

# Number of matches and teams
soccer_data %>%
  summarise(
    matches = n_distinct(match_id),
    teams = n_distinct(team_id),
    observations = n()
  )

# Check missing values
colSums(is.na(soccer_data))
```

Expected results:

- 3,652 rows and 16 columns
- 1,826 unique matches
- 98 unique teams
- No missing values

Once loaded, the dataset is ready for EDA, visualization, and regression modeling.

## Important Notes

- **Raw data:** You only need the cleaned CSV file to start your analysis. The original ZIP files contain the detailed match and player activity data used to create it, so there's no need to download or process those again.

- **Ball possession (`pass_share_pct`):** In soccer, possession refers to how much of the game a team controls the ball. Our dataset estimates this using the percentage of passes made by each team during a match. For example, if Team A makes 600 passes and Team B makes 400, Team A's pass share would be 60%. This isn't the same as the actual percentage of time a team has the ball, but it gives us a useful estimate of passing activity.

- **Shots on target (`on_target_tagged`):** A shot on target is generally a shot that scores or would have gone into the goal if the goalkeeper hadn't stopped it. Our dataset estimates this using a tag in the original data that identifies accurate shots. However, we found four shots recorded as goals that weren't marked with this tag, so this variable should be treated as an estimate rather than an exact count.

- **Dataset structure:** Each soccer match has two teams, so every match appears twice in our dataset: once for each team. For example, if Arsenal beats Chelsea 2–1, one row records Arsenal scoring 2 goals and another records Chelsea scoring 1 goal. Since both rows describe the same match, they aren't completely independent.

- **Model evaluation:** When dividing the data into training and testing sets, both teams from the same match should stay together. We can use `match_id` to make sure the same match doesn't appear in both sets, which helps us evaluate our models more fairly.

- **Interpreting results:** Our goal is to understand which statistics are associated with scoring more goals, not necessarily what causes a team to score. For example, if teams that make more passes tend to score more goals, that doesn't automatically mean making more passes causes more goals.

## Data Preparation

The raw Wyscout match and event JSON files were processed into a single analysis-ready dataset using R.

The process included:

1. Extracting match results and team information.
2. Aggregating individual events into team-match statistics.
3. Calculating pass accuracy and pass-share percentages.
4. Cleaning team-name encoding.
5. Validating match consistency and missing values.
6. Exporting the cleaned dataset and supporting summaries.

The large raw event archives are not included in GitHub. The processed CSV contains the information needed for the team's planned EDA and regression analysis.

## Next Steps

With data preparation completed, the remaining project work includes:

- Exploratory data analysis and visualizations.
- Baseline multiple linear regression.
- Team fixed-effects and league interaction models.
- Poisson regression for goal counts.
- Model diagnostics, evaluation, and comparison.
- Final report and presentation.

The cleaned dataset provides a common starting point for all team members to conduct their analyses consistently.
