###Plot2 ####
#Q2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
library(dplyr)
totalBaltimore<-filter(NEI, fips == "24510") %>% 
                group_by(year) %>% 
                summarise(Emissions = sum(Emissions))
                
barplot(
        totalBaltimore$Emissions,
        names.arg=totalBaltimore$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()  


#yep, total emissions from  have decreased in Baltimore City, Maryland from 1999 to 2008.
