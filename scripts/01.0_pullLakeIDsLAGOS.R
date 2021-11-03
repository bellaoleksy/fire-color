infile4 <- trimws("https://pasta.lternet.edu/package/data/eml/edi/854/1/5488e333ce818597fa3dbfc9b4e0c131")
infile4 <-sub("^https","http",infile4)
# This creates a tibble named: lakeIDs
lakeIDs <-read_delim(infile4
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
lakeIDs$lagoslakeid <- ifelse((trimws(as.character(lakeIDs$lagoslakeid))==trimws("NA")),NA,lakeIDs$lagoslakeid)
suppressWarnings(lakeIDs$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lagoslakeid))==as.character(as.numeric("NA"))),NA,lakeIDs$lagoslakeid))
lakeIDs$lake_nhdid <- ifelse((trimws(as.character(lakeIDs$lake_nhdid))==trimws("NA")),NA,lakeIDs$lake_nhdid)
suppressWarnings(lakeIDs$lake_nhdid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_nhdid))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_nhdid))
lakeIDs$lake_reachcode <- ifelse((trimws(as.character(lakeIDs$lake_reachcode))==trimws("NA")),NA,lakeIDs$lake_reachcode)
suppressWarnings(lakeIDs$lake_reachcode <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_reachcode))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_reachcode))
lakeIDs$lake_namegnis <- ifelse((trimws(as.character(lakeIDs$lake_namegnis))==trimws("NA")),NA,lakeIDs$lake_namegnis)
suppressWarnings(lakeIDs$lake_namegnis <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_namegnis))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_namegnis))
lakeIDs$lake_namelagos <- ifelse((trimws(as.character(lakeIDs$lake_namelagos))==trimws("NA")),NA,lakeIDs$lake_namelagos)
suppressWarnings(lakeIDs$lake_namelagos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_namelagos))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_namelagos))
lakeIDs$lake_county <- ifelse((trimws(as.character(lakeIDs$lake_county))==trimws("NA")),NA,lakeIDs$lake_county)
suppressWarnings(lakeIDs$lake_county <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_county))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_county))
lakeIDs$lake_countyfips <- ifelse((trimws(as.character(lakeIDs$lake_countyfips))==trimws("NA")),NA,lakeIDs$lake_countyfips)
suppressWarnings(lakeIDs$lake_countyfips <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_countyfips))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_countyfips))
lakeIDs$lake_lat_decdeg <- ifelse((trimws(as.character(lakeIDs$lake_lat_decdeg))==trimws("NA")),NA,lakeIDs$lake_lat_decdeg)
suppressWarnings(lakeIDs$lake_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_lat_decdeg))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_lat_decdeg))
lakeIDs$lake_lon_decdeg <- ifelse((trimws(as.character(lakeIDs$lake_lon_decdeg))==trimws("NA")),NA,lakeIDs$lake_lon_decdeg)
suppressWarnings(lakeIDs$lake_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_lon_decdeg))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_lon_decdeg))
lakeIDs$lake_centroidstate <- ifelse((trimws(as.character(lakeIDs$lake_centroidstate))==trimws("NA")),NA,lakeIDs$lake_centroidstate)
suppressWarnings(lakeIDs$lake_centroidstate <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lake_centroidstate))==as.character(as.numeric("NA"))),NA,lakeIDs$lake_centroidstate))
lakeIDs$nhdhr_area_sqkm <- ifelse((trimws(as.character(lakeIDs$nhdhr_area_sqkm))==trimws("NA")),NA,lakeIDs$nhdhr_area_sqkm)
suppressWarnings(lakeIDs$nhdhr_area_sqkm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nhdhr_area_sqkm))==as.character(as.numeric("NA"))),NA,lakeIDs$nhdhr_area_sqkm))
lakeIDs$nhdhr_fdate <- ifelse((trimws(as.character(lakeIDs$nhdhr_fdate))==trimws("NA")),NA,lakeIDs$nhdhr_fdate)
suppressWarnings(lakeIDs$nhdhr_fdate <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nhdhr_fdate))==as.character(as.numeric("NA"))),NA,lakeIDs$nhdhr_fdate))
lakeIDs$nhdhr_gnisid <- ifelse((trimws(as.character(lakeIDs$nhdhr_gnisid))==trimws("NA")),NA,lakeIDs$nhdhr_gnisid)
suppressWarnings(lakeIDs$nhdhr_gnisid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nhdhr_gnisid))==as.character(as.numeric("NA"))),NA,lakeIDs$nhdhr_gnisid))
lakeIDs$lagosus_legacysiteid <- ifelse((trimws(as.character(lakeIDs$lagosus_legacysiteid))==trimws("NA")),NA,lakeIDs$lagosus_legacysiteid)
suppressWarnings(lakeIDs$lagosus_legacysiteid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lagosus_legacysiteid))==as.character(as.numeric("NA"))),NA,lakeIDs$lagosus_legacysiteid))
lakeIDs$lagosus_legacysitelabel <- ifelse((trimws(as.character(lakeIDs$lagosus_legacysitelabel))==trimws("NA")),NA,lakeIDs$lagosus_legacysitelabel)
suppressWarnings(lakeIDs$lagosus_legacysitelabel <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lagosus_legacysitelabel))==as.character(as.numeric("NA"))),NA,lakeIDs$lagosus_legacysitelabel))
lakeIDs$lagosus_legacyprogram <- ifelse((trimws(as.character(lakeIDs$lagosus_legacyprogram))==trimws("NA")),NA,lakeIDs$lagosus_legacyprogram)
suppressWarnings(lakeIDs$lagosus_legacyprogram <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lagosus_legacyprogram))==as.character(as.numeric("NA"))),NA,lakeIDs$lagosus_legacyprogram))
lakeIDs$wqp_monitoringlocationidentifier <- ifelse((trimws(as.character(lakeIDs$wqp_monitoringlocationidentifier))==trimws("NA")),NA,lakeIDs$wqp_monitoringlocationidentifier)
suppressWarnings(lakeIDs$wqp_monitoringlocationidentifier <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$wqp_monitoringlocationidentifier))==as.character(as.numeric("NA"))),NA,lakeIDs$wqp_monitoringlocationidentifier))
lakeIDs$wqp_monitoringlocationname <- ifelse((trimws(as.character(lakeIDs$wqp_monitoringlocationname))==trimws("NA")),NA,lakeIDs$wqp_monitoringlocationname)
suppressWarnings(lakeIDs$wqp_monitoringlocationname <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$wqp_monitoringlocationname))==as.character(as.numeric("NA"))),NA,lakeIDs$wqp_monitoringlocationname))
lakeIDs$wqp_providername <- ifelse((trimws(as.character(lakeIDs$wqp_providername))==trimws("NA")),NA,lakeIDs$wqp_providername)
suppressWarnings(lakeIDs$wqp_providername <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$wqp_providername))==as.character(as.numeric("NA"))),NA,lakeIDs$wqp_providername))
lakeIDs$nhdplusv2_comid <- ifelse((trimws(as.character(lakeIDs$nhdplusv2_comid))==trimws("NA")),NA,lakeIDs$nhdplusv2_comid)
suppressWarnings(lakeIDs$nhdplusv2_comid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nhdplusv2_comid))==as.character(as.numeric("NA"))),NA,lakeIDs$nhdplusv2_comid))
lakeIDs$nhdplusv2_reachcode <- ifelse((trimws(as.character(lakeIDs$nhdplusv2_reachcode))==trimws("NA")),NA,lakeIDs$nhdplusv2_reachcode)
suppressWarnings(lakeIDs$nhdplusv2_reachcode <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nhdplusv2_reachcode))==as.character(as.numeric("NA"))),NA,lakeIDs$nhdplusv2_reachcode))
lakeIDs$nhdplusv2_area_sqkm <- ifelse((trimws(as.character(lakeIDs$nhdplusv2_area_sqkm))==trimws("NA")),NA,lakeIDs$nhdplusv2_area_sqkm)
suppressWarnings(lakeIDs$nhdplusv2_area_sqkm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nhdplusv2_area_sqkm))==as.character(as.numeric("NA"))),NA,lakeIDs$nhdplusv2_area_sqkm))
lakeIDs$lagosne_lagoslakeid <- ifelse((trimws(as.character(lakeIDs$lagosne_lagoslakeid))==trimws("NA")),NA,lakeIDs$lagosne_lagoslakeid)
suppressWarnings(lakeIDs$lagosne_lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lagosne_lagoslakeid))==as.character(as.numeric("NA"))),NA,lakeIDs$lagosne_lagoslakeid))
lakeIDs$lagosne_legacysiteid <- ifelse((trimws(as.character(lakeIDs$lagosne_legacysiteid))==trimws("NA")),NA,lakeIDs$lagosne_legacysiteid)
suppressWarnings(lakeIDs$lagosne_legacysiteid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lagosne_legacysiteid))==as.character(as.numeric("NA"))),NA,lakeIDs$lagosne_legacysiteid))
lakeIDs$nla2007_siteid <- ifelse((trimws(as.character(lakeIDs$nla2007_siteid))==trimws("NA")),NA,lakeIDs$nla2007_siteid)
suppressWarnings(lakeIDs$nla2007_siteid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nla2007_siteid))==as.character(as.numeric("NA"))),NA,lakeIDs$nla2007_siteid))
lakeIDs$nla2012_siteid <- ifelse((trimws(as.character(lakeIDs$nla2012_siteid))==trimws("NA")),NA,lakeIDs$nla2012_siteid)
suppressWarnings(lakeIDs$nla2012_siteid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nla2012_siteid))==as.character(as.numeric("NA"))),NA,lakeIDs$nla2012_siteid))
lakeIDs$nhdplusv2_lakes_n <- ifelse((trimws(as.character(lakeIDs$nhdplusv2_lakes_n))==trimws("NA")),NA,lakeIDs$nhdplusv2_lakes_n)
suppressWarnings(lakeIDs$nhdplusv2_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$nhdplusv2_lakes_n))==as.character(as.numeric("NA"))),NA,lakeIDs$nhdplusv2_lakes_n))
lakeIDs$lagosne_lakes_n <- ifelse((trimws(as.character(lakeIDs$lagosne_lakes_n))==trimws("NA")),NA,lakeIDs$lagosne_lakes_n)
suppressWarnings(lakeIDs$lagosne_lakes_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lagosne_lakes_n))==as.character(as.numeric("NA"))),NA,lakeIDs$lagosne_lakes_n))
lakeIDs$wqp_sites_n <- ifelse((trimws(as.character(lakeIDs$wqp_sites_n))==trimws("NA")),NA,lakeIDs$wqp_sites_n)
suppressWarnings(lakeIDs$wqp_sites_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$wqp_sites_n))==as.character(as.numeric("NA"))),NA,lakeIDs$wqp_sites_n))
lakeIDs$lagosus_legacyids_n <- ifelse((trimws(as.character(lakeIDs$lagosus_legacyids_n))==trimws("NA")),NA,lakeIDs$lagosus_legacyids_n)
suppressWarnings(lakeIDs$lagosus_legacyids_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(lakeIDs$lagosus_legacyids_n))==as.character(as.numeric("NA"))),NA,lakeIDs$lagosus_legacyids_n))


# Observed issues when reading the data. An empty list is good!
problems(lakeIDs)


#Filter to only include western US states
lakeIDs <- lakeIDs %>%
  filter(lake_centroidstate %in% c("CA", "UT", "NV",
                      "WA", "OR", "ID",
                      "MT", "WY", "CO",
                      "NM", "AZ")) 