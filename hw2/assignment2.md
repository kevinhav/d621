# DATA 621 – Business Analytics and Data Mining

## Homework #2 Assignment Requirements

### Overview

In this homework assignment, you will work through various classification metrics. You will be asked to create functions in R to carry out the various calculations. You will also investigate some functions in packages that will let you obtain the equivalent results. Finally, you will create graphical output that also can be used to evaluate the output of classification models, such as binary logistic regression.

### Supplemental Material

- *Applied Predictive Modeling*, Ch. 11 (provided as a PDF file).
- Web tutorials: <http://www.saedsayad.com/model_evaluation_c.htm>

### Deliverables (100 Points)

- Upon following the instructions below, use your created R functions and the other packages to generate the classification metrics for the provided data set.
- A write-up of your solutions submitted in PDF format.

### Instructions

Complete each of the following steps as instructed:

1. Download the classification output data set (attached in Blackboard to the assignment).
2. The data set has three key columns we will use:
   - `class`: the actual class for the observation
   - `scored.class`: the predicted class for the observation (based on a threshold of 0.5)
   - `scored.probability`: the predicted probability of success for the observation

   Use the `table()` function to get the raw confusion matrix for this scored dataset. Make sure you understand the output. In particular, do the rows represent the actual or predicted class? The columns?

3. Write a function that takes the data set as a dataframe, with actual and predicted classifications identified, and returns the **accuracy** of the predictions.

   $$\text{Accuracy} = \frac{TP + TN}{TP + FP + TN + FN}$$

4. Write a function that takes the data set as a dataframe, with actual and predicted classifications identified, and returns the **classification error rate** of the predictions.

   $$\text{Classification Error Rate} = \frac{FP + FN}{TP + FP + TN + FN}$$

   Verify that you get an accuracy and an error rate that sums to one.

5. Write a function that takes the data set as a dataframe, with actual and predicted classifications identified, and returns the **precision** of the predictions.

   $$\text{Precision} = \frac{TP}{TP + FP}$$

6. Write a function that takes the data set as a dataframe, with actual and predicted classifications identified, and returns the **sensitivity** of the predictions. Sensitivity is also known as recall.

   $$\text{Sensitivity} = \frac{TP}{TP + FN}$$

7. Write a function that takes the data set as a dataframe, with actual and predicted classifications identified, and returns the **specificity** of the predictions.

   $$\text{Specificity} = \frac{TN}{TN + FP}$$

8. Write a function that takes the data set as a dataframe, with actual and predicted classifications identified, and returns the **F1 score** of the predictions.

   $$F_1 \; \text{Score} = \frac{2 \times \text{Precision} \times \text{Sensitivity}}{\text{Precision} + \text{Sensitivity}}$$

9. Before we move on, let's consider a question that was asked: What are the bounds on the F1 score? Show that the F1 score will always be between 0 and 1. (Hint: If $0 < a < 1$ and $0 < b < 1$ then $ab < a$.)

10. Write a function that generates an **ROC curve** from a data set with a true classification column (`class` in our example) and a probability column (`scored.probability` in our example). Your function should return a list that includes the plot of the ROC curve and a vector that contains the calculated area under the curve (AUC). Note that I recommend using a sequence of thresholds ranging from 0 to 1 at 0.01 intervals.

11. Use your created R functions and the provided classification output data set to produce all of the classification metrics discussed above.

12. Investigate the `caret` package. In particular, consider the functions `confusionMatrix`, `sensitivity`, and `specificity`. Apply the functions to the data set. How do the results compare with your own functions?

13. Investigate the `pROC` package. Use it to generate an ROC curve for the data set. How do the results compare with your own functions?
