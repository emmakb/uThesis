#GFDL analysis of reefs contained within suitable MPA habitat in the future

#names for reference
sstcontrolgfdl= sea surface temperature raster from 2000-2010  (GFDL)
sstanalyzegfdl85= sea surface temperature raster from 2090-2100  (GFDL- RCP8.5)
sstanalyzegfdl37= sea surface temperature raster from 2090-2100 (GFDL-RCP3.7)
sstanalyzegfdl26= sea surface temperature raster from 2090-2100 (GFDL-RCP2.6)

phcontrolgfdl= pH raster from 2000-2010
phanalyzegfdl85= pH raster from 2090-2100 (IPSL- RCP8.5)
phanalyzegfdl37= pH raster from 2090-2100 (IPSL-RCP3.7)
phanalyzegfdl26= pH raster from 2090-2100 (IPSL-RCP2.6)

#Load the necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)

#Load required SST GFDL data
sstanalyzegfdl26 <- read(sstanalyzegfdl26.grd)
sstanalyzegfdl37 <-read(sstanalyzegfdl37.grd)
sstanalyzegfdl85 <-read(sstanalyzegfdl85.grd)

#Load required pH GFDL data
phanalyzegfdl26 <-read(phanalyzegfdl26.grd)
phanalyzegfdl37 <-read(phanalyzegfdl37.grd)
phanalyzegfdl85 <-read(phanalyzegfdl85.grd)

#Load required mpa and reef data
mpaandreefdata <-read(mpasandreefs.Rdata)

#Reefs within sst + pH thresholds covered by MPAs in 2090-2100 under RCP8.5:
#joining temperature to reefs
mpasandreefs$sst = extract(sstanalyzegfdl85, mpasandreefs, weights = TRUE, fun = mean)
#joining pH to reefs
mpasandreefs$pH= extract(phanalyzegfdl85, mpasandreefs, weights= TRUE, fun= mean)

#remove reefs outside temp threshold of 30
ok_coralsg85 = mpasandreefs[mpasandreefs$sst < 30,]
#remove reefs outside pH threshold of 7.7
ok_coralsg85 = ok_coralsg85[ok_coralsg85$pH > 7.7,]

# Calculate summed area for suitable reefs by IUCN category (in km^2)
reefs_by_cat_area_futureg85 = tapply(ok_coralsg85$GIS_AREA_K, ok_coralsg85$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df7=reefs_by_cat_area_futureg85[keeps]

# Save complete spatial files of future reef locations
save(ok_coralsg85, file = "ok_coralsg85.Rdata")
save(df7, file="df7.Rdata")

#Reefs within sst + pH thresholds covered by MPAs in 2090-2100 under RCP3.7:
#joining temperature to reefs
mpasandreefs$sst = extract(sstanalyzegfdl37, mpasandreefs, weights = TRUE, fun = mean)
#joining pH to reefs
mpasandreefs$pH= extract(phanalyzegfdl37, mpasandreefs, weights= TRUE, fun= mean)

#remove reefs outside temp threshold of 30
ok_coralsg37 = mpasandreefs[mpasandreefs$sst < 30,]
#remove reefs outside pH threshold of 7.7
ok_coralsg37 = ok_coralsg37[ok_coralsg37$pH > 7.7,]

# Calculate summed area for suitable reefs by IUCN category (in km^2)
reefs_by_cat_area_futureg37 = tapply(ok_coralsg37$GIS_AREA_K, ok_coralsg37$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df8=reefs_by_cat_area_futureg37[keeps]

# Save complete spatial files of future reef locations
save(ok_coralsg37, file = "ok_coralsg37.Rdata")
save(df8, file="df8.Rdata")

#Reefs within sst + pH thresholds covered by MPAs in 2090-2100:
#joining temperature to reefs
mpasandreefs$sst = extract(sstanalyzegfdl26, mpasandreefs, weights = TRUE, fun = mean)
#joining pH to reefs
mpasandreefs$pH= extract(phanalyzegfdl26, mpasandreefs, weights= TRUE, fun= mean)

#remove reefs outside temp threshold of 30
ok_coralsg26 = mpasandreefs[mpasandreefs$sst < 30,]
#remove reefs outside pH threshold of 7.7
ok_coralsg26 = ok_coralsg26[ok_coralsg26$pH > 7.7,]

# Calculate summed area for suitable reefs by IUCN category (in km^2)
reefs_by_cat_area_futureg26 = tapply(ok_coralsg26$GIS_AREA_K, ok_coralsg26$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df9=reefs_by_cat_area_futureg26[keeps]

# Save complete spatial files of future reef locations
save(ok_corals26, file = "ok_corals26.Rdata")
save(df9, file="df6.Rdata")

#Save final mpa data
save(mpasandreefs, file="mpasandreefsgfdl")