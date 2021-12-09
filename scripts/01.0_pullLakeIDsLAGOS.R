#Smith, N.J., K.E. Webster, L.K. Rodriguez, K.S. Cheruvelil, and P.A. Soranno. 2021. LAGOS-US LOCUS v1.0: Data module of location, identifiers, and physical characteristics of lakes and their watersheds in the conterminous U.S. ver 1. Environmental Data Initiative. https://doi.org/10.6073/pasta/e5c2fb8d77467d3f03de4667ac2173ca (Accessed 2021-11-19).


# Lake IDs ----------------------------------------------------------------


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

#For some reason there are TONS of duplicates (example, lagoslakeid==453667, Gunlock reservoir)
lakeIDs <- distinct(lakeIDs, nhdplusv2_comid, .keep_all = TRUE)

#Smith, N.J., K.E. Webster, L.K. Rodriguez, K.S. Cheruvelil, and P.A. Soranno. 2021. LAGOS-US LOCUS v1.0: Data module of location, identifiers, and physical characteristics of lakes and their watersheds in the conterminous U.S. ver 1. Environmental Data Initiative. https://doi.org/10.6073/pasta/e5c2fb8d77467d3f03de4667ac2173ca (Accessed 2021-11-19).


# zone IDs ----------------------------------------------------------------



inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/854/1/007ca4f5ec02bb5809fc661dcfa7a903" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


zoneIDs <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
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
                 "neon_zoneid"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(zoneIDs$lagoslakeid)=="factor") zoneIDs$lagoslakeid <-as.numeric(levels(zoneIDs$lagoslakeid))[as.integer(zoneIDs$lagoslakeid) ]               
if (class(zoneIDs$lagoslakeid)=="character") zoneIDs$lagoslakeid <-as.numeric(zoneIDs$lagoslakeid)
if (class(zoneIDs$lake_nhdid)!="factor") zoneIDs$lake_nhdid<- as.factor(zoneIDs$lake_nhdid)
if (class(zoneIDs$lake_nhdfcode)!="factor") zoneIDs$lake_nhdfcode<- as.factor(zoneIDs$lake_nhdfcode)
if (class(zoneIDs$lake_nhdftype)!="factor") zoneIDs$lake_nhdftype<- as.factor(zoneIDs$lake_nhdftype)
if (class(zoneIDs$lake_reachcode)!="factor") zoneIDs$lake_reachcode<- as.factor(zoneIDs$lake_reachcode)
if (class(zoneIDs$lake_namegnis)!="factor") zoneIDs$lake_namegnis<- as.factor(zoneIDs$lake_namegnis)
if (class(zoneIDs$lake_namelagos)!="factor") zoneIDs$lake_namelagos<- as.factor(zoneIDs$lake_namelagos)
if (class(zoneIDs$lake_onlandborder)!="factor") zoneIDs$lake_onlandborder<- as.factor(zoneIDs$lake_onlandborder)
if (class(zoneIDs$lake_ismultipart)!="factor") zoneIDs$lake_ismultipart<- as.factor(zoneIDs$lake_ismultipart)
if (class(zoneIDs$lake_missingws)!="factor") zoneIDs$lake_missingws<- as.factor(zoneIDs$lake_missingws)
if (class(zoneIDs$lake_shapeflag)!="factor") zoneIDs$lake_shapeflag<- as.factor(zoneIDs$lake_shapeflag)
if (class(zoneIDs$lake_lat_decdeg)=="factor") zoneIDs$lake_lat_decdeg <-as.numeric(levels(zoneIDs$lake_lat_decdeg))[as.integer(zoneIDs$lake_lat_decdeg) ]               
if (class(zoneIDs$lake_lat_decdeg)=="character") zoneIDs$lake_lat_decdeg <-as.numeric(zoneIDs$lake_lat_decdeg)
if (class(zoneIDs$lake_lon_decdeg)=="factor") zoneIDs$lake_lon_decdeg <-as.numeric(levels(zoneIDs$lake_lon_decdeg))[as.integer(zoneIDs$lake_lon_decdeg) ]               
if (class(zoneIDs$lake_lon_decdeg)=="character") zoneIDs$lake_lon_decdeg <-as.numeric(zoneIDs$lake_lon_decdeg)
if (class(zoneIDs$lake_elevation_m)=="factor") zoneIDs$lake_elevation_m <-as.numeric(levels(zoneIDs$lake_elevation_m))[as.integer(zoneIDs$lake_elevation_m) ]               
if (class(zoneIDs$lake_elevation_m)=="character") zoneIDs$lake_elevation_m <-as.numeric(zoneIDs$lake_elevation_m)
if (class(zoneIDs$lake_centroidstate)!="factor") zoneIDs$lake_centroidstate<- as.factor(zoneIDs$lake_centroidstate)
if (class(zoneIDs$lake_states)!="factor") zoneIDs$lake_states<- as.factor(zoneIDs$lake_states)
if (class(zoneIDs$lake_county)!="factor") zoneIDs$lake_county<- as.factor(zoneIDs$lake_county)
if (class(zoneIDs$lake_countyfips)!="factor") zoneIDs$lake_countyfips<- as.factor(zoneIDs$lake_countyfips)
if (class(zoneIDs$lake_huc12)!="factor") zoneIDs$lake_huc12<- as.factor(zoneIDs$lake_huc12)
if (class(zoneIDs$buff100_zoneid)!="factor") zoneIDs$buff100_zoneid<- as.factor(zoneIDs$buff100_zoneid)
if (class(zoneIDs$buff500_zoneid)!="factor") zoneIDs$buff500_zoneid<- as.factor(zoneIDs$buff500_zoneid)
if (class(zoneIDs$ws_zoneid)!="factor") zoneIDs$ws_zoneid<- as.factor(zoneIDs$ws_zoneid)
if (class(zoneIDs$nws_zoneid)!="factor") zoneIDs$nws_zoneid<- as.factor(zoneIDs$nws_zoneid)
if (class(zoneIDs$hu12_zoneid)!="factor") zoneIDs$hu12_zoneid<- as.factor(zoneIDs$hu12_zoneid)
if (class(zoneIDs$hu8_zoneid)!="factor") zoneIDs$hu8_zoneid<- as.factor(zoneIDs$hu8_zoneid)
if (class(zoneIDs$hu4_zoneid)!="factor") zoneIDs$hu4_zoneid<- as.factor(zoneIDs$hu4_zoneid)
if (class(zoneIDs$county_zoneid)!="factor") zoneIDs$county_zoneid<- as.factor(zoneIDs$county_zoneid)
if (class(zoneIDs$state_zoneid)!="factor") zoneIDs$state_zoneid<- as.factor(zoneIDs$state_zoneid)
if (class(zoneIDs$epanutr_zoneid)!="factor") zoneIDs$epanutr_zoneid<- as.factor(zoneIDs$epanutr_zoneid)
if (class(zoneIDs$omernik3_zoneid)!="factor") zoneIDs$omernik3_zoneid<- as.factor(zoneIDs$omernik3_zoneid)
if (class(zoneIDs$wwf_zoneid)!="factor") zoneIDs$wwf_zoneid<- as.factor(zoneIDs$wwf_zoneid)
if (class(zoneIDs$mlra_zoneid)!="factor") zoneIDs$mlra_zoneid<- as.factor(zoneIDs$mlra_zoneid)
if (class(zoneIDs$bailey_zoneid)!="factor") zoneIDs$bailey_zoneid<- as.factor(zoneIDs$bailey_zoneid)
if (class(zoneIDs$neon_zoneid)!="factor") zoneIDs$neon_zoneid<- as.factor(zoneIDs$neon_zoneid)

# Convert Missing Values to NA for non-dates

zoneIDs$lagoslakeid <- ifelse((trimws(as.character(zoneIDs$lagoslakeid))==trimws("NA")),NA,zoneIDs$lagoslakeid)               
suppressWarnings(zoneIDs$lagoslakeid <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(zoneIDs$lagoslakeid))==as.character(as.numeric("NA"))),NA,zoneIDs$lagoslakeid))
zoneIDs$lake_nhdid <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_nhdid))==trimws("NA")),NA,as.character(zoneIDs$lake_nhdid)))
zoneIDs$lake_nhdfcode <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_nhdfcode))==trimws("NA")),NA,as.character(zoneIDs$lake_nhdfcode)))
zoneIDs$lake_nhdftype <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_nhdftype))==trimws("NA")),NA,as.character(zoneIDs$lake_nhdftype)))
zoneIDs$lake_reachcode <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_reachcode))==trimws("NA")),NA,as.character(zoneIDs$lake_reachcode)))
zoneIDs$lake_namegnis <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_namegnis))==trimws("NA")),NA,as.character(zoneIDs$lake_namegnis)))
zoneIDs$lake_namelagos <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_namelagos))==trimws("NA")),NA,as.character(zoneIDs$lake_namelagos)))
zoneIDs$lake_onlandborder <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_onlandborder))==trimws("NA")),NA,as.character(zoneIDs$lake_onlandborder)))
zoneIDs$lake_ismultipart <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_ismultipart))==trimws("NA")),NA,as.character(zoneIDs$lake_ismultipart)))
zoneIDs$lake_missingws <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_missingws))==trimws("NA")),NA,as.character(zoneIDs$lake_missingws)))
zoneIDs$lake_shapeflag <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_shapeflag))==trimws("NA")),NA,as.character(zoneIDs$lake_shapeflag)))
zoneIDs$lake_lat_decdeg <- ifelse((trimws(as.character(zoneIDs$lake_lat_decdeg))==trimws("NA")),NA,zoneIDs$lake_lat_decdeg)               
suppressWarnings(zoneIDs$lake_lat_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(zoneIDs$lake_lat_decdeg))==as.character(as.numeric("NA"))),NA,zoneIDs$lake_lat_decdeg))
zoneIDs$lake_lon_decdeg <- ifelse((trimws(as.character(zoneIDs$lake_lon_decdeg))==trimws("NA")),NA,zoneIDs$lake_lon_decdeg)               
suppressWarnings(zoneIDs$lake_lon_decdeg <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(zoneIDs$lake_lon_decdeg))==as.character(as.numeric("NA"))),NA,zoneIDs$lake_lon_decdeg))
zoneIDs$lake_elevation_m <- ifelse((trimws(as.character(zoneIDs$lake_elevation_m))==trimws("NA")),NA,zoneIDs$lake_elevation_m)               
suppressWarnings(zoneIDs$lake_elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(zoneIDs$lake_elevation_m))==as.character(as.numeric("NA"))),NA,zoneIDs$lake_elevation_m))
zoneIDs$lake_centroidstate <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_centroidstate))==trimws("NA")),NA,as.character(zoneIDs$lake_centroidstate)))
zoneIDs$lake_states <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_states))==trimws("NA")),NA,as.character(zoneIDs$lake_states)))
zoneIDs$lake_county <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_county))==trimws("NA")),NA,as.character(zoneIDs$lake_county)))
zoneIDs$lake_countyfips <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_countyfips))==trimws("NA")),NA,as.character(zoneIDs$lake_countyfips)))
zoneIDs$lake_huc12 <- as.factor(ifelse((trimws(as.character(zoneIDs$lake_huc12))==trimws("NA")),NA,as.character(zoneIDs$lake_huc12)))
zoneIDs$buff100_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$buff100_zoneid))==trimws("NA")),NA,as.character(zoneIDs$buff100_zoneid)))
zoneIDs$buff500_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$buff500_zoneid))==trimws("NA")),NA,as.character(zoneIDs$buff500_zoneid)))
zoneIDs$ws_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$ws_zoneid))==trimws("NA")),NA,as.character(zoneIDs$ws_zoneid)))
zoneIDs$nws_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$nws_zoneid))==trimws("NA")),NA,as.character(zoneIDs$nws_zoneid)))
zoneIDs$hu12_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$hu12_zoneid))==trimws("NA")),NA,as.character(zoneIDs$hu12_zoneid)))
zoneIDs$hu8_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$hu8_zoneid))==trimws("NA")),NA,as.character(zoneIDs$hu8_zoneid)))
zoneIDs$hu4_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$hu4_zoneid))==trimws("NA")),NA,as.character(zoneIDs$hu4_zoneid)))
zoneIDs$county_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$county_zoneid))==trimws("NA")),NA,as.character(zoneIDs$county_zoneid)))
zoneIDs$state_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$state_zoneid))==trimws("NA")),NA,as.character(zoneIDs$state_zoneid)))
zoneIDs$epanutr_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$epanutr_zoneid))==trimws("NA")),NA,as.character(zoneIDs$epanutr_zoneid)))
zoneIDs$omernik3_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$omernik3_zoneid))==trimws("NA")),NA,as.character(zoneIDs$omernik3_zoneid)))
zoneIDs$wwf_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$wwf_zoneid))==trimws("NA")),NA,as.character(zoneIDs$wwf_zoneid)))
zoneIDs$mlra_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$mlra_zoneid))==trimws("NA")),NA,as.character(zoneIDs$mlra_zoneid)))
zoneIDs$bailey_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$bailey_zoneid))==trimws("NA")),NA,as.character(zoneIDs$bailey_zoneid)))
zoneIDs$neon_zoneid <- as.factor(ifelse((trimws(as.character(zoneIDs$neon_zoneid))==trimws("NA")),NA,as.character(zoneIDs$neon_zoneid)))


# Here is the structure of the input data frame:
str(zoneIDs)                            
attach(zoneIDs)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(lagoslakeid)
summary(lake_nhdid)
summary(lake_nhdfcode)
summary(lake_nhdftype)
summary(lake_reachcode)
summary(lake_namegnis)
summary(lake_namelagos)
summary(lake_onlandborder)
summary(lake_ismultipart)
summary(lake_missingws)
summary(lake_shapeflag)
summary(lake_lat_decdeg)
summary(lake_lon_decdeg)
summary(lake_elevation_m)
summary(lake_centroidstate)
summary(lake_states)
summary(lake_county)
summary(lake_countyfips)
summary(lake_huc12)
summary(buff100_zoneid)
summary(buff500_zoneid)
summary(ws_zoneid)
summary(nws_zoneid)
summary(hu12_zoneid)
summary(hu8_zoneid)
summary(hu4_zoneid)
summary(county_zoneid)
summary(state_zoneid)
summary(epanutr_zoneid)
summary(omernik3_zoneid)
summary(wwf_zoneid)
summary(mlra_zoneid)
summary(bailey_zoneid)
summary(neon_zoneid) 
# Get more details on character variables

summary(as.factor(zoneIDs$lake_nhdid)) 
summary(as.factor(zoneIDs$lake_nhdfcode)) 
summary(as.factor(zoneIDs$lake_nhdftype)) 
summary(as.factor(zoneIDs$lake_reachcode)) 
summary(as.factor(zoneIDs$lake_namegnis)) 
summary(as.factor(zoneIDs$lake_namelagos)) 
summary(as.factor(zoneIDs$lake_onlandborder)) 
summary(as.factor(zoneIDs$lake_ismultipart)) 
summary(as.factor(zoneIDs$lake_missingws)) 
summary(as.factor(zoneIDs$lake_shapeflag)) 
summary(as.factor(zoneIDs$lake_centroidstate)) 
summary(as.factor(zoneIDs$lake_states)) 
summary(as.factor(zoneIDs$lake_county)) 
summary(as.factor(zoneIDs$lake_countyfips)) 
summary(as.factor(zoneIDs$lake_huc12)) 
summary(as.factor(zoneIDs$buff100_zoneid)) 
summary(as.factor(zoneIDs$buff500_zoneid)) 
summary(as.factor(zoneIDs$ws_zoneid)) 
summary(as.factor(zoneIDs$nws_zoneid)) 
summary(as.factor(zoneIDs$hu12_zoneid)) 
summary(as.factor(zoneIDs$hu8_zoneid)) 
summary(as.factor(zoneIDs$hu4_zoneid)) 
summary(as.factor(zoneIDs$county_zoneid)) 
summary(as.factor(zoneIDs$state_zoneid)) 
summary(as.factor(zoneIDs$epanutr_zoneid)) 
summary(as.factor(zoneIDs$omernik3_zoneid)) 
summary(as.factor(zoneIDs$wwf_zoneid)) 
summary(as.factor(zoneIDs$mlra_zoneid)) 
summary(as.factor(zoneIDs$bailey_zoneid)) 
summary(as.factor(zoneIDs$neon_zoneid))
detach(zoneIDs)               
