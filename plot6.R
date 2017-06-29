
library(tidyverse)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


SCC <- SCC %>% mutate(
        Description = paste(Short.Name, EI.Sector, Option.Group, Option.Set, SCC.Level.One, 
                            SCC.Level.Two, SCC.Level.Three, SCC.Level.Four, sep = ""))


motor <- grep("Vehicle", SCC$Description)
motor1 <- SCC[motor,]

NEI1 <- NEI %>% 
        filter(NEI$SCC %in% motor1$SCC) %>%
        filter(fips == "24510" | fips == "06037")

NEI1 <- transform(NEI1, year = as.factor(year))

png("plot6.png")

ggplot(NEI1, aes(year, Emissions)) +
        geom_col(aes(fill = fips)) +
        ggtitle("Motor Related Emissions in Los Angeles & Baltimore")+
        facet_grid(.~ fips)

dev.off()
