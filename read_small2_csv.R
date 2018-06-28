### File:    read_small2_csv.R
### Purpose: read from data file 'small2.csv' in directory 'data/original'
###          and store in 'orig_small2_csv.RData' in directory 'data/derived'
### Created: Wed Jun 27 16:59:51 2018 for demo
### Author:  Peter Baker
### Licence: GPL3 see <http://www.gnu.org/licenses/>

### Changelog: -- insert comments and times re changes here --

## Specific libraries to be used. NB: can also be loaded in .Rprofile
library(car)

### Read in data file 'small2.csv' in '../data/original'
small2_csv_orig <- read.csv("data/original/small2.csv")

### could rename to help with less typing
df1 <- small2_csv_orig

df1 <-
  transform(df1,
            matEducat = factor(matEducat,
                               labels = c("IncompHigh", "CompHigh","PostHigh")),
            familyIncome = factor(familyIncome, labels = c("<$10399",">=$10400")),
            sex = factor(sex, labels = c("Male", "Female")))
## str(df1[, c("matEducat", "familyIncome", "sex")])

## Data structure
str(df1)

### You can insert any transformations here or tidy up variable names
### and so on but ideally these should be carried out when cleaning
### the data so that an unchanged original version is stored initially

df1 <- transform(df1, logBMI = log(bmi.21))
names(df1)

### Store data for subsequent analysis
(comment(df1) <- paste("Data read from 'small2.csv' at", date()))
comment(df1)

save(small2_csv_orig, df1,
  file = file.path("data/derived", "orig_small2_csv.RData"))

