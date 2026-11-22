# Hospital Quality Dashboard

## Tools and Libraries

- Microsoft Power BI Desktop
- Power Query
- DAX

## Overview

This project uses publicly available Centers for Medicare & Medicaid Services (CMS) hospital data to examine overall hospital star ratings across the United States. An interactive Power BI dashboard allows users to compare ratings by hospital ownership, geographic region, and state while filtering results by state, hospital type, and ownership.

The dashboard combines summary indicators, a stacked bar chart, regional comparisons, and a geographic map to make differences in hospital ratings easier to explore and interpret.

## Problem

Hospital quality ratings provide useful information about healthcare performance, but differences across hospitals can be difficult to interpret when facilities vary by ownership, location, and type. Not every hospital receives an overall star rating, so rated hospitals must be distinguished from the complete population.

This analysis addresses three research questions:

1. How do overall hospital star ratings differ across ownership groups?
2. Which geographic regions and states have higher or lower average hospital ratings?
3. How can interactive filters help users investigate rating differences while accounting for hospitals without available ratings?

## Data

The analysis uses the CMS Hospital General Information dataset.

- **Total records:** 5,435 hospitals
- **Total fields:** 38
- **Geographic coverage:** 50 states, Washington, D.C., and five U.S. territories
- **Hospital types:** 9 categories
- **Hospital ownership classifications:** 12 categories
- **Overall star ratings:** 1 through 5, plus "Not Available"

The dataset contains hospital identifiers, facility names, geographic information, hospital types, ownership classifications, emergency service indicators, overall star ratings, and additional quality measure counts.

### Data Quality Assessment

The source data was examined to identify issues that could affect comparisons.

- **Unique identifiers:** All 5,435 records had unique Facility IDs, with no duplicate records.
- **Unavailable ratings:** Hospitals without an overall star rating were recorded as "Not Available." These hospitals remained in total hospital counts but were excluded from calculations requiring numeric ratings.
- **Rated hospital types:** Only acute care, critical access, and Veterans Administration hospitals received overall ratings. Psychiatric, children's, long-term, cancer, rural emergency, and Department of Defense hospitals had none.
- **Categorical differences:** Hospital ownership and hospital type classifications required careful grouping and interpretation.
- **Geographic coverage:** The dataset includes U.S. territories as well as states, requiring appropriate geographic classifications.

These distinctions were incorporated into the dashboard so that hospital totals and rating-based statistics would not be confused.

## Data Source

**Dataset:** [CMS Hospital General Information](https://data.cms.gov/provider-data/dataset/xubh-q36u)

**Publisher:** Centers for Medicare & Medicaid Services (CMS), Provider Data Catalog

**File:** `Hospital_General_Information_2.csv`

The dataset contains publicly reported hospital information and quality ratings. CMS updates it periodically, so current downloads may contain different records.

## Methodology

The analysis was developed in Microsoft Power BI Desktop.

1. **Data exploration:** Reviewed the dataset structure, hospital identifiers, geographic fields, ownership classifications, hospital types, and overall star ratings.
2. **Data preparation (Power Query):** Kept 9 relevant columns, replaced "Not Available" ratings with null, and converted the rating field to whole numbers. Unrated hospitals were kept so that hospital counts remained accurate. The original CSV was not changed.
3. **Measures and calculated columns (DAX):** Created measures for hospital counts, rated-hospital counts, the percentage of hospitals rated, and average ratings, along with calculated columns for ownership groups, regions, and rating categories. Each is described in the next section.
4. **Ownership comparisons:** Calculated the percentage distribution of one-star through five-star ratings within each ownership group.
5. **Regional and state comparisons:** Compared average star ratings across regions and mapped average state ratings in five color-coded ranges. States with no rated hospitals were excluded from the map.
6. **Interactive filtering:** Added State, Hospital Type, and Hospital Ownership filters to allow users to narrow the dashboard results.
7. **Dashboard design:** Combined key performance indicators, ownership comparisons, geographic analysis, and user instructions in a single interactive report.
8. **Validation:** Tested each filter, state selection, map color, and tooltip, and confirmed how hospitals without ratings were handled.

## Measures and Calculated Columns

DAX measures and calculated columns support hospital counts, rating comparisons, geographic classifications, and interactive reporting. All of them respond to the dashboard's filters, so counts and ratings change as users narrow their selections.

### DAX Measures

| Measure | Purpose |
|---|---|
| `Hospital Count` | Counts hospitals using unique facility identifiers and supports the Total Hospitals KPI. |
| `Hospitals Rated` | Calculates the percentage of hospitals with available overall star ratings for the Hospitals Rated KPI. |
| `Rated Hospital Count` | Counts hospitals with numeric star ratings and provides rated-hospital counts in the map tooltips. |
| `Average Rating` | Calculates the average overall star rating among rated hospitals for the map tooltips. |
| `Ownership Sample Size` | Reports the number of hospitals in an ownership group, providing context for interpreting rating distributions. |

The Average Star Rating KPI card and the regional bar chart use an average aggregation of the numeric hospital rating field.

### Calculated Columns

| Calculated Column | Purpose |
|---|---|
| `Ownership Group` | Consolidates detailed CMS ownership classifications into Nonprofit, For-profit, Government, and Other groups for comparison. |
| `U.S. Region` | Assigns hospitals to seven geographic regions or U.S. Territories based on their state or territory. |
| `Rating Legend` | Converts numeric ratings into labels from 1 Star through 5 Stars, excluding missing ratings, for the ownership distribution chart. |
| `Rating Group` | Assigns average state ratings to five rating ranges for geographic color classification. |
| `Total Hospitals` | Provides a supporting field used to count hospitals within the ownership and star-rating visualization. |

### Hospital Ownership Grouping

The `Ownership Group` calculated column consolidates the 12 CMS ownership classifications into four categories.

| Ownership Group | Original CMS Classification |
|---|---|
| Nonprofit | Voluntary non-profit - Private |
| Nonprofit | Voluntary non-profit - Other |
| Nonprofit | Voluntary non-profit - Church |
| For-profit | Proprietary |
| Government | Government - Hospital District or Authority |
| Government | Government - Local |
| Government | Government - State |
| Government | Government - Federal |
| Other | Veterans Health Administration |
| Other | Physician |
| Other | Department of Defense |
| Other | Tribal |

The DAX classification uses the presence of "Voluntary non-profit" or "Government" in the original ownership field, assigns "Proprietary" to For-profit, and places remaining classifications in Other.

The Other group therefore includes several types of institutions, including federal and tribal facilities. Its label reflects the analytical grouping rule rather than a uniform ownership structure. Because Department of Defense hospitals had no ratings, the rated hospitals in this group were Veterans Health Administration, physician-owned, and tribal hospitals.

### Geographic Region Assignments

The `U.S. Region` calculated column groups states and territories into eight geographic categories. Abbreviations correspond to the codes in the original CMS dataset.

| Region | States and Territories |
|---|---|
| Mountain West | CO, ID, MT, NV, UT, WY |
| Midwest | IL, IN, IA, KS, MI, MN, MO, NE, ND, OH, SD, WI |
| New England | CT, ME, MA, NH, RI, VT |
| Southwest | AZ, NM, OK, TX |
| Mid-Atlantic | DE, DC, MD, NJ, NY, PA |
| Pacific | AK, CA, HI, OR, WA |
| Southeast | AL, AR, FL, GA, KY, LA, MS, NC, SC, TN, VA, WV |
| U.S. Territories | AS, GU, MP, PR, VI |

The U.S. Territories category includes American Samoa, Guam, the Northern Mariana Islands, Puerto Rico, and the U.S. Virgin Islands. These regional groupings are analytical classifications rather than official CMS regional designations.

### Geographic Rating Categories

The `Rating Group` calculated column organizes average state ratings into five color-coded categories for the map.

| Rating Range | Map Classification |
|---|---|
| 4.5 and above | Highest |
| 3.5–4.49 | Above average |
| 2.5–3.49 | Middle |
| 1.5–2.49 | Lower |
| Below 1.5 | Lowest |

The actual average star ratings remain available in the dashboard tooltips.

## Key Findings

### 1. Overall Hospital Ratings

| Indicator | Result |
|---|---:|
| Total Hospitals | 5,435 |
| Hospitals with Ratings | 3,166 |
| Hospitals without Ratings | 2,269 |
| Percentage Rated | 58.3% |
| Average Star Rating | 3.21 |

The average of 3.21 applies only to hospitals with available ratings. Because 41.7% of hospitals had no rating, comparisons based on rated facilities do not represent every hospital in the dataset.

### 2. Hospital Ratings by Ownership Type

| Ownership Group | Rated Hospitals | Average Rating | 1–2 Stars | 4–5 Stars | 5 Stars |
|---|---:|---:|---:|---:|---:|
| Nonprofit | 2,079 | 3.32 | 22.2% | 45.7% | 13.0% |
| For-profit | 498 | 2.79 | 43.8% | 27.7% | 5.0% |
| Government | 456 | 2.92 | 36.6% | 31.4% | 7.0% |
| Other | 133 | 4.08 | 7.5% | 72.9% | 42.1% |

- **Nonprofit hospitals** had a larger share of four-star and five-star ratings than for-profit or government hospitals.
- **For-profit hospitals** had the largest share of one-star and two-star ratings and the lowest average rating.
- **Other hospitals** had the highest ratings, although the size and composition of this group require consideration.

Differences between ownership groups do not establish that ownership itself causes higher or lower quality ratings. Hospital characteristics, patient populations, and the availability of ratings may also influence comparisons.

### 3. Average Hospital Rating by Region

| Region | Average Rating |
|---|---:|
| Mountain West | 3.66 |
| Midwest | 3.35 |
| New England | 3.27 |
| Southwest | 3.26 |
| Mid-Atlantic | 3.14 |
| Pacific | 3.13 |
| Southeast | 3.02 |
| U.S. Territories | 1.70 |

The Mountain West had the highest regional average, while the Southeast had the lowest among the seven state-based regions. U.S. Territories averaged 1.70, but only ten territorial hospitals had available ratings, so this group should not be compared directly with larger regions without considering sample size and hospital characteristics.

### 4. State-Level Differences

Utah had the highest state average at 4.24, and no state reached 4.5 stars. Mississippi (2.33) and New Mexico (2.48) were the only states that averaged below 2.5 stars.

Geographic differences are descriptive and do not explain the reasons for higher or lower hospital ratings.

## Conclusion

The Hospital Quality Dashboard identifies differences in overall star ratings across hospital ownership groups and geographic regions while distinguishing rated from unrated facilities.

Nonprofit hospitals had a higher proportion of four-star and five-star ratings than for-profit and government hospitals, and for-profit hospitals were the most likely to receive one or two stars. Regionally, the Mountain West recorded the highest average rating, while substantial variation remained across the country.

Only 58.3% of hospitals had available overall ratings, mostly acute care and critical access hospitals, which limits how broadly the results can be generalized. The dashboard provides a practical starting point for identifying patterns, but the results should not be interpreted as definitive rankings of hospital quality.

## Visualizations

The Power BI report contains four principal visual components.

### Visual 1. Key Performance Indicators

Three summary cards display total hospitals, average star rating among rated facilities, and the percentage of hospitals with available ratings.

### Visual 2. Hospital Ratings by Ownership Type

A 100% stacked horizontal bar chart compares the distribution of one-star through five-star ratings across nonprofit, for-profit, government, and other ownership groups.

### Visual 3. Average Hospital Rating by Region

A horizontal bar chart ranks geographic regions by average star rating.

### Visual 4. Average Hospital Rating by State

An interactive U.S. map displays average state ratings using five color-coded ranges, with tooltips showing each state's average rating and number of rated hospitals.

### Interactive Features

The dashboard includes:

- State filter
- Hospital Type filter
- Hospital Ownership filter
- Interactive chart selections and tooltips
- Instructions for navigating and resetting selections

## How to Run

1. Download `Hospital_Quality_Dashboard.pbix` and `Hospital_General_Information_2.csv`.
2. Install Microsoft Power BI Desktop if necessary.
3. Open `Hospital_Quality_Dashboard.pbix` in Power BI Desktop. The saved report can be explored using the existing data model.
4. If refreshing the data, update the CSV source location through Power BI's data source settings to point to the downloaded file.
5. Apply the State, Hospital Type, and Hospital Ownership filters to explore hospital ratings.
6. Select individual chart elements or states to investigate results, and clear selections to return to the broader view.

## Repository Structure

- `Hospital_Quality_Dashboard.pbix` — Interactive Power BI report, data model, and visualizations
- `Hospital_General_Information_2.csv` — Original CMS hospital dataset
- `header_hospital_icon.png` — Dashboard header icon
- `hospital_icon_v2.png` — Total Hospitals card icon
- `star_icon_v2.png` — Average Star Rating card icon
- `rated_icon_column.png` — Hospitals Rated card icon
- `info_icon.png` — How to Use panel icon
- `README.md` — Project documentation and findings

The Power BI file contains the dashboard's embedded icons. The separate icon files are design assets and are not required to open the report.

## Ethical Considerations

Hospital quality ratings can influence healthcare decisions, making accurate presentation and interpretation particularly important.

A hospital's overall star rating summarizes selected quality measures but does not describe every aspect of care. Ratings should not be interpreted as complete assessments of medical professionals, individual treatment outcomes, or patient experiences, or used alone to choose where to receive care.

Hospitals without available ratings were not classified as low-performing facilities. The dashboard separates missing ratings from numerical results to reduce the risk of misleading comparisons.

The analysis uses publicly available facility-level information, reports results only by group, region, and state, and does not include identifiable patient records.

## Limitations

The analysis uses a single CMS dataset and represents a snapshot of published hospital information rather than changes in quality over time.

Approximately 41.7% of hospitals did not have available overall star ratings. Excluding these hospitals from rating calculations may affect comparisons, particularly because rating availability differs by hospital type, ownership, and geographic location.

The dashboard uses overall star ratings rather than individual quality measures, limiting its ability to explain the underlying reasons for performance differences. Average ratings also treat star levels from 1 to 5 as evenly spaced, which simplifies the CMS rating categories.

Ownership and regional categories simplify more detailed hospital classifications. Some groups contain relatively few rated hospitals, making their averages or rating distributions less stable. U.S. Territories had only 10 rated hospitals, and Guam had only one.

Geographic comparisons do not adjust for differences in patient populations, hospital size, clinical complexity, or services provided.

The findings are descriptive and do not establish causal relationships or provide recommendations about which hospitals patients should choose.
