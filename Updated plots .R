#Load necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)
library(ggspatial)

# Plot the sst in 2000-2010, then the land in green: 
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

#Plot reef density around the Caribbean: 
dev.new()
ggplot() +
  geom_sf(data=world, fill= "antiquewhite", color=NA) +
  geom_sf(data=coral_poly, aes(fill="red", size=1)) +
  coord_sf(xlim= c(-75,-55), ylim= c(10,20), expand= FALSE) +
  annotation_north_arrow(location = "br", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Distribution of coral reefs in the Caribbean") 
  
#Plot reef density around the Indo-Pacific: 
dev.new()
ggplot() +
  geom_sf(data=world, fill= "antiquewhite", color=NA) +
  geom_sf(data=coral_poly, aes(fill="red", size=1)) +
  coord_sf(xlim= c(120,135), ylim= c(-15,0), expand= FALSE) +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Distribution of coral reefs in the Indo-Pacific")

#Plot reef density around Australia: 
dev.new()
ggplot() +
  geom_sf(data=world, fill= "antiquewhite", color=NA) +
  geom_sf(data=coral_poly, aes(fill="red", size=1)) +
  coord_sf(xlim= c(150,165), ylim= c(-30,-15), expand= FALSE) +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Distribution of coral reefs around Australia")

#Plot the distribution of MPAs
dev.new()
ggplot()+
  geom_sf(data=world, fill="black", color= NA) +
  geom_sf(data=mpa_polys3, aes(fill="red", size=1)) +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Global distribution of MPAs")