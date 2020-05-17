#Plot 5####
library(dplyr)
library(ggplot2)
#Q5
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
vehicle <- SCC[grep("[Vv]eh", SCC$Short.Name), ]

emission_motor_baltimore <- NEI %>% 
        filter(fips == "24510" & NEI$SCC %in% vehicle$SCC) %>%
        merge(y = vehicle, by.x = "SCC", by.y = "SCC") %>%
        group_by(year) %>%
        summarize(Vehicle_Emissions_Type = sum(Emissions))

emission_motor_baltimore_plot <- ggplot(emission_motor_baltimore, aes(year, Vehicle_Emissions_Type,fill=year)) +
        geom_bar(stat="identity",width=0.75) +
        xlab("Year") +
        ylab("Total Emissions (Tons)") +
        ggtitle("Total Annual Vehicle Emissions in Baltimore City")

print(emission_motor_baltimore_plot) 
dev.copy(png,"plot5.png", width=480, height=480)
dev.off() 

#Emissions from motor vehicles in Baltimore have decreased by 258.5445426 tons from 1999 to 2008.
