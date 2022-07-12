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
 
#Pull in .nc data files ...
# load the ncdf4 package
library(ncdf4)
# set path and filename
# Tutorial from: https://pjbartlein.github.io/REarthSysSci/netCDF.html#reading-restructuring-and-writing-netcdf-files-in-r
ncpath <- "~/Dropbox/dropbox Research/fire-color/data/temperature_willard/"
ncname <- "01_predicted_temp_N24-53_W98-126"  
ncfname <- paste(ncpath, ncname, ".nc", sep="")
dname <- "surftemp"  # note: tmp means temperature (not temporary)

# open a netCDF file
ncin <- nc_open(ncfname)
print(ncin)

# get longitude and latitude
lon <- ncvar_get(ncin,"lon")
nlon <- dim(lon)
head(lon)
lat <- ncvar_get(ncin,"lat")
nlat <- dim(lat)
head(lat)
print(c(nlon,nlat))
#Get site ID
site_id <- ncvar_get(ncin,"site_id")
site_id

# get temperature
tmp_array <- ncvar_get(ncin,dname)
dlname <- ncatt_get(ncin,dname,"long_name")
dunits <- ncatt_get(ncin,dname,"units")
fillvalue <- ncatt_get(ncin,dname,"missing_value")
dim(tmp_array)
names(tmp_array)
# get global attributes
standard_name_vocabulary <- ncatt_get(ncin,0,"standard_name_vocabulary")
cdm_data_type <- ncatt_get(ncin,0,"cdm_data_type")
featureType <- ncatt_get(ncin,0,"featureType")
Conventions <- ncatt_get(ncin,0,"Conventions")


# Reshaping from raster to rectangular ------------------------------------
library(chron)

