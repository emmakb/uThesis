#Analysis of reefs contained within MPAs and categorization of MPAs= step 3

#Load the necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)

sstcontrol= sea surface temperature raster from 2000-2010  (IPSL- RCP8.5)
sstanalyze= sea surface temperature raster from 2090-2100  (IPSL- RCP8.5)

phcontrol= pH raster from 2000-2010 (IPSL- RCP8.5)
phanalyze= pH raster from 2090-2100 (IPSL- RCP8.5)

mpa_polys4= sf global distribution of marine protected areas (most recent-feb 2022) 
reefs_poly2= sf global distribution of coral reefs (most recent- feb 2022)

#Extract data associated to reefs
reefs_poly2$(x)
x includes various data such as layer name, metadata, parent iso, ISO3, family, genus, species, etc
reefs_poly2$PROTECT includes the level of protection of each reefs according to IUCN category (0, 1, 2)
reefs_poly2$LOC_DEF includes whether they are exposed, aggregated, shallow lagoon etc.
reefs_poly2$Shape_Leng and reefs_poly2$Shape_Area 

#Extract data associated to MPAs
mpa_polys4$(x)
x includes various data such as name, status, no-take, design type, marine, etc
mpa_polys4$IUCN_CAT includes the designation of each one from Ia to VI. 

#Spatial join of reefs + MPAS
mpasandreefs <- st_join(reefs_poly2, mpa_polys4)

# Number of MPAs is the first number
length(mpa_polys4$IUCN_CAT) = 17 400 mpas

#Total area of reefs in MPAS
mpa_polys4$IUCN_CAT shows 1000 reefs by IUCN cat
iucncat <- mpa_polys4$IUCN_CAT
mpasbyiucn<- st_area(mpa_polys4[1:1000,])
units::set_units(mpasbyiucn, km^2)

#Bar plot of total area of reefs in MPAs
ggplot(data=mpasandreefs, aes(x=x,y=y)) +
         geom_bar(stat="identity"))
#ERROR BUT CANT FIND WHAT

# Calculate summed area by IUCN category for all MPAs (in km^2)
mpas_by_cat_area = tapply(mpa_polys4$REP_M_AREA, mpa_polys4$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df3=mpas_by_cat_area[keeps]

# Calculate summed area for reefs by IUCN category (in km^2)
reefs_by_cat_area = tapply(mpasandreefs$GIS_AREA_K, mpasandreefs$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df1=reefs_by_cat_area[keeps]

#Bar plot of total area of summed area of MPAs by IUCN category:
dev.new()
barplot(df3, main="Total area of MPAs by IUCN category",
        xlab="IUCN category", las=0, ylab="Total area (km2)", col="purple", border=NA, ylim=c(0,8000000))

#Bar plot of total area of reefs in MPAs by IUCN category: 
dev.new()
barplot(df1,
        main="Reef area within MPAs (2000-2010)", 
        xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="Lightblue", border= NA, ylim=c(0,300000))

#Reefs within sst + pH thresholds covered by MPAs in 2090-2100 under RCP8.5:
#joining temperature to reefs
mpasandreefs$sst = extract(sstanalyze, mpasandreefs, weights = TRUE, fun = mean)
#joining pH to reefs
mpasandreefs$pH= extract(phanalyze, mpasandreefs, weights= TRUE, fun= mean)

#remove reefs outside temp threshold of 30
ok_corals = mpasandreefs[mpasandreefs$sst < 30,]
#remove reefs outside pH threshold of 7.7
ok_corals = ok_corals[ok_corals$pH > 7.7,]

# Save the two complete spatial files of present and future reef locations
save(mpasandreefs, file = "mpasandreefs.Rdata")
save(ok_corals, file = "c:/users/emmabradshaw/OneDrive - Dalhousie University/mpa and coral data/ok_corals.Rdata")

# Calculate summed area for suitable reefs by IUCN category (in km^2)
reefs_by_cat_area_future = tapply(ok_corals$GIS_AREA_K, ok_corals$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df2=reefs_by_cat_area_future[keeps]

#Bar plot of area of reefs within sst + pH thresholds covered by MPAs in 2090-2100:
dev.new()
barplot(df2,
        main="Reef area within MPAs (2090-2100, RCP8.5)",
        xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="lightblue", border=NA, ylim=c(0,25000))      
