# DATA 621 – Business Analytics and Data Mining

## Homework #4 Assignment Requirements

### Overview

In this homework assignment, you will explore, analyze and model a data set containing approximately 8000 records representing a customer at an auto insurance company. Each record has two response variables. The first response variable, `TARGET_FLAG`, is a 1 or a 0. A "1" means that the person was in a car crash. A zero means that the person was not in a car crash. The second response variable is `TARGET_AMT`. This value is zero if the person did not crash their car. But if they did crash their car, this number will be a value greater than zero.

Your objective is to build multiple linear regression and binary logistic regression models on the training data to predict the probability that a person will crash their car and also the amount of money it will cost if the person does crash their car. You can only use the variables given to you (or variables that you derive from the variables provided). Below is a short description of the variables of interest in the data set:

| Variable Name | Definition | Theoretical Effect |
|---|---|---|
| `INDEX` | Identification Variable (do not use) | None |
| `TARGET_FLAG` | Was car in a crash? 1 = Yes, 0 = No | None |
| `TARGET_AMT` | If car was in a crash, what was the cost | None |
| `AGE` | Age of driver | Very young people tend to be risky. Maybe very old people also. |
| `BLUEBOOK` | Value of vehicle | Unknown effect on probability of collision, but probably affects the payout if there is a crash |
| `CAR_AGE` | Vehicle age | Unknown effect on probability of collision, but probably affects the payout if there is a crash |
| `CAR_TYPE` | Type of car | Unknown effect on probability of collision, but probably affects the payout if there is a crash |
| `CAR_USE` | Vehicle use | Commercial vehicles are driven more, so might increase probability of collision |
| `CLM_FREQ` | # Claims (past 5 years) | The more claims you filed in the past, the more you are likely to file in the future |
| `EDUCATION` | Max education level | Unknown effect, but in theory more educated people tend to drive more safely |
| `HOMEKIDS` | # Children at home | Unknown effect |
| `HOME_VAL` | Home value | In theory, home owners tend to drive more responsibly |
| `INCOME` | Income | In theory, rich people tend to get into fewer crashes |
| `JOB` | Job category | In theory, white collar jobs tend to be safer |
| `KIDSDRIV` | # Driving children | When teenagers drive your car, you are more likely to get into crashes |
| `MSTATUS` | Marital status | In theory, married people drive more safely |
| `MVR_PTS` | Motor vehicle record points | If you get lots of traffic tickets, you tend to get into more crashes |
| `OLDCLAIM` | Total claims (past 5 years) | If your total payout over the past five years was high, this suggests future payouts will be high |
| `PARENT1` | Single parent | Unknown effect |
| `RED_CAR` | A red car | Urban legend says that red cars (especially red sports cars) are more risky. Is that true? |
| `REVOKED` | License revoked (past 7 years) | If your license was revoked in the past 7 years, you probably are a more risky driver. |
| `SEX` | Gender | Urban legend says that women have fewer crashes than men. Is that true? |
| `TIF` | Time in force | People who have been customers for a long time are usually more safe. |
| `TRAVTIME` | Distance to work | Long drives to work usually suggest greater risk |
| `URBANICITY` | Home/work area | Unknown |
| `YOJ` | Years on job | People who stay at a job for a long time are usually more safe |

### Deliverables

- A write-up submitted in PDF format. Your write-up should have four sections. Each one is described below. You may assume you are addressing me as a fellow data scientist, so do not need to shy away from technical details.
- Assigned predictions (probabilities, classifications, cost) for the evaluation data set. Use a 0.5 threshold.
- Include your R statistical programming code in an Appendix.

### Write Up

#### 1. Data Exploration (25 Points)

Describe the size and the variables in the insurance training data set. Consider that too much detail will cause a manager to lose interest while too little detail will make the manager consider that you aren't doing your job. Some suggestions are given below. Please do NOT treat this as a check list of things to do to complete the assignment. You should have your own thoughts on what to tell the boss. These are just ideas.

a. Mean / Standard Deviation / Median
b. Bar Chart or Box Plot of the data
c. Is the data correlated to the target variable (or to other variables?)
d. Are any of the variables missing and need to be imputed "fixed"?

#### 2. Data Preparation (25 Points)

Describe how you have transformed the data by changing the original variables or creating new variables. If you did transform the data or create new variables, discuss why you did this. Here are some possible transformations.

a. Fix missing values (maybe with a Mean or Median value)
b. Create flags to suggest if a variable was missing
c. Transform data by putting it into buckets
d. Mathematical transforms such as log or square root (or use Box-Cox)
e. Combine variables (such as ratios or adding or multiplying) to create new variables

#### 3. Build Models (25 Points)

Using the training data set, build at least two different multiple linear regression models and three different binary logistic regression models, using different variables (or the same variables with different transformations). You may select the variables manually, use an approach such as Forward or Stepwise, use a different approach such as trees, or use a combination of techniques. Describe the techniques you used. If you manually selected a variable for inclusion into the model or exclusion into the model, indicate why this was done.

Discuss the coefficients in the models, do they make sense? For example, if a person has a lot of traffic tickets, you would reasonably expect that person to have more car crashes. If the coefficient is negative (suggesting that the person is a safer driver), then that needs to be discussed. Are you keeping the model even though it is counter intuitive? Why? The boss needs to know.

#### 4. Select Models (25 Points)

Decide on the criteria for selecting the best multiple linear regression model and the best binary logistic regression model. Will you select models with slightly worse performance if it makes more sense or is more parsimonious? Discuss why you selected your models.

For the multiple linear regression model, will you use a metric such as Adjusted R2, RMSE, etc.? Be sure to explain how you can make inferences from the model, discuss multi-collinearity issues (if any), and discuss other relevant model output. Using the training data set, evaluate the multiple linear regression model based on (a) mean squared error, (b) R2, (c) F-statistic, and (d) residual plots. For the binary logistic regression model, will you use a metric such as log likelihood, AIC, ROC curve, etc.? Using the training data set, evaluate the binary logistic regression model based on (a) accuracy, (b) classification error rate, (c) precision, (d) sensitivity, (e) specificity, (f) F1 score, (g) AUC, and (h) confusion matrix. Make predictions using the evaluation data set.
