### File:    summary_small2_csv.R
### Purpose: summary data from 'small2.csv' stored in 
###          in file orig_small2_csv.RData in directory 'data/derived'
###          and store in summary_small2_csv.RData in directory 'data/derived'
### Created: Wed Jun 27 16:59:51 2018 initially for demo
### Author:  Peter Baker
### Licence: GPL3 see <http://www.gnu.org/licenses/>

### Changelog: -- insert comments and times re changes here --

## Specific libraries to be used. NB: can also be loaded in .Rprofile
library(car)
library(psych)

### Read/Load data in file ../data/derived/clean_small2_csv.RData  ---------
load("data/derived/orig_small2_csv.RData")

## Data structure(s)
## ls.str() # uncomment this line to see structure of all objects in workspace
str(df1)

comment(df1)

## Insert sensible summary commands here -------------------------------

## Summary statistics:

cat("Summary statistics for 'small2_csv_orig':\n")

summary(df1)

psych::describe(df1)
    
### Example: simple plot of data

boxplot(bmi.21 ~ matEducat, data = df1,
        main = "BMI at 21 by Mother's Edudation Level") 

## you may need to install these packages
library(GGally)
ggpairs1 <- GGally::ggpairs(df1[,1:6])
ggpairs1

## Table One
library(compareGroups)

res <-
  compareGroups(sex ~ bmi.21 + bpSys.21 + bpDia.21 + ysrExter.14 + ysrInter.14,
                df1, reference = 'Female')

res

table1 <- createTable(res)
table1

## lets store data, plot and table away for later
(comment(res) <- paste("Summary table for 'small2_csv' saved at", date()))
(comment(ggpairs1) <- paste("Pairwise plots for 'small2_csv' saved at", date()))

### Store summary data for subsequent analysis/reports  ----------------

save(df1, ggpairs1, table1, 
  file = file.path("data/derived", "summary_small2_csv.RData"))
