# Lab Analysis Trends and Risk Calculation

This project is designed to analyze lab test trends and calculate associated risks using various R packages. The focus is on plotting trend data for lab results and visually assessing risk levels based on predefined thresholds.

## Requirements

- **R**: A language and environment for statistical computing and graphics.
- **ggplot2**: A data visualization package for R, part of the tidyverse, which makes it easy to produce complex multi-layered graphics.
- **tidyverse**: A collection of R packages designed for data science, including tools for data manipulation, visualization, and more.
- **CVrisk**: An R package for calculating cardiovascular risk scores based on different models.

## Installation

To install the required R packages, use the following commands:

1. ggplot2: For creating complex, multi-layered graphics.
2. tidyverse: A collection of R packages for data manipulation and visualization.
3. CVrisk: For calculating cardiovascular risk scores.

## Data

The data is read directly from a GitHub repository. It contains lab test results in a tab-separated values (TSV) format. Ensure that the data file is accessible at the specified URL.

## Usage

### Load and Prepare Data

The data is read and prepared for analysis. The `Date` column is converted to Date format for proper time series analysis.

### Trend Plot of Lab Analysis

A trend plot is created to visualize the lab test results over time. Points above the threshold are highlighted differently from those below the threshold to easily identify outliers.

### Plot Customization

The plot includes several customization features:
- Different line types for each lab item.
- Highlighting points above the threshold.
- Adding horizontal lines at threshold levels.
- Customizing axis labels, titles, and legends for better readability.


@ Explanation of Risk Scores
## ASCVD 10-Year Risk Score (ACC/AHA)
ascvd_10y_accaha: This score calculates the 10-year risk of developing atherosclerotic cardiovascular disease (ASCVD) using guidelines from the American College of Cardiology (ACC) and the American Heart Association (AHA). It considers factors such as age, gender, race, cholesterol levels, blood pressure, diabetes status, smoking status, and medication use. The patient's score ranges from 1.00% to 1.02%, indicating a very low risk of cardiovascular events over the next 10 years.
## Framingham Risk Scores
ascvd_10y_frs: This is the Framingham Risk Score, which estimates the 10-year risk of ASCVD. It uses a similar set of risk factors as the ACC/AHA score but applies a different algorithm. The patient's score ranges from 3.06% to 3.77%, still indicating a low risk.
ascvd_10y_frs_simple: This is a simplified version of the Framingham Risk Score. The patient's score is consistently 3.39% across all records, indicating a low risk.
## MESA Risk Scores
chd_10y_mesa: This score estimates the 10-year risk of coronary heart disease (CHD) based on the Multi-Ethnic Study of Atherosclerosis (MESA) cohort. It includes similar risk factors but is tailored for a multi-ethnic population. The patient's score ranges from 1.69% to 1.94%, suggesting a very low risk of CHD.
chd_10y_mesa_cac: This score incorporates the Coronary Artery Calcium (CAC) score for a more accurate estimation. The patient's score ranges from 1.41% to 1.58%, indicating a very low risk of CHD, reflecting the absence of calcified plaque in the coronary arteries.
