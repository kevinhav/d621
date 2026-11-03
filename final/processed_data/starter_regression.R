# DATA 621 — Starter regression analysis
library(readr)
library(dplyr)
data <- read_csv('processed_data/soccer_team_match_2017_18.csv',
                 show_col_types = FALSE)

# pass_share_pct is a pass-share proxy, NOT official possession.
# Only use complete cases for variables in each model.
model_data <- data %>%
  filter(!is.na(pass_share_pct), !is.na(pass_accuracy_pct),
         !is.na(shots)) %>%
  mutate(league = factor(league), team_id = factor(team_id))

baseline <- lm(goals ~ pass_share_pct + shots + pass_accuracy_pct +
                 home + league, data = model_data)
summary(baseline)

# Team fixed effects; omit league main effect (nested in team).
team_adjusted <- lm(goals ~ pass_share_pct + shots +
                      pass_accuracy_pct + home + team_id,
                    data = model_data)
summary(team_adjusted)

# League-specific pass-share slopes with team fixed effects.
league_interaction <- lm(goals ~ pass_share_pct +
                         pass_share_pct:league + shots +
                         pass_accuracy_pct + home + team_id,
                       data = model_data)
summary(league_interaction)

# Count model: check dispersion and compare held-out performance later.
poisson_model <- glm(goals ~ pass_share_pct + shots +
                       pass_accuracy_pct + home + league,
                     family = poisson(link = 'log'), data = model_data)
summary(poisson_model)
sum(residuals(poisson_model, type = 'pearson')^2) /
  df.residual(poisson_model)

# IMPORTANT: Split by match_id (not rows) before assessing
# out-of-sample performance, since each match has two team rows.
