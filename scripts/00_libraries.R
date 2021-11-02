##Load all the libraries your heart desires


# install.packages(c("cowplot", "googleway", "ggplot2", "ggrepel", 
# "ggspatial", "libwgeom", "sf", "rnaturalearth", "rnaturalearthdata"))
if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')
if (!require('colorspace')) install.packages('colorspace'); library('colorspace')#Borrowed some code from their minimum working example: 

library(tidyverse)
library(lubridate)
if (!require('patchwork')) install.packages('patchwork'); library('patchwork')
if (!require('kableExtra')) install.packages('kableExtra'); library('kableExtra')
library(data.table) #for faster data summaries than dplyr
if (!require('ggstatsplot')) install.packages('ggstatsplot'); library('ggstatsplot')
if (!require('ggthemes')) install.packages('ggthemes'); library('ggthemes')
theme_set(ggthemes::theme_base())
if (!require('GGally')) install.packages('GGally'); library('GGally')


#For summaries
if (!require('huxtable')) install.packages('huxtable'); library('huxtable')
if (!require('officer')) install.packages('officer'); library('officer')
if (!require('flextable')) install.packages('flextable'); library('flextable')

#Mapping
if (!require('sf')) install.packages('sf'); library("sf")
if (!require('rnaturalearth')) install.packages('rnaturalearth'); library("rnaturalearth")
if (!require('rnaturalearthdata')) install.packages('rnaturalearthdata'); library("rnaturalearthdata")
if (!require('ggspatial')) install.packages('ggspatial'); library("ggspatial")
if (!require('raster')) install.packages('raster'); library(raster)
if (!require('tidytext')) install.packages('tidytext'); library(tidytext)
if (!require('nhdplusTools')) install.packages('nhdplusTools'); library('nhdplusTools')
if (!require('maps')) install.packages('maps'); library('maps')

if (!require('ggfortify')) install.packages('ggfortify'); library('ggfortify')
if (!require('cluster')) install.packages('cluster'); library('cluster')
if (!require('FactoMineR')) install.packages('FactoMineR'); library('FactoMineR')
if (!require('factoextra')) install.packages('factoextra'); library('factoextra')

#For sen slopes
library(trend)
library(zyp)

#Wilcox tests

if (!require('coin')) install.packages('coin'); library('coin')
