# Montgomery County Crime Rate Analysis

**Tools:** R, tidyverse, dplyr, ggplot2, forcats, knitr, magick, scales

[View the Full Analysis and Visualizations](https://corharr.github.io/projects/montgomery-county-crime/Montgomery_County_Crime.html)

## Overview

Is Montgomery County, Maryland, a safe place to live? This project examines reported crime through comparisons with other Maryland jurisdictions, similarly populated U.S. counties, and historical trends. By evaluating both total incidents and population-adjusted crime rates, the analysis provides a more balanced assessment of public safety.

## Data

The analysis combines four datasets covering different geographic areas and time periods.

- **Montgomery County Crime Data:** 35,460 reported incidents from 2022, including geographic information.
- **United States Crime Rates by County:** Crime counts from 2016 and population estimates from 2013 for 3,136 counties.
- **Montgomery County Historical Crime Data:** Annual crime and population statistics from 1975 through 2020.
- **U.S. Census Bureau:** Population estimates for 232 Montgomery County Census tracts from the 2018–2022 American Community Survey.

## Data Sources

- **Montgomery County crime incidents:** [Montgomery County Open Data](https://catalog.data.gov/dataset/crime)
- **County crime rates:** [Kaggle – United States Crime Rates by County](https://www.kaggle.com/datasets/mikejohnsonjr/united-states-crime-rates-by-county)
- **Historical county crime:** [Maryland Open Data – Violent Crime & Property Crime by County](https://opendata.maryland.gov/Public-Safety/Violent-Crime-Property-Crime-by-County-1975-to-Pre/jwfa-fdxs/data)
- **Tract population:** U.S. Census Bureau, American Community Survey 5-year estimates, 2018–2022

## Methodology

Using R, the analysis involved cleaning and preparing crime records, standardizing geographic identifiers, and combining incident data with Census population estimates. Eight violent and property crime categories were used for county-level comparisons.

Tables, bar charts, scatterplots, and line charts were developed to examine geographic differences, crime rates per 100,000 residents, and historical trends.

## Key Findings

- **Maryland comparison:** Montgomery County reported 19,559 crimes in 2016, the fourth-highest total among Maryland jurisdictions. After adjusting for population, it had the fifth-lowest crime rate among the state's 24 jurisdictions.
- **National comparison:** Among 120 U.S. counties with populations between 500,000 and 2 million, Montgomery County had the 13th-lowest crime rate.
- **Historical trends:** The county's reported crime rate declined approximately 71% from its 1980 peak to 2020, despite substantial population growth.
- **Crime categories:** Property crime accounted for most of the overall historical decline, while violent crime remained substantially lower.
- **Local patterns:** Silver Spring, Gaithersburg, and Germantown recorded the highest incident totals in 2022. Census tract comparisons showed a weak relationship between population size and reported incidents.

## Limitations

The datasets represent different years and geographic levels. Of the 35,460 reported incidents, 358 lacked Census tract identifiers, and another 171 did not match the available Census tract population data. These records were excluded from the tract scatterplot.

Crime statistics also depend on law enforcement reporting practices and do not capture every incident. These limitations should be considered when interpreting comparisons and assessing public safety.

## Conclusion

The findings indicate that Montgomery County is a relatively safe place to live compared with other Maryland jurisdictions and similarly populated counties nationwide. Population-adjusted comparisons and historical trends provide a more meaningful assessment than raw crime counts alone.

## Project Files

- `Montgomery_County_Crime.html` contains the complete report and visualizations.
- `Montgomery_County_Crime.Rmd` contains the R Markdown source code.
- `1-Crime Reset.csv`, `2-United States_crime_rates_by_county.csv`, `3-Montgomery_County_Crime_by_year.csv`, and `5-MOCO_Tract_Population_2022.csv` contain the four datasets.
- `Screenshotmoco.png` contains the crime map image used in the report.

## How to Run

1. Download the Rmd file, the four CSV files, and `Screenshotmoco.png`, and place them in the same folder.
2. Install the required packages if needed.

   ```r
   install.packages(c("rmarkdown", "knitr", "tidyverse", "magick", "scales"))
   ```

3. Open `Montgomery_County_Crime.Rmd` in RStudio and click **Knit**.
