# TSA Complaint Hotspots

**Tools:** Python, pandas, Matplotlib, Seaborn

## Overview

This project analyzes approximately one million TSA complaint and airport reference records to identify where complaints are concentrated by airport, category, and time period.

## Objective

Identify complaint patterns that can help prioritize training, staffing, and operational improvements.

## Data

The analysis uses four datasets covering airport complaints, complaint categories, subcategories, and airport identifiers.

- `complaints-by-airport.csv`: 41,721 rows and 4 columns.
- `complaints-by-category.csv`: 241,588 rows and 7 columns.
- `complaints-by-subcategory.csv`: 504,512 rows and 11 columns.
- `iata-icao.csv`: 8,937 rows and 7 columns, used as an airport lookup table.

Date columns were parsed as dates, complaint counts were converted to numeric values, airport codes were standardized to uppercase, and category and subcategory labels were cleaned.

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

- LAX, JFK, EWR, ATL, and MCO recorded some of the highest complaint volumes among identified airports.
- Complaint activity varied by airport and month. Several major airports experienced their highest monthly complaint volumes in October 2023, while others peaked in March.
- Three complaint categories accounted for approximately 70% of complaints at the highest-volume airports: Expedited Passenger Screening, Mishandling of Passenger Property, and Customer Service.

## Practical Application

The findings can help identify where targeted training, staffing adjustments, and process improvements may be most beneficial.

## Repository Structure

The project files are organized as follows:

```text
tsa-complaints/
├── README.md
├── TSA_Complaint_Hotspots.ipynb
├── complaints-by-airport.csv
├── complaints-by-category.csv
└── iata-icao.csv
```

The additional dataset, `complaints-by-subcategory.csv`, must be downloaded separately from the Data Liberation Project source linked above.

## Requirements

- Python 3
- Jupyter Notebook
- pandas
- NumPy
- Matplotlib
- Seaborn
- Plotly
- IPython

## How to Run

1. Download the project notebook and the three included CSV files.
2. Download `complaints-by-subcategory.csv` from the Data Liberation Project source listed in the Data Sources section.
3. Place all four CSV files and `TSA_Complaint_Hotspots.ipynb` in the same folder.
4. Install the required Python packages if they are not already installed:

   ```bash
   pip install notebook pandas numpy matplotlib seaborn plotly ipython
   ```

5. Open `TSA_Complaint_Hotspots.ipynb` in Jupyter Notebook.
6. Restart the kernel and run all cells in sequence.

The analysis produces summary tables, six visualizations, and two generated files: `top_airports_by_complaints.csv` and `tsa-pareto-chart.png`.

## Visualizations

The analysis includes six visualizations:

1. Pareto chart of airport complaint concentration.
2. Geographic map of complaint distribution.
3. Heatmap of monthly complaints at the top 15 airports.
4. Box plot of monthly complaint distributions.
5. Bar chart of leading complaint categories.
6. National complaint trend with a 12-month rolling average.

## Reproducibility and Limitations

The notebook uses relative file paths, so the required CSV files must be available in the same working directory when it executes.

About 43% of complaint records (437,786 of 1,021,281) have no airport code. These complaints are excluded from the airport rankings and percentages but are included in the national complaint trend.

Complaint counts represent reported complaint activity rather than a direct measure of airport performance. Airports with larger passenger volumes may receive more complaints because they serve more travelers.

Findings should therefore be interpreted as indicators of complaint concentration and opportunities for further investigation, not definitive rankings of airport service quality.
