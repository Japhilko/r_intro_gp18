# Jan-Philipp Kolb
# Sat Sep 15 10:21:51 2018

#-------------------------------------------------#
# Installing necessary packages
#-------------------------------------------------#

necpackages <- c("knitr","rmarkdown","tidyverse")
for (i in 1:length(necpackages)){
  if (!require(necpackages[i])){
    install.packages(necpackages[i])    
  }
  library(necpackages[i])
}

#-------------------------------------------------#
# Load libraries
#-------------------------------------------------#

library(knitr)
library(rmarkdown)
library(lme4)

#-------------------------------------------------#
# Define paths
#-------------------------------------------------#

main_path <- "D:/github/r_intro_gp18/" # zu Hause
main_path <- "D:/Daten/GitHub/r_intro_gp18/"
slide_path <- paste0(main_path,"slides/")
rcode_path <- paste0(main_path,"rcode/")

#-------------------------------------------------#
# Parts of the presentation
#-------------------------------------------------#
setwd(slide_path)
dirnamen <- dir()
presparts <- dirnamen[grep(".Rmd",dirnamen)]


# setwd("D:/gitlab/IntroDataAnalysis/rcode/")
setwd(rcode_path)

for (i in 1:length(presparts)){
  purl(paste0("../slides/",presparts[i]),documentation = 2)  
}

#-------------------------------------------------#
# Creating pdf slides
#-------------------------------------------------#

# setwd("D:/Daten/GitLab/IntroDataAnalysis/slides")
setwd(slide_path)


for (i in 1:length(presparts)){
  rmarkdown::render(presparts[i], "beamer_presentation")
}


for (i in 1:length(presparts)){
  rmarkdown::render(presparts[i], "md_document")
}

for (i in 1:length(presparts)){
  rmarkdown::render(presparts[i], "all")
}


# B1_DataProcessing


#-------------------------------------------------#
# Create rcode in course
#-------------------------------------------------#

setwd(rcode_path)

#purl("../slides/C2_hierarchMods.Rmd",documentation = 2)
#purl("../slides/D1_webScrapping.Rmd",documentation = 2)
#purl("../slides/D2_dataCleaning.Rmd",documentation = 2)

setwd(slide_path)

rmarkdown::render("B1_DatenVerarbeitung.Rmd", "md_document")
rmarkdown::render("A4_DatenImport.Rmd", "md_document")
rmarkdown::render("A3_GESISPanel.Rmd", "md_document")
rmarkdown::render("A3_GESISPanel.Rmd", "pdf_presentation")


#-------------------------------------------------#
# Install necessary packages
#-------------------------------------------------#


install.packages("lme4")


#-------------------------------------------------#
# Links
#-------------------------------------------------#


# https://rmarkdown.rstudio.com/authoring_quick_tour.html
# https://www.r-bloggers.com/function-to-simplify-loading-and-installing-packages/