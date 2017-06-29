NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
#str(NEI)

#head(SCC)
#str(SCC)

bal <- subset(NEI, fips == "24510")
bal2 <- with(bal, aggregate(Emissions, list(year), sum, na.rm = TRUE))


png("plot2.png")

plot(bal2[,1], bal2[,2], col = "blue", pch = 17, xlab = "Year", ylab = "Emissions")

dev.off()
