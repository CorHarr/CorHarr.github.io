# Lottery Number Patterns and Randomness

## Tools and Libraries

- Python
- pandas and NumPy
- Matplotlib and Seaborn
- SciPy
- Jupyter Notebook

## Overview

This project examines historical New York lottery winning numbers for Mega Millions, Powerball, and Pick 10 to identify "hot" and "cold" numbers and to test whether differences in how often numbers were drawn are consistent with random variation.

## Problem

Many lottery players believe some numbers come up more often than others and choose their numbers accordingly. Uneven counts alone, however, do not show that a drawing is biased, because some variation is expected by chance.

This analysis addresses three research questions:

1. Do some numbers appear more or less often than expected in each game?
2. Are these differences larger than random variation would produce?
3. Do numbers that were hot or cold in earlier drawings stay that way in later drawings?

## Data

The analysis uses three datasets of New York lottery winning numbers.

- **Mega Millions:** 2,285 drawings from May 17, 2002, to April 16, 2024. Five main numbers per drawing, plus a separate Mega Ball and Multiplier.
- **Powerball:** 1,617 drawings from February 3, 2010, to April 20, 2024. Six numbers per drawing, with the Powerball stored as the sixth number, plus a Multiplier.
- **Pick 10:** 13,570 drawings from January 12, 1987, to April 20, 2024. Twenty numbers per drawing, drawn from 1 to 80.
- **Missing values:** Multiplier values were missing for 903 Mega Millions drawings and 210 Powerball drawings. The multiplier was not used in the analysis.
- **Duplicates:** None

## Data Source

**Datasets:**

- [Lottery Mega Millions Winning Numbers: Beginning 2002](https://data.ny.gov/d/5xaw-6ayf)
- [Lottery Powerball Winning Numbers: Beginning 2010](https://data.ny.gov/d/d6yy-54nr)
- [Lottery Pick 10 Winning Numbers: Beginning 1987](https://data.ny.gov/d/bycu-cw7c)

**Publisher:** State of New York, Open Data NY ([data.ny.gov](https://data.ny.gov))

**Retrieved:** April 21, 2024

These datasets are updated after new drawings. The files used in this analysis contain drawings through April 2024, so current downloads may contain additional records.

## Methodology

1. **Data inspection:** Examined dataset structure, missing values, duplicates, and draw dates.
2. **Data preparation:** Converted draw dates, split the space-separated winning numbers into one row per number, and kept only the main numbers. The Mega Ball and Powerball come from a separate, smaller pool and were excluded.
3. **Current number ranges:** Mega Millions and Powerball changed their number ranges during the period covered, so each game was limited to drawings under its current range:
   - **Mega Millions:** 1–70, from October 31, 2017 (675 drawings)
   - **Powerball:** 1–69, from October 7, 2015 (1,026 drawings)
   - **Pick 10:** 1–80, all years (13,570 drawings)
4. **Hot and cold numbers:** Compared each number's count with the count expected if every number were equally likely. Numbers 2 or more standard deviations above expected were labeled hot, and numbers 2 or more below were labeled cold.
5. **Statistical analysis:** Ran a chi-square test for each game to check whether the counts were consistent with a random drawing.
6. **Consistency over time:** Split each game's drawings in half by date to check whether hot and cold numbers kept that status.
7. **Visualization:** Created four charts showing data volume by game, hot and cold numbers, the spread of results, and changes over time.

## Key Findings

- Only 10 of 219 numbers crossed the hot or cold cutoff, about the number expected by chance alone.
  - **Mega Millions:** hot 3 and 10; cold 49
  - **Powerball:** hot 21, 61, and 63; cold 13
  - **Pick 10:** hot 58; cold 7 and 25
- All three games returned chi-square p-values well above 0.05 (Mega Millions 0.60, Powerball 0.40, Pick 10 0.94), showing no convincing evidence of bias.
- 66.7% of numbers fell within 1 standard deviation of expected and 95.4% within 2, closely matching what a fair drawing would produce. No number exceeded 3 standard deviations.
- Eleven numbers were hot or cold in the earlier half of the drawings, and none of them stayed hot or cold in the later half.
- Pick 10 accounted for 97.0% of the numbers analyzed, so each game was analyzed separately to keep it from overwhelming the results.

## Conclusion

Hot and cold numbers did appear in the historical data, but their frequencies were consistent with random variation. The number of exceptions was about what chance would produce, none were extreme, and earlier patterns did not carry into later drawings. Choosing historically hot numbers or avoiding cold ones does not improve the odds of winning in a fair drawing.

## Visualizations

The notebook includes four visualizations:

1. Share of All Numbers Drawn Donut Chart
2. Hot and Cold Numbers Polar Wheel
3. Distance from Expected Swarm Plot
4. Hot and Cold Numbers Over Time Icon Array

![Hot and Cold Numbers Polar Wheel](lottery-analysis-polarwheel.png)

Each visualization includes an assessment explaining its findings.

## How to Run

1. Download the notebook and all three CSV files from this folder.
2. Place all files in the same directory.
3. Open `Lottery_Patterns.ipynb` in Jupyter Notebook or JupyterLab.
4. Install the listed Python libraries if necessary.
5. Run all cells in sequence.

## Repository Structure

- `Lottery_Patterns.ipynb` — Analysis, visualizations, and findings
- `MegaMillions.csv` — Mega Millions winning numbers
- `Powerball.csv` — Powerball winning numbers
- `Pick10.csv` — Pick 10 winning numbers
- `README.md` — Project documentation

## Ethical Considerations

The data comes from an official public source, and the original records were preserved for verification. Findings about hot and cold numbers could be misused to suggest that certain numbers improve the odds of winning. This analysis is for informational purposes only and does not offer a winning strategy.

## Limitations

The analysis assumes the published drawing records are complete and accurate.

Limiting Mega Millions and Powerball to their current number ranges kept comparisons fair but reduced the number of drawings analyzed for those games.

The chi-square test provides an approximate assessment because several numbers are drawn without replacement in each drawing. The results show that the counts are consistent with random variation, but they do not prove that the drawings are completely random.
