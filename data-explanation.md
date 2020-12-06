# Data collection

## Current data

- wages_hs2020.rda contains the current tidied data
- wages_hs2020_complete.rda for more employment history

## Code

- brolgar.R contains code for analysis in brolgar
- code_di.R contains code by Di for initial quality checks

## Data source
Extracting data from https://www.nlsinfo.org/content/cohorts/nlsy79/get-data to get a wages data set with several demographics, suitable for developing methods to explore longitudinal data

## Explanation of cohort

Information from the web site:

*National Longitudinal Survey of Youth | 1979 (NLSY79)
The NLSY79 Cohort is a longitudinal project that follows the lives of a sample of American youth born between 1957-64. The cohort originally included 12,686 respondents ages 14-22 when first interviewed in 1979; after two subsamples were dropped, 9,964 respondents remain in the eligible samples. Data are now available from Round 1 (1979 survey year) to Round 27 (2016 survey year).*

## Choosing variables

On web site choose:

- Education, Training & Achievement Scores
    -  Education
        -  Summary measures
            - All  schools
                - By year
                    - Highest grade completed (78 variables)
- Employment
    - Summary measures
        -  By year
            - Annual wages and  earnings
        - By job
            - Hours worked
            - Hourly wages
- Household, Geography & Contextual Variables
    - Context
        - Summary measures
            - Basic demographics

## Files downloaded

All in data-raw/wages-high-school-demo.

- wages-high-school-demo.NLSY79: This is the tagset, that can be uploaded to the web site to recreate the data set
- wages-high-school-demo.R: provided by NLSY for reading into R, reads new data, qnames (to convert names and cooding into something sensible)
- data is in wages-high-school-demo.dat and also wages-high-school-demo.csv

## Notes

Education - Highest grade completed data:
- Chose the revised May data because the May data seemed to have less missing and presumably the revised data has been checked
- There was no revised May data for 2012, 2014 and 2016, so just used ordinary May data


Employment - Hours worked per week data:
- initially only one variable per job, no choice from 1979 to 1987
- when had more options, chose the variable for total hours including time spent working from home (D)
- 1993 didn't have all five D variables - the first one and the last one were missing - so used the A variable instead (number of hours worked, before any questions about working from home were asked)
- 2008 only had jobs 1-4 for the D variable (whereas the other years had 1-5), so just used these
