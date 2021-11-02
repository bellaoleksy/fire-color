
# pull 'lakeinformation' dataframe from EDI -------------------------------

 
#Pull from EDI
# https://portal.edirepository.org/nis/mapbrowse?packageid=edi.854.1

# Package ID: edi.854.1 Cataloging System:https://pasta.edirepository.org.
# Data set title: LAGOS-US LOCUS v1.0: Data module of location, identifiers, and physical characteristics of lakes and their watersheds in the conterminous U.S..
# Data set creator:  Nicole Smith - Michigan State University 
# Data set creator:  Katherine Webster - Michigan State University 
# Data set creator:  Lauren Rodriguez - Michigan State University 
# Data set creator:  Kendra Cheruvelil - Michigan State University 
# Data set creator:  Patricia Soranno - Michigan State University 
# Contact:  Kendra Cheruvelil -  Michigan State University  - ksc@msu.edu
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu 
#
#install package tidyverse if not already installed
if(!require(tidyverse)){ install.packages("tidyverse") }  
library("tidyverse") 
infile1 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/854/1/007ca4f5ec02bb5809fc661dcfa7a903") 
infile1 <-sub("^https","http",infile1)
# This creates a tibble named: lakeinformation 
lakeinformation <-read_delim(infile1  
                             ,delim=","   
                             ,skip=1 
                             ,quote='"'  
                             , col_names=c( 
                               "lagoslakeid",   
                               "lake_nhdid",   
                               "lake_nhdfcode",   
                               "lake_nhdftype",   
                               "lake_reachcode",   
                               "lake_namegnis",   
                               "lake_namelagos",   
                               "lake_onlandborder",   
                               "lake_ismultipart",   
                               "lake_missingws",   
                               "lake_shapeflag",   
                               "lake_lat_decdeg",   
                               "lake_lon_decdeg",   
                               "lake_elevation_m",   
                               "lake_centroidstate",   
                               "lake_states",   
                               "lake_county",   
                               "lake_countyfips",   
                               "lake_huc12",   
                               "buff100_zoneid",   
                               "buff500_zoneid",   
                               "ws_zoneid",   
                               "nws_zoneid",   
                               "hu12_zoneid",   
                               "hu8_zoneid",   
                               "hu4_zoneid",   
                               "county_zoneid",   
                               "state_zoneid",   
                               "epanutr_zoneid",   
                               "omernik3_zoneid",   
                               "wwf_zoneid",   
                               "mlra_zoneid",   
                               "bailey_zoneid",   
                               "neon_zoneid"   ), 
                             col_types=list(
                               col_number() ,  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(), 
                               col_number() , 
                               col_number() , 
                               col_number() ,  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character(),  
                               col_character()), 
                             na=c(" ",".","NA")  )


# Convert Missing Values to NA for individual vectors 
lakeinformation$lagoslakeid <- ifelse((trimws(as.character(lakeinformation$lagoslakeid))==trimws("NA")),NA,lakeinformation$lagoslakeid)               
suppressWarnings(lakeinformation$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lagoslakeid))==as.character(as.numeric("NA"))),NA,lakeinformation$lagoslakeid))
lakeinformation$lake_nhdid <- ifelse((trimws(as.character(lakeinformation$lake_nhdid))==trimws("NA")),NA,lakeinformation$lake_nhdid)               
suppressWarnings(lakeinformation$lake_nhdid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_nhdid))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_nhdid))
lakeinformation$lake_nhdfcode <- ifelse((trimws(as.character(lakeinformation$lake_nhdfcode))==trimws("NA")),NA,lakeinformation$lake_nhdfcode)               
suppressWarnings(lakeinformation$lake_nhdfcode <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_nhdfcode))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_nhdfcode))
lakeinformation$lake_nhdftype <- ifelse((trimws(as.character(lakeinformation$lake_nhdftype))==trimws("NA")),NA,lakeinformation$lake_nhdftype)               
suppressWarnings(lakeinformation$lake_nhdftype <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_nhdftype))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_nhdftype))
lakeinformation$lake_reachcode <- ifelse((trimws(as.character(lakeinformation$lake_reachcode))==trimws("NA")),NA,lakeinformation$lake_reachcode)               
suppressWarnings(lakeinformation$lake_reachcode <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_reachcode))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_reachcode))
lakeinformation$lake_namegnis <- ifelse((trimws(as.character(lakeinformation$lake_namegnis))==trimws("NA")),NA,lakeinformation$lake_namegnis)               
suppressWarnings(lakeinformation$lake_namegnis <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_namegnis))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_namegnis))
lakeinformation$lake_namelagos <- ifelse((trimws(as.character(lakeinformation$lake_namelagos))==trimws("NA")),NA,lakeinformation$lake_namelagos)               
suppressWarnings(lakeinformation$lake_namelagos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_namelagos))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_namelagos))
lakeinformation$lake_onlandborder <- ifelse((trimws(as.character(lakeinformation$lake_onlandborder))==trimws("NA")),NA,lakeinformation$lake_onlandborder)               
suppressWarnings(lakeinformation$lake_onlandborder <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_onlandborder))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_onlandborder))
lakeinformation$lake_ismultipart <- ifelse((trimws(as.character(lakeinformation$lake_ismultipart))==trimws("NA")),NA,lakeinformation$lake_ismultipart)               
suppressWarnings(lakeinformation$lake_ismultipart <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_ismultipart))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_ismultipart))
lakeinformation$lake_missingws <- ifelse((trimws(as.character(lakeinformation$lake_missingws))==trimws("NA")),NA,lakeinformation$lake_missingws)               
suppressWarnings(lakeinformation$lake_missingws <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_missingws))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_missingws))
lakeinformation$lake_shapeflag <- ifelse((trimws(as.character(lakeinformation$lake_shapeflag))==trimws("NA")),NA,lakeinformation$lake_shapeflag)               
suppressWarnings(lakeinformation$lake_shapeflag <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_shapeflag))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_shapeflag))
lakeinformation$lake_lat_decdeg <- ifelse((trimws(as.character(lakeinformation$lake_lat_decdeg))==trimws("NA")),NA,lakeinformation$lake_lat_decdeg)               
suppressWarnings(lakeinformation$lake_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_lat_decdeg))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_lat_decdeg))
lakeinformation$lake_lon_decdeg <- ifelse((trimws(as.character(lakeinformation$lake_lon_decdeg))==trimws("NA")),NA,lakeinformation$lake_lon_decdeg)               
suppressWarnings(lakeinformation$lake_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_lon_decdeg))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_lon_decdeg))
lakeinformation$lake_elevation_m <- ifelse((trimws(as.character(lakeinformation$lake_elevation_m))==trimws("NA")),NA,lakeinformation$lake_elevation_m)               
suppressWarnings(lakeinformation$lake_elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_elevation_m))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_elevation_m))
lakeinformation$lake_centroidstate <- ifelse((trimws(as.character(lakeinformation$lake_centroidstate))==trimws("NA")),NA,lakeinformation$lake_centroidstate)               
suppressWarnings(lakeinformation$lake_centroidstate <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_centroidstate))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_centroidstate))
lakeinformation$lake_states <- ifelse((trimws(as.character(lakeinformation$lake_states))==trimws("NA")),NA,lakeinformation$lake_states)               
suppressWarnings(lakeinformation$lake_states <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_states))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_states))
lakeinformation$lake_county <- ifelse((trimws(as.character(lakeinformation$lake_county))==trimws("NA")),NA,lakeinformation$lake_county)               
suppressWarnings(lakeinformation$lake_county <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_county))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_county))
lakeinformation$lake_countyfips <- ifelse((trimws(as.character(lakeinformation$lake_countyfips))==trimws("NA")),NA,lakeinformation$lake_countyfips)               
suppressWarnings(lakeinformation$lake_countyfips <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_countyfips))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_countyfips))
lakeinformation$lake_huc12 <- ifelse((trimws(as.character(lakeinformation$lake_huc12))==trimws("NA")),NA,lakeinformation$lake_huc12)               
suppressWarnings(lakeinformation$lake_huc12 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$lake_huc12))==as.character(as.numeric("NA"))),NA,lakeinformation$lake_huc12))
lakeinformation$buff100_zoneid <- ifelse((trimws(as.character(lakeinformation$buff100_zoneid))==trimws("NA")),NA,lakeinformation$buff100_zoneid)               
suppressWarnings(lakeinformation$buff100_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$buff100_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$buff100_zoneid))
lakeinformation$buff500_zoneid <- ifelse((trimws(as.character(lakeinformation$buff500_zoneid))==trimws("NA")),NA,lakeinformation$buff500_zoneid)               
suppressWarnings(lakeinformation$buff500_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$buff500_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$buff500_zoneid))
lakeinformation$ws_zoneid <- ifelse((trimws(as.character(lakeinformation$ws_zoneid))==trimws("NA")),NA,lakeinformation$ws_zoneid)               
suppressWarnings(lakeinformation$ws_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$ws_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$ws_zoneid))
lakeinformation$nws_zoneid <- ifelse((trimws(as.character(lakeinformation$nws_zoneid))==trimws("NA")),NA,lakeinformation$nws_zoneid)               
suppressWarnings(lakeinformation$nws_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$nws_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$nws_zoneid))
lakeinformation$hu12_zoneid <- ifelse((trimws(as.character(lakeinformation$hu12_zoneid))==trimws("NA")),NA,lakeinformation$hu12_zoneid)               
suppressWarnings(lakeinformation$hu12_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$hu12_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$hu12_zoneid))
lakeinformation$hu8_zoneid <- ifelse((trimws(as.character(lakeinformation$hu8_zoneid))==trimws("NA")),NA,lakeinformation$hu8_zoneid)               
suppressWarnings(lakeinformation$hu8_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$hu8_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$hu8_zoneid))
lakeinformation$hu4_zoneid <- ifelse((trimws(as.character(lakeinformation$hu4_zoneid))==trimws("NA")),NA,lakeinformation$hu4_zoneid)               
suppressWarnings(lakeinformation$hu4_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$hu4_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$hu4_zoneid))
lakeinformation$county_zoneid <- ifelse((trimws(as.character(lakeinformation$county_zoneid))==trimws("NA")),NA,lakeinformation$county_zoneid)               
suppressWarnings(lakeinformation$county_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$county_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$county_zoneid))
lakeinformation$state_zoneid <- ifelse((trimws(as.character(lakeinformation$state_zoneid))==trimws("NA")),NA,lakeinformation$state_zoneid)               
suppressWarnings(lakeinformation$state_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$state_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$state_zoneid))
lakeinformation$epanutr_zoneid <- ifelse((trimws(as.character(lakeinformation$epanutr_zoneid))==trimws("NA")),NA,lakeinformation$epanutr_zoneid)               
suppressWarnings(lakeinformation$epanutr_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$epanutr_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$epanutr_zoneid))
lakeinformation$omernik3_zoneid <- ifelse((trimws(as.character(lakeinformation$omernik3_zoneid))==trimws("NA")),NA,lakeinformation$omernik3_zoneid)               
suppressWarnings(lakeinformation$omernik3_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$omernik3_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$omernik3_zoneid))
lakeinformation$wwf_zoneid <- ifelse((trimws(as.character(lakeinformation$wwf_zoneid))==trimws("NA")),NA,lakeinformation$wwf_zoneid)               
suppressWarnings(lakeinformation$wwf_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$wwf_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$wwf_zoneid))
lakeinformation$mlra_zoneid <- ifelse((trimws(as.character(lakeinformation$mlra_zoneid))==trimws("NA")),NA,lakeinformation$mlra_zoneid)               
suppressWarnings(lakeinformation$mlra_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$mlra_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$mlra_zoneid))
lakeinformation$bailey_zoneid <- ifelse((trimws(as.character(lakeinformation$bailey_zoneid))==trimws("NA")),NA,lakeinformation$bailey_zoneid)               
suppressWarnings(lakeinformation$bailey_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$bailey_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$bailey_zoneid))
lakeinformation$neon_zoneid <- ifelse((trimws(as.character(lakeinformation$neon_zoneid))==trimws("NA")),NA,lakeinformation$neon_zoneid)               
suppressWarnings(lakeinformation$neon_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeinformation$neon_zoneid))==as.character(as.numeric("NA"))),NA,lakeinformation$neon_zoneid))


# Observed issues when reading the data. An empty list is good!
problems(lakeinformation) 
# Here is the structure of the input data tibble: 
glimpse(lakeinformation) 
# And some statistical summaries of the data 
summary(lakeinformation) 
# Get more details on character variables

summary(as.factor(lakeinformation$lake_nhdid)) 
summary(as.factor(lakeinformation$lake_nhdfcode)) 
summary(as.factor(lakeinformation$lake_nhdftype)) 
summary(as.factor(lakeinformation$lake_reachcode)) 
summary(as.factor(lakeinformation$lake_namegnis)) 
summary(as.factor(lakeinformation$lake_namelagos)) 
summary(as.factor(lakeinformation$lake_onlandborder)) 
summary(as.factor(lakeinformation$lake_ismultipart)) 
summary(as.factor(lakeinformation$lake_missingws)) 
summary(as.factor(lakeinformation$lake_shapeflag)) 
summary(as.factor(lakeinformation$lake_centroidstate)) 
summary(as.factor(lakeinformation$lake_states)) 
summary(as.factor(lakeinformation$lake_county)) 
summary(as.factor(lakeinformation$lake_countyfips)) 
summary(as.factor(lakeinformation$lake_huc12)) 
summary(as.factor(lakeinformation$buff100_zoneid)) 
summary(as.factor(lakeinformation$buff500_zoneid)) 
summary(as.factor(lakeinformation$ws_zoneid)) 
summary(as.factor(lakeinformation$nws_zoneid)) 
summary(as.factor(lakeinformation$hu12_zoneid)) 
summary(as.factor(lakeinformation$hu8_zoneid)) 
summary(as.factor(lakeinformation$hu4_zoneid)) 
summary(as.factor(lakeinformation$county_zoneid)) 
summary(as.factor(lakeinformation$state_zoneid)) 
summary(as.factor(lakeinformation$epanutr_zoneid)) 
summary(as.factor(lakeinformation$omernik3_zoneid)) 
summary(as.factor(lakeinformation$wwf_zoneid)) 
summary(as.factor(lakeinformation$mlra_zoneid)) 
summary(as.factor(lakeinformation$bailey_zoneid)) 
summary(as.factor(lakeinformation$neon_zoneid)) 


# pull 'lakecharacteristics' dataframe from EDI ---------------------------



infile2 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/854/1/fd7fe936d290a12bc6dbf5c41047849e") 
infile2 <-sub("^https","http",infile2)
# This creates a tibble named: lakecharacteristics 
lakecharacteristics <-read_delim(infile2  
                                 ,delim=","   
                                 ,skip=1 
                                 ,quote='"'  
                                 , col_names=c( 
                                   "lagoslakeid",   
                                   "lake_waterarea_ha",   
                                   "lake_totalarea_ha",   
                                   "lake_islandarea_ha",   
                                   "lake_perimeter_m",   
                                   "lake_islandperimeter_m",   
                                   "lake_shorelinedevfactor",   
                                   "lake_mbgconhull_length_m",   
                                   "lake_mbgconhull_width_m",   
                                   "lake_mbgconhull_orientation_deg",   
                                   "lake_mbgrect_length_m",   
                                   "lake_mbgrect_width_m",   
                                   "lake_mbgrect_arearatio",   
                                   "lake_meanwidth_m",   
                                   "lake_connectivity_class",   
                                   "lake_connectivity_fluctuates",   
                                   "lake_connectivity_permanent",   
                                   "lake_lakes4ha_upstream_ha",   
                                   "lake_lakes4ha_upstream_n",   
                                   "lake_lakes1ha_upstream_ha",   
                                   "lake_lakes1ha_upstream_n",   
                                   "lake_lakes10ha_upstream_n",   
                                   "lake_lakes10ha_upstream_ha",   
                                   "lake_glaciatedlatewisc"   ), 
                                 col_types=list(
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() ,  
                                   col_character(),  
                                   col_character(),  
                                   col_character(), 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() , 
                                   col_number() ,  
                                   col_character()), 
                                 na=c(" ",".","NA")  )


# Convert Missing Values to NA for individual vectors 
lakecharacteristics$lagoslakeid <- ifelse((trimws(as.character(lakecharacteristics$lagoslakeid))==trimws("NA")),NA,lakecharacteristics$lagoslakeid)               
suppressWarnings(lakecharacteristics$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lagoslakeid))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lagoslakeid))
lakecharacteristics$lake_waterarea_ha <- ifelse((trimws(as.character(lakecharacteristics$lake_waterarea_ha))==trimws("NA")),NA,lakecharacteristics$lake_waterarea_ha)               
suppressWarnings(lakecharacteristics$lake_waterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_waterarea_ha))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_waterarea_ha))
lakecharacteristics$lake_totalarea_ha <- ifelse((trimws(as.character(lakecharacteristics$lake_totalarea_ha))==trimws("NA")),NA,lakecharacteristics$lake_totalarea_ha)               
suppressWarnings(lakecharacteristics$lake_totalarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_totalarea_ha))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_totalarea_ha))
lakecharacteristics$lake_islandarea_ha <- ifelse((trimws(as.character(lakecharacteristics$lake_islandarea_ha))==trimws("NA")),NA,lakecharacteristics$lake_islandarea_ha)               
suppressWarnings(lakecharacteristics$lake_islandarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_islandarea_ha))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_islandarea_ha))
lakecharacteristics$lake_perimeter_m <- ifelse((trimws(as.character(lakecharacteristics$lake_perimeter_m))==trimws("NA")),NA,lakecharacteristics$lake_perimeter_m)               
suppressWarnings(lakecharacteristics$lake_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_perimeter_m))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_perimeter_m))
lakecharacteristics$lake_islandperimeter_m <- ifelse((trimws(as.character(lakecharacteristics$lake_islandperimeter_m))==trimws("NA")),NA,lakecharacteristics$lake_islandperimeter_m)               
suppressWarnings(lakecharacteristics$lake_islandperimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_islandperimeter_m))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_islandperimeter_m))
lakecharacteristics$lake_shorelinedevfactor <- ifelse((trimws(as.character(lakecharacteristics$lake_shorelinedevfactor))==trimws("NA")),NA,lakecharacteristics$lake_shorelinedevfactor)               
suppressWarnings(lakecharacteristics$lake_shorelinedevfactor <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_shorelinedevfactor))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_shorelinedevfactor))
lakecharacteristics$lake_mbgconhull_length_m <- ifelse((trimws(as.character(lakecharacteristics$lake_mbgconhull_length_m))==trimws("NA")),NA,lakecharacteristics$lake_mbgconhull_length_m)               
suppressWarnings(lakecharacteristics$lake_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_mbgconhull_length_m))
lakecharacteristics$lake_mbgconhull_width_m <- ifelse((trimws(as.character(lakecharacteristics$lake_mbgconhull_width_m))==trimws("NA")),NA,lakecharacteristics$lake_mbgconhull_width_m)               
suppressWarnings(lakecharacteristics$lake_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_mbgconhull_width_m))
lakecharacteristics$lake_mbgconhull_orientation_deg <- ifelse((trimws(as.character(lakecharacteristics$lake_mbgconhull_orientation_deg))==trimws("NA")),NA,lakecharacteristics$lake_mbgconhull_orientation_deg)               
suppressWarnings(lakecharacteristics$lake_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_mbgconhull_orientation_deg))
lakecharacteristics$lake_mbgrect_length_m <- ifelse((trimws(as.character(lakecharacteristics$lake_mbgrect_length_m))==trimws("NA")),NA,lakecharacteristics$lake_mbgrect_length_m)               
suppressWarnings(lakecharacteristics$lake_mbgrect_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_mbgrect_length_m))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_mbgrect_length_m))
lakecharacteristics$lake_mbgrect_width_m <- ifelse((trimws(as.character(lakecharacteristics$lake_mbgrect_width_m))==trimws("NA")),NA,lakecharacteristics$lake_mbgrect_width_m)               
suppressWarnings(lakecharacteristics$lake_mbgrect_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_mbgrect_width_m))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_mbgrect_width_m))
lakecharacteristics$lake_mbgrect_arearatio <- ifelse((trimws(as.character(lakecharacteristics$lake_mbgrect_arearatio))==trimws("NA")),NA,lakecharacteristics$lake_mbgrect_arearatio)               
suppressWarnings(lakecharacteristics$lake_mbgrect_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_mbgrect_arearatio))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_mbgrect_arearatio))
lakecharacteristics$lake_meanwidth_m <- ifelse((trimws(as.character(lakecharacteristics$lake_meanwidth_m))==trimws("NA")),NA,lakecharacteristics$lake_meanwidth_m)               
suppressWarnings(lakecharacteristics$lake_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_meanwidth_m))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_meanwidth_m))
lakecharacteristics$lake_connectivity_class <- ifelse((trimws(as.character(lakecharacteristics$lake_connectivity_class))==trimws("NA")),NA,lakecharacteristics$lake_connectivity_class)               
suppressWarnings(lakecharacteristics$lake_connectivity_class <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_connectivity_class))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_connectivity_class))
lakecharacteristics$lake_connectivity_fluctuates <- ifelse((trimws(as.character(lakecharacteristics$lake_connectivity_fluctuates))==trimws("NA")),NA,lakecharacteristics$lake_connectivity_fluctuates)               
suppressWarnings(lakecharacteristics$lake_connectivity_fluctuates <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_connectivity_fluctuates))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_connectivity_fluctuates))
lakecharacteristics$lake_connectivity_permanent <- ifelse((trimws(as.character(lakecharacteristics$lake_connectivity_permanent))==trimws("NA")),NA,lakecharacteristics$lake_connectivity_permanent)               
suppressWarnings(lakecharacteristics$lake_connectivity_permanent <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_connectivity_permanent))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_connectivity_permanent))
lakecharacteristics$lake_lakes4ha_upstream_ha <- ifelse((trimws(as.character(lakecharacteristics$lake_lakes4ha_upstream_ha))==trimws("NA")),NA,lakecharacteristics$lake_lakes4ha_upstream_ha)               
suppressWarnings(lakecharacteristics$lake_lakes4ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_lakes4ha_upstream_ha))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_lakes4ha_upstream_ha))
lakecharacteristics$lake_lakes4ha_upstream_n <- ifelse((trimws(as.character(lakecharacteristics$lake_lakes4ha_upstream_n))==trimws("NA")),NA,lakecharacteristics$lake_lakes4ha_upstream_n)               
suppressWarnings(lakecharacteristics$lake_lakes4ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_lakes4ha_upstream_n))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_lakes4ha_upstream_n))
lakecharacteristics$lake_lakes1ha_upstream_ha <- ifelse((trimws(as.character(lakecharacteristics$lake_lakes1ha_upstream_ha))==trimws("NA")),NA,lakecharacteristics$lake_lakes1ha_upstream_ha)               
suppressWarnings(lakecharacteristics$lake_lakes1ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_lakes1ha_upstream_ha))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_lakes1ha_upstream_ha))
lakecharacteristics$lake_lakes1ha_upstream_n <- ifelse((trimws(as.character(lakecharacteristics$lake_lakes1ha_upstream_n))==trimws("NA")),NA,lakecharacteristics$lake_lakes1ha_upstream_n)               
suppressWarnings(lakecharacteristics$lake_lakes1ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_lakes1ha_upstream_n))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_lakes1ha_upstream_n))
lakecharacteristics$lake_lakes10ha_upstream_n <- ifelse((trimws(as.character(lakecharacteristics$lake_lakes10ha_upstream_n))==trimws("NA")),NA,lakecharacteristics$lake_lakes10ha_upstream_n)               
suppressWarnings(lakecharacteristics$lake_lakes10ha_upstream_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_lakes10ha_upstream_n))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_lakes10ha_upstream_n))
lakecharacteristics$lake_lakes10ha_upstream_ha <- ifelse((trimws(as.character(lakecharacteristics$lake_lakes10ha_upstream_ha))==trimws("NA")),NA,lakecharacteristics$lake_lakes10ha_upstream_ha)               
suppressWarnings(lakecharacteristics$lake_lakes10ha_upstream_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_lakes10ha_upstream_ha))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_lakes10ha_upstream_ha))
lakecharacteristics$lake_glaciatedlatewisc <- ifelse((trimws(as.character(lakecharacteristics$lake_glaciatedlatewisc))==trimws("NA")),NA,lakecharacteristics$lake_glaciatedlatewisc)               
suppressWarnings(lakecharacteristics$lake_glaciatedlatewisc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakecharacteristics$lake_glaciatedlatewisc))==as.character(as.numeric("NA"))),NA,lakecharacteristics$lake_glaciatedlatewisc))


# Observed issues when reading the data. An empty list is good!
problems(lakecharacteristics) 
# Here is the structure of the input data tibble: 
glimpse(lakecharacteristics) 
# And some statistical summaries of the data 
summary(lakecharacteristics) 
# Get more details on character variables

summary(as.factor(lakecharacteristics$lake_connectivity_class)) 
summary(as.factor(lakecharacteristics$lake_connectivity_fluctuates)) 
summary(as.factor(lakecharacteristics$lake_connectivity_permanent)) 
summary(as.factor(lakecharacteristics$lake_glaciatedlatewisc)) 


# pull 'lakewatersheds' dataframe from EDI --------------------------------



infile3 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/854/1/8bd86b94234a21a74991eca7bd9ab883") 
infile3 <-sub("^https","http",infile3)
# This creates a tibble named: lakewatersheds 
lakewatersheds <-read_delim(infile3  
                            ,delim=","   
                            ,skip=1 
                            ,quote='"'  
                            , col_names=c( 
                              "lagoslakeid",   
                              "ws_zoneid",   
                              "nws_zoneid",   
                              "ws_subtype",   
                              "ws_equalsnws",   
                              "ws_onlandborder",   
                              "ws_oncoast",   
                              "ws_inusa_pct",   
                              "ws_includeshu4inlet",   
                              "ws_ismultipart",   
                              "ws_sliverflag",   
                              "nws_onlandborder",   
                              "nws_oncoast",   
                              "nws_inusa_pct",   
                              "nws_includeshu4inlet",   
                              "nws_ismultipart",   
                              "ws_states",   
                              "ws_focallakewaterarea_ha",   
                              "ws_area_ha",   
                              "ws_perimeter_m",   
                              "ws_lake_arearatio",   
                              "ws_mbgconhull_length_m",   
                              "ws_mbgconhull_width_m",   
                              "ws_mbgconhull_orientation_deg",   
                              "ws_meanwidth_m",   
                              "ws_lat_decdeg",   
                              "ws_lon_decdeg",   
                              "nws_states",   
                              "nws_focallakewaterarea_ha",   
                              "nws_area_ha",   
                              "nws_perimeter_m",   
                              "nws_lake_arearatio",   
                              "nws_mbgconhull_length_m",   
                              "nws_mbgconhull_width_m",   
                              "nws_mbgconhull_orientation_deg",   
                              "nws_meanwidth_m",   
                              "nws_lat_decdeg",   
                              "nws_lon_decdeg"   ), 
                            col_types=list(
                              col_number() ,  
                              col_character(),  
                              col_character(),  
                              col_character(),  
                              col_character(),  
                              col_character(),  
                              col_character(), 
                              col_number() ,  
                              col_character(),  
                              col_character(),  
                              col_character(),  
                              col_character(),  
                              col_character(), 
                              col_number() ,  
                              col_character(),  
                              col_character(),  
                              col_character(), 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() ,  
                              col_character(), 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() , 
                              col_number() ), 
                            na=c(" ",".","NA")  )


# Convert Missing Values to NA for individual vectors 
lakewatersheds$lagoslakeid <- ifelse((trimws(as.character(lakewatersheds$lagoslakeid))==trimws("NA")),NA,lakewatersheds$lagoslakeid)               
suppressWarnings(lakewatersheds$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$lagoslakeid))==as.character(as.numeric("NA"))),NA,lakewatersheds$lagoslakeid))
lakewatersheds$ws_zoneid <- ifelse((trimws(as.character(lakewatersheds$ws_zoneid))==trimws("NA")),NA,lakewatersheds$ws_zoneid)               
suppressWarnings(lakewatersheds$ws_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_zoneid))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_zoneid))
lakewatersheds$nws_zoneid <- ifelse((trimws(as.character(lakewatersheds$nws_zoneid))==trimws("NA")),NA,lakewatersheds$nws_zoneid)               
suppressWarnings(lakewatersheds$nws_zoneid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_zoneid))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_zoneid))
lakewatersheds$ws_subtype <- ifelse((trimws(as.character(lakewatersheds$ws_subtype))==trimws("NA")),NA,lakewatersheds$ws_subtype)               
suppressWarnings(lakewatersheds$ws_subtype <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_subtype))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_subtype))
lakewatersheds$ws_equalsnws <- ifelse((trimws(as.character(lakewatersheds$ws_equalsnws))==trimws("NA")),NA,lakewatersheds$ws_equalsnws)               
suppressWarnings(lakewatersheds$ws_equalsnws <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_equalsnws))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_equalsnws))
lakewatersheds$ws_onlandborder <- ifelse((trimws(as.character(lakewatersheds$ws_onlandborder))==trimws("NA")),NA,lakewatersheds$ws_onlandborder)               
suppressWarnings(lakewatersheds$ws_onlandborder <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_onlandborder))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_onlandborder))
lakewatersheds$ws_oncoast <- ifelse((trimws(as.character(lakewatersheds$ws_oncoast))==trimws("NA")),NA,lakewatersheds$ws_oncoast)               
suppressWarnings(lakewatersheds$ws_oncoast <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_oncoast))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_oncoast))
lakewatersheds$ws_inusa_pct <- ifelse((trimws(as.character(lakewatersheds$ws_inusa_pct))==trimws("NA")),NA,lakewatersheds$ws_inusa_pct)               
suppressWarnings(lakewatersheds$ws_inusa_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_inusa_pct))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_inusa_pct))
lakewatersheds$ws_includeshu4inlet <- ifelse((trimws(as.character(lakewatersheds$ws_includeshu4inlet))==trimws("NA")),NA,lakewatersheds$ws_includeshu4inlet)               
suppressWarnings(lakewatersheds$ws_includeshu4inlet <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_includeshu4inlet))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_includeshu4inlet))
lakewatersheds$ws_ismultipart <- ifelse((trimws(as.character(lakewatersheds$ws_ismultipart))==trimws("NA")),NA,lakewatersheds$ws_ismultipart)               
suppressWarnings(lakewatersheds$ws_ismultipart <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_ismultipart))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_ismultipart))
lakewatersheds$ws_sliverflag <- ifelse((trimws(as.character(lakewatersheds$ws_sliverflag))==trimws("NA")),NA,lakewatersheds$ws_sliverflag)               
suppressWarnings(lakewatersheds$ws_sliverflag <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_sliverflag))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_sliverflag))
lakewatersheds$nws_onlandborder <- ifelse((trimws(as.character(lakewatersheds$nws_onlandborder))==trimws("NA")),NA,lakewatersheds$nws_onlandborder)               
suppressWarnings(lakewatersheds$nws_onlandborder <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_onlandborder))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_onlandborder))
lakewatersheds$nws_oncoast <- ifelse((trimws(as.character(lakewatersheds$nws_oncoast))==trimws("NA")),NA,lakewatersheds$nws_oncoast)               
suppressWarnings(lakewatersheds$nws_oncoast <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_oncoast))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_oncoast))
lakewatersheds$nws_inusa_pct <- ifelse((trimws(as.character(lakewatersheds$nws_inusa_pct))==trimws("NA")),NA,lakewatersheds$nws_inusa_pct)               
suppressWarnings(lakewatersheds$nws_inusa_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_inusa_pct))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_inusa_pct))
lakewatersheds$nws_includeshu4inlet <- ifelse((trimws(as.character(lakewatersheds$nws_includeshu4inlet))==trimws("NA")),NA,lakewatersheds$nws_includeshu4inlet)               
suppressWarnings(lakewatersheds$nws_includeshu4inlet <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_includeshu4inlet))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_includeshu4inlet))
lakewatersheds$nws_ismultipart <- ifelse((trimws(as.character(lakewatersheds$nws_ismultipart))==trimws("NA")),NA,lakewatersheds$nws_ismultipart)               
suppressWarnings(lakewatersheds$nws_ismultipart <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_ismultipart))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_ismultipart))
lakewatersheds$ws_states <- ifelse((trimws(as.character(lakewatersheds$ws_states))==trimws("NA")),NA,lakewatersheds$ws_states)               
suppressWarnings(lakewatersheds$ws_states <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_states))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_states))
lakewatersheds$ws_focallakewaterarea_ha <- ifelse((trimws(as.character(lakewatersheds$ws_focallakewaterarea_ha))==trimws("NA")),NA,lakewatersheds$ws_focallakewaterarea_ha)               
suppressWarnings(lakewatersheds$ws_focallakewaterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_focallakewaterarea_ha))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_focallakewaterarea_ha))
lakewatersheds$ws_area_ha <- ifelse((trimws(as.character(lakewatersheds$ws_area_ha))==trimws("NA")),NA,lakewatersheds$ws_area_ha)               
suppressWarnings(lakewatersheds$ws_area_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_area_ha))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_area_ha))
lakewatersheds$ws_perimeter_m <- ifelse((trimws(as.character(lakewatersheds$ws_perimeter_m))==trimws("NA")),NA,lakewatersheds$ws_perimeter_m)               
suppressWarnings(lakewatersheds$ws_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_perimeter_m))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_perimeter_m))
lakewatersheds$ws_lake_arearatio <- ifelse((trimws(as.character(lakewatersheds$ws_lake_arearatio))==trimws("NA")),NA,lakewatersheds$ws_lake_arearatio)               
suppressWarnings(lakewatersheds$ws_lake_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_lake_arearatio))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_lake_arearatio))
lakewatersheds$ws_mbgconhull_length_m <- ifelse((trimws(as.character(lakewatersheds$ws_mbgconhull_length_m))==trimws("NA")),NA,lakewatersheds$ws_mbgconhull_length_m)               
suppressWarnings(lakewatersheds$ws_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_mbgconhull_length_m))
lakewatersheds$ws_mbgconhull_width_m <- ifelse((trimws(as.character(lakewatersheds$ws_mbgconhull_width_m))==trimws("NA")),NA,lakewatersheds$ws_mbgconhull_width_m)               
suppressWarnings(lakewatersheds$ws_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_mbgconhull_width_m))
lakewatersheds$ws_mbgconhull_orientation_deg <- ifelse((trimws(as.character(lakewatersheds$ws_mbgconhull_orientation_deg))==trimws("NA")),NA,lakewatersheds$ws_mbgconhull_orientation_deg)               
suppressWarnings(lakewatersheds$ws_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_mbgconhull_orientation_deg))
lakewatersheds$ws_meanwidth_m <- ifelse((trimws(as.character(lakewatersheds$ws_meanwidth_m))==trimws("NA")),NA,lakewatersheds$ws_meanwidth_m)               
suppressWarnings(lakewatersheds$ws_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_meanwidth_m))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_meanwidth_m))
lakewatersheds$ws_lat_decdeg <- ifelse((trimws(as.character(lakewatersheds$ws_lat_decdeg))==trimws("NA")),NA,lakewatersheds$ws_lat_decdeg)               
suppressWarnings(lakewatersheds$ws_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_lat_decdeg))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_lat_decdeg))
lakewatersheds$ws_lon_decdeg <- ifelse((trimws(as.character(lakewatersheds$ws_lon_decdeg))==trimws("NA")),NA,lakewatersheds$ws_lon_decdeg)               
suppressWarnings(lakewatersheds$ws_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$ws_lon_decdeg))==as.character(as.numeric("NA"))),NA,lakewatersheds$ws_lon_decdeg))
lakewatersheds$nws_states <- ifelse((trimws(as.character(lakewatersheds$nws_states))==trimws("NA")),NA,lakewatersheds$nws_states)               
suppressWarnings(lakewatersheds$nws_states <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_states))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_states))
lakewatersheds$nws_focallakewaterarea_ha <- ifelse((trimws(as.character(lakewatersheds$nws_focallakewaterarea_ha))==trimws("NA")),NA,lakewatersheds$nws_focallakewaterarea_ha)               
suppressWarnings(lakewatersheds$nws_focallakewaterarea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_focallakewaterarea_ha))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_focallakewaterarea_ha))
lakewatersheds$nws_area_ha <- ifelse((trimws(as.character(lakewatersheds$nws_area_ha))==trimws("NA")),NA,lakewatersheds$nws_area_ha)               
suppressWarnings(lakewatersheds$nws_area_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_area_ha))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_area_ha))
lakewatersheds$nws_perimeter_m <- ifelse((trimws(as.character(lakewatersheds$nws_perimeter_m))==trimws("NA")),NA,lakewatersheds$nws_perimeter_m)               
suppressWarnings(lakewatersheds$nws_perimeter_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_perimeter_m))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_perimeter_m))
lakewatersheds$nws_lake_arearatio <- ifelse((trimws(as.character(lakewatersheds$nws_lake_arearatio))==trimws("NA")),NA,lakewatersheds$nws_lake_arearatio)               
suppressWarnings(lakewatersheds$nws_lake_arearatio <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_lake_arearatio))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_lake_arearatio))
lakewatersheds$nws_mbgconhull_length_m <- ifelse((trimws(as.character(lakewatersheds$nws_mbgconhull_length_m))==trimws("NA")),NA,lakewatersheds$nws_mbgconhull_length_m)               
suppressWarnings(lakewatersheds$nws_mbgconhull_length_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_mbgconhull_length_m))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_mbgconhull_length_m))
lakewatersheds$nws_mbgconhull_width_m <- ifelse((trimws(as.character(lakewatersheds$nws_mbgconhull_width_m))==trimws("NA")),NA,lakewatersheds$nws_mbgconhull_width_m)               
suppressWarnings(lakewatersheds$nws_mbgconhull_width_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_mbgconhull_width_m))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_mbgconhull_width_m))
lakewatersheds$nws_mbgconhull_orientation_deg <- ifelse((trimws(as.character(lakewatersheds$nws_mbgconhull_orientation_deg))==trimws("NA")),NA,lakewatersheds$nws_mbgconhull_orientation_deg)               
suppressWarnings(lakewatersheds$nws_mbgconhull_orientation_deg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_mbgconhull_orientation_deg))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_mbgconhull_orientation_deg))
lakewatersheds$nws_meanwidth_m <- ifelse((trimws(as.character(lakewatersheds$nws_meanwidth_m))==trimws("NA")),NA,lakewatersheds$nws_meanwidth_m)               
suppressWarnings(lakewatersheds$nws_meanwidth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_meanwidth_m))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_meanwidth_m))
lakewatersheds$nws_lat_decdeg <- ifelse((trimws(as.character(lakewatersheds$nws_lat_decdeg))==trimws("NA")),NA,lakewatersheds$nws_lat_decdeg)               
suppressWarnings(lakewatersheds$nws_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_lat_decdeg))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_lat_decdeg))
lakewatersheds$nws_lon_decdeg <- ifelse((trimws(as.character(lakewatersheds$nws_lon_decdeg))==trimws("NA")),NA,lakewatersheds$nws_lon_decdeg)               
suppressWarnings(lakewatersheds$nws_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakewatersheds$nws_lon_decdeg))==as.character(as.numeric("NA"))),NA,lakewatersheds$nws_lon_decdeg))


# Observed issues when reading the data. An empty list is good!
problems(lakewatersheds) 
# Here is the structure of the input data tibble: 
glimpse(lakewatersheds) 
# And some statistical summaries of the data 
summary(lakewatersheds) 
# Get more details on character variables

summary(as.factor(lakewatersheds$ws_zoneid)) 
summary(as.factor(lakewatersheds$nws_zoneid)) 
summary(as.factor(lakewatersheds$ws_subtype)) 
summary(as.factor(lakewatersheds$ws_equalsnws)) 
summary(as.factor(lakewatersheds$ws_onlandborder)) 
summary(as.factor(lakewatersheds$ws_oncoast)) 
summary(as.factor(lakewatersheds$ws_includeshu4inlet)) 
summary(as.factor(lakewatersheds$ws_ismultipart)) 
summary(as.factor(lakewatersheds$ws_sliverflag)) 
summary(as.factor(lakewatersheds$nws_onlandborder)) 
summary(as.factor(lakewatersheds$nws_oncoast)) 
summary(as.factor(lakewatersheds$nws_includeshu4inlet)) 
summary(as.factor(lakewatersheds$nws_ismultipart)) 
summary(as.factor(lakewatersheds$ws_states)) 
summary(as.factor(lakewatersheds$nws_states)) 
# 




# pull 'lakeids' dataframe from EDI ----------------------------------------------------



infile4 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/854/1/5488e333ce818597fa3dbfc9b4e0c131")
infile4 <-sub("^https","http",infile4)
# This creates a tibble named: lakeids
lakeids <-read_delim(infile4
                 ,delim=","
                 ,skip=1
                 ,quote='"'
                 , col_names=c(
                   "lagoslakeid",
                   "lake_nhdid",
                   "lake_reachcode",
                   "lake_namegnis",
                   "lake_namelagos",
                   "lake_county",
                   "lake_countyfips",
                   "lake_lat_decdeg",
                   "lake_lon_decdeg",
                   "lake_centroidstate",
                   "nhdhr_area_sqkm",
                   "nhdhr_fdate",
                   "nhdhr_gnisid",
                   "lagosus_legacysiteid",
                   "lagosus_legacysitelabel",
                   "lagosus_legacyprogram",
                   "wqp_monitoringlocationidentifier",
                   "wqp_monitoringlocationname",
                   "wqp_providername",
                   "nhdplusv2_comid",
                   "nhdplusv2_reachcode",
                   "nhdplusv2_area_sqkm",
                   "lagosne_lagoslakeid",
                   "lagosne_legacysiteid",
                   "nla2007_siteid",
                   "nla2012_siteid",
                   "nhdplusv2_lakes_n",
                   "lagosne_lakes_n",
                   "wqp_sites_n",
                   "lagosus_legacyids_n"   ),
                 col_types=list(
                   col_number() ,
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_number() ,
                   col_number() ,
                   col_character(),
                   col_number() ,
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_character(),
                   col_number() ,
                   col_number() ,
                   col_character(),
                   col_character(),
                   col_character(),
                   col_number() ,
                   col_number() ,
                   col_number() ,
                   col_number() ),
                 na=c(" ",".","NA")  )


# Convert Missing Values to NA for individual vectors
lakeids$lagoslakeid <- ifelse((trimws(as.character(lakeids$lagoslakeid))==trimws("NA")),NA,lakeids$lagoslakeid)
suppressWarnings(lakeids$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lagoslakeid))==as.character(as.numeric("NA"))),NA,lakeids$lagoslakeid))
lakeids$lake_nhdid <- ifelse((trimws(as.character(lakeids$lake_nhdid))==trimws("NA")),NA,lakeids$lake_nhdid)
suppressWarnings(lakeids$lake_nhdid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_nhdid))==as.character(as.numeric("NA"))),NA,lakeids$lake_nhdid))
lakeids$lake_reachcode <- ifelse((trimws(as.character(lakeids$lake_reachcode))==trimws("NA")),NA,lakeids$lake_reachcode)
suppressWarnings(lakeids$lake_reachcode <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_reachcode))==as.character(as.numeric("NA"))),NA,lakeids$lake_reachcode))
lakeids$lake_namegnis <- ifelse((trimws(as.character(lakeids$lake_namegnis))==trimws("NA")),NA,lakeids$lake_namegnis)
suppressWarnings(lakeids$lake_namegnis <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_namegnis))==as.character(as.numeric("NA"))),NA,lakeids$lake_namegnis))
lakeids$lake_namelagos <- ifelse((trimws(as.character(lakeids$lake_namelagos))==trimws("NA")),NA,lakeids$lake_namelagos)
suppressWarnings(lakeids$lake_namelagos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_namelagos))==as.character(as.numeric("NA"))),NA,lakeids$lake_namelagos))
lakeids$lake_county <- ifelse((trimws(as.character(lakeids$lake_county))==trimws("NA")),NA,lakeids$lake_county)
suppressWarnings(lakeids$lake_county <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_county))==as.character(as.numeric("NA"))),NA,lakeids$lake_county))
lakeids$lake_countyfips <- ifelse((trimws(as.character(lakeids$lake_countyfips))==trimws("NA")),NA,lakeids$lake_countyfips)
suppressWarnings(lakeids$lake_countyfips <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_countyfips))==as.character(as.numeric("NA"))),NA,lakeids$lake_countyfips))
lakeids$lake_lat_decdeg <- ifelse((trimws(as.character(lakeids$lake_lat_decdeg))==trimws("NA")),NA,lakeids$lake_lat_decdeg)
suppressWarnings(lakeids$lake_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_lat_decdeg))==as.character(as.numeric("NA"))),NA,lakeids$lake_lat_decdeg))
lakeids$lake_lon_decdeg <- ifelse((trimws(as.character(lakeids$lake_lon_decdeg))==trimws("NA")),NA,lakeids$lake_lon_decdeg)
suppressWarnings(lakeids$lake_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_lon_decdeg))==as.character(as.numeric("NA"))),NA,lakeids$lake_lon_decdeg))
lakeids$lake_centroidstate <- ifelse((trimws(as.character(lakeids$lake_centroidstate))==trimws("NA")),NA,lakeids$lake_centroidstate)
suppressWarnings(lakeids$lake_centroidstate <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lake_centroidstate))==as.character(as.numeric("NA"))),NA,lakeids$lake_centroidstate))
lakeids$nhdhr_area_sqkm <- ifelse((trimws(as.character(lakeids$nhdhr_area_sqkm))==trimws("NA")),NA,lakeids$nhdhr_area_sqkm)
suppressWarnings(lakeids$nhdhr_area_sqkm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nhdhr_area_sqkm))==as.character(as.numeric("NA"))),NA,lakeids$nhdhr_area_sqkm))
lakeids$nhdhr_fdate <- ifelse((trimws(as.character(lakeids$nhdhr_fdate))==trimws("NA")),NA,lakeids$nhdhr_fdate)
suppressWarnings(lakeids$nhdhr_fdate <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nhdhr_fdate))==as.character(as.numeric("NA"))),NA,lakeids$nhdhr_fdate))
lakeids$nhdhr_gnisid <- ifelse((trimws(as.character(lakeids$nhdhr_gnisid))==trimws("NA")),NA,lakeids$nhdhr_gnisid)
suppressWarnings(lakeids$nhdhr_gnisid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nhdhr_gnisid))==as.character(as.numeric("NA"))),NA,lakeids$nhdhr_gnisid))
lakeids$lagosus_legacysiteid <- ifelse((trimws(as.character(lakeids$lagosus_legacysiteid))==trimws("NA")),NA,lakeids$lagosus_legacysiteid)
suppressWarnings(lakeids$lagosus_legacysiteid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lagosus_legacysiteid))==as.character(as.numeric("NA"))),NA,lakeids$lagosus_legacysiteid))
lakeids$lagosus_legacysitelabel <- ifelse((trimws(as.character(lakeids$lagosus_legacysitelabel))==trimws("NA")),NA,lakeids$lagosus_legacysitelabel)
suppressWarnings(lakeids$lagosus_legacysitelabel <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lagosus_legacysitelabel))==as.character(as.numeric("NA"))),NA,lakeids$lagosus_legacysitelabel))
lakeids$lagosus_legacyprogram <- ifelse((trimws(as.character(lakeids$lagosus_legacyprogram))==trimws("NA")),NA,lakeids$lagosus_legacyprogram)
suppressWarnings(lakeids$lagosus_legacyprogram <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lagosus_legacyprogram))==as.character(as.numeric("NA"))),NA,lakeids$lagosus_legacyprogram))
lakeids$wqp_monitoringlocationidentifier <- ifelse((trimws(as.character(lakeids$wqp_monitoringlocationidentifier))==trimws("NA")),NA,lakeids$wqp_monitoringlocationidentifier)
suppressWarnings(lakeids$wqp_monitoringlocationidentifier <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$wqp_monitoringlocationidentifier))==as.character(as.numeric("NA"))),NA,lakeids$wqp_monitoringlocationidentifier))
lakeids$wqp_monitoringlocationname <- ifelse((trimws(as.character(lakeids$wqp_monitoringlocationname))==trimws("NA")),NA,lakeids$wqp_monitoringlocationname)
suppressWarnings(lakeids$wqp_monitoringlocationname <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$wqp_monitoringlocationname))==as.character(as.numeric("NA"))),NA,lakeids$wqp_monitoringlocationname))
lakeids$wqp_providername <- ifelse((trimws(as.character(lakeids$wqp_providername))==trimws("NA")),NA,lakeids$wqp_providername)
suppressWarnings(lakeids$wqp_providername <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$wqp_providername))==as.character(as.numeric("NA"))),NA,lakeids$wqp_providername))
lakeids$nhdplusv2_comid <- ifelse((trimws(as.character(lakeids$nhdplusv2_comid))==trimws("NA")),NA,lakeids$nhdplusv2_comid)
suppressWarnings(lakeids$nhdplusv2_comid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nhdplusv2_comid))==as.character(as.numeric("NA"))),NA,lakeids$nhdplusv2_comid))
lakeids$nhdplusv2_reachcode <- ifelse((trimws(as.character(lakeids$nhdplusv2_reachcode))==trimws("NA")),NA,lakeids$nhdplusv2_reachcode)
suppressWarnings(lakeids$nhdplusv2_reachcode <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nhdplusv2_reachcode))==as.character(as.numeric("NA"))),NA,lakeids$nhdplusv2_reachcode))
lakeids$nhdplusv2_area_sqkm <- ifelse((trimws(as.character(lakeids$nhdplusv2_area_sqkm))==trimws("NA")),NA,lakeids$nhdplusv2_area_sqkm)
suppressWarnings(lakeids$nhdplusv2_area_sqkm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nhdplusv2_area_sqkm))==as.character(as.numeric("NA"))),NA,lakeids$nhdplusv2_area_sqkm))
lakeids$lagosne_lagoslakeid <- ifelse((trimws(as.character(lakeids$lagosne_lagoslakeid))==trimws("NA")),NA,lakeids$lagosne_lagoslakeid)
suppressWarnings(lakeids$lagosne_lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lagosne_lagoslakeid))==as.character(as.numeric("NA"))),NA,lakeids$lagosne_lagoslakeid))
lakeids$lagosne_legacysiteid <- ifelse((trimws(as.character(lakeids$lagosne_legacysiteid))==trimws("NA")),NA,lakeids$lagosne_legacysiteid)
suppressWarnings(lakeids$lagosne_legacysiteid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lagosne_legacysiteid))==as.character(as.numeric("NA"))),NA,lakeids$lagosne_legacysiteid))
lakeids$nla2007_siteid <- ifelse((trimws(as.character(lakeids$nla2007_siteid))==trimws("NA")),NA,lakeids$nla2007_siteid)
suppressWarnings(lakeids$nla2007_siteid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nla2007_siteid))==as.character(as.numeric("NA"))),NA,lakeids$nla2007_siteid))
lakeids$nla2012_siteid <- ifelse((trimws(as.character(lakeids$nla2012_siteid))==trimws("NA")),NA,lakeids$nla2012_siteid)
suppressWarnings(lakeids$nla2012_siteid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nla2012_siteid))==as.character(as.numeric("NA"))),NA,lakeids$nla2012_siteid))
lakeids$nhdplusv2_lakes_n <- ifelse((trimws(as.character(lakeids$nhdplusv2_lakes_n))==trimws("NA")),NA,lakeids$nhdplusv2_lakes_n)
suppressWarnings(lakeids$nhdplusv2_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$nhdplusv2_lakes_n))==as.character(as.numeric("NA"))),NA,lakeids$nhdplusv2_lakes_n))
lakeids$lagosne_lakes_n <- ifelse((trimws(as.character(lakeids$lagosne_lakes_n))==trimws("NA")),NA,lakeids$lagosne_lakes_n)
suppressWarnings(lakeids$lagosne_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lagosne_lakes_n))==as.character(as.numeric("NA"))),NA,lakeids$lagosne_lakes_n))
lakeids$wqp_sites_n <- ifelse((trimws(as.character(lakeids$wqp_sites_n))==trimws("NA")),NA,lakeids$wqp_sites_n)
suppressWarnings(lakeids$wqp_sites_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$wqp_sites_n))==as.character(as.numeric("NA"))),NA,lakeids$wqp_sites_n))
lakeids$lagosus_legacyids_n <- ifelse((trimws(as.character(lakeids$lagosus_legacyids_n))==trimws("NA")),NA,lakeids$lagosus_legacyids_n)
suppressWarnings(lakeids$lagosus_legacyids_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeids$lagosus_legacyids_n))==as.character(as.numeric("NA"))),NA,lakeids$lagosus_legacyids_n))


# Observed issues when reading the data. An empty list is good!
problems(lakeids)
# Here is the structure of the input data tibble:
glimpse(lakeids)
# And some statistical summaries of the data
summary(lakeids)
# Get more details on character variables

summary(as.factor(lakeids$lake_nhdid))
summary(as.factor(lakeids$lake_reachcode))
summary(as.factor(lakeids$lake_namegnis))
summary(as.factor(lakeids$lake_namelagos))
summary(as.factor(lakeids$lake_county))
summary(as.factor(lakeids$lake_countyfips))
summary(as.factor(lakeids$lake_centroidstate))
summary(as.factor(lakeids$nhdhr_fdate))
summary(as.factor(lakeids$nhdhr_gnisid))
summary(as.factor(lakeids$lagosus_legacysiteid))
summary(as.factor(lakeids$lagosus_legacysitelabel))
summary(as.factor(lakeids$lagosus_legacyprogram))
summary(as.factor(lakeids$wqp_monitoringlocationidentifier))
summary(as.factor(lakeids$wqp_monitoringlocationname))
summary(as.factor(lakeids$wqp_providername))
summary(as.factor(lakeids$nhdplusv2_comid))
summary(as.factor(lakeids$nhdplusv2_reachcode))
summary(as.factor(lakeids$lagosne_legacysiteid))
summary(as.factor(lakeids$nla2007_siteid))
summary(as.factor(lakeids$nla2012_siteid))



# pull 'connectivity' dataframe from EDI ----------------------------------

# Package ID: edi.879.1 Cataloging System:https://pasta.edirepository.org.
# Data set title: LAGOS-US NETWORKS v1.0: Data module of surface water networks characterizing connections among lakes, streams, and rivers in the conterminous U.S.
# Data set creator:  Katelyn King - Michigan State University 
# Data set creator:  Qi Wang - Michigan State University 
# Data set creator:  Lauren Rodriguez - Michigan State University 
# Data set creator:  Maggie Haite - Michigan State University 
# Data set creator:  Laura Danila - Michigan State University 
# Data set creator:  Pang-Ning Tan - Michigan State University 
# Data set creator:  Jiayu Zhou - Michigan State University 
# Data set creator:  Kendra Cheruvelil - Michigan State University 
# Contact:  Katelyn King -  Michigan State University  - kingka21@msu.edu
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu 
#
#install package tidyverse if not already installed
if(!require(tidyverse)){ install.packages("tidyverse") }  
library("tidyverse") 
infile1 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/879/1/eb1c4a78df8140b89cbf053b0cef3976") 
infile1 <-sub("^https","http",infile1)
# This creates a tibble named: lakeconn 
lakeconn <-read_delim(infile1  
                 ,delim=","   
                 ,skip=1 
                 ,quote='"'  
                 , col_names=c( 
                   "lagoslakeid",   
                   "lake_nets_upstreamlake_km",   
                   "lake_nets_downstreamlake_km",   
                   "lake_nets_bidirectionallake_km",   
                   "lake_nets_upstreamlake_n",   
                   "lake_nets_downstreamlake_n",   
                   "lake_nets_lakeorder",   
                   "lake_nets_lnn",   
                   "net_id",   
                   "net_lakes_n",   
                   "net_averagelakedistance_km",   
                   "net_averagelakearea_ha",   
                   "lake_nets_nearestdamdown_km",   
                   "lake_nets_nearestdamdown_id",   
                   "lake_nets_totaldamdown_n",   
                   "lake_nets_nearestdamup_km",   
                   "lake_nets_nearestdamup_id",   
                   "lake_nets_totaldamup_n",   
                   "lake_nets_damonlake_flag",   
                   "lake_nets_multidam_flag",   
                   "net_dams_n",   
                   "nhdplusv2_comid"   ), 
                 col_types=list(
                   col_number() , 
                   col_number() , 
                   col_number() , 
                   col_number() , 
                   col_number() , 
                   col_number() , 
                   col_number() , 
                   col_number() ,  
                   col_character(), 
                   col_number() , 
                   col_number() , 
                   col_number() , 
                   col_number() ,  
                   col_character(), 
                   col_number() , 
                   col_number() ,  
                   col_character(), 
                   col_number() ,  
                   col_character(),  
                   col_character(), 
                   col_number() ,  
                   col_character()), 
                 na=c(" ",".","NA")  )


# Convert Missing Values to NA for individual vectors 
lakeconn$lagoslakeid <- ifelse((trimws(as.character(lakeconn$lagoslakeid))==trimws("NA")),NA,lakeconn$lagoslakeid)               
suppressWarnings(lakeconn$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lagoslakeid))==as.character(as.numeric("NA"))),NA,lakeconn$lagoslakeid))
lakeconn$lake_nets_upstreamlake_km <- ifelse((trimws(as.character(lakeconn$lake_nets_upstreamlake_km))==trimws("NA")),NA,lakeconn$lake_nets_upstreamlake_km)               
suppressWarnings(lakeconn$lake_nets_upstreamlake_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_upstreamlake_km))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_upstreamlake_km))
lakeconn$lake_nets_downstreamlake_km <- ifelse((trimws(as.character(lakeconn$lake_nets_downstreamlake_km))==trimws("NA")),NA,lakeconn$lake_nets_downstreamlake_km)               
suppressWarnings(lakeconn$lake_nets_downstreamlake_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_downstreamlake_km))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_downstreamlake_km))
lakeconn$lake_nets_bidirectionallake_km <- ifelse((trimws(as.character(lakeconn$lake_nets_bidirectionallake_km))==trimws("NA")),NA,lakeconn$lake_nets_bidirectionallake_km)               
suppressWarnings(lakeconn$lake_nets_bidirectionallake_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_bidirectionallake_km))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_bidirectionallake_km))
lakeconn$lake_nets_upstreamlake_n <- ifelse((trimws(as.character(lakeconn$lake_nets_upstreamlake_n))==trimws("NA")),NA,lakeconn$lake_nets_upstreamlake_n)               
suppressWarnings(lakeconn$lake_nets_upstreamlake_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_upstreamlake_n))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_upstreamlake_n))
lakeconn$lake_nets_downstreamlake_n <- ifelse((trimws(as.character(lakeconn$lake_nets_downstreamlake_n))==trimws("NA")),NA,lakeconn$lake_nets_downstreamlake_n)               
suppressWarnings(lakeconn$lake_nets_downstreamlake_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_downstreamlake_n))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_downstreamlake_n))
lakeconn$lake_nets_lakeorder <- ifelse((trimws(as.character(lakeconn$lake_nets_lakeorder))==trimws("NA")),NA,lakeconn$lake_nets_lakeorder)               
suppressWarnings(lakeconn$lake_nets_lakeorder <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_lakeorder))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_lakeorder))
lakeconn$lake_nets_lnn <- ifelse((trimws(as.character(lakeconn$lake_nets_lnn))==trimws("NA")),NA,lakeconn$lake_nets_lnn)               
suppressWarnings(lakeconn$lake_nets_lnn <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_lnn))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_lnn))
lakeconn$net_lakes_n <- ifelse((trimws(as.character(lakeconn$net_lakes_n))==trimws("NA")),NA,lakeconn$net_lakes_n)               
suppressWarnings(lakeconn$net_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$net_lakes_n))==as.character(as.numeric("NA"))),NA,lakeconn$net_lakes_n))
lakeconn$net_averagelakedistance_km <- ifelse((trimws(as.character(lakeconn$net_averagelakedistance_km))==trimws("NA")),NA,lakeconn$net_averagelakedistance_km)               
suppressWarnings(lakeconn$net_averagelakedistance_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$net_averagelakedistance_km))==as.character(as.numeric("NA"))),NA,lakeconn$net_averagelakedistance_km))
lakeconn$net_averagelakearea_ha <- ifelse((trimws(as.character(lakeconn$net_averagelakearea_ha))==trimws("NA")),NA,lakeconn$net_averagelakearea_ha)               
suppressWarnings(lakeconn$net_averagelakearea_ha <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$net_averagelakearea_ha))==as.character(as.numeric("NA"))),NA,lakeconn$net_averagelakearea_ha))
lakeconn$lake_nets_nearestdamdown_km <- ifelse((trimws(as.character(lakeconn$lake_nets_nearestdamdown_km))==trimws("NA")),NA,lakeconn$lake_nets_nearestdamdown_km)               
suppressWarnings(lakeconn$lake_nets_nearestdamdown_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_nearestdamdown_km))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_nearestdamdown_km))
lakeconn$lake_nets_totaldamdown_n <- ifelse((trimws(as.character(lakeconn$lake_nets_totaldamdown_n))==trimws("NA")),NA,lakeconn$lake_nets_totaldamdown_n)               
suppressWarnings(lakeconn$lake_nets_totaldamdown_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_totaldamdown_n))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_totaldamdown_n))
lakeconn$lake_nets_nearestdamup_km <- ifelse((trimws(as.character(lakeconn$lake_nets_nearestdamup_km))==trimws("NA")),NA,lakeconn$lake_nets_nearestdamup_km)               
suppressWarnings(lakeconn$lake_nets_nearestdamup_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_nearestdamup_km))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_nearestdamup_km))
lakeconn$lake_nets_totaldamup_n <- ifelse((trimws(as.character(lakeconn$lake_nets_totaldamup_n))==trimws("NA")),NA,lakeconn$lake_nets_totaldamup_n)               
suppressWarnings(lakeconn$lake_nets_totaldamup_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_totaldamup_n))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_totaldamup_n))
lakeconn$lake_nets_damonlake_flag <- ifelse((trimws(as.character(lakeconn$lake_nets_damonlake_flag))==trimws("NA")),NA,lakeconn$lake_nets_damonlake_flag)               
suppressWarnings(lakeconn$lake_nets_damonlake_flag <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_damonlake_flag))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_damonlake_flag))
lakeconn$lake_nets_multidam_flag <- ifelse((trimws(as.character(lakeconn$lake_nets_multidam_flag))==trimws("NA")),NA,lakeconn$lake_nets_multidam_flag)               
suppressWarnings(lakeconn$lake_nets_multidam_flag <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$lake_nets_multidam_flag))==as.character(as.numeric("NA"))),NA,lakeconn$lake_nets_multidam_flag))
lakeconn$net_dams_n <- ifelse((trimws(as.character(lakeconn$net_dams_n))==trimws("NA")),NA,lakeconn$net_dams_n)               
suppressWarnings(lakeconn$net_dams_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$net_dams_n))==as.character(as.numeric("NA"))),NA,lakeconn$net_dams_n))
lakeconn$nhdplusv2_comid <- ifelse((trimws(as.character(lakeconn$nhdplusv2_comid))==trimws("NA")),NA,lakeconn$nhdplusv2_comid)               
suppressWarnings(lakeconn$nhdplusv2_comid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeconn$nhdplusv2_comid))==as.character(as.numeric("NA"))),NA,lakeconn$nhdplusv2_comid))


# Observed issues when reading the data. An empty list is good!
problems(lakeconn) 
# Here is the structure of the input data tibble: 
glimpse(lakeconn) 
# And some statistical summaries of the data 
summary(lakeconn) 
# Get more details on character variables

summary(as.factor(lakeconn$net_id)) 
summary(as.factor(lakeconn$lake_nets_nearestdamdown_id)) 
summary(as.factor(lakeconn$lake_nets_nearestdamup_id)) 
summary(as.factor(lakeconn$lake_nets_damonlake_flag)) 
summary(as.factor(lakeconn$lake_nets_multidam_flag)) 
summary(as.factor(lakeconn$nhdplusv2_comid)) 


lakeconn$lagoslakeid<-factor(lakeconn$lagoslakeid)



#Where are these lakes and what network are they in?
#Joining  to lakeinformation which only has western states
colnames<-(intersect( colnames(lakeinformation),  colnames(lakeconn)))
lakeconn_western<-merge(lakeinformation,lakeconn, all.x=TRUE, no.dups=TRUE, by="lagoslakeid") %>%
  mutate(connectivity_type = case_when(net_id >= 1 ~ 'yes network',
                                       TRUE ~ 'no network')) 

colnames<-(intersect( colnames(lakeconn_western),  colnames(dt_limno))) #Find common column names
lakeconn_western<-left_join(lakeconn_western,dt_limno, by=colnames)
sum(is.na(dt_limno$year))
sum(is.na(lakeconn_western$year))



# pull 'dt2' dataframe from EDI -------------------------------------------

##MAYBE NOT YET? NOT SURE HOW IT IS HELPFUL -- IAO

# 
# infile2 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/879/1/7ec02af96e1ef066455cf41caebf59d2") 
# infile2 <-sub("^https","http",infile2)
# # This creates a tibble named: dt2
# 	dt2 <-read_delim(infile2
#                 ,delim=","
#                 ,skip=1
#                     ,quote='"'
#                     , col_names=c(
#                         "lagoslakeid",
#                         "to_lagoslakeid",
#                         "streamlength_down_km"   ),
#                     col_types=list(
#                         col_number() ,
#                         col_number() ,
#                         col_number() ),
#                         na=c(" ",".","NA")  )
# 
# 
# # Convert Missing Values to NA for individual vectors
# dt2$lagoslakeid <- ifelse((trimws(as.character(dt2$lagoslakeid))==trimws("NA")),NA,dt2$lagoslakeid)
# suppressWarnings(dt2$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lagoslakeid))==as.character(as.numeric("NA"))),NA,dt2$lagoslakeid))
# dt2$to_lagoslakeid <- ifelse((trimws(as.character(dt2$to_lagoslakeid))==trimws("NA")),NA,dt2$to_lagoslakeid)
# suppressWarnings(dt2$to_lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$to_lagoslakeid))==as.character(as.numeric("NA"))),NA,dt2$to_lagoslakeid))
# dt2$streamlength_down_km <- ifelse((trimws(as.character(dt2$streamlength_down_km))==trimws("NA")),NA,dt2$streamlength_down_km)
# suppressWarnings(dt2$streamlength_down_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$streamlength_down_km))==as.character(as.numeric("NA"))),NA,dt2$streamlength_down_km))
# 
# 
# # Observed issues when reading the data. An empty list is good!
# problems(dt2)
# # Here is the structure of the input data tibble:
# glimpse(dt2)
# # And some statistical summaries of the data
# summary(dt2)
# # Get more details on character variables
# #                      
# infile3 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/879/1/20d37c3f72ffb78945f1d85b4806f975")
# infile3 <-sub("^https","http",infile3)
# # This creates a tibble named: dt3
# 	dt3 <-read_delim(infile3
#                 ,delim=","
#                 ,skip=1
#                     ,quote='"'
#                     , col_names=c(
#                         "V1",
#                         "lagoslakeid",
#                         "to_lagoslakeid",
#                         "streamlength_total_km",
#                         "streamlength_up_km",
#                         "streamlength_down_km"   ),
#                     col_types=list(
#                         col_number() ,
#                         col_number() ,
#                         col_number() ,
#                         col_number() ,
#                         col_number() ,
#                         col_number() ),
#                         na=c(" ",".","NA")  )
# 
# 
# # Convert Missing Values to NA for individual vectors
# dt3$V1 <- ifelse((trimws(as.character(dt3$V1))==trimws("NA")),NA,dt3$V1)
# suppressWarnings(dt3$V1 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$V1))==as.character(as.numeric("NA"))),NA,dt3$V1))
# dt3$lagoslakeid <- ifelse((trimws(as.character(dt3$lagoslakeid))==trimws("NA")),NA,dt3$lagoslakeid)
# suppressWarnings(dt3$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$lagoslakeid))==as.character(as.numeric("NA"))),NA,dt3$lagoslakeid))
# dt3$to_lagoslakeid <- ifelse((trimws(as.character(dt3$to_lagoslakeid))==trimws("NA")),NA,dt3$to_lagoslakeid)
# suppressWarnings(dt3$to_lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$to_lagoslakeid))==as.character(as.numeric("NA"))),NA,dt3$to_lagoslakeid))
# dt3$streamlength_total_km <- ifelse((trimws(as.character(dt3$streamlength_total_km))==trimws("NA")),NA,dt3$streamlength_total_km)
# suppressWarnings(dt3$streamlength_total_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$streamlength_total_km))==as.character(as.numeric("NA"))),NA,dt3$streamlength_total_km))
# dt3$streamlength_up_km <- ifelse((trimws(as.character(dt3$streamlength_up_km))==trimws("NA")),NA,dt3$streamlength_up_km)
# suppressWarnings(dt3$streamlength_up_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$streamlength_up_km))==as.character(as.numeric("NA"))),NA,dt3$streamlength_up_km))
# dt3$streamlength_down_km <- ifelse((trimws(as.character(dt3$streamlength_down_km))==trimws("NA")),NA,dt3$streamlength_down_km)
# suppressWarnings(dt3$streamlength_down_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$streamlength_down_km))==as.character(as.numeric("NA"))),NA,dt3$streamlength_down_km))
# 
# 
# # Observed issues when reading the data. An empty list is good!
# problems(dt3)
# # Here is the structure of the input data tibble:
# glimpse(dt3)
# # And some statistical summaries of the data
# summary(dt3)
# # Get more details on character variables
# 
# infile4 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/879/1/d9cf897fd7461d565a9c506575262fc4")
# infile4 <-sub("^https","http",infile4)
# # This creates a tibble named: dt4
# 	dt4 <-read_delim(infile4
#                 ,delim=","
#                 ,skip=1
#                     ,quote='"'
#                     , col_names=c(
#                         "from_comid",
#                         "to_comid",
#                         "from_lagoslakeid",
#                         "to_lagoslakeid"   ),
#                     col_types=list(
#                         col_character(),
#                         col_character(),
#                         col_number() ,
#                         col_number() ),
#                         na=c(" ",".","NA")  )
# 
# 
# # Convert Missing Values to NA for individual vectors
# dt4$from_lagoslakeid <- ifelse((trimws(as.character(dt4$from_lagoslakeid))==trimws("NA")),NA,dt4$from_lagoslakeid)
# suppressWarnings(dt4$from_lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$from_lagoslakeid))==as.character(as.numeric("NA"))),NA,dt4$from_lagoslakeid))
# dt4$to_lagoslakeid <- ifelse((trimws(as.character(dt4$to_lagoslakeid))==trimws("NA")),NA,dt4$to_lagoslakeid)
# suppressWarnings(dt4$to_lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$to_lagoslakeid))==as.character(as.numeric("NA"))),NA,dt4$to_lagoslakeid))
# 
# 
# # Observed issues when reading the data. An empty list is good!
# problems(dt4)
# # Here is the structure of the input data tibble:
# glimpse(dt4)
# # And some statistical summaries of the data
# summary(dt4)
# # Get more details on character variables
# 
# summary(as.factor(dt4$from_comid))
# summary(as.factor(dt4$to_comid))


