# water chem correlations 

# Corinne Klohmann
#cak268@uw.edu

# clear workspace
rm(list =ls())

# load packages
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

# import data
dat <- read.csv("Field Assay Counts - Sheet1.csv")

# clean up data
#remove discovery field site
dat <- dat[dat$site != "Disc",]
# remove geom mean, notes columns
dat <- dat[-c(15,16, 17,18)]
#remove NA's
dat <- na.omit(dat)

# load package
library("ggpubr")

# correlations
t <- ggscatter(dat, x = "temp", y = "ent_count", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson", 
          add.params = list(color = "black",
                        fill = "blue"),
          xlab = "Temperature (°C)", ylab = "Enterococcus (CFUs/100mL)",
          ylim = c(0,600))
p <- ggscatter(dat, x = "ph", y = "ent_count", 
               add = "reg.line", conf.int = TRUE, 
               cor.coef = TRUE, cor.method = "spearman", 
               add.params = list(color = "black",
                                 fill = "blue"),
               xlab = "pH", ylab = "Enterococcus (CFUs/100mL)",
               ylim = c(0,600))
s <- ggscatter(dat, x = "sal", y = "ent_count", 
               add = "reg.line", conf.int = TRUE, 
               cor.coef = TRUE, cor.method = "pearson", 
               add.params = list(color = "black",
                                 fill = "blue"),
               xlab = "Salinity (ppm)", ylab = "Enterococcus (CFUs/100mL)",
               ylim = c(0,600))
d <- ggscatter(dat, x = "do", y = "ent_count", 
               add = "reg.line", conf.int = TRUE, 
               cor.coef = TRUE, cor.method = "pearson", 
               add.params = list(color = "black",
                                 fill = "blue"),
               xlab = "Dissolved oxygen (mg/L)", ylab = "Enterococcus (CFUs/100mL)",
               ylim = c(0,600))
r <- ggscatter(dat, x = "par", y = "ent_count", 
                   add = "reg.line", conf.int = TRUE, 
                   cor.coef = TRUE, cor.method = "pearson", 
                   add.params = list(color = "black",
                                     fill = "blue"),
                   xlab = "Photosynthetically Available Radiation (umol/m-2/s-1)",
              ylab = "Enterococcus (CFUs/100mL)", ylim = c(0,600))
# combine plots
ggarrange(t, p, s, d, r , 
          labels = c("A", "B", "C", "D", "E"),
          hjust= -5,
          ncol = 2, nrow = 3)

# non-linear correlation for pH
install.packages("devtools") 
library(devtools)
install_github("ProcessMiner/nlcor")
library(nlcor)

# Implementation 
ph <- dat$ph
ent <- dat$ent_count

plot(ph,ent,type="l")

nlcor(ph,ent, plt = T)

cor(ph, ent)







