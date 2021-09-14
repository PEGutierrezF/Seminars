


leaflitter <- read.csv("data/leaflitter.csv")
head(leaflitter)

summary(leaflitter)

leaflitter$Week<-as.POSIXct(leaflitter$Week,"%Y-%m-%d",tz = "UTC")


leaf <- ggplot(leaflitter,aes(x=Week,y=Mean)) +
  xlab('Sampling event (2010-2020)')+ ylab("Mean litter input rate ("*g~m^-2~d^-1*")") +
  geom_point(colour = "#6e016b", size = 1.5) +
  geom_errorbar(aes(ymax=Mean+SD, ymin=Mean-SD),na.rm=TRUE, position="dodge",
                colour = "#6e016b") +
  
  theme(axis.title.x = element_text(size = 14, angle = 0)) + # axis x
  theme(axis.title.y = element_text(size = 14, angle = 90)) + # axis y
  theme(axis.text.x=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis x
  theme(axis.text.y=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis y
  
  theme_classic() 

leaf
leaf + ggsave("Leaf litter.jpeg",  width = 12, height = 10, units = "cm")                     
                     



chla. <- read.csv("data/chla.csv")
head(chla.)


chla <- ggplot(chla., aes(x=event, y=chla, color=season, na.rm = TRUE))+
  geom_line(size=1, na.rm = TRUE)+
  geom_point(aes(shape =  factor(pool)),size=2, na.rm = TRUE) +
  scale_shape_manual(values = c(1,2,3,4,5,6,7,8,9,10,11,12)) +
  
  labs(y="Chlorophyll-a ("*"\u03BC"~g~m^-2*")", x = "Sampling event", 
       color = "Season", shape="Pool") +
  

  theme(axis.title.x = element_text(size = 14, angle = 0)) + # axis x
  theme(axis.title.y = element_text(size = 14, angle = 90)) + # axis y
  theme(axis.text.x=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis x
  theme(axis.text.y=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis y
  
  theme_classic() 

  chla
  chla + ggsave("Chla.jpeg",  width = 12, height = 10, units = "cm")   
  
  chla.. <- na.omit(chla.)  
 c <- ggplot(chla.., aes(x=Year, y=chla, color=season, fill=factor(Year))) +
    labs(y="Chlorophyll-a ("*"\u03BC"~g~m^-2*")", x = "Sampling event", 
         color = "Season", fill="Year") +
    geom_boxplot() +
   theme(axis.title.x = element_text(size = 14, angle = 0)) + # axis x
   theme(axis.title.y = element_text(size = 14, angle = 90)) + # axis y
   theme(axis.text.x=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis x
   theme(axis.text.y=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis y
   
   theme_classic() 
 
