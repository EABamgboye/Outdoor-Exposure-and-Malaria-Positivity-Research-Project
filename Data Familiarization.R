#------------------------------------------------------------------------------------------------------------------------#
##----------------------------------------------------R Packages--------------------------------------------------------##
#------------------------------------------------------------------------------------------------------------------------#

#Load necessary packages
list.of.packages <- c(
  "sf", "tidyverse", "ggplot2", "ggrepel", 
  "patchwork", "biscale", "cowplot", "readxl", "dplyr", "readr"
  )

# Install any packages not already installed
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Load all packages
lapply(list.of.packages, library, character.only = TRUE) 

#------------------------------------------------------------------------------------------------------------------------#
##-------------------------------------------------Project Dataset-----------------------------------------------------##
#------------------------------------------------------------------------------------------------------------------------#

##Read in dataset through dropbox link
##Retrieve url link
data_url <- "https://www.dropbox.com/scl/fi/ixv7usayrwxe2e3b7ehvg/outdoor_project_data.csv?rlkey=2utgsbj04ds6hf9r5174arxlh&st=o9a0v9sn&dl=1"

##Read in data
project_data <- read_csv(data_url)


#Check the first few rows
head(project_data)

##Print all rows
print(project_data)

#------------------------------------------------------------------------------------------------------------------------#
##------------------------------------------------------Data Dictionary-------------------------------------------------##
#------------------------------------------------------------------------------------------------------------------------#

## Read in Data Dictionary

##Retrieve url link
dictionary_url <- "https://www.dropbox.com/scl/fi/8wo4vvd0dr3tf75xljjm5/outdoor_project_data_dictionary.csv?rlkey=jsh5btous027ckn2g3406fz0c&st=qr5avgjd&dl=1"

#Read in data
project_data_dictionary <- read_csv(dictionary_url)

#Check the first few rows
head(project_data_dictionary)

##Print all rows
print(project_data_dictionary)
