## ----setup, include=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(echo = FALSE)
knitr::opts_knit$set(root.dir='..')
knitr::opts_chunk$set(out.width = '100%',fig.height=5,
                      echo=FALSE, 
               warning=FALSE, message=FALSE) 



## ----some package version control stuff, echo=FALSE, message=FALSE, warning=FALSE, include=FALSE----------------------------------------------------------------------------------------------------------------------
##Hi! If you have never used renv read their little vignette here. 
##https://rstudio.github.io/renv/articles/renv.html

##If you've ever had script not work after updating R/various libraries, using
##renv() is a nice way to avoid a lot of future headaches. -IAO

if (!require('renv')) install.packages('renv');library('renv')

#Create a lockfile for packages
# renv::init()


## ----Load necessary packages, echo=FALSE, message=FALSE, warning=FALSE, include=FALSE---------------------------------------------------------------------------------------------------------------------------------
if (!require('here')) install.packages('here');library('here')
##enable easy file referencing in project-oriented workflows.
##https://rstats.wtf/project-oriented-workflow.html
## ^ ^ a little more on that

source(here("scripts/00_libraries.R"))


## ----Load LAGOS IDs dataframe, echo=FALSE, message=FALSE, warning=FALSE, include=FALSE--------------------------------------------------------------------------------------------------------------------------------
source(here("scripts/01.0_pullLakeIDsLAGOS.R"))
source(here("scripts/01.1_pullLakeCat.R"))
#Currently only pulling out MTBS, FirePerimeters, and ForestLoss, but all the other data is in that R file and commented out for speed. 


