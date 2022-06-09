#Re-plotting SST + pH around the world in 2000-2100 GFDL= step 5

#Load necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)
library(ggspatial)

#Terms
sstcontrolgfdl= sea surface temperature raster from 2000-2010 under GFDL
sstanalyzegfdl85= sea surface temperature raster from 2090-2100 under GFDL, RCP8.5
sstanalyzegfdl37= sea surface temperature raster from 2090-2100 under GFLD, RCP3.7
sstanalyzegfdl26= sea surface temperature raster from 2090-2100 under GFDL, RCP2.6

phcontrolgfdl= ph raster from 2000-2010 under GFDL
phanalyzegfdl85= ph raster from 2090-2100 under GFDL, RCP8.5
phanalyzegfdl37= ph raster from 2090-2100 under GFDL, RCP3.7
phanalyzegfdl26= ph raster from 2090-2100 under GFDL, RCP2.6

#Create histograms and compare histogram values to those determined under IPSL
#SST
#Histogram of sst and reef distribution (2000-2010), GFDL
gfdltwothousandtempsandreefs <- unlist(extract(x=sstcontrolgfdl, y=reefs_poly2, small=TRUE))
histogramdata_9 <- hist(gfdltwothousandtempsandreefs, 
                        main="Reef density by sea surface temperature, 2000-2010 under ESM GFDL-ESM4",
                        xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of sst and reef distribution (2090-2100, GFDL, RCP8.5))
gfdltempsandreefs85 <- unlist(extract(x=sstanalyzegfdl85, y=reefs_poly2, small=TRUE))
histogramdata_10 <- hist(gfdltempsandreefs85, 
                        main="Reef density by sea surface temperature, 2090-2100, GFDL- RCP8.5",
                        xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of sst and reef distribution (2090-2100, GFDL, RCP3.7))
gfdltempsandreefs37 <- unlist(extract(x=sstanalyzegfdl37, y=reefs_poly2, small=TRUE))
histogramdata_11 <- hist(gfdltempsandreefs37, 
                         main="Reef density by sea surface temperature, 2090-2100, GFDL- RCP3.7",
                         xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of sst and reef distribution (2090-2100, GFDL, RCP2.6))
gfdltempsandreefs26 <- unlist(extract(x=sstanalyzegfdl26, y=reefs_poly2, small=TRUE))
histogramdata_12 <- hist(gfdltempsandreefs26, 
                         main="Reef density by sea surface temperature, 2090-2100, GFDL- RCP2.6",
                         xlab="Temperature in degrees Celsius",xlim=c(25,35),ylim= c(0,0.5), col="lightgrey",freq=FALSE)

#pH
#Histogram of pH and reef distribution (2000-2010), GFDL
gfdltwothousandPHandreefs <- unlist(extract(x=phcontrolgfdl, y=reefs_poly2, small=TRUE))
histogramdata_13 <- hist(gfdltwothousandPHandreefs, 
                        main="Reef density by pH, 2000-2010 under ESM GFDL-ESM4",
                        xlab="Surface ocean pH",xlim=c(7.5,8.0),ylim = c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of pH and reef distribution (2090-2100, IPSL, RCP8.5))
gfdlPHandreefs85 <- unlist(extract(x=phanalyzegfdl85, y=reefs_poly2, small=TRUE))
histogramdata_14 <- hist(gfdlPHandreefs85, 
                        main="Reef density by pH, 2090-2100, GFDL- RCP8.5",
                        xlab="Surface ocean pH ",xlim=c(7.5,8.0),ylim = c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of pH and reef distribution (2090-2100, IPSL, RCP8.5))
gfdlPHandreefs37 <- unlist(extract(x=phanalyzegfdl37, y=reefs_poly2, small=TRUE))
histogramdata_15 <- hist(gfdlPHandreefs37, 
                        main="Reef density by pH, 2090-2100, GFDL- RCP3.7",
                        xlab="Surface ocean pH ",xlim=c(7.5,8.0),ylim = c(0,0.5), col="lightgrey",freq=FALSE)

#Histogram of pH and reef distribution (2090-2100, IPSL, RCP8.5))
gfdlPHandreefs26 <- unlist(extract(x=phanalyzegfdl26, y=reefs_poly2, small=TRUE))
histogramdata_16 <- hist(gfdlPHandreefs26, 
                        main="Reef density by pH, 2090-2100, GFDL- RCP2.6",
                        xlab="Surface ocean pH ",xlim=c(7.5,8.0),ylim = c(0,0.5), col="lightgrey",freq=FALSE)
