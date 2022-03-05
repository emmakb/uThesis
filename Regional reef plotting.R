#Load necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)
library(ggspatial)

#Plot reef density around the Caribbean: 
dev.new()
ggplot() +
  geom_sf(data=world, fill= "antiquewhite", color=NA) +
  geom_sf(data=coral_poly, aes(fill="red", size=1)) +
  coord_sf(xlim= c(-75,-55), ylim= c(10,20), expand= FALSE) +
  annotation_scale(location = "br", width_hint = 0.5) +
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
  annotation_scale(location = "br", width_hint = 0.5) +
  annotation_north_arrow(location = "br", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Distribution of coral reefs in the Indo-Pacific")

#Plot reef density around Australia: 
dev.new()
ggplot() +
  geom_sf(data=world, fill= "antiquewhite", color=NA) +
  geom_sf(data=coral_poly, aes(fill="red", size=1)) +
  coord_sf(xlim= c(150,165), ylim= c(-30,-15), expand= FALSE) +
  annotation_scale(location = "br", width_hint = 0.5) +
  annotation_north_arrow(location = "br", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Distribution of coral reefs around Australia")

#Plotting the global distribution of MPAs
dev.new()
ggplot() +
  geom_sf(data=world, fill="black", color=NA) +
  geom_sf(mpa_polys3, aes(fill="red", size=1)) +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Distribution of MPAs (February 2021")
  