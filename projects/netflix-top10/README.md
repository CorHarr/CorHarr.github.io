# Netflix Top 10 Viewership Analysis

**Tools:** Python, pandas, NumPy, Matplotlib, Seaborn

## Overview

Analyzed Netflix Top 10 viewing data from July 2021 through April 2024, including global weekly rankings, country-level rankings across 94 countries, and Netflix's most popular titles, to examine whether a title's longevity in the Top 10 offers more insight into audience engagement than its initial popularity.

## Data

The analysis combines three Netflix datasets covering 146 weeks, from July 4, 2021, through April 14, 2024.

- **Global Weekly Top 10:** 5,840 records across four categories, covering English and non-English television and films, including weekly viewing hours and cumulative weeks in the Top 10.
- **Country Weekly Top 10:** 272,260 records showing weekly title rankings across 94 countries.
- **Most Popular Titles:** 40 records containing viewing statistics for Netflix's most popular titles during their first 91 days.

## Data Sources

The datasets are published on [Netflix's official Top 10 data portal](https://www.netflix.com/tudum/top10/). The original data is available for download in TSV format and can be saved as Excel workbooks.

- **Country-Level Top 10:** [Download all-weeks-countries.tsv](https://www.netflix.com/tudum/top10/data/all-weeks-countries.tsv)
- **Global Top 10:** [Download all-weeks-global.tsv](https://www.netflix.com/tudum/top10/data/all-weeks-global.tsv)
- **Most Popular Titles:** [Download most-popular.tsv](https://www.netflix.com/tudum/top10/data/most-popular.tsv)

To recreate the Excel files, open each downloaded TSV file in Excel and select **Save As → Excel Workbook (.xlsx)**, using the file names listed under Project Files.

Netflix updates these datasets regularly. The files used in this analysis contain historical data through April 2024, so current downloads may contain additional records.

## Methodology

Using Python, the analysis involved preparing the three datasets, converting dates, handling missing values, and aggregating viewing statistics. Viewing hours, title variety, and weeks in the Top 10 were compared across categories, countries, and individual titles.

Line, bar, and scatter charts were developed to examine overall viewing trends, category differences, geographic variety, early popularity, and longevity. An additional three-dimensional staircase visualization highlights the longest-running titles, with tied titles sharing a step.

## Key Findings

- **Category comparison:** Television accounted for approximately 71% of all Global Top 10 viewing hours, led by English-language television at 43%.
- **Geographic variety:** Canada's Top 10 included 1,220 distinct titles, the highest reported count among the countries examined.
- **Early popularity:** *Squid Game: Season 1* recorded approximately 2.2 billion viewing hours during its first 91 days, the highest total in the Most Popular dataset.
- **Longevity:** *Yo soy Betty, la fea* spent 30 cumulative weeks in the Global Top 10, the longest recorded run. Eight of the 11 longest-running titles were non-English productions.
- **Longevity versus popularity:** Titles that remained in the Global Top 10 longer generally accumulated more total viewing hours.

## Limitations

The datasets include only titles that reached Netflix's Top 10 rankings, excluding viewing activity for titles outside those lists. Country-level rankings do not include viewing hours, limiting direct comparisons of audience engagement between countries.

The longevity analysis uses the maximum reported cumulative weeks for each title. Titles with multiple seasons may therefore have separate ranking histories that are not fully represented by this measure.

Additionally, total viewing hours and time spent in the Top 10 are related measures. Their observed relationship does not establish that longevity predicts future popularity.

## Conclusion

A title's initial popularity does not fully capture its performance. Examining how long titles remain in the Global Top 10 provides an additional perspective on sustained audience engagement. The results also highlight the substantial presence of non-English productions among Netflix's longest-running titles.

## Project Files

- `Netflix_Top10.ipynb` contains the Python analysis and visualizations.
- `all-weeks-global-netflix.xlsx` contains global weekly rankings and viewing statistics.
- `all-weeks-countries-netflix.xlsx` contains country-level weekly rankings.
- `most-popular-netflix.xlsx` contains first-91-day viewing statistics for popular titles.

## How to Run

1. Download the Jupyter notebook and all three Excel files into the same folder.
2. Install the required packages if needed.

   ```bash
   pip install pandas numpy matplotlib seaborn openpyxl
   ```

3. Open `Netflix_Top10.ipynb` in Jupyter Notebook and run all cells in order.
