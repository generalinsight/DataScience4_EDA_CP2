library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
#str(NEI)

#head(SCC)
#str(SCC)

bal <- subset(NEI, fips == "24510")
bal1 <- transform(bal, year = as.factor(year))
bal1 <- transform(bal1, type = as.factor(type))

png("plot3.png", width = 480, height = 480)

ggplot(bal1, aes(year, Emissions)) +
        geom_col(aes(fill = type)) +
        facet_grid(.~type) +
        ggtitle("Emission in Baltimore City by Type")

dev.off()
