if (!require('here')) install.packages('here');library('here') 
source("fire-color/scripts/00_libraries.R")
source("fire-color/scripts/00_helperFuns.R")
# source("scripts/00_libraries.R")
# source("scripts/00_helperFuns.R")
source("fire-color/scripts/01.0_pullLakeIDsLAGOS.R")
source("fire-color/scripts/01.1_pullLakeCat.R")
# source("scripts/01.0_pullLakeIDsLAGOS.R")
# source("scripts/01.1_pullLakeCat.R")


FirePerimeters_long_trim <- FirePerimeters_long %>%
  filter(scale=="Cat")%>%
  rename(perc_forest_loss=value) %>%
  filter(nhdplusv2_comid %in% fire_trend_changes_over5$nhdplusv2_comid) %>%
  full_join(., MTBS_moderate %>%
              mutate(yearBurn = as.numeric(as.character(yearBurn))) %>%
              rename(perc_total_burn=value))


FirePerimeters_long_trim %>%
  filter(year==yearBurn) %>% #Pick out the observations where the watershed burned
  ggplot(aes(x=perc_total_burn, y=perc_forest_loss))+
  geom_point()


NLCD_long_trim <- NLCD_long %>%
  filter(scale=="Cat")%>%
  rename(perc_landcover=value,
         year_landcover=year) %>%
  filter(type %in% c("PctDecid","PctMxFst","PctConif")) %>%
  filter(nhdplusv2_comid %in% fire_trend_changes_over5$nhdplusv2_comid) %>%
  full_join(., MTBS_moderate %>%
              mutate(yearBurn = as.numeric(as.character(yearBurn))) %>%
              rename(perc_total_burn=value))


#If we normalize forest cover, do we see changes through time across lakes?

NLCD_long_trim %>%
  pivot_wider(names_from=type,values_from = perc_landcover) %>%
  mutate(PctForest=PctDecid+PctConif+PctMxFst) %>%
  group_by(nhdplusv2_comid) %>%
  mutate(PctForest_normalized=scale(PctForest),
         year_landcover=as.numeric(as.character(year_landcover))) %>%
  filter(perc_total_burn > 50) %>%
  ggplot(aes(x=year_landcover,y=PctForest_normalized,group=nhdplusv2_comid)) +
  geom_point(alpha=0.5)+
  geom_line()

#What we combine with FirePerimeters and color points by 2001 Forest Cover? 
NLCD_long_trim %>%
  pivot_wider(names_from=type,values_from = perc_landcover) %>%
  mutate(PctForest=PctDecid+PctConif+PctMxFst) %>%
  select(-c(PctDecid:PctMxFst)) %>%
  left_join(.,FirePerimeters_long_trim) %>%
  filter(year==yearBurn) %>% #Pick out the observations where the watershed burned
  filter(yearBurn>2001) %>%
  filter(year_landcover=="2001")%>%
  ggplot(aes(x=perc_total_burn, y=perc_forest_loss, fill=PctForest))+
  geom_point(shape=21,size=2.5)+
  scale_fill_continuous_sequential(palette="Terrain 2",
                                   name="NLCD 2001\ntotal forest cover (%)")+
  labs(y="% Forest Loss in the year of the burn",
       x="% Watershed burned")+
  theme_few()


#Hone in on just the sites where a large % of the local catchment burned
#What we combine with FirePerimeters and color points by 2001 Forest Cover? 
NLCD_long_trim %>%
  pivot_wider(names_from=type,values_from = perc_landcover) %>%
  mutate(PctForest=PctDecid+PctConif+PctMxFst) %>%
  select(-c(PctDecid:PctMxFst)) %>%
  left_join(.,FirePerimeters_long_trim) %>%
  filter(year==yearBurn) %>% #Pick out the observations where the watershed burned
  filter(yearBurn>2001) %>%
  filter(year_landcover=="2001")%>%
  filter(perc_total_burn > 50) %>%
  ggplot(aes(x=perc_total_burn, y=perc_forest_loss, fill=PctForest))+
  geom_point(shape=21,size=2.5)+
  scale_fill_continuous_sequential(palette="Terrain 2",
                                   name="NLCD 2001\ntotal forest cover (%)")+
  labs(y="% Forest Loss in the year of the burn",
       x="% Watershed burned")+
  theme_few()


#Look at the sites with over 10% forest loss. Do we see that reflected in the NLCD data?
NLCD_long_trim %>%
  pivot_wider(names_from=type,values_from = perc_landcover) %>%
  mutate(PctForest=PctDecid+PctConif+PctMxFst) %>%
  select(-c(PctDecid:PctMxFst)) %>%
  left_join(.,FirePerimeters_long_trim) %>%
  group_by(nhdplusv2_comid)%>%
  mutate(PctForest_normalized=scale(PctForest),
         year_landcover=as.numeric(as.character(year_landcover))) %>%
  filter(yearBurn>2001) %>%
  filter(perc_forest_loss>50 & perc_total_burn > 50) %>%
  ggplot(aes(x=year_landcover,y=PctForest,group=nhdplusv2_comid)) +
  geom_point(alpha=0.5)+
  geom_line() +
  facet_wrap(~nhdplusv2_comid)+
  geom_vline(aes(xintercept = yearBurn),
             color = "red", size = 0.5) +
  labs(title="All lakes plotted here burned after 2011 and had % forest loss of >50% and area burn >50%",
       subtitle="Yet you'll notice there are quite a few sites with 0% total forest cover. Also, often the % change in forest cover is very small according to NLCD even though the LakeCat sources claims there was a 50% or more loss in forest cover. What to trust?")
