##Load all the libraries your heart desires

if (!require('pacman')) install.packages('pacman'); library('pacman')

pacman::p_load("ggplot2",
               "colorspace",
               "formatR",
               "feather",
               "zoo", #rollapply()
               "furrr",
               "xts",
               "imputeTS",
               "purrr",
               "changepoint",
               "corrplot",
               "ggfortify",
               "cluster",
               "FactoMineR",
               "factoextra",
               "tidyverse",
               "lubridate",
               "patchwork",
               "kableExtra",
               "ggstatsplot",
               "ggthemes",
               "ggpubr",
               "GGally",
               "data.table",
               "huxtable",
               "officer",
               "flextable",
               "sf",
               "rnaturalearth",
               "rnaturalearthdata",
               "ggspatial",
               "raster",
               "tidytext",
               "nhdplusTools",
               "maps",
               "rgeos",
               "ggfortify",
               "trend", #for sen slopes
               "zyp", #for sen slopes
               "coin"
               )