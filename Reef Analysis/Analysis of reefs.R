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

#Total area of reefs in MPAS
mpa_polys3$IUCN_CAT shows 1000 reefs by IUCN cat
iucncat <- mpa_polys3$IUCN_CAT
mpasbyiucn<- st_area(mpa_polys3[1:1000,])
units::set_units(mpasbyiucn, km^2)

#Bar plot of total area of reefs in MPAs
ggplot(mpasandreefs, aes(x=, y=) +
  geom_bar(stat="identity")

#Reefs within thresholds covered by MPAs in 2090-2100: 


