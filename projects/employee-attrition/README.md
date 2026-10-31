
# Predicting Employee Attrition

**Tools:** Python, pandas, scikit-learn

## Overview

This project uses logistic regression to identify employees at greater risk of leaving an organization and examines factors associated with employee turnover.

## Objective

Determine which employee characteristics are associated with attrition and evaluate whether a predictive model could support proactive retention efforts.

## Data

IBM HR Analytics Employee Attrition & Performance dataset, containing 1,470 employee records and 35 original columns.

The target variable is Attrition (Yes/No). The dataset contained no missing values or duplicate records. Constant columns and an employee identifier were removed before modeling.

## Methodology

- Conducted exploratory analysis of employee characteristics and attrition rates.
- Examined numerical correlations and categorical associations using Cramér's V.
- Encoded categorical variables and prepared features for modeling.
- Used an 80/20 stratified training and testing split.
- Trained a logistic regression model using balanced class weights.
- Compared performance with a decision tree.
- Evaluated precision, recall, F1-score, and the confusion matrix.

## Key Findings

- Employees working overtime had substantially higher attrition rates.
- Attrition varied significantly across job roles.
- The logistic regression model identified 62% of employees who left.
- The model achieved approximately 0.35 precision and 0.62 recall.
- Logistic regression performed better than the evaluated decision tree on recall.

## Practical Application

HR teams could use model results to identify workforce patterns and prioritize supportive retention initiatives, including workload reviews and targeted employee engagement.

Predictions should support human review rather than automated employment decisions.

## Limitations

The dataset is synthetic and does not establish causal relationships. Results would require validation using real organizational data before operational use.

## Project Files

The analysis notebook, visualizations, and supporting documentation will be added as the portfolio develops.
