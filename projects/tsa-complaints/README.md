
# TSA Complaint Hotspots

**Tools:** Python, pandas, Matplotlib, Seaborn

## Overview

This project analyzes approximately one million TSA complaint and airport reference records to identify where complaints are concentrated by airport, category, and time period.

## Objective

Identify complaint patterns that can help prioritize training, staffing, and operational improvements.

## Data

The analysis uses four datasets covering airport complaints, complaint categories, subcategories, and airport identifiers.

## Data Sources

**TSA Complaint Counts**

Source: [Data Liberation Project](https://github.com/data-liberation-project/tsa-complaint-counts/tree/main/output/03-standardized)

The following files contain monthly complaint records from January 2015 through March 2024:

- `complaints-by-airport.csv`
- `complaints-by-category.csv`
- `complaints-by-subcategory.csv`

The subcategory file exceeds GitHub's browser upload limit and must be downloaded separately from the source repository.

**Airport Reference Data**

Source: [IP2Location IATA/ICAO Airport Codes](https://github.com/ip2location/ip2location-iata-icao)

- `iata-icao.csv`

This site or product includes IATA/ICAO List data available from https://github.com/ip2location/ip2location-iata-icao.

The airport reference data is licensed under Creative Commons Attribution-ShareAlike 4.0 International.

## Methodology

- Cleaned and standardized airport codes, dates, and complaint categories.
- Analyzed complaint volumes by airport, category, and month.
- Applied Pareto analysis to identify high-volume airports.
- Created geographic, categorical, and time-series visualizations.

## Key Findings

- LAX, JFK, EWR, ATL, and MCO recorded some of the highest complaint volumes.
- Complaint activity varied by airport and month.
- Three complaint categories accounted for approximately 79% of complaints at the highest-volume airports.

## Practical Application

The findings can help identify where targeted training, staffing adjustments, and process improvements may be most beneficial.

## Project Files

Analysis files and visualizations will be added as the portfolio develops.
