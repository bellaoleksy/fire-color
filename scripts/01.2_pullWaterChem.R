

# in situ -----------------------------------------------------------------


chemicalphysical<-read.csv(here("data/site_chemicalphysical_epi.csv")) %>%
  mutate(event_date=lubridate::ymd(event_date),
         year=lubridate::year(event_date),
         year=factor(year),
         lagoslakeid=factor(lagoslakeid))

claritycarbon<-read.csv(here("data/site_claritycarbon_epi.csv"))%>%
  mutate(event_date=lubridate::ymd(event_date),
         year=lubridate::year(event_date),
         year=factor(year),
         lagoslakeid=factor(lagoslakeid))

nutrientsalgae<-read.csv(here("data/site_nutrientsalgae_epi.csv"))%>%
  mutate(event_date=lubridate::ymd(event_date),
         year=lubridate::year(event_date),
         year=factor(year),
         lagoslakeid=factor(lagoslakeid))


lakeinformation <- lakeinformation %>%
  filter(lake_centroidstate %in% c("CA", "UT", "NV",
                                   "WA", "OR", "ID",
                                   "MT", "WY", "CO",
                                   "NM", "AZ")) %>%
  mutate(lagoslakeid=factor(lagoslakeid))

lakewatersheds <- lakewatersheds %>%
  mutate(lagoslakeid=factor(lagoslakeid))

lakecharacteristics <- lakecharacteristics %>%
  mutate(lagoslakeid=factor(lagoslakeid))


##SUMMARIZE IN SITU DATA

# names(chemicalphysical)
chemicalphysical_annual <- chemicalphysical %>%
  group_by(lagoslakeid, year) %>%
  summarise_at(c("ca_mgl","alk_ueql","do_mgl","ph_eq",
                 "so4_mgl","temp_degc","salinity_mgl",
                 "mg_mgl","spcond_uscm"), list(median = function(x) median(x,na.rm=T),
                                               max = function(x) max(x,na.rm=T),
                                               n=length))
# names(claritycarbon)
claritycarbon_annual <- claritycarbon %>%
  group_by(lagoslakeid, year) %>%
  summarize_at(c("colora_pcu","colort_pcu","doc_mgl","turb_ntu",
                 "secchi_m","tss"), list(median = function(x) median(x,na.rm=T),
                                         max = function(x) max(x,na.rm=T),
                                         n=length))



# names(nutrientsalgae)
nutrientsalgae_annual <- nutrientsalgae %>%
  group_by(lagoslakeid, year) %>%
  summarize_at(c("chla_ugl","no2no3n_ugl","nh4n_ugl",
                 "tkn_ugl","tn_ugl","ton_ugl","tp_ugl",
                 "srpp_ugl","microcystin_ugl"), list(median = function(x) median(x,na.rm=T),
                                                     max = function(x) max(x,na.rm=T),
                                                     n=length))

#Joining each data.table to lakeinformation which only has western states
chemicalphysical_annual<-merge(lakeinformation,chemicalphysical_annual, no.dups=TRUE, by="lagoslakeid") 
claritycarbon_annual<-merge(lakeinformation,claritycarbon_annual, no.dups=TRUE, by="lagoslakeid")
nutrientsalgae_annual<-merge(lakeinformation,nutrientsalgae_annual,  no.dups=TRUE, by="lagoslakeid")

colnames<-(intersect( colnames(lakeinformation),  colnames(depth))) #identify common columns between data.tables
depth<-merge(lakeinformation,depth, all.x=TRUE,  no.dups=TRUE, by=colnames)
colnames<-(intersect( colnames(lakeinformation),  colnames(lakewatersheds))) #identify common columns between data.tables
lakewatersheds<-merge(lakeinformation,lakewatersheds,  no.dups=TRUE, by=colnames)
colnames<-(intersect( colnames(lakeinformation),  colnames(lakecharacteristics))) #identify common columns between data.tables
lakecharacteristics<-merge(lakeinformation,lakecharacteristics,  no.dups=TRUE, by=colnames)


#Make one big dataframe, and join by all of the common columns ("colnames")
colnames<-(intersect( colnames(chemicalphysical),  colnames(claritycarbon)))
dt_limno<- merge(chemicalphysical,claritycarbon, all=TRUE,by=colnames) 
colnames<-(intersect( colnames(dt_limno),  colnames(contaminants)))
dt_limno<- merge(dt_limno,contaminants, all=TRUE,by=colnames) 
colnames<-(intersect( colnames(dt_limno),  colnames(nutrientsalgae)))
dt_limno<- merge(dt_limno,nutrientsalgae, all=TRUE,by=colnames) 
colnames<-(intersect( colnames(dt_limno),  colnames(depth)))
dt_limno<- merge(dt_limno,depth,by=colnames) 

colnames<-(intersect( colnames(dt_limno),  colnames(lakewatersheds)))
dt_limno<- merge(dt_limno,lakewatersheds,all=TRUE,by=colnames) 

colnames<-(intersect( colnames(dt_limno), colnames(lakecharacteristics)))
dt_limno<- merge(dt_limno,lakecharacteristics,all=TRUE,by=colnames) 
