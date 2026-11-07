# DATA 621 — Soccer Regression Project

## Project Overview

**Beyond Possession: Do Traditional Soccer Statistics Really Explain Goal Scoring?**

This project examines the relationships between traditional soccer statistics and goals scored across five European domestic leagues during the 2017–2018 season.

Using exploratory data analysis (EDA) and regression modeling, we aim to understand how passing activity, pass accuracy, shot attempts, and home-field advantage relate to goal scoring, and whether these relationships differ across teams and leagues.

For those unfamiliar with soccer, the objective of a match is simple: score more goals than the opposing team. However, having more possession (control of the ball), completing more passes, or taking more shots doesn't necessarily mean a team will score more goals.

Our project explores which of these statistics are most strongly associated with scoring and whether different regression techniques provide better explanations of goal-scoring patterns.

## Research Questions

Our analysis focuses on four main questions:

1. **Passing and possession:** Do teams that make a larger share of passes during a match tend to score more goals?
2. **Important statistics:** Which match statistics, such as shots, passing accuracy, and home advantage, are most strongly associated with goals scored?
3. **Team and league differences:** Do these relationships change when accounting for differences between teams or comparing different European leagues?
4. **Model comparison:** How do multiple linear regression and Poisson regression compare when estimating goals from observed match statistics?

## Regression Models

We plan to use four regression approaches to answer our research questions. Each model builds on the previous analysis by examining different factors that may influence the relationship between match statistics and goals.

### Model 1: Multiple Linear Regression (Baseline)

**Purpose:** Establish a starting point for understanding how traditional match statistics relate to goals scored.

Multiple linear regression examines the relationship between one outcome variable and several predictors.

For our project:

- **Outcome:** `goals` — number of goals scored by a team in a match.
- **Predictors:** `shots`, `pass_share_pct`, `pass_accuracy_pct`, `home`, and `league`.

For example, this model can help us estimate whether teams that take more shots tend to score more goals after accounting for their passing statistics and whether they played at home.

**What we'll examine:**
- Which statistics have the strongest associations with scoring?
- Are the relationships statistically significant?
- How much variation in goals does the model explain?

**Limitation:** Linear regression treats goals as a continuous numerical outcome, even though goals are counts. This means the model can potentially estimate negative goal values, which aren't possible in an actual soccer match.

### Model 2: Team Fixed-Effects Regression

**Purpose:** Account for differences between teams that could influence goal scoring.

Not all soccer teams are equally strong. Some consistently have better players, stronger offenses, or more resources than others.

For example, if a strong team tends to make more passes and score more goals, we don't want to assume that passing alone explains its scoring success.

A team fixed-effects model accounts for stable differences between teams by including a separate effect for each team.

**What we'll examine:**
- Do passing and shooting statistics remain associated with goals after accounting for team differences?
- Do the relationships change compared with the baseline model?
- How much additional variation can we explain by accounting for team-specific characteristics?

This model helps us distinguish relationships associated with match-to-match performance from persistent differences between teams.

### Model 3: League Interaction Regression

**Purpose:** Determine whether the relationship between passing activity and goals differs across European leagues.

Our dataset includes five domestic leagues: England, Spain, Italy, Germany, and France.

Different leagues may have different playing styles. For example, some teams may rely more heavily on maintaining possession and making passes, while others may focus on creating scoring opportunities through faster attacks.

An interaction model allows us to test whether the association between passing activity and goals changes depending on the league.

Specifically, we'll examine an interaction between `pass_share_pct` and `league`.

**What we'll examine:**
- Is passing activity associated with goals in the same way across all five leagues?
- Are there leagues where passing activity has a stronger or weaker relationship with scoring?
- Does allowing league-specific relationships improve the model?

This approach helps us determine whether one overall relationship adequately describes all five leagues.

### Model 4: Poisson Regression (Goal Count Model)

**Purpose:** Compare traditional linear regression with a model specifically designed for count data.

Unlike continuous measurements such as height or temperature, goals are counts. A team can score 0, 1, 2, or 3 goals, but it cannot score a negative number of goals.

Poisson regression is commonly used when the outcome represents the number of times an event occurs.

For our project, we'll use Poisson regression to estimate the expected number of goals scored based on match statistics such as shots, passing activity, passing accuracy, home advantage, and league.

**How it differs from linear regression:**

| Multiple Linear Regression | Poisson Regression |
|---|---|
| Designed primarily for continuous outcomes | Designed for count outcomes |
| Can estimate negative goal values | Estimates nonnegative expected goal counts |
| Models additive changes in expected goals | Models multiplicative changes in expected goals |
| Serves as our baseline model | Provides an alternative suited to goal counts |

For example, suppose taking more shots is associated with scoring more goals:

- Linear regression might estimate that each additional shot is associated with 0.08 additional goals on average.
- Poisson regression might estimate that each additional shot is associated with an 8% increase in expected goals.

These are hypothetical examples, not actual findings from our dataset.

**What we'll examine:**
- Does Poisson regression estimate goal counts more accurately than linear regression?
- Does it provide a better fit for the distribution of goals?
- Do the same statistics remain important across both approaches?
- Are the assumptions of Poisson regression reasonable for our data?

### Model Evaluation and Comparison

After fitting the models, we'll compare their results and assess how well they explain or estimate goal scoring.

Our evaluation will include:

- **MAE (Mean Absolute Error):** The average difference between estimated and actual goals.
- **RMSE (Root Mean Squared Error):** A measure of prediction error that places more emphasis on larger mistakes.
- **Model diagnostics:** Checking residual patterns, assumptions, and potential model issues.
- **Coefficient interpretation:** Understanding how each statistic relates to the expected number of goals.
- **Model comparison:** Determining whether the more specialized or complex models offer meaningful improvements.

For fair evaluation, we'll divide the dataset into training and testing groups using `match_id`, ensuring both teams from the same match remain in the same group.

Because our predictors are statistics observed during the matches, the models are primarily intended to explain and estimate goal-scoring patterns **after a match has taken place**, rather than predict scores before kickoff.

The four approaches are planned starting points and may be adjusted based on exploratory analysis, diagnostics, and model performance.

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

Starter R code for the four planned regression approaches:

1. Baseline multiple linear regression.
2. Team fixed-effects regression.
3. League interaction regression.
4. Poisson regression for goal counts.

These are initial model specifications intended to help the team begin analysis. They will be refined and evaluated during the modeling phase.

**`DATA621_Soccer_Final_Project_Team_Plan.docx`**

Team project plan outlining the research objectives, responsibilities, and timeline.

## Getting Started in R

Team members do **not** need to download or process the original Wyscout ZIP files to begin their analysis.

### Step 1: Clone or Download the Repository

Download the repository from GitHub and open the `final` folder in RStudio.

### Step 2: Load the Cleaned Dataset

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

### Step 3: Verify the Dataset

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

- **Raw data:** The cleaned CSV contains the information needed to begin analysis. The original Wyscout match and event ZIP files are only necessary to reproduce or modify the data-preparation process.

- **Ball possession (`pass_share_pct`):** In soccer, possession refers to how much of the game a team controls the ball. Our dataset uses each team's percentage of all recorded passes as an approximate measure. For example, if Team A makes 600 passes and Team B makes 400, Team A's pass share would be 60%. This is not the same as the actual percentage of time a team controls the ball.

- **Shots on target (`on_target_tagged`):** A shot on target generally scores or would have entered the goal if the goalkeeper hadn't stopped it. Our dataset estimates this using an accuracy tag in the original data. However, four shots recorded as goals were missing this tag, so the variable should be treated as an approximate measure rather than an official count.

- **Dataset structure:** Every match appears twice, once for each participating team. For example, if Arsenal beats Chelsea 2–1, one row records Arsenal scoring two goals and another records Chelsea scoring one goal. Because these observations describe the same match, they aren't completely independent. Statistical inference should account for this dependence where appropriate.

- **Model evaluation:** Both teams from the same match should remain together when dividing the data into training and testing sets. We can use `match_id` to avoid including the same match in both groups.

- **Interpreting results:** Our goal is to understand which statistics are associated with scoring more goals, not necessarily what causes teams to score. For example, if teams that make more passes tend to score more goals, that doesn't automatically mean making more passes causes more goals.

- **Model assumptions:** Each regression approach has assumptions that must be checked. For example, Poisson regression assumes that the conditional mean and variance of the goal counts are equal. If this assumption is substantially violated, an alternative count model may be considered.

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

1. **Exploratory Data Analysis:** Examine goal distributions, passing activity, shots, home advantage, and league-level differences.
2. **Baseline Multiple Linear Regression:** Identify initial relationships between match statistics and goals.
3. **Team Fixed-Effects Regression:** Assess whether relationships remain after accounting for stable team differences.
4. **League Interaction Regression:** Test whether the relationship between passing activity and scoring differs across leagues.
5. **Poisson Regression:** Model goals as count data and compare results with the baseline linear regression.
6. **Model Diagnostics and Evaluation:** Assess assumptions, compare estimation errors, and interpret findings.
7. **Final Report and Presentation:** Summarize the methodology, results, limitations, and conclusions.

The cleaned dataset provides a common starting point for all team members to conduct their analyses consistently.
