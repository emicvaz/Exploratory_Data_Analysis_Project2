 #Plot 3####

library(dplyr)
library(ggplot2)

 #Q3
 #Which have seen increases in emissions from 1999–2008?

Baltimore<-filter(NEI, fips == "24510")

ggp <- ggplot(Baltimore,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()   


#The point source saw a slight increase overall from 1999-2008. Also note that the point source saw a significant increase until 2005 at which point it decreases again by 2008 to just above the starting values.
