sstcontrol= sea surface temperature raster from 2000-2010
sstanalyze= sea surface temperature raster from 2090-2100

phcontrol= pH raster from 2000-2010
phanalyze= pH raster from 2090-2100

mpa_polys3= sf global distribution of marine protected areas (most recent) 
coral_poly= sf global distribution of coral reefs (most recent)

#Extract data associated to reefs
coral_poly$(x)
x includes various data such as layer name, metadata, parent iso, ISO3, family, genus, species, etc
coral_poly$PROTECT includes the level of protection of each reefs according to IUCN category (0, 1, 2)
coral_poly$LOC_DEF includes whether they are exposed, aggregated, shallow lagoon etc.
coral_poly$Shape_Leng and coral_poly$Shape_Area 

#Extract data associated to MPAs
mpa_polys3$(x)
x includes various data such as name, status, no-take, design type, marine, etc
mpa_polys3$IUCN_CAT includes the designation of each one from Ia to VI. 

#Spatial join of reefs + MPAS
mpasandreefs <- st_join(coral_poly, mpa_polys3)

# Number of MPAs is the first number
length(mpa_polys3$IUCN_CAT) = 17054 mpas

#iucncat <- mpa_polys3$IUCN_CAT
#mpasbyiucn<- st_area(mpa_polys3)
#units::set_units(mpasbyiucn, km^2)

# Calculate summed area by IUCN category for all MPAs (in km^2)
mpas_by_cat_area = tapply(mpa_polys3$REP_M_AREA, mpa_polys3$IUCN_CAT, FUN = sum)
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

#Reefs within sst + pH thresholds covered by MPAs in 2090-2100:
#joining temperature to reefs
mpasandreefs$sst = extract(sstanalyze, mpasandreefs, weights = TRUE, fun = mean)
#joining pH to reefs
mpasandreefs$pH= extract(phanalyze, mpasandreefs, weights= TRUE, fun= mean)

#remove reefs outside temp threshold of 30
ok_corals = mpasandreefs[mpasandreefs$sst < 30,]
#remove reefs outside pH threshold of 7.6
ok_corals = ok_corals[ok_corals$pH > 7.6,]

# Save the two complete spatial files of present and future reef locations
save(mpasandreefs, file = "c:/users/derekt/OneDrive - Dalhousie University/mpa and coral data/mpasandreefs.Rdata")
save(ok_corals, file = "c:/users/derekt/OneDrive - Dalhousie University/mpa and coral data/ok_corals.Rdata")

# Calculate summed area for suitable reefs by IUCN category (in km^2)
reefs_by_cat_area_future = tapply(ok_corals$GIS_AREA_K, ok_corals$IUCN_CAT, FUN = sum)
keeps <- c("Ia","Ib","II","III","IV","V","VI")
df2=reefs_by_cat_area_future[keeps]

#Bar plot of area of reefs within sst + pH thresholds covered by MPAs in 2090-2100:
dev.new()
barplot(df2,
        main="Reef area within MPAs (2090-2100)",
xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="lightblue", border=NA, ylim=c(0,25000))






