#Re-plotting SST + pH around the world in 2000-2100= step 2

#Load necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)
library(ggspatial)

sstcontrol= sea surface temperature raster from 2000-2010
sstanalyze= sea surface temperature raster from 2090-2100

phcontrol= pH raster from 2000-2010
phanalyze= pH raster from 2090-2100

mpa_polys2= sf global distribution of marine protected areas (most recent) 
reefs_poly2= sf global distribution of coral reefs (most recent)


#Plotting SST in 2000-2010, then the land in green: 
dev.new()
ggplot() +
  geom_raster(data = sstcontrol_df, aes(x=x, y = y, fill = sstcontrol)) + 
  scale_fill_viridis_c(option="plasma", trans = "sqrt") + 
  geom_sf(data = world, fill = "darkgreen", color = NA) + 
  xlab("Longitude") + ylab("Latitude") +
  # Need to fiddle with raster CRS to get the below working
  #coord_sf(crs = "+proj=cea +ellps=WGS84 +units=m +no_defs ") +
  ggtitle("SST (2000-2010)")

# Plot the sst in 2090-2100, then the land in green:
dev.new()
ggplot() +
  geom_raster(data = sstanalyze_df, aes(x=x, y = y, fill = sstanalyze)) + 
  scale_fill_viridis_c(option="plasma", trans = "sqrt") + 
  geom_sf(data = world, fill = "darkgreen", color = NA) + 
  xlab("Longitude") + ylab("Latitude") +
  # Need to fiddle with raster CRS to get the below working
  #coord_sf(crs = "+proj=cea +ellps=WGS84 +units=m +no_defs ") + 
  ggtitle("SST (2090-2100)")

# Plot the pH in 2000-2010, then the land in green:
dev.new()
ggplot() +
  geom_raster(data = phcontrol_df, aes(x=x, y = y, fill = phcontrol)) + 
  scale_fill_viridis_c(option="plasma", trans = "sqrt") + 
  geom_sf(data = world, fill = "darkgreen", color = NA) + 
  xlab("Longitude") + ylab("Latitude") +
  # Need to fiddle with raster CRS to get the below working
  #coord_sf(crs = "+proj=cea +ellps=WGS84 +units=m +no_defs ") + 
  ggtitle("pH (2000-2010)")

# Plot the pH in 2090-2100, then the land in green,  then add the MPAs
dev.new()
ggplot() +
  geom_raster(data = phanalyze_df, aes(x=x, y = y, fill = phanalyze)) + 
  scale_fill_viridis_c(option="plasma", trans = "sqrt") + 
  geom_sf(data = world, fill = "darkgreen", color = NA) + 
  xlab("Longitude") + ylab("Latitude") +
  # Need to fiddle with raster CRS to get the below working
  #coord_sf(crs = "+proj=cea +ellps=WGS84 +units=m +no_defs ") + 
  ggtitle("pH (2090-2100)")

#Histogram of sst and reef distribution (2000-2010)
twothousandtempsandreefs <- unlist(extract(x=sstcontrol, y=reefs_poly2, small=TRUE))
dev.new()
hist(twothousandtempsandreefs, 
     main="Reef density by sea surface temperature, 2000-2010",
     xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of sst and reef distribution (2090-2100)
endofcenturytempsandreefs <- unlist(extract(x=sstanalyze, y=reefs_poly2, small=TRUE))
dev.new()
hist(endofcenturytempsandreefs, 
     main="Reef density by sea surface temperature, 2090-2100",
     xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of pH and reef distribution (2000-2010)
twothousandPHandreefs <- unlist(extract(x=phcontrol, y=reefs_poly2, small=TRUE))
dev.new()
hist(twothousandPHandreefs, 
     main="Reef density by pH, 2000-2010",
     xlab="Surface ocean pH",xlim=c(7.5,8.0),ylim = c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of pH and reef distribution (2090-2100)
endofcenturyPHandreefs <- unlist(extract(x=phanalyze, y=reefs_poly2, small=TRUE))
dev.new()
hist(endofcenturyPHandreefs, 
     main="Reef density by pH, 2090-2100",
     xlab="Surface ocean pH ",xlim=c(7.5,8.0),ylim = c(0,0.5), col="lightgrey",freq=FALSE)