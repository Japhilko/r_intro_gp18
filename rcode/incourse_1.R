# Code erster Tag

3+2 # erste code Zeile

date()
sessionInfo()

#############

b <- c(1,2)

b <- c(1,2,3,4,5)

str(b)

ba <- c("a","b")

ba <- c("a","b",1)

str()

str(b)

b <- c(4,5,6,7,4,3,2,9)
sample(b,2)
sample(b,10,replace=T)    

########
# Lösung Aufgabe A1B

b <- c(1,2,3,4,5)
b <- 1:5

5:1

6:-8

b <- seq(1,5)
b <- seq(from=1,to=5)
u <- seq(from=1,to=5,by=2)

?seq

mean(b)
var(b)
sd(b)
sqrt(mean(b))

##########

install.packages("lme4")

library(lme4)

##########

library(ggmap)

qmap("Berlin")

##########

# Paket für deskritive Datenalyse
install.packages("descr")
library(descr)

# Datenimport
library(haven)
library(foreign)

install.packages("biglasso")

install.packages("data.table")

install.packages("RPostgreSQL")

###
# Demos

demo(nlm)

######
# A2A which.min

?which.min
b <- c(4,1,3,5,76)
which.min(b)
min(b)

######
# Arbeitsverzeichnis setzen

getwd()
setwd("C:")

setwd("D:/Eigene Dateien/Dokumente/GitHub/r_intro_gp18/data")

######
#



# install.packages("readstata13")
library(readstata13)

dat <- readstata13::read.dta13("data/ZA5666_v1-0-0_Stata14.dta")

dat <- read.dta13("ZA5666_v1-0-0_Stata14.dta")
att_dat <- attributes(dat)
names(att_dat)

att_dat$var.labels



dat <- readstata13::read.dta13("ZA5666_v1-0-0_Stata14.dta")
# Alternative:
library(readstata13)
dat <- read.dta13("ZA5666_v1-0-0_Stata14.dta")


#####
# Umbenennen von Daten

objekt_mit_langem_namen <- readstata13::read.dta13("ZA5666_v1-0-0_Stata14.dta")
dat <- objekt_mit_langem_namen
  # so wirft man Daten wieder raus
rm(objekt_mit_langem_namen)

#######
# Daten exportieren

A <- 1:4
B <- c("A","B","C","D")
B <- LETTERS[1:4]

ab<- data.frame(Spalte_A=A,B)

######
# Export

# install.packages("devtools")

library(devtools)
install_github("dreamRs/viewxl")
  # Alterative
devtools::install_github("dreamRs/viewxl")

#######

data(iris)

getwd()

write.csv2(iris,file="iris.csv")

write.xlsx2(iris,file="iris.xlsx")

####
# B1

head(dat)
head(ab)

colnames(dat)
rownames(dat)
names(dat)

dim(dat)
nrow(dat)
ncol(dat)

ab <- 1:4
ab[1]
ab[1:3] # erste drei Elemente

ab <- 4:1
ab[1:3] # erste drei Elemente

ab[c(1,3,4)]
ab[-2]

dat100 <- dat[,1:100]

head(dat100)

dat$bfam056a[1:10]

a <- 1:7
(a <- 1:7)

dat2 <- data.frame(age=c(20,30,40),sex=c("f","m","f"))

dat2

dat2[dat2$age<30,]

dat2[1,]


table(dat$a11c019a)


dat5 <- dat[dat$a11c019a=="Sehr zufrieden",]


datf <- readstata13::read.dta13("ZA5666_v1-0-0_Stata14.dta",
                                convert.factors = F)


head(datf$a11c019a)
nrow(dat5)

att_dat <- attributes(dat)
val_labels <- att_dat$val.labels


mean(datf$bazq020a)

datf$bazq020a <- as.numeric(datf$bazq020a)

  # Beispiel warum hier eine Warnung auftaucht
as.numeric("1")
as.numeric("n")


head(dat$bazq020a)

mean(datf$bazq020a)
?mean
mean(datf$bazq020a,na.rm=T)
min(datf$bazq020a,na.rm=T)

datf$bazq020a[datf$bazq020a%in%c(-99,-88,-33,-77)] <- NA
datf$a11c020a[datf$a11c020a%in%c(-99,-88,-33,-77)] <- NA

#########

transform_miss <- function(x){
  x[x%in%c(-99,-88,-33,-77)] <- NA
  x[x%in%c("Item nonresponse","Not invited")] <- NA
  return(x)
}

ab <- transform_miss(datf$bazq020a)
ab <- transform_miss(x=datf$bazq020a)

datf2 <- apply(datf,2,transform_miss)


ab <- as.character(dat$a11c026a)
table(ab)
str(ab)
str(dat$a11c026a)


levels(dat$a11c034a)[2:4] <- c("yes","no","don`t know")
table(dat$a11c034a)

dat$bbzc022a[dat$bbzc022a=="Täglich weniger als eine Stunde"] <- "Less than an hour a day"

# Alternative
dat$bbzc022a <- recode(dat$bbzc022a,'Daily more than two hours'="'Täglich mehr als zwei Stunden'")


str(dat$bbzc022a)
# levels(dat$bbzc022a)[7:13] <- c("Daily more than two hours" ,"Daily one to two hours" ,"Daily less than one hour",
#                                "Once a week.", "Once a month or less.","Never" ) 


save(dat,file="dat.RData")

# save.image()


