
# Predicting Employee Attrition

**Tools:** Python, pandas, NumPy, SciPy, Matplotlib, scikit-learn

## Overview

This project uses logistic regression to identify employees at greater risk of leaving an organization and examines factors associated with employee turnover.

## Objective

Determine which employee characteristics are associated with attrition and evaluate whether a predictive model could support proactive retention efforts.

## Data

IBM HR Analytics Employee Attrition & Performance dataset, containing 1,470 employee records and 35 original columns.

Source: [IBM HR Analytics Employee Attrition & Performance (Kaggle)](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

The target variable is Attrition (Yes/No). The dataset contained no missing values or duplicate records. Constant columns (EmployeeCount, Over18, StandardHours) and the employee identifier (EmployeeNumber) were removed before modeling. Categorical variables were one-hot encoded, expanding 30 features to 44.

## Methodology

- Conducted exploratory analysis of employee characteristics and attrition rates.
- Measured associations with attrition using point-biserial correlation for numeric features and Cramér's V (chi-square) for categorical features.
- Encoded categorical variables and prepared features for modeling.
- Used an 80/20 stratified training and testing split.
- Trained a logistic regression model using balanced class weights.
- Compared performance with a decision tree (maximum depth of 4, balanced class weights).
- Validated both models with 5-fold stratified cross-validation.
- Evaluated precision, recall, F1-score, the confusion matrix, and the precision-recall curve.
- Validated the proposed risk tiers (0.70 and 0.50) against actual outcomes in the test set.
- Audited model performance across gender, age, and marital status, and tested the model without these sensitive features.

## Key Findings

**Top three factors associated with attrition**

1. **Overtime:** strongest categorical association (Cramér's V = 0.24); 30.5% of employees who worked overtime left.
2. **Job role:** nearly identical association (Cramér's V = 0.24); attrition ranged from 39.8% for Sales Representatives to 2.5% for Research Directors.
3. **Compensation and career stage:** monthly income, job level, and tenure were the strongest numerical factors. Employees who left earned less on average ($4,787 vs. $6,833 per month).

Performance ratings were not meaningfully associated with attrition (correlation of 0.003).

**Model performance**

- The logistic regression model identified 62% of employees who left, with approximately 0.35 precision.
- Average precision was 0.55, compared with a 0.16 baseline, showing the model ranks attrition risk substantially better than chance.
- Logistic regression outperformed the decision tree on the test set (recall 0.62 vs. 0.49) and across all five cross-validation folds (recall 0.74 vs. 0.56; average precision 0.61 vs. 0.34).

**Risk tier validation**

| Tier | Employees | Actually Left | Actual Rate |
|---|---|---|---|
| High (0.70+) | 43 | 22 | 51% |
| Moderate (0.50–0.69) | 41 | 7 | 17% |
| Low (below 0.50) | 210 | 18 | 9% |

- The tiers rank risk in the correct order, and the High tier captured 47% of leavers while flagging about 15% of employees.
- Balanced class weighting inflated predicted probabilities (average prediction of 0.34 vs. an actual rate of 0.16), so the tiers should be treated as relative rankings rather than literal probabilities.
- The Moderate tier was barely above the 16% baseline and did not identify meaningfully elevated risk.

## Ethical Considerations

**Subgroup audit**

- Performance was similar for women and men (recall 0.69 vs. 0.58).
- The model identified most leavers under 40 (recall 0.76–0.79) but missed most older leavers (0.38 for ages 40–49 and 0.25 for 50+).
- Removing age, gender, and marital status had almost no effect on overall performance (recall 0.62 for both; average precision 0.527 vs. 0.545) and improved recall for employees aged 40–49 from 0.38 to 0.62.
- Recall for employees 50 and older remained low (0.25). With only 8 leavers in this group, results should be interpreted with caution.

**Recommended safeguards**

- Exclude age, gender, and marital status from any deployed version of the model.
- Repeat the subgroup audit each time the model is retrained, with special attention to older employees.
- Use model results only for supportive retention outreach, never for hiring, promotion, discipline, or termination decisions.
- Require HR review before any action, and allow employees to decline retention conversations.
- Limit data to what the model needs, restrict access to authorized HR staff, and remove individual risk scores after use.
- Review the model with legal and compliance teams before deployment.

## Practical Application

HR teams could use the model as an early-warning signal and prioritize retention efforts in this order: reduce overtime, focus interventions on high-turnover roles such as Sales Representatives, and review compensation to ensure it remains competitive. Individual outreach should focus on the High-risk tier.

Predictions should support human review rather than automated employment decisions.

## Requirements

- Python 3
- Jupyter Notebook
- pandas
- NumPy
- SciPy
- Matplotlib
- scikit-learn

## How to Run

1. Download `Predicting_Employee_Attrition.ipynb` and `Employee-Attrition.csv` from this folder.
2. Place both files in the same folder.
3. Install the required Python packages if they are not already installed:

   ```bash
   pip install notebook pandas numpy scipy matplotlib scikit-learn
   ```

4. Open `Predicting_Employee_Attrition.ipynb` in Jupyter Notebook.
5. Restart the kernel and run all cells in sequence.

The analysis produces summary tables, model results, four visualizations, and a saved chart image (`income_boxplot.png`).

## Visualizations

1. Ranked correlations and categorical associations with attrition.
2. Attrition rate by job role.
3. Monthly income by attrition status (box plot).
4. Precision-recall curve for the logistic regression model.

## Repository Structure

```text
employee-attrition/
├── README.md                              Project overview and instructions
├── Predicting_Employee_Attrition.ipynb    Analysis and modeling notebook
└── Employee-Attrition.csv                 IBM HR Analytics dataset
```

## Limitations

The dataset is synthetic and does not establish causal relationships. The sample size is relatively small, and the data does not distinguish between voluntary and involuntary departures. Results would require validation using real organizational data before operational use.

The risk tiers were validated using the original model and would require further validation after removing sensitive features.
