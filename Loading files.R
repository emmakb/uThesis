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

#Loading pH rasters, under IPSL for scenaio RCP2.6 and RCP3.7
#Since all RCP scenarios project for 2100, they are given the name "analyze"
phanalyze26 <- raster("ph_raster_ipsl_2090s_RCP26")
phanalyze37 <- raster("ph_raster_ipsl_2090s_RCP37")

phanalyze26_pts <- rasterToPoints(phanalyze26, spatial = TRUE)
phanalyze26_df <- data.frame(phanalyze26_pts)
names(phanalyze26_df)[1] = "phanalyze26"

phanalyze37_pts <- rasterToPoints(phanalyze37, spatial = TRUE)
phanalyze37_df <- data.frame(phanalyze37_pts)
names(phanalyze37_df)[1] = "phanalyze37"

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

#Loading sst rasters, under IPSL for RCP2.6 and RCP 3.7
sstanalyze26 <-raster("sst_raster_ipsl_2090s_RCP26")
sstanalyze37 <-raster("sst_raster_ipsl_2090s_RCP37")

sstanalyze26_pts <- rasterToPoints(sstanalyze26, spatial = TRUE)
sstanalyze26_df <- data.frame(sstanalyze26_pts)
names(sstanalyze26_df)[1] = "sstanalyze26"

sstanalyze37_pts <- rasterToPoints(sstanalyze37, spatial = TRUE)
sstanalyze37_df <- data.frame(sstanalyze37_pts)
names(sstanalyze37_df)[1] = "sstanalyze37"

#Load the ph rasters for RCP2.6,3.7 and 8.5 under GFDL
#Anything with control is considered 2000-2010
#Anything with analyze is considered 2090-2100

phcontrolgfdl <-raster("ph_raster_gfdl_2000s")
phanalyzegfdl85 <-raster("ph_raster_gfdl_2090s_RCP85")
phanalyzegfdl37 <-raster("ph_raster_gfdl_2090s_RCP37")
phanalyzegfdl26 <-raster("ph_raster_gfdl_2090s_RCP26")

phcontrolgfdl_pts <- rasterToPoints(phcontrolgfdl, spatial = TRUE)
phcontrolgfdl_df <- data.frame(phcontrolgfdl_pts)
names(phcontrolgfdl_df)[1] = "phcontrolgfdl"

phanalyzegfdl85_pts <- rasterToPoints(phanalyzegfdl85, spatial = TRUE)
phanalyzegfdl85_df <- data.frame(phanalyzegfdl85_pts)
names(phanalyzegfdl85_df)[1] = "phanalyzegfdl85"

phanalyzegfdl37_pts <- rasterToPoints(phanalyzegfdl37, spatial = TRUE)
phanalyzegfdl37_df <- data.frame(phanalyzegfdl37_pts)
names(phanalyzegfdl37_df)[1] = "phanalyzegfdl37"

phanalyzegfdl26_pts <- rasterToPoints(phanalyzegfdl26, spatial = TRUE)
phanalyzegfdl26_df <- data.frame(phanalyzegfdl26_pts)
names(phanalyzegfdl26_df)[1] = "phanalyzegfdl26"

#Load the SST rasters for RCP2.6,3.7 and 8.5 under GFDL
#Anything with control is considered 2000-2010
#Anything with analyze is considered 2090-2100

sstcontrolgfdl <-raster("sst_raster_gfdl_2000s")
sstanalyzegfdl85 <-raster("sst_raster_gfdl_2090s_RCP85")
sstanalyzegfdl37 <-raster("sst_raster_gfdl_2090s_RCP37")
sstanalyzegfdl26 <-raster("sst_raster_gfdl_2090s_RCP26")

sstcontrolgfdl_pts <- rasterToPoints(sstcontrolgfdl, spatial = TRUE)
sstcontrolgfdl_df <- data.frame(sstcontrolgfdl_pts)
names(sstcontrolgfdl_df)[1] = "sstcontrolgfdl"

sstanalyzegfdl85_pts <- rasterToPoints(sstanalyzegfdl85, spatial = TRUE)
sstanalyzegfdl85_df <- data.frame(sstanalyzegfdl85_pts)
names(sstanalyzegfdl85_df)[1] = "sstanalyzegfdl85"

sstanalyzegfdl37_pts <- rasterToPoints(sstanalyzegfdl37, spatial = TRUE)
sstanalyzegfdl37_df <- data.frame(sstanalyzegfdl37_pts)
names(sstanalyzegfdl37_df)[1] = "sstanalyzegfdl37"

sstanalyzegfdl26_pts <- rasterToPoints(sstanalyzegfdl26, spatial = TRUE)
sstanalyzegfdl26_df <- data.frame(sstanalyzegfdl26_pts)
names(sstanalyzegfdl26_df)[1] = "sstanalyzegfdl26"

#Load the MPA data
#Data is divided into three separate shape files. mpa_polys = shapefile 0, mpa_polys1= shapefile 1, mpa_polys3= shapefile 2
mpa_polys <- st_read("WDPA_WDOECM_Feb2022_Public_marine_shp-polygons.shp")
mpa_polys1 <- st_read("WDPA_WDOECM_Feb2022_Public_marine_shp-polygons.shp")
mpa_polys2 <- st_read("WDPA_WDOECM_Feb2022_Public_marine_shp-polygons.shp")

#Combine MPA data into one major shapefile
#mpa_poly3 will be the join of mpa_polys0 + 1, and mpa_polys4 will be the join of mpa_polys3 + mpa_polys2
#mpa_polys4 = ALL THE MPA DATA, DATA TO BE USED FOR REST OF ANALYSIS
mpa_polys4= rbind(mpa_polys, mpa_polys1, mpa_polys2)
