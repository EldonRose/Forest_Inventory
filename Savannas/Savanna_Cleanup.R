# Savanna Data Cleanup #
# Packages
install.packages("dplyr")
library(dplyr)

# Load data
sav <- read.csv("C:/Users/rwetz/Documents/GitHub/Forest_Inventory/Savannas/Savanna_Data.csv")

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
                                "Juniper" ~ "Eastern Red Cedar"
                                ))
