# College Starting Age and Academic Performance

## Tools and Libraries

- Python
- pandas and NumPy
- Matplotlib
- Jupyter Notebook

## Overview

This project examines whether students' age at college enrollment is associated with first-semester academic performance. Using records from 4,424 undergraduate students, the analysis separates two outcomes: whether students passed at least one first-semester unit and the average grades earned by those who did.

## Problem

Older students may face different circumstances when entering college, but does enrollment age meaningfully relate to academic performance? Comparing grades alone may be misleading when some students pass no first-semester units.

This analysis addresses two research questions:

1. Does enrollment age have a meaningful relationship with first-semester grades?
2. Does the age difference appear in whether students pass their first-semester units, in the grades they earn, or both?

## Data

The dataset contains records from students enrolled at a single higher education institution in Portugal between academic years 2008/2009 and 2018/2019.

- **Records:** 4,424 undergraduate students
- **Variables:** 37 original columns
- **Missing values:** None
- **Enrollment ages:** 17 to 70
- **Age at enrollment:** Student's age when entering college
- **Curricular units 1st sem (approved):** Number of first-semester units the student passed
- **Curricular units 1st sem (grade):** Average first-semester grade on a 0–20 scale, with 10 considered passing

A first-semester grade of 0.0 was recorded for 718 students. These are the same 718 students who passed no first-semester units, so a 0.0 reflects no units passed rather than an earned grade of zero. These records were kept and analyzed as a separate measure rather than averaged into the grades of students who passed units.

## Data Source

**Dataset:** Predict Students' Dropout and Academic Success

**Repository:** [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/697/predict+students+dropout+and+academic+success)

**Original authors:** Valentim Realinho, Mónica Vieira Martins, Jorge Machado, and Luís Baptista

**Citation:**

Realinho, V., Vieira Martins, M., Machado, J., & Baptista, L. (2021). *Predict Students' Dropout and Academic Success* [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5MC89

**License:** Creative Commons Attribution 4.0 International (CC BY 4.0)

## Methodology

1. **Data inspection:** Examined dataset structure, missing values, duplicates, and key variables.
2. **Outcome verification:** Confirmed that all 718 zero-grade records corresponded to students who passed no first-semester units.
3. **Age grouping:** Divided students into five enrollment age groups: 17–19, 20–22, 23–25, 26–30, and 31+.
4. **Statistical analysis:** Compared pass rates and average grades across age groups and calculated Pearson correlations.
5. **Visualization:** Created five charts to examine enrollment age distributions, grade relationships, pass rates, and grade variation.

## Key Findings

- Enrollment age had a weak negative correlation with first-semester grades across all students (r = -0.157).
- Among students who passed at least one unit, the correlation was weaker (r = -0.095).
- Students aged 17–19 had an 88.2% pass rate, compared with 72.6% for ages 26–30 and 74.2% for ages 31 and older.
- Among the 3,706 students who passed units, average grades ranged from 12.40 to 12.90 across age groups.
- Average grades declined slightly through ages 23–25, then remained nearly unchanged among older students.
- Students aged 26 and older were more than twice as likely as students aged 17–19 to pass no first-semester units.

## Conclusion

Enrollment age showed a weak negative relationship with first-semester grades. Most of this difference came from students who passed no first-semester units, which occurred more than twice as often among students aged 26 and older as among those aged 17–19. Among students who passed units, grades were nearly identical across age groups. These findings suggest that enrollment age is more strongly associated with whether students pass their first-semester units than with the grades earned by those who do.

## Visualizations

The notebook includes five visualizations:

1. Age Distribution Histogram
2. Age Versus Grade Scatter Plot
3. Pass Rate Waffle Chart
4. Passing Grades Box Plots
5. Combined Summary Dot Plot

Each visualization includes an assessment explaining its findings.

## How to Run

1. Download the notebook and CSV dataset from this folder.
2. Place both files in the same directory.
3. Open `College_vs_Academics.ipynb` in Jupyter Notebook or JupyterLab.
4. Install the listed Python libraries if necessary.
5. Run all cells in sequence.

## Repository Structure

- `College_vs_Academics.ipynb` — Analysis, visualizations, and findings
- `predict+students+dropout+and+academic+success.csv` — Original dataset
- `README.md` — Project documentation

## Limitations

This analysis identifies associations rather than causal relationships. Enrollment age alone cannot explain differences in first-semester outcomes.

The dataset comes from a single higher education institution in Portugal, so the findings may not represent students at other colleges or universities.

Passing at least one first-semester unit does not necessarily mean a student passed all enrolled units or completed the semester successfully.
