# Set wd
setwd("C:/Users/rwetz/Documents/GitHub/Forest_Inventory")

# Packages
install.packages("pdftools")
library(pdftools)

# Load and clean up data
tree <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/TreePlot_All.csv")
os <- subset(tree, tree$Strata == "O")
locs <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/PlotLocs.csv")
loc.cl <- locs[c("OBJECTID", "Name", "X", "Y")]

# Retrieve plot names
plots <- loc.cl[["Name"]]

list_df <- split(tree, tree$Plot.ID)
list2env(list_df, envir = .GlobalEnv)
