# Clean EORA

setwd("/Users/renato/data/input-output-workshop/")

if(!file.exists("./data")){dir.create("data")}
if(!file.exists("./data/gb15_all_data.csv")){
  fileUrl <- "https://raw.githubusercontent.com/chwresearch/input-output-workshop/master/data/gb15_all_data.csv"
  download.file(fileUrl, destfile="./data/gb15_all_data.csv", method="curl")
}
if(!file.exists("./data/colnames.csv")){
  fileUrl <- "https://raw.githubusercontent.com/chwresearch/input-output-workshop/master/data/colnames.csv"
  download.file(fileUrl, destfile="./data/colnames.csv", method="curl")
}
if(!file.exists("./data/rownames.csv")){
  fileUrl <- "https://raw.githubusercontent.com/chwresearch/input-output-workshop/master/data/rownames.csv"
  download.file(fileUrl, destfile="./data/rownames.csv", method="curl")
}

gb15_all_data <- read.csv("./data/gb15_all_data.csv", header=FALSE, na.strings="NaN")
gb15_rownames <- read.csv("./data/rownames.csv", header=FALSE, na.strings="NaN")
gb15_colnames <- read.csv("./data/colnames.csv", header=FALSE, na.strings="NaN")