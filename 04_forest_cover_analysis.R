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
  filter(nhdplusv2_comid %in% fire_trend_changes_over5$nhdplusv2_comid) %>%
  full_join(., MTBS_moderate %>%
              mutate(yearBurn = as.numeric(as.character(yearBurn))) %>%
              rename(perc_total_burn=value))


#If we normalize forest cover, do we see changes through time across lakes?

NLCD_long_trim %>%
  pivot_wider(names_from=type,values_from = perc_landcover) %>%
  filter(type %in% c("PctDecid","PctMxFst","PctConif")) %>%
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

#How does dominant landcover look across all burned watersheds?
NLCD_long_trim %>%
  filter(type %in% c("PctShrb","PctGrs","PctConif")) %>%
  group_by(nhdplusv2_comid, type) %>%
  mutate(perc_landcover_median=median(perc_landcover, na.rm=TRUE)) %>%
  ggplot(aes(x=perc_landcover_median)) +
  geom_histogram()+
  facet_wrap(type~year_landcover)

#How does dominant landcover look across burn severity classes??

#First figure out what are the most ABUNDANT land cover types by burn class.
#This will help with narrowing down the variables to make it possible to visualize
#without being too busy. 
top3_NLCD_types_by_burnClassSeverity<-NLCD_long_trim %>%
  full_join(
    ., MTBS_moderate %>% mutate(yearBurn=as.numeric(as.character(yearBurn)))
  ) %>% 
  filter(nhdplusv2_comid %in% colorModtoSevereBurn_trim$nhdplusv2_comid) %>%
  group_by(nhdplusv2_comid)  %>%
  # slice(which.max(value)) %>% # We have duplicate rows of observations and this picks just the year of the burn
  mutate(burnSeverityClass = cut(value, breaks = c(1, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                                 labels = c("1-10%","10-20%","20-30%","30-40%","40-50%","50-60%",
                                            "60-70%","70-80%","80-90%","90-100%"),
                                 ordered_result = TRUE))  %>%
  pivot_wider(names_from=type,values_from = perc_landcover) %>%
  mutate(PctForest=PctDecid+PctConif+PctMxFst) %>% #Add Total forest cover
  select(-c(PctDecid:PctMxFst)) %>%
  pivot_longer(cols=PctOw:PctForest,
               names_to="type",
               values_to="perc_landcover") %>% #Convert to long again with PctForest added in
  group_by(burnSeverityClass, type) %>%
  summarize(median_perc_landcover=median(perc_landcover, na.rm=TRUE)) %>%
  group_by(burnSeverityClass)%>% 
  arrange(desc(median_perc_landcover)) %>%
  # slice(which.max(median_perc_landcover)) #Selects the highest landcover type by group
  slice(1:3)

top3_NLCD_types_by_burnClassSeverity %>%
  mutate(type=factor(type, 
                     levels=c("PctForest","PctGrs","PctOw","PctShrb"),
                     labels=c("% total forest","% grassland","% open water","% shrub/scrub"))) %>%
  ggplot(aes(x=burnSeverityClass,
             y=median_perc_landcover, fill=type))+
  geom_bar(color="black", width=0.5, position = "dodge", stat = "identity")+
  scale_fill_manual(values=c("#283618","#606c38","#34a0a4","#dda15e"),
                    name="Dominant land cover class")+
  labs(y="Median % landcover",
       x="Burn severity class",
       title="Top 3 most abundant land cover types by burn severity class across all NLCD years")+
  theme(legend.position="bottom")


NLCD_ridges<-NLCD_long_trim %>%
  full_join(
  ., MTBS_moderate %>% mutate(yearBurn=as.numeric(as.character(yearBurn)))
) %>% 
  filter(nhdplusv2_comid %in% colorModtoSevereBurn_trim$nhdplusv2_comid) %>%
  group_by(nhdplusv2_comid)  %>%
  mutate(burnSeverityClass = cut(value, breaks = c(1, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                                 labels = c("1-10%","10-20%","20-30%","30-40%","40-50%","50-60%",
                                            "60-70%","70-80%","80-90%","90-100%"),
                                 ordered_result = TRUE))  %>%
  pivot_wider(names_from=type,values_from = perc_landcover) %>%
  mutate(PctForest=PctDecid+PctConif+PctMxFst) %>% #Add Total forest cover
  select(-c(PctDecid:PctMxFst)) %>%
  pivot_longer(cols=PctOw:PctForest,
               names_to="type",
               values_to="perc_landcover") %>% #Convert to long again with PctForest added in
  filter(type %in% c("PctForest","PctGrs","PctOw","PctShrb")) %>%
  mutate(type=factor(type, 
                     levels=c("PctForest","PctGrs","PctOw","PctShrb"),
                     labels=c("% total forest","% grassland","% open water","% shrub/scrub"))) %>%
  group_by(nhdplusv2_comid, burnSeverityClass, type) %>%
  mutate(perc_landcover_median=median(perc_landcover, na.rm=TRUE)) 
  # ggplot(aes(x=perc_landcover_median, color=type, fill=type)) +
  # geom_histogram(bins=60)+
  # scale_color_manual(values=c("#283618","#606c38","#34a0a4","#dda15e"),
  #                   name="Dominant land cover class")+
  # scale_fill_manual(values=c("#283618","#606c38","#34a0a4","#dda15e"),
  #                   name="Dominant land cover class")+
  # facet_grid(type~burnSeverityClass, scales="free_y")


library(ggridges)

ggplot(NLCD_ridges, aes(x = perc_landcover_median, y = burnSeverityClass, group = burnSeverityClass)) +
  geom_density_ridges(
    data = filter(NLCD_ridges, type == "% total forest"),
    scale = 1,
    size = 0.25,
    rel_min_height = 0.05,
    fill = "#283618",
    # alpha = 0.4,
    quantile_lines = TRUE,
    quantiles = 2 #plot the median
  ) +
  geom_density_ridges(
    data = filter(NLCD_ridges, type == "% grassland"),
    scale = 1,
    size = 0.25,
    rel_min_height = 0.05,
    fill = "#606c38",
    # alpha = 0.4,
    quantile_lines = TRUE,
    quantiles = 2 #plot the median
  ) +
  geom_density_ridges(
    data = filter(NLCD_ridges, type == "% open water"),
    scale = 1,
    size = 0.25,
    rel_min_height = 0.05,
    fill = "#34a0a4",
    # alpha = 0.4,
    quantile_lines = TRUE,
    quantiles = 2 #plot the median
  ) +
  geom_density_ridges(
    data = filter(NLCD_ridges, type == "% shrub/scrub"),
    scale = 1,
    size = 0.25,
    rel_min_height = 0.05,
    fill = "#dda15e",
    # alpha = 0.4,
    quantile_lines = TRUE,
    quantiles = 2 #plot the median
  ) +
  theme_few(base_size = 9.5)+
  xlim(range(NLCD_ridges$perc_landcover_median)) + 
  facet_wrap( ~ type,nrow=4,scales="free")+
  theme(plot.margin = unit(c(0.1,0.1,0.1,0.1), "cm"))+
  scale_x_continuous(expand = c(0, 0),
                     breaks = c(seq(0,100,25))) +
  scale_y_discrete(expand = expand_scale(mult = c(0.01, .15)),
                   limits=rev) +
  coord_cartesian(clip = "off") +
  labs(y="% Watershed Burn",
       x="% Land cover")

ggsave("figures/landcover/ridges_by_top3_landcover_types.jpg", width = 2, height = 6, units = 'in', dpi=600)

  # scale_x_continuous(limits = c(470, 590), expand = c(0.01, 0)) +
  # scale_y_reverse(breaks = c(seq(2020, 1984, -6))) 
