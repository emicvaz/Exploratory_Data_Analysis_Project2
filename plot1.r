#### Plot 1 ####
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
#Q1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

totalNEI<-NEI    %>%
        group_by(year) %>% 
        summarise(Emissions = sum(Emissions))


barplot(
        (totalNEI$Emissions)/10^6,
        names.arg=totalNEI$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Million Tons)",
        main="Total PM2.5 Emissions From All US Sources"
)
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

#As we can see from the plot, total emissions have decreased in the US from 1999 to 2008.
