#Plot 4####
library(dplyr)
library(ggplot2)
#Q4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
# Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

combustion_plot <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="year", y=expression("Total  Emission (10OK Tons)")) + 
        labs(title=expression("Total Annual Coal Combustion Emissions in the US from 1999 to2008"))

print(combustion_plot)

        
#Emissions from coal combustion related sources have decreased from 600,000 to below 400,000 from 1999-2008.

dev.copy(png,"plot4.png", width=480, height=480)
dev.off() 
