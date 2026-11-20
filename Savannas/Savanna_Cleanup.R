# Savanna Data Cleanup #
# Packages
install.packages("dplyr")
library(dplyr)
install.packages("tidyverse")
library(tidyverse)
install.packages("FastUtils")
library("FastUtils")
install.packages("data.table")
library("data.table")

#### Code to Clean Up data first time ####
# Load data
sav <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Savannas/Savanna_Data.csv")
clump <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Savannas/clumps.csv")

# Remove empty rows
sav <- sav[1:637, 1:8]

# Add clump names
sav <- cbind(sav, clump)

  # Change 101 E to 101 F
sav <- sav %>% mutate(Site.Name = replace_values(Site.Name, "101 E" ~ "101 F"))

# Fix species names
sav <- sav %>% mutate(Species = replace_values(Family.Genus,
                                "White Oak" ~ "White Oak",
                                "white oak" ~ "White Oak",
                                "Cherry" ~ "Black Cherry",
                                "VA Pine" ~ "Virginia Pine",
                                "Dogwood" ~ "Flowering Dogwood",
                                "S. Red Oak" ~ "Southern Red Oak",
                                "Red Oak" ~ "Red Oak Sp.",
                                "Maple" ~ "Maple Sp.",
                                "Hickory" ~ "Hickory Sp.",
                                "Hawthorne" ~ "Green Hawthorn",
                                "Hawthorn" ~ "Green Hawthorn",
                                "Mulberry" ~ "Red Mulberry",
                                "mulberry" ~ "Red Mulberry",
                                "Sassafras" ~ "Sassafras",
                                "dogwood" ~ "Flowering Dogwood",
                                "birch" ~ "Sweet birch",
                                "Black locust" ~ "Black Locust",
                                "Black Oak" ~ "Black Oak",
                                "Black Gum" ~ "Blackgum",
                                "blackgum" ~ "Blackgum",
                                "Canada Plum" ~ "Prunus Sp.",
                                "hackberry" ~ "Common Hackberry",
                                "locust" ~ "Black Locust",
                                "Locust" ~ "Black Locust",
                                "Maples" ~ "Maple Sp.",
                                "Osage orange" ~ "Osage Orange",
                                "Princess tree" ~ "Princess Tree",
                                "Tulip poplar" ~ "Tulip Poplar",
                                "ailanthus" ~ "Ailanthus",
                                "Juniper" ~ "Eastern Red Cedar",
                                "UNKNOWN TREE" ~ "NA",
                                "N/A" ~ "NA",
                                "Blackhaw" ~ "Blackhaw",
                                "Overgrown?" ~ "NA",
                                "Maple (Dead)" ~ "Dead",
                                "maple" ~ "Maple Sp.",
                                "dead/dying ailanthus" ~ "Ailanthus"
                                ))
write.csv(sav, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Savannas/sav_trees_clumps_rw.csv")

sav <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Savannas/sav_trees_FS.csv")
simple <- sav[c(2:5)]
simple <- na.omit(simple)

# Calc sum by species
sp.s <- simple %>%
  group_by(Species, ClumpID) %>%
  mutate(species_sum = sum(Number.of.trees))

# Split df with sums into list by Tree Clump, then turn sublists into dfs
sp.r <- split(sp.s, sp.s$ClumpID)
sp.df <- lapply(sp.r, function(x) {as.data.frame(x)})

# Calculate totals and Relative Frequency
# Clump.total <- summarise(group_by(sav.na, ClumpID), sum_Clump_Trees = sum(Number.of.trees))
sums <- lapply(sp.df, function(x) {cbind(x, sum(x$Number.of.trees))})
RF <- lapply(sums, function(x){cbind(x, divide(x[5], x[6]))})

# Weight Fire tolerance by Relative Frequency -> Score
score <- lapply(RF, function(x){cbind(x, multiply(x[4], x[7]))})
sav.sc <- rbindlist(score)

# Rename Columns
names(sav.sc)[5] <- "Clump.Sp.Total"
names(sav.sc)[6] <- "Clump.SumTotal"
names(sav.sc)[7] <- "Relative.Frequency"
names(sav.sc)[8] <- "Sp.Fire.Score"

# Save csv
write.csv(sav.sc, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Savannas/sav_trees_scores.csv")
sav.sc <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Savannas/sav_trees_scores.csv")

# Fire Tolerance Score Total
tol <- split(sav.sc, sav.sc$ClumpID)
toll <- lapply(tol, function(x) {as.data.frame(x)})
tols <- lapply(toll, function(x) {cbind(x, sum(x$Sp.Fire.Score))})
tols <- rbindlist(tols)
names(tols)[10] <- "Clump.Fire.Tolerance"

write.csv(tols, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Savannas/sav_scores_final.csv")

