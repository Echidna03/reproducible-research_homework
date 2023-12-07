install.packages("ggplot2")
install.packages("janitor")

library(ggplot2)
library(janitor)

Cui_etal_clean<- clean_names(Cui_etal2014)

Cuilm <- lm(log(virion_volume_nm_nm_nm) ~ log(genome_length_kb), Cui_etal_clean)

ggplot(aes(x = log(genome_length_kb), y =log(virion_volume_nm_nm_nm)), data =Cui_etal_clean) +
  
  geom_point() +
  geom_smooth(method = lm) +
  theme_bw() + 
  xlab("Log[Genome Length(kb)]")+
  ylab("Log[Virion volume (nm3)]")

Cuilm <- lm(log(virion_volume_nm_nm_nm) ~ log(genome_length_kb), Cui_etal_clean)


  Cuilm
  
  
  