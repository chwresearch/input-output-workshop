# Clean EORA

library(openxlsx)

if(!file.exists("data")){dir.create("data")}
fileUrl <- "www.naturalcapitalworld.com/data/COU-2010-test.xlsx"
download.file(fileUrl, destfile="./data/COU-2010.xlsx", method="curl")
gb15_all_data <- read.csv("~/data/input-output-workshop/data/gb15_all_data.csv", header=FALSE, na.strings="NaN")
