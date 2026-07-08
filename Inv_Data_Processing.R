# Set wd
setwd("C:/Users/rwetz/Documents/GitHub/Forest_Inventory")

# Packages
library(dplyr)
library(data.table)

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

  # Decimals
treefreak <- tree %>%
  group_by (Plot.ID, Species) %>%
  summarise (n=n()) %>%
  mutate(rel.freq = paste0((n/sum(n))))
treefreak$Class <- "Canopy"
  # Remove NAs
treefreak <- na.omit(treefreak)
write.csv(treefreak, "C:/Users/rwetz/Documents/GitHub/Forest_Inventory/TreeRF_Dec.csv")

list_df <- split(treefreak, treefreak$Plot.ID)
list2env(list_df, envir = .GlobalEnv)
list2DF(list_df)
for (i in list_df) {
  print(i)
  t(i)
  if (list_df$Name == "BA11") { 
    break
    }
}

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


