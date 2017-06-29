
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
#str(NEI)

#head(SCC)
#str(SCC)

annual <- with(NEI, aggregate(Emissions, list(year), sum, na.rm = TRUE))

png("plot1.png")

plot(annual[,1], annual[,2], col = "Blue", pch = 17, xlab = "Year", ylab = "Emmissions")

dev.off() 
