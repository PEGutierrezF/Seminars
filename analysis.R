
library(ggplot2)

leaflitter <- read.csv("data/leaflitter.csv")
head(leaflitter)

leaf <- ggplot(leaflitter,aes(x=Week,y=Mean)) +
  xlab('Sampling event (weeks)')+ ylab("Mean litter input rate ("*g~m^-2~d^-1*")") +
  geom_point(colour = "#1d5c06", size = 1) +
  geom_errorbar(aes(ymax=Mean+SD, ymin=Mean-SD),na.rm=TRUE, position="dodge",
                colour = "#a7db3d") +
  
  theme(axis.title.x = element_text(size = 14, angle = 0)) + # axis x
  theme(axis.title.y = element_text(size = 14, angle = 90)) + # axis y
  theme(axis.text.x=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis x
  theme(axis.text.y=element_text(angle=0, size=12, vjust=0.5, color="black")) + #subaxis y
  
  theme_classic() 

leaf
leaf + ggsave("Leaf litter.jpeg",  width = 12, height = 10, units = "cm")                     
                     