
#Burn severity
MTBS<-read.csv("~/Dropbox/dropbox Research/fire-color/data/lakeCat/MTBS.csv") %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# MTBS<-semi_join(MTBS,lakeIDs,by="nhdplusv2_comid")
MTBS<-inner_join(MTBS,lakeIDs,by="nhdplusv2_comid")


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

#Forest loss
ForestLoss<-read.csv("~/Dropbox/dropbox Research/fire-color/data/lakeCat/ForestLossByYear0013.csv") %>%
  rename(nhdplusv2_comid=COMID)%>%
  mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# ForestLoss<-semi_join(ForestLoss,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
ForestLoss<-inner_join(ForestLoss,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b


# #Ag Nitrogen
# AgN <-read.csv(here("data/lakeCat/AgriculturalNitrogen.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# AgN<-semi_join(AgN,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #NLCD
# NLCD2001 <-read.csv(here("data/lakeCat/NLCD2001.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# NLCD2004 <-read.csv(here("data/lakeCat/NLCD2004.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# NLCD2006 <-read.csv(here("data/lakeCat/NLCD2006.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# NLCD2008 <-read.csv(here("data/lakeCat/NLCD2008.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# NLCD2011 <-read.csv(here("data/lakeCat/NLCD2011.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# NLCD2013 <-read.csv(here("data/lakeCat/NLCD2013.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# NLCD2016 <-read.csv(here("data/lakeCat/NLCD2016.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# 
# colnames<-(intersect( colnames(NLCD2001),  colnames(NLCD2004))) #identify common columns between data.tables
# NLCD<-left_join(NLCD2001,NLCD2004, by=colnames)
# NLCD<-left_join(NLCD,NLCD2006, by=colnames)
# NLCD<-left_join(NLCD,NLCD2008, by=colnames)
# NLCD<-left_join(NLCD,NLCD2011, by=colnames)
# NLCD<-left_join(NLCD,NLCD2013, by=colnames)
# NLCD<-left_join(NLCD,NLCD2016, by=colnames)
# NLCD<-semi_join(NLCD,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# names(NLCD)
# 
# #Runoff
# Runoff <-read.csv(here("data/lakeCat/Runoff.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# Runoff<-semi_join(Runoff,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# 
# #NADP
# NADP <-read.csv(here("data/lakeCat/NADP.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# NADP<-semi_join(NADP,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# NADP_2014_2018<-read.csv(here("data/lakeCat/NADP_2014_2018.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# NADP_2014_2018<-semi_join(NADP_2014_2018,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
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
# #Mean Composite Topographic Index (CTI)[Wetness Index]:, within the local catchment (Cat) and upslope watershed (Ws) 
# CTI<-read.csv(here("data/lakeCat/WetIndx.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# CTI<-semi_join(CTI,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
# 
# #Slope
# Slope<-read.csv(here("data/lakeCat/Slope.csv")) %>%
#   rename(nhdplusv2_comid=COMID)%>%
#   mutate(nhdplusv2_comid=as.character(nhdplusv2_comid))
# Slope<-semi_join(Slope,lakeIDs,by="nhdplusv2_comid")# All rows in a that have a match in b
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
rm(FirePerimeters, MTBS, ForestLoss
#    # AgN, NLCD, 
#    # Runoff, 
#    # NADP, PRISM_1981_2010, 
#    # CTI,  Slope, 
#    # Lithology, 
#    # ImpSurf, GeoChemPhys, 
#    # EPA_FRS, BFI, 
#    # Census,
#    # GeoChemPhys1,GeoChemPhys2,GeoChemPhys3,GeoChemPhys4,
#    # NLCD2001, NLCD2004, NLCD2006, NLCD2008, NLCD2011, NLCD2013, NLCD2016
   )

