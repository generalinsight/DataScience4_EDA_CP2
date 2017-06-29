library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
str(NEI)

#head(SCC)
#str(SCC)

SCC <- SCC %>% mutate(
        Description = paste(Short.Name, EI.Sector, Option.Group, Option.Set, SCC.Level.One, 
                            SCC.Level.Two, SCC.Level.Three, SCC.Level.Four, sep = ""))


coal <- grep("Coal", SCC$Description)
coal1 <- SCC[coal,]

NEI1 <- filter(NEI, NEI$SCC %in% coal1$SCC)
NEI1 <- transform(NEI1, year = as.factor(year))

png("plot4.png")

ggplot(NEI1, aes(year, Emissions)) +
        geom_col() +
        ggtitle("Coal Related Emissions")

dev.off()
