#Analysis of reefs contained within MPAs in the present

#Load the necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)

sstcontrol= sea surface temperature raster from 2000-2010
sstanalyze= sea surface temperature raster from 2090-2100

phcontrol= pH raster from 2000-2010
phanalyze= pH raster from 2090-2100

mpa_polys4= sf global distribution of marine protected areas (most recent) 
reefs_poly2= sf global distribution of coral reefs (most recent)

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
length(mpa_polys4$IUCN_CAT) = 17 300 mpas

#Total area of reefs in MPAS
mpa_polys4$IUCN_CAT shows 1000 reefs by IUCN cat
iucncat <- mpa_polys4$IUCN_CAT
mpasbyiucn<- st_area(mpa_polys4[1:1000,])
units::set_units(mpasbyiucn, km^2)

#Bar plot of total area of reefs in MPAs
ggplot(mpasandreefs, aes(x=,y=) +
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
       
       

