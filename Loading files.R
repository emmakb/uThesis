#Loading the files = step 1

#Load the necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)

#Download the country data
world <- ne_countries(scale = "medium", returnclass = "sf")

# Check the coordinate reference system. It's currently WGS 1984 but a non equal-area projection
st_crs(world)

# Load the reef data
reefs_poly2 <- st_read("globalreefs2/coralreefs2/WCMC008_CoralReef2018_Py_v4_1.shp")

#Loading pH rasters (original pH values used in thesis, under IPSL + RCP8.5)
#Anything with control is considered 2000-2010
#Anything with analyze is considered 2090-2100
phcontrol <- raster("/Users/emmabradshaw/Desktop/Thesis/Datasets/R-Spatial/ph/ph_raster2000_2010")
phanalyze <- raster("/Users/emmabradshaw/Desktop/Thesis/Datasets/R-Spatial/ph/ph_raster2090_2100")

phcontrol_pts <- rasterToPoints(phcontrol, spatial = TRUE)
phcontrol_df <- data.frame(phcontrol_pts)
names(phcontrol_df)[1] = "phcontrol"

phanalyze_pts <- rasterToPoints(phanalyze, spatial = TRUE)
phanalyze_df <- data.frame(phanalyze_pts)
names(phanalyze_df)[1] = "phanalyze"

#loading sst rasters (original SST values used in thesis, under IPSL + RCP8.5)
#Anything with control is considered 2000-2010
#Anything with analyze is considered 2090-2100
sstcontrol <- raster("/Users/emmabradshaw/Desktop/Thesis/Datasets/R-Spatial/sst/sst_raster2000_2010")
sstanalyze <- raster("/Users/emmabradshaw/Desktop/Thesis/Datasets/R-Spatial/sst/sst_raster2090_2100")

sstcontrol_pts <- rasterToPoints(sstcontrol, spatial = TRUE)
sstcontrol_df <- data.frame(sstcontrol_pts)
names(sstcontrol_df)[1] = "sstcontrol"

sstanalyze_pts <- rasterToPoints(sstanalyze, spatial = TRUE)
sstanalyze_df <- data.frame(sstanalyze_pts)
names(sstanalyze_df)[1] = "sstanalyze"

#Load the MPA data
#Data is divided into three separate shape files. mpa_polys = shapefile 0, mpa_polys1= shapefile 1, mpa_polys3= shapefile 2
mpa_polys <- st_read("WDPA_WDOECM_Feb2022_Public_marine_shp-polygons.shp")
mpa_polys1 <- st_read("WDPA_WDOECM_Feb2022_Public_marine_shp-polygons.shp")
mpa_polys2 <- st_read("WDPA_WDOECM_Feb2022_Public_marine_shp-polygons.shp")

#Combine MPA data into one major shapefile
#mpa_poly3 will be the join of mpa_polys0 + 1, and mpa_polys4 will be the join of mpa_polys3 + mpa_polys2
#mpa_polys4 = ALL THE MPA DATA, DATA TO BE USED FOR REST OF ANALYSIS
mpa_polys3 <- st_join(mpa_polys, mpa_polys1)
mpa_polys4 <- st_join(mpa_polys3, mpa_polys2)

