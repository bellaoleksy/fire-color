# Lake temperature data -------------------------------------------------------------

#' This script pulls the water temperature data from Willard et al. and uses LAGOS-US lake link to make the NHD HR IDs to our existing dataset

#' Willard, J., Read, J.S., Topp, S.N., Hansen, G.J.A., and Kumar, V., 2022, Daily surface temperature predictions for 185,549 U.S. lakes with associated observations and meteorological conditions (1980-2020): U.S. Geological Survey data release, https://doi.org/10.5066/P9CEMS0M.


source("scripts/00_libraries.R")
source("scripts/00_helperFuns.R")

#Pull in lake_link so we have NHD HR identifier
lake_link<-read_csv("data/lagos/lake_link.csv") %>%
  select(lagoslakeid, nhdplusv2_comid, nhdhr_gnisid)
names(lake_link)


#Pull in water temperature metadata
temperature_metadata <- read_csv("data/temperature_willard/lake_metadata.csv")
head(temperature_metadata)

temperature_metadata <- temperature_metadata %>%
  separate(site_id, into=c("type","nhdhr_gnisid"), sep="_")

#Pull is raw surface temperature data
lake_temperature <- read_csv("data/temperature_willard/lake_surface_temp_obs_preds.csv")%>%
  separate(site_id, into=c("type","nhdhr_gnisid"), sep="_")

head(lake_temperature)
#' @param wtemp_EALSTM Predicted surface temperature from the EA-LSTM model (Willard et al., 2021; Kratzert et al., 2019) in degrees C.
#' @param wtemp_LM Predicted surface temperature from the Bachmann linear model (Bachmann et al., 2019) in degrees C.
#' @param wtemp_ERA5 Predicted surface temperature from the ERA5 FLake model (Hersbach et al., 2020) in degrees C.
#' @param wtemp_ERA5* Predicted surface temperature from the ERA5 FLake model (Hersbach et al., 2020) with simple offset (+3.31°C; Willard et al., 2022) applied for the purpose of removing a cold bias in degrees C.
#' @param wtemp_obs Observed surface temperature (Willard et al., 2022) in degrees C.
#' @param obs_data_source  Data source name from monitoring group (Willard et al., 2022).