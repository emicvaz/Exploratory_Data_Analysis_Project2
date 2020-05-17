#Plot6####
library(dplyr)
library(ggplot2)
#Q6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == “𝟶𝟼𝟶𝟹𝟽”). Which city has seen greater changes over time in motor vehicle emissions?
vehicle <- SCC[grep("[Vv]eh", SCC$Short.Name), ]

emission_motor_la <- NEI %>% 
        filter(fips == "06037" & NEI$SCC %in% vehicle$SCC) %>%
        merge(y = vehicle, by.x = "SCC", by.y = "SCC") %>%
        group_by(year) %>%
        summarize(Vehicle_Emissions_Type = sum(Emissions))

emission_motor_baltimore_2 <- cbind(emission_motor_baltimore, "City" = rep("Baltimore", 4))
emission_motor_la2 <- cbind(emission_motor_la, "City" = rep("LA", 4))

emission_motor_total<-rbind(emission_motor_baltimore_2,emission_motor_la2)
  
emission_motor_total

emission_motor_total_plot <- ggplot(emission_motor_total, aes(x=factor(year), y=Vehicle_Emissions_Type, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~City) +
        guides(fill=FALSE) + theme_bw() +
        labs(x="year", y="Total Emissions (Tons)") + 
        labs(title=expression("Comparison of Total Annual Vehicle Emissions in Baltimore and Los Angeles, 1999-2008"))

print(emission_motor_total)

dev.copy(png,"plot6.png", width=480, height=480)
dev.off() 
        
#The greatest magnitude of change in motor vehicle emissions occurred in Baltimore City which experienced a decrease of 258.5445426 tons, while Los Angeles experienced an increase of 163.43998 tons during the 1999-2008 period.
