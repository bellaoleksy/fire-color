
#Burn severity
MTBS<-read.csv("~/Dropbox/dropbox Research/fire-color/data/lakeCat/MTBS.csv") %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# MTBS<-semi_join(MTBS,lakeIDs,by="nhdplusv2_comid")
MTBS<-inner_join(MTBS,lakeIDs,by="nhdplusv2_comid")

MTBS_burnCats<- MTBS %>%
  select(nhdplusv2_comid, contains("Cat")) %>%
  select(-c(CatPctFull,inStreamCat,CatAreaSqKm,wqp_monitoringlocationidentifier, wqp_monitoringlocationname)) %>%
  mutate(sumBurn = rowSums(across(where(is.numeric)))) %>%
  select(nhdplusv2_comid,sumBurn) %>%
  # mutate(burn_YN= 
  #          ifelse(sumBurn > 0, "burned",
  #                 ifelse(sumBurn <= 0, "unburned", "error"))) 
  mutate(burn_YN= 
           ifelse(sumBurn > 0 & sumBurn < 80, "burned",
                  ifelse(sumBurn >= 80, "severeBurn",
                         ifelse(sumBurn <= 0, "unburned", "error")))) 

MTBS <- left_join(MTBS, MTBS_burnCats, by="nhdplusv2_comid")

#How many NAs in burn_YN?
# sum(is.na(MTBS$burn_YN))

# MTBS_Severity_1984<-read.csv(here("data/lakeCat/MTBS_Severity_1984.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# MTBS_Severity_1984<-semi_join(MTBS,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b

#Fire perimenter - this might be better too use than MTBS?
FirePerimeters<-read.csv("~/Dropbox/dropbox Research/fire-color/data/lakeCat/FirePerimeters.csv") %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# FirePerimeters<-semi_join(FirePerimeters,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
FirePerimeters<-inner_join(FirePerimeters,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b

FirePerimeters_long <- FirePerimeters %>%
  dplyr::select(lagoslakeid, nhdplusv2_comid,lake_nhdid,nhdplusv2_reachcode,lake_namegnis,
                lake_lon_decdeg, lake_lat_decdeg,
                contains("PctFire"))%>%
  pivot_longer(-(1:7), names_pattern = "(\\d+)([A-Za-z]+)", names_to = c("year","scale"))
# "([A-Za-z]+)" matches only letters, so will pull out just "Ws" or "Cat". "(\\d+)" matches digits and will pull out the year.



#Forest loss
ForestLoss<-read.csv("~/Dropbox/dropbox Research/fire-color/data/lakeCat/ForestLossByYear0013.csv") %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# ForestLoss<-semi_join(ForestLoss,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
ForestLoss<-inner_join(ForestLoss,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b

## Reservoir data

reservoir<-read.csv("/Users/isabellaoleksy/Dropbox/CollinsLabShared/Data/LAGOS RSVR for Bella/LAGOSUS_RSVR_v1.1.csv") %>%
  dplyr::select(lagoslakeid, lake_rsvr_class, lake_rsvr_probnl, lake_rsvr_probrsvr,
                lake_rsvr_model,lake_rsvr_probdiff,lake_rsvr_classmethod,
                lake_rsvr_rsvrisolated_flag,lake_rsvr_nlneardam_flag) 


reservoir<-inner_join(reservoir,lakeIDs,by="lagoslakeid")# All rows in a that have a match in b



# #Ag Nitrogen
# AgN <-read.csv(here("data/lakeCat/AgriculturalNitrogen.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# AgN<-semi_join(AgN,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #NLCD
NLCD2001 <-read.csv(here("data/lakeCat/NLCD2001.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
NLCD2004 <-read.csv(here("data/lakeCat/NLCD2004.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
NLCD2006 <-read.csv(here("data/lakeCat/NLCD2006.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
NLCD2008 <-read.csv(here("data/lakeCat/NLCD2008.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
NLCD2011 <-read.csv(here("data/lakeCat/NLCD2011.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
NLCD2013 <-read.csv(here("data/lakeCat/NLCD2013.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
NLCD2016 <-read.csv(here("data/lakeCat/NLCD2016.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))

colnames<-(intersect( colnames(NLCD2001),  colnames(NLCD2004))) #identify common columns between data.tables
NLCD<-left_join(NLCD2001,NLCD2004, by=colnames)
NLCD<-left_join(NLCD,NLCD2006, by=colnames)
NLCD<-left_join(NLCD,NLCD2008, by=colnames)
NLCD<-left_join(NLCD,NLCD2011, by=colnames)
NLCD<-left_join(NLCD,NLCD2013, by=colnames)
NLCD<-left_join(NLCD,NLCD2016, by=colnames)
NLCD<-inner_join(NLCD,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b

NLCD_long <- NLCD %>%
  dplyr::select(lagoslakeid, nhdplusv2_comid,lake_nhdid,nhdplusv2_reachcode,lake_namegnis,
                             lake_lon_decdeg, lake_lat_decdeg,
                             contains("Pct"))%>%
  pivot_longer(-(1:7), names_pattern = "([A-Za-z]+)(\\d+)([A-Za-z]+)", names_to = c("type","year","scale")) %>%
  drop_na(type)
# "([A-Za-z]+)" matches only letters, so will pull out just "Ws" or "Cat". "(\\d+)" matches digits and will pull out the year.

# 
# #Runoff
# Runoff <-read.csv(here("data/lakeCat/Runoff.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# Runoff<-semi_join(Runoff,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# 
# #NADP
NADP <-read.csv(here("data/lakeCat/NADP.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
NADP<-semi_join(NADP,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
NADP_2014_2018<-read.csv(here("data/lakeCat/NADP_2014_2018.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
NADP_2014_2018<-semi_join(NADP_2014_2018,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# colnames<-(intersect( colnames(NADP),  colnames(NADP_2014_2018))) #identify common columns between data.tables
# NADP<-left_join(NADP,NADP_2014_2018, by=colnames)
# rm(NADP_2014_2018)
# 
# #PRISM
# PRISM_1981_2010<-read.csv(here("data/lakeCat/PRISM_1981_2010.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# PRISM_1981_2010<-left_join(PRISM_1981_2010,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# PRISM_1981_2010 %>%
#   drop_na(lagoslakeid)
# #CTI
#Mean Composite Topographic Index (CTI)[Wetness Index]:, within the local catchment (Cat) and upslope watershed (Ws)
#compound topographic index (CTI), is a steady state wetness index. It is commonly used to quantify topographic control on hydrological processes.[1] The index is a function of both the slope and the upstream contributing area per unit width orthogonal to the flow direction.
CTI<-read.csv(here("data/lakeCat/WetIndx.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
CTI<-semi_join(CTI,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b

#Slope
Slope<-read.csv(here("data/lakeCat/Slope.csv")) %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
Slope<-semi_join(Slope,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #Lithology
# Lithology<-read.csv(here("data/lakeCat/Lithology.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# Lithology<-semi_join(Lithology,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #ImpSurf
# ImpSurf<-read.csv(here("data/lakeCat/ImperviousSurfaces2016.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# ImpSurf<-semi_join(ImpSurf,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #GeoChemPhys
# GeoChemPhys1<-read.csv(here("data/lakeCat/GeoChemPhys1.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# GeoChemPhys2<-read.csv(here("data/lakeCat/GeoChemPhys2.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# GeoChemPhys3<-read.csv(here("data/lakeCat/GeoChemPhys3.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# GeoChemPhys4<-read.csv(here("data/lakeCat/GeoChemPhys4.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# colnames<-(intersect( colnames(GeoChemPhys1),  colnames(GeoChemPhys2))) #identify common columns between data.tables
# GeoChemPhys<-left_join(GeoChemPhys1,GeoChemPhys2, by=colnames)
# GeoChemPhys<-left_join(GeoChemPhys,GeoChemPhys3, by=colnames)
# GeoChemPhys<-left_join(GeoChemPhys,GeoChemPhys4, by=colnames)
# GeoChemPhys<-semi_join(GeoChemPhys,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #EPA_FRS
# EPA_FRS<-read.csv(here("data/lakeCat/EPA_FRS.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# EPA_FRS<-semi_join(EPA_FRS,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #BFI
# BFI<-read.csv(here("data/lakeCat/BFI.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# BFI<-semi_join(BFI,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #Census
# Census<-read.csv(here("data/lakeCat/USCensus2010.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# Census<-semi_join(Census,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b

colnames<-(intersect( colnames(FirePerimeters),  colnames(MTBS))) #identify common columns between data.tables
lakeCat<- left_join(FirePerimeters, MTBS, by=colnames)
lakeCat<- left_join(lakeCat, ForestLoss, by=colnames)
colnames<-(intersect( colnames(lakeCat),  colnames(reservoir))) #identify common columns between data.tables
lakeCat<- left_join(lakeCat, reservoir, by=colnames)

lakeCat <- lakeCat %>%
left_join(., zoneIDs %>%
            select(lagoslakeid,lake_elevation_m),by="lagoslakeid") %>%#grab elevation
  left_join(., CTI %>%
              select(nhdplusv2_comid, WetIndexCat), by="nhdplusv2_comid") %>% #Add some info about hydrology
  left_join(., Slope %>%
              select(nhdplusv2_comid, SlopeCat), by="nhdplusv2_comid") #Add some info about slope

# saveRDS(lakeCat, file = "data_export/lakeCat.rds") #last saved 2022-01-11

# lakeCat<- left_join(lakeCat, AgN, by=colnames)
# lakeCat<- left_join(lakeCat, NLCD, by=colnames)
# lakeCat<- left_join(lakeCat, MTBS, by=colnames)
# lakeCat<- left_join(lakeCat, Runoff, by=colnames)
# lakeCat<- left_join(lakeCat, NADP, by=colnames)
# lakeCat<- left_join(lakeCat, PRISM_1981_2010, by=colnames)
# lakeCat<- left_join(lakeCat, CTI, by=colnames)
# lakeCat<- left_join(lakeCat, Slope, by=colnames)
# lakeCat<- left_join(lakeCat, Lithology, by=colnames)
# lakeCat<- left_join(lakeCat, ImpSurf, by=colnames)
# lakeCat<- left_join(lakeCat, GeoChemPhys, by=colnames)
# lakeCat<- left_join(lakeCat, EPA_FRS, by=colnames)
# lakeCat<- left_join(lakeCat, BFI, by=colnames)
# lakeCat<- left_join(lakeCat, Census, by=colnames)

#Clean up 
# rm(FirePerimeters, MTBS, ForestLoss
# #    # AgN, NLCD, 
# #    # Runoff, 
# #    # NADP, PRISM_1981_2010, 
# #    # CTI,  Slope, 
# #    # Lithology, 
# #    # ImpSurf, GeoChemPhys, 
# #    # EPA_FRS, BFI, 
# #    # Census,
# #    # GeoChemPhys1,GeoChemPhys2,GeoChemPhys3,GeoChemPhys4,
# #    # NLCD2001, NLCD2004, NLCD2006, NLCD2008, NLCD2011, NLCD2013, NLCD2016
#    )

## Compile and export for rocky-mtn-color
NLCD2016<-semi_join(NLCD2016,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
Lithology<-Lithology %>% select(nhdplusv2_comid, PctCarbResidWs, PctSilicicWs)
NADP_2014_2018<-NADP_2014_2018 %>% select(nhdplusv2_comid, NH4_2018Ws, NO3_2018Ws)
ForestLoss<-ForestLoss %>% select(nhdplusv2_comid, contains("Ws")) %>%
  group_by(nhdplusv2_comid) %>%
  mutate(across(starts_with("PctFrstLoss"), ~ .x * WsAreaSqKm)) %>% #convert annual forest loss % to sq km burned
  rowwise() %>% # perform row-wise aggregation for functions that do not have specific row-wise variants
  summarize(forestLossSum_sqkm = sum(c_across(starts_with("PctFrstLoss")), na.rm = T)) %>%
  ungroup() # you'll likely want to ungroup after using rowwise()

 
  
colnames<-(intersect( colnames(NLCD2016),  colnames(Lithology))) #identify common columns between data.tables
lakeCatExport<- left_join(NLCD2016, Lithology, by=colnames)
colnames<-(intersect( colnames(lakeCatExport),  colnames(NADP_2014_2018))) #identify common columns between data.tables
lakeCatExport<- left_join(lakeCatExport, NADP_2014_2018, by=colnames)
colnames<-(intersect( colnames(lakeCatExport),  colnames(ForestLoss))) #identify common columns between data.tables
lakeCatExport<- left_join(lakeCatExport, ForestLoss, by=colnames)
# colnames<-(intersect( colnames(lakeCatExport),  colnames(Slope))) #identify common columns between data.tables
lakeCatExport<- left_join(lakeCatExport, Slope %>%
                            select(nhdplusv2_comid, SlopeWs), by="nhdplusv2_comid")
# colnames<-(intersect( colnames(lakeCatExport),  colnames(CTI))) #identify common columns between data.tables
lakeCatExport<- left_join(lakeCatExport, CTI %>%
                            select(nhdplusv2_comid, WetIndexWs), by="nhdplusv2_comid")
lakeCatExport <- lakeCatExport %>%
  select(-contains("Cat")) #Exclude catchment scale
lakeCatExport<-inner_join(lakeCatExport,lakeIDs %>%
                                            select(nhdplusv2_comid, lagoslakeid, lake_perimeter_m,
                                                   lake_connectivity_class, lake_totalarea_ha, lake_waterarea_ha),by="nhdplusv2_comid") 

write_feather(lakeCatExport, "data_export/lakeCatExport.feather")

