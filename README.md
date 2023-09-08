# DNAnexus project checker

This repo contains script to check the standards of DNAnexus projects are met. Each file does as follows:

- **project_query.sh** - generates files with info on created date, modified data and storage costs per project (002, 003 and 004)

- **archival_query.py** - takes in project IDs and will return each file archival status. Please note that due to the how exhaustive this is, it takes roughly 1 hour to query each file of a production 002 project.

- **functions.R** - a bunch of functions called in the Rmardown

- **DNAnexus_project_checker.Rmd** - Rmarkdown that generates plots from the data produced from the first two scripts listed. Output is html interactive dashboard.



