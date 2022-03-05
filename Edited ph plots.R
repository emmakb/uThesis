#EditedpHplots
phcontrol= raster layer
coral_poly= spatial data frame 

#Histogram of pH and reef distribution (2000-2010)
dev.new()
twothousandPHandreefs<- unlist(extract(x=phcontrol, y=coral_poly, small=TRUE))/100
hist(twothousandPHandreefs,
     main="Reef distribution by surface ocean pH (2000-2010)",
     xlab="Surface ocean pH",ylab="Reef proportion", xlim=c(7.6,8.2),ylim = c(0,35), 
     col="lightgreen",freq=FALSE)
abline(v = 7.7, lty = 2)

#Histogram of pH and reef distribution (2090-2100)
dev.new()
endofcenturyPHandreefs <- unlist(extract(x=phanalyze, y=coral_poly, small=TRUE))
hist(endofcenturyPHandreefs, 
     main="Reef distribution by surface ocean pH (2090-2100)",
     xlab="Surface ocean pH ",ylab="Reef proportion", xlim=c(7.6,8.2),ylim = c(0,35),
     col="lightgreen",freq=FALSE)
abline(v = 7.7, lty = 2)