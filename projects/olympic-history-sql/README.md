# 120 Years of Olympic History (1896–2016)

## Tools and Libraries

- SQL (SQLite)
- DB Browser for SQLite
- Python
- pandas
- Matplotlib
- Jupyter Notebook

## Overview

This project examines 120 years of Olympic history to explore medal performance, women's participation, and possible host-country advantages. Using SQL for data exploration, validation, and analysis, the project investigates historical patterns across Summer and Winter Olympic Games from 1896 through 2016.

Python and Matplotlib were used to visualize selected results, making historical comparisons easier to interpret.

## Problem

Olympic records provide opportunities to examine how international competition has evolved. Olympic medal tables are widely quoted, but raw athlete records can overstate results. A single team gold medal appears once for every team member, and some records are repeated.

Comparing medal totals and participation across different countries and time periods requires careful attention to duplicate records, historical national delegations, and changes in Olympic participation.

This analysis addresses three research questions:

1. Which countries accumulated the most Olympic medals between 1896 and 2016?
2. How did women's participation in the Summer Olympics change over time?
3. Did countries win more medals when hosting the Summer Olympics compared with their previous Games?

## Data

The analysis uses two datasets from *120 Years of Olympic History: Athletes and Results*.

- **athlete_events.csv:** 271,116 records covering 135,571 individual athletes from 1896 through 2016.
- **noc_regions.csv:** 230 records linking National Olympic Committee (NOC) codes to geographic regions and country names.
- **Missing values:** Age was missing for 9,474 records, height for 60,171, and weight for 62,875. These fields were not used in the analysis.

The athlete dataset contains 15 fields, including athlete identification, sex, age, team, country code, Olympic year, season, sport, event, and medal outcome.

Each record represents an athlete's participation in an Olympic event. Athletes competing in multiple events or Games appear more than once.

### Data Quality Assessment

SQL validation identified several issues requiring attention.

- **Unmatched country codes:** 349 records used `SGP`, while the country reference table used `SIN` for Singapore. A SQL `CASE` expression resolved the mismatch during analysis without changing the original records.
- **Duplicate records:** 1,385 exact duplicates were identified, primarily associated with historical art competitions.
- **Duplicate medal records:** Eleven exact duplicates involved medals, all in sailing events.
- **Medal values:** Athletes without medals were recorded with the text `NA`, requiring explicit filtering rather than a standard SQL null check.
- **Team names:** Some historical teams were identified by boat names rather than countries. NOC codes were used for country comparisons.

These checks informed the counting and filtering methods used in subsequent queries.

## Data Source

**Dataset:** [120 Years of Olympic History: Athletes and Results](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results)

**Platform:** Kaggle

**Files:**
- `athlete_events.csv`
- `noc_regions.csv`

**Historical coverage:** Athens 1896 through Rio 2016 Games

The original athlete dataset is provided as `athlete_events.zip` to accommodate GitHub's browser upload limits.

## Methodology

The analysis was completed primarily in SQLite, with Python used for visualization.

1. **Data exploration:** Examined dataset dimensions, distinct athletes, historical coverage, and selected fields.
2. **Country code validation:** Joined athlete records to the country table and found 349 unmatched records, all using the code SGP, while the country table used SIN for Singapore. SGP was mapped to SIN within the queries without changing the original data.
3. **Data quality checks:** Confirmed that medal values were stored as Gold, Silver, Bronze, or the text "NA" for no medal, identified exact duplicate records, and found team names that referred to boats rather than countries.
4. **Country medal rankings:** Used joins, conditional aggregation, and `DISTINCT` to count each country, event, and medal type once per Games so that team members and duplicate records did not inflate totals. Historical delegations were grouped by region.
5. **Women's participation:** Calculated the percentage of female athletes competing in each Summer Olympics using distinct athlete identifiers.
6. **Host-country comparison:** Compared medal totals for six Summer Olympic host countries from 1996 through 2016 against their totals in the previous Summer Games.
7. **Visualization:** Exported selected SQL results to CSV files and created two visualizations using pandas and Matplotlib.

SQL techniques included joins, common table expressions (CTEs), `CASE` statements, aggregate functions, conditional calculations, and the `RANK()` window function.

## Key Findings

### 1. Olympic Medal Performance

The United States led the historical rankings with 2,823 medals, followed by Russia with 1,916 and Germany with 1,766.

The top five were:

| Country | Total Medals |
|---|---:|
| USA | 2,823 |
| Russia | 1,916 |
| Germany | 1,766 |
| UK | 919 |
| France | 879 |

Medals were counted once per country, event, and medal type per Games to prevent athletes on the same team from inflating medal totals.

Historical delegations were grouped according to the dataset's regional classifications. Russia includes Soviet Union and Unified Team results, while Germany includes East German, West German, and other German delegations.

These rankings therefore represent historical regional groupings rather than modern national teams alone.

### 2. Women's Olympic Participation

Women's participation in the Summer Olympics increased substantially over the period studied.

- **1896:** No female athletes participated.
- **1900:** Women represented 1.9% of participants, with 23 female athletes.
- **2016:** Women represented 45.0% of participants, with 5,034 female athletes.
- **Overall change:** Women's share increased by 43.1 percentage points between 1900 and 2016.

Despite considerable progress, women still represented less than half of Summer Olympic participants in 2016.

The analysis counted each athlete once per Games to avoid inflating participation through multiple event entries.

### 3. Host-Country Advantage

Five of the six Summer Olympic host countries examined won more medals when hosting than they had in the previous Summer Games.

- **China (2008):** Largest increase, gaining 37 medals.
- **Australia (2000):** Increased by 17 medals.
- **United Kingdom (2012):** Increased by 17 medals.
- **United States (1996):** Only host country with a decline, losing 7 medals compared with the previous Games.

These results suggest a possible host-country advantage, although hosting alone cannot be identified as the cause.

Changes in sports funding, athlete preparation, and the number of medal events may also influence performance.

## Conclusion

Olympic history reveals substantial differences in national medal performance, meaningful progress in women's participation, and evidence of possible benefits associated with hosting the Games.

The United States dominated the historical medal rankings under the counting method used, while women's representation grew from fewer than 2% of Summer Olympic participants in 1900 to 45% in 2016.

Most host countries examined improved their medal totals, but the results were not universal. The findings demonstrate the importance of combining historical context with careful data preparation before drawing conclusions from competitive rankings.

## Visualizations

Two visualizations were created using Python and Matplotlib.

### Visual 1. Top 10 Countries by Total Olympic Medals

The lollipop chart compares medal totals for the ten highest-ranking countries from 1896 through 2016.

### Visual 2. Women's Participation in the Summer Olympics

The waffle chart compares the percentage of female athletes in 1900 and 2016. Orange represents women and blue represents men, with each square representing approximately one percentage point.

Both charts use a colorblind-friendly blue and orange palette.

## How to Run

### SQL Analysis

1. Download `athlete_events.zip` and `noc_regions.csv`.
2. Extract `athlete_events.csv` from the ZIP archive.
3. Create or open a SQLite database.
4. Import the two CSV files into tables named `athlete_events` and `noc_regions`, preserving their column names and appropriate data types.
5. Open `Olympic_Analysis.sql`.
6. Execute the queries in sequence to reproduce the exploration, validation, and analysis.
7. Export the results of the medal-ranking and women's participation queries as `olympic_medal_totals.csv` and `olympic_womens_participation.csv`.

### Python Visualizations

1. Download `Olympic_Visualizations.ipynb` and the two exported CSV files.
2. Place all three files in the same directory.
3. Open the notebook in Jupyter Notebook or JupyterLab.
4. Install pandas and Matplotlib if necessary.
5. Run the notebook cells sequentially to reproduce both visualizations.

The exported SQL results are included in the repository, allowing the visualizations to be reproduced without rerunning the SQL analysis.

## Repository Structure

- `Olympic_Analysis.sql` — SQL exploration, validation, medal rankings, women's participation, and host-country analysis
- `Olympic_Visualizations.ipynb` — Python code for both visualizations
- `athlete_events.zip` — Compressed original athlete dataset
- `noc_regions.csv` — Country and NOC reference dataset
- `olympic_medal_totals.csv` — Exported medal-ranking results
- `olympic_womens_participation.csv` — Exported women's participation results
- `medal_lollipop.png` — Olympic medal-ranking visualization
- `olympic-womens-waffle.png` — Women's participation visualization
- `README.md` — Project documentation and findings

## Ethical Considerations

Historical comparisons require care because national boundaries, delegations, and participation opportunities have changed considerably since 1896.

Grouping historical delegations, such as the Soviet Union and East Germany, under present-day regions simplifies political history and may not reflect how athletes or nations identified at the time. Similarly, differences in women's participation reflect historical access to Olympic competition and should not be interpreted as differences in athletic ability.

The analysis preserves the original records and documents the counting and classification decisions used to produce its findings.

## Limitations

The analysis relies on the accuracy and completeness of the historical dataset.

Historical NOC classifications combine some former national delegations under present-day regional names, making medal totals different from official modern-country rankings.

Medal counting uses one medal per country, event, and medal type per Games rather than counting every individual athlete's medal record. This avoids inflating team results but can also combine multiple same-color medals awarded to athletes from the same country in an individual event.

The women's participation analysis includes the 1906 Games, which are no longer officially recognized by the International Olympic Committee.

The host-country analysis covers only six Summer Olympics from 1996 through 2016. Changes in funding, participation, and the number of medal events were not controlled for, so the results cannot establish a causal relationship between hosting and medal performance.
