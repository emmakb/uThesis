#Re-plotting SST + pH around the world in 2000-2100 IPSL= step 2

#Load necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)
library(ggspatial)

sstcontrol= sea surface temperature raster from 2000-2010 under IPSL
sstanalyze= sea surface temperature raster from 2090-2100 under IPSL, RCP8.5
sstanalyze26= sea surface temperature raster from 2090-2100 under IPSL, RCP2.6
sstanalyze37= sea surface temperature raster from 2090-2100 under IPSL, RCP3.7

phcontrol= pH raster from 2000-2010 under IPSL
phanalyze= pH raster from 2090-2100 under IPSL, RCP8.5
phanalyze26= ph raster from 2090-2100 under IPSL, RCP2.6
phanalyze37= ph raster from 2090-2100 under IPSL, RCP3.7

#Plotting SST in 2000-2010, then the land in green: 
dev.new()
ggplot() +
  geom_raster(data = sstcontrol_df, aes(x=x, y = y, fill=sstcontrol)) + 
  scale_fill_viridis_c(option="plasma", trans = "sqrt", limits=c(10,35), name="SST") + 
  geom_sf(data = world, fill = "darkgreen", color = NA) + 
  xlab("Longitude") + ylab("Latitude") +
  # Need to fiddle with raster CRS to get the below working
  #coord_sf(crs = "+proj=cea +ellps=WGS84 +units=m +no_defs ") +
  ggtitle("SST (2000-2010)")

# Plot the sst in 2090-2100 (IPSL, RCP8.5), then the land in green:
dev.new()
ggplot() +
  geom_raster(data = sstanalyze_df, aes(x=x, y= y, fill=sstanalyze)) + 
  scale_fill_viridis_c(option="plasma", trans = "sqrt", limits=c(10,35), name="SST") + 
  geom_sf(data = world, fill = "darkgreen", color = NA) + 
  xlab("Longitude") + ylab("Latitude") +
  # Need to fiddle with raster CRS to get the below working
  #coord_sf(crs = "+proj=cea +ellps=WGS84 +units=m +no_defs ") +
  ggtitle("SST (2090-2100)")
  
# Plot the pH in 2000-2010, then the land in green:
dev.new()
ggplot() +
  geom_raster(data = phcontrol_df, aes(x=x, y = y, fill = phcontrol)) + 
  scale_fill_viridis_c(option="plasma", trans = "sqrt", aes(fill="pH")) + 
  geom_sf(data = world, fill = "darkgreen", color = NA) + 
  xlab("Longitude") + ylab("Latitude") +
  # Need to fiddle with raster CRS to get the below working
  #coord_sf(crs = "+proj=cea +ellps=WGS84 +units=m +no_defs ") + 
  ggtitle("pH (2000-2010)")

# Plot the pH in 2090-2100 (IPSL, RCP8.5), then the land in green, then add the MPAs
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
histogramdata_1 <- hist(twothousandtempsandreefs, 
     main="Reef density by SST- 2000-2010",
     xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="orange",freq=FALSE)

#Histogram of sst and reef distribution (2090-2100, IPSL, RCP8.5))
endofcenturytempsandreefs85 <- unlist(extract(x=sstanalyze, y=reefs_poly2, small=TRUE))
histogramdata_2 <- hist(endofcenturytempsandreefs85, 
     main="Reef density by SST- 2090-2100, 
     RCP8.5",
     xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="orange",freq=FALSE)

#Histogram of sst and reef distribution (2090-2100, IPSL, RCP3.7))
endofcenturytempsandreefs37 <- unlist(extract(x=sstanalyze37, y=reefs_poly2, small=TRUE))
histogramdata_3 <- hist(endofcenturytempsandreefs37, 
     main="Reef density by SST- 2090-2100,
     RCP7.0",
     xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="orange",freq=FALSE)

#Histogram of sst and reef distribution (2090-2100, IPSL, RCP2.6))
endofcenturytempsandreefs26 <- unlist(extract(x=sstanalyze26, y=reefs_poly2, small=TRUE))
histogramdata_4 <- hist(endofcenturytempsandreefs26, 
     main="Reef density by SST- 2090-2100
     RCP2.6",
     xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="orange",freq=FALSE)

#Histogram of pH and reef distribution (2000-2010)
twothousandPHandreefs <- unlist(extract(x=phcontrol, y=reefs_poly2, small=TRUE))
histogramdata_5 <- hist(twothousandPHandreefs, 
     main="Reef density by pH- 2000-2010",
     xlab="Surface ocean pH",xlim=c(7.5,8.0),ylim = c(0,0.5), col="lightblue",freq=FALSE)

#Histogram of pH and reef distribution (2090-2100, IPSL, RCP8.5))
endofcenturyPHandreefs85 <- unlist(extract(x=phanalyze, y=reefs_poly2, small=TRUE))
histogramdata_6 <- hist(endofcenturyPHandreefs85, 
     main="Reef density by pH- 2090-2100, 
     RCP8.5",
     xlab="Surface ocean pH",xlim=c(7.5,8.0),ylim = c(0,0.5), col="lightblue",freq=FALSE)

#Histogram of pH and reef distribution (2090-2100, IPSL, RCP3.7))
endofcenturyPHandreefs37 <- unlist(extract(x=phanalyze37, y=reefs_poly2, small=TRUE))
histogramdata_7 <- hist(endofcenturyPHandreefs37, 
     main="Reef density by pH- 2090-2100,
     RCP7.0",
     xlab="Surface ocean pH ",xlim=c(7.5,8.0),ylim = c(0,0.6), col="lightblue",freq=FALSE)

#Histogram of pH and reef distribution (2090-2100, IPSL, RCP8.5))
endofcenturyPHandreefs26 <- unlist(extract(x=phanalyze26, y=reefs_poly2, small=TRUE))
histogramdata_8 <- hist(endofcenturyPHandreefs26, 
     main="Reef density by pH- 2090-2100, 
     RCP2.6",
     xlab="Surface ocean pH ",xlim=c(7.5,8.0),ylim = c(0,0.50), col="lightblue",freq=FALSE)