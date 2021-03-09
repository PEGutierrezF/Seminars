



MIv <- read.csv("data/macroinvertebrates.csv")
head(MIv)

summary(MIv)

MIv$date<-as.POSIXct(MIv$date,"%Y-%m-%d",tz = "UTC")

MacroInv <- ggplot(MIv,aes(x=date,y=Abundance)) +
  xlab('Sampling event (2010-2020)')+ ylab("Density ("*ind. ~m^-2*")") +
  geom_line() + geom_point(size = 1) +
 geom_errorbar(aes(ymax=Abundance+SE, ymin=Abundance-SE),na.rm=TRUE, position="dodge",
               colour = "gray", linetype = 2) +
  
  theme(axis.title.x = element_text(size = 14, angle = 0)) + # axis x
  theme(axis.title.y = element_text(size = 14, angle = 90)) + # axis y
  theme(axis.text.x=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis x
  theme(axis.text.y=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis y
  
  theme_classic() 

MacroInv
MacroInv + ggsave("Macroinvertebrates.jpeg",  width = 12, height = 10, units = "cm")                     
