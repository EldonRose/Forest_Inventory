# Set wd
setwd("C:/Users/rwetz/Documents/GitHub/Forest_Inventory")

# Packages
install.packages("tidyverse")

library(dplyr)
library(data.table)
library(tidyverse)

# Load and clean up data
tree <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/TreePlot_All.csv")
sa <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Saplings_All.csv")
sh <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Shrubs_All.csv")

# Standardize with sp focus
  # Create relative frequency table
    # Trees
# treefreak <- tree %>%
#   group_by (Plot.ID, Species) %>%
#   summarise (n=n()) %>%
#   mutate(rel.freq = paste0(round(100 * n/sum(n), 0), "%"))
#treefreak$Class <- "Canopy"

  # Convert Percents to Decimals
# treefreak <- tree %>%
#   group_by (Plot.ID, Species) %>%
#   summarise (n=n()) %>%
#   mutate(rel.freq = paste0((n/sum(n))))
# treefreak$Class <- "Canopy"
#   # Remove NAs
# treefreak <- na.omit(treefreak)
# write.csv(treefreak, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/TreeRF_Dec.csv")

treefreak <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/TreeRF_Dec.csv")
vert <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/RF_GPS.csv")
vert <- na.omit(vert)

# Hello subsets my old friend
list_sp <- split(vert, vert$Species)
list_sp <- lapply(list_sp, function(x) {as.data.frame(x)})
list2env(list_sp, envir = .GlobalEnv)

  # QAQC
blackcherry <- `Black cherry`
BLACKGUM <- rbind(`Black gum`, Blackgum)
maples <- rbind(`Red maple`, `Striped maple`, Boxelder, `Maple spp.`)
walnut <- rbind(`Black walnut`, Walnut)
Ash <- rbind(Ash, `Green ash`)
hickory <- rbind(`Shagwood hickory`, Hickory)
r.oak <- rbind(`Northern red oak`, `Red oak`)
sass <- rbind(Sassafras, Sassafrass)

  # Save SELECTED dfs as csv
write.csv(aial, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/aial.csv")
write.csv(Ash, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/Ash.csv")
write.csv(Beech, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/fagr.csv")
write.csv(blackcherry, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/prse.csv")
write.csv(BLACKGUM, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/nysy.csv")
write.csv(maples, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/maple.csv")
write.csv(`Black locust`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/rops.csv")
write.csv(`Black oak`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/quve.csv")
write.csv(walnut, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/walnut.csv")
write.csv(`Chestnut oak`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/qumo.csv")
write.csv(`Cucumber tree`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/magnolia.csv")
write.csv(Dogwood, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/cofl.csv")
write.csv(`Eastern hemlock`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/tsca.csv")
write.csv(`Eastern redcedar`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/juvi.csv")
write.csv(Hackberry, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/hack.csv")
write.csv(`hickory`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/carya.csv")
write.csv(Hornbeam, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/osvi.csv")
write.csv(Mulberry, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/morus.csv")
write.csv(r.oak, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/quru.csv")
write.csv(`Post oak`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/qust.csv")
write.csv(Redbud, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/ceca.csv")
write.csv(sass, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/sassafras.csv")
write.csv(`Sweet birch`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/bele.csv")
write.csv(`Sycamore`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/ploc.csv")
write.csv(`Tulip poplar`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/litu.csv")
write.csv(`Virginia pine`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/pivi.csv")
write.csv(`White oak`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/qual.csv")
write.csv(`White pine`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/strobus.csv")
write.csv(`Witch hazel`, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Forest_Inv_Map/havi.csv")

# Turn data into a list by plot
  # list_df <- split(treefreak, treefreak$Plot.ID)
  # list2env(list_df, envir = .GlobalEnv)
  #list2DF(list_df)
  
# Transpose each df in list and save 
  # list_df <- lapply(list_df, function(x) {t(x)})
  # list_df <- lapply(list_df, function(x) {as.data.frame(x)})
  # trees <- as.data.frame(list_df)
  # write_csv(trees, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/TreeRF_Cols.csv")
  # list2env(list_df, envir = .GlobalEnv)
  # 
  # TEST <- BA10
  # colnames(BA10)[colnames(BA10) == '1'] <- 'Sp 1'
  # colnames(BA10)[colnames(BA10) == '2'] <- 'Sp 2'
  # colnames(BA10)[colnames(BA10) == '3'] <- 'Sp 3'
  # stt <- stack(BA10)

  # Saplings
sa$Sp.total <- rowSums(cbind(sa$X0.1.3..DBH,sa$X3.4.9..DBH), na.rm=TRUE) 
sa$Class <- "Understory"

safr <- sa %>%
  group_by (Plot.ID, Species) %>%
  summarise (n=n()) %>%
  mutate(rel.freq = paste0(round(100 * n/sum(n), 0), "%"))

# Shrubs
sh$Class <- "Shrub"
colnames(sh)[colnames(sh) == 'X..Cover'] <- 'rel.freq'

locs <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/PlotLocs.csv")
loc.cl <- locs[c("OBJECTID", "Name", "X", "Y")]

# Retrieve plot names
plots <- loc.cl[["Name"]]

#os <- subset(tree, tree$Strata == "O")
# list_df <- split(tree, tree$Plot.ID)
# list2env(list_df, envir = .GlobalEnv)


