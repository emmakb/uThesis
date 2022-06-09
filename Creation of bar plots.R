#Load necessary packages
library(ggplot2)
library(sf)
library(rnaturalearth)
library(raster)

#Create bar plot of future reef locations in IPSL(8.5)
dev.new()
barplot(df4,
        main="Reef area within MPAs (2090-2100, RCP8.5)",
        xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="lightblue", border=NA, ylim=c(0,25000))
#Create bar plot of future reef locations in IPSL(3.7)
dev.new()
barplot(df5,
        main="Reef area within MPAs (2090-2100, RCP3.7)",
        xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="lightblue", border=NA, ylim=c(0,25000))

#Create bar plot of future reef locations in IPSL(2.6)
#Bar plot of area of reefs within sst + pH thresholds covered by MPAs in 2090-2100:
dev.new()
barplot(df6,
        main="Reef area within MPAs (2090-2100, RCP2.6)",
        xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="lightblue", border=NA, ylim=c(0,25000))  

#Create bar plot of future reef locations in GFDL(8.5)
dev.new()
barplot(df7,
        main="Reef area within MPAs (2090-2100, GFDL, RCP8.5)",
        xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="lightblue", border=NA, ylim=c(0,25000))  

#Create bar plot of future reef locations in GFDL(3.7)
dev.new()
barplot(df8,
        main="Reef area within MPAs (2090-2100, GFDL, RCP3.7)",
        xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="lightblue", border=NA, ylim=c(0,25000))  

#Create bar plot of future reef locations in GFDL(2.6)
dev.new()
barplot(df9,
        main="Reef area within MPAs (2090-2100, GFDL, RCP2.6)",
        xlab="IUCN category", las=0, ylab="Total area of reefs (km2)", col="lightblue", border=NA, ylim=c(0,25000))  
