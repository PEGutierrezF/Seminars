



# shrimps -----------------------------------------------------------------

shrimps <- read.csv("data/shrimp.csv")
head(shrimps)


sh1 <- shrimps %>%
  group_by(stream, year, Month) %>% 
  summarise(mean = mean(Abundance, na.rm=T),
            sd = sd(Abundance, na.rm = T)) %>%
  arrange(year, match(Month, month.name))
sh1


sh2 <- filter(sh1, stream=="QPB")  %>% rowid_to_column(var='observation')
sh2

ggplot(sh2, aes(x=observation , y=mean)) + 
  geom_line() +
  geom_point() 



d <- read.csv("data/discharge.csv")
head(d)

disc_Pool0 <- d %>%
  group_by(day) %>%
  summarize(daily_discharge = mean(discharge, na.rm = TRUE))
  
disc_Pool0

write.csv(disc_Pool0, file = "disc_Pool0.csv")
