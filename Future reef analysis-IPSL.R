#IPSL analysis of reefs contained within suitable MPA habitat in the future

#names for reference
sstcontrol= sea surface temperature raster from 2000-2010  (IPSL- RCP8.5)
sstanalyze= sea surface temperature raster from 2090-2100  (IPSL- RCP8.5)
sstanalyze37= sea surface temperature raster from 2090-2100 (IPSL-RCP3.7)
sstanalyze26= sea surface temperature raster from 2090-2100 (IPSL-RCP2.6)

phcontrol= pH raster from 2000-2010 (IPSL- RCP8.5)
phanalyze= pH raster from 2090-2100 (IPSL- RCP8.5)
phanalyze37= pH raster from 2090-2100 (IPSL-RCP3.7)
phanalyze26= pH raster from 2090-2100 (IPSL-RCP2.6)

#Load the necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)
remove(list = ls())

#Load required SST GFDL data from Dropbox
sstanalyze26 <- read(sstanalyze26.grd)
sstanalyze37 <-read(sstanalyze37.grd)
sstanalyze85 <-read(sstanalyze85.grd)

#Load required pH GFDL data
phanalyze26 <-read(phanalyze26.grd)
phanalyze37 <-read(phanalyze37.grd)
phanalyze85 <-read(phanalyze85.grd)

#Load required mpa and reef data
mpaandreefdata <-read(mpasandreefs.Rdata)

#Reefs within sst + pH thresholds covered by MPAs in 2090-2100 under RCP8.5:
#joining temperature to reefs
mpasandreefs$sst = extract(sstanalyze, mpasandreefs, weights = TRUE, fun = mean)
#joining pH to reefs
mpasandreefs$pH= extract(phanalyze, mpasandreefs, weights= TRUE, fun= mean)

#remove reefs outside temp threshold of 30
ok_corals85 = mpasandreefs[mpasandreefs$sst < 30,]
#remove reefs outside pH threshold of 7.7
ok_corals85 = ok_corals85[ok_corals85$pH > 7.7,]

# Calculate summed area for suitable reefs by IUCN category (in km^2)
reefs_by_cat_area_future85 = tapply(ok_corals85$GIS_AREA_K, ok_corals85$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df4=reefs_by_cat_area_future85[keeps]

# Save complete spatial files of future reef locations
save(ok_corals85, file = "ok_corals85.Rdata")
save(df4, file="df4.Rdata")

#Reefs within sst + pH thresholds covered by MPAs in 2090-2100 under RCP3.7:
#joining temperature to reefs
mpasandreefs$sst = extract(sstanalyze37, mpasandreefs, weights = TRUE, fun = mean)
#joining pH to reefs
mpasandreefs$pH= extract(phanalyze37, mpasandreefs, weights= TRUE, fun= mean)

#remove reefs outside temp threshold of 30
ok_corals37 = mpasandreefs[mpasandreefs$sst < 30,]
#remove reefs outside pH threshold of 7.7
ok_corals37 = ok_corals37[ok_corals37$pH > 7.7,]

# Calculate summed area for suitable reefs by IUCN category (in km^2)
reefs_by_cat_area_future37 = tapply(ok_corals37$GIS_AREA_K, ok_corals37$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df5=reefs_by_cat_area_future37[keeps]

# Save complete spatial files of future reef locations
save(ok_corals37, file = "ok_corals37.Rdata")
save(df5, file="df5.Rdata")

#Reefs within sst + pH thresholds covered by MPAs in 2090-2100:
#joining temperature to reefs
mpasandreefs$sst = extract(sstanalyze26, mpasandreefs, weights = TRUE, fun = mean)
#joining pH to reefs
mpasandreefs$pH= extract(phanalyze26, mpasandreefs, weights= TRUE, fun= mean)

#remove reefs outside temp threshold of 30
ok_corals26 = mpasandreefs[mpasandreefs$sst < 30,]
#remove reefs outside pH threshold of 7.7
ok_corals26 = ok_corals26[ok_corals26$pH > 7.7,]

# Calculate summed area for suitable reefs by IUCN category (in km^2)
reefs_by_cat_area_future26 = tapply(ok_corals26$GIS_AREA_K, ok_corals26$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df6=reefs_by_cat_area_future26[keeps]

# Save complete spatial files of future reef locations
save(ok_corals26, file = "ok_corals26.Rdata")
save(df6, file="df6.Rdata")
