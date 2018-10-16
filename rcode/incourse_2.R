###
# Zweiter Tag

#####
# Fragen zum ersten Tag

myfun <- function(x,y){
  z <- x+y
  return(z)
}


myfun(2,3)

ergebnis <- myfun(2,3)
ergebnis

#####
# 

ab <- c(1,2,4,5,NA)

mean(ab,na.rm=T)

#####
# Faktor, 

log <- c(TRUE,FALSE,TRUE)

log <- c(T,F)
str(log)

ab==1

###
# numeric

num <- 8:5

mean(num)
var(num)

str(num)

?var

####
# character

char <- c("a","1","op233")
str(char)

mean(char)

####
# factor

fac <- LETTERS[1:10]
fac <- as.factor(fac)

str(fac)
levels(fac)

levels(fac) <- LETTERS
levels(fac)
length(fac)
str(fac)

table(fac)

table(char)

#################################
# Schleifen

j <-0
for (i in 1:10000){
  j <- j+i
  cat(i, "/n")
}


dat1 <- dat[,1:100]
dim(dat1)

str(dat)

dat[,1] <- as.character(dat[,1])
dat[,2] <- as.character(dat[,2])

for( i in 1:ncol(dat1)){
  dat1[,i] <- as.character(dat1[,i])
  cat(i, " ")
}


for( i in 1:ncol(dat1)){
  dat1[,i] <- as.character(dat1[,i])
  cat(i, "/n")
}

mean(ab) 
var(ab)

for( i in 1:ncol(dat1)){cat(i, "/n")}

mean(ab);var(ab)

ab_dat <- data.frame(a=ab,
                     b=ab)


###############################
# Unterschied Funktion und Schleife



transform_miss <- function(x){
  x[x==-99] <- NA
  x[x=="Item nonresponse"] <- NA
  return(x)
}

dat$z000001z[dat$z000001z==-99] <- NA
dat$z000001z[dat$z000001z=="Item nonresponse"] <- NA

dat$z000001z <- transform_miss(dat$z000001z)


dat$z000003z <- dat$z000003z[dat$z000003z==-99] <- NA

#####


erg1 <- vector()
erg2 <- list()


for (i in 1:ncol(dat)){
  tab <- table(dat[,i])
  erg1[i] <- length(tab)
  erg2[[i]] <- tab
  cat(i, "/n")
}

##########

i<-0
repeat{
  i <- i+1
  if (i %in% c(2,4,6,8,10)){
    cat(i,"/n")
  }
  if (i==10){
    break
  }
}

### elegantere Lösung

i<-0
repeat{
  i <- i+1
  if (i %% 2==0){
    cat(i,"/n")
  }
  if (i==10){
    break
  }
}

### noch elegantere Lösung ohne Schleife

seq(2,10,by=2)

#### Zufallszahlen

1:4
runif(4)
rnorm(4)

(ApplyDat <- cbind(1:4,runif(4),rnorm(4)))

myfun <- function(x){
  m_x <- mean(x)
  v_x <- var(x)
  return(c(m_x,v_x))
}

myfun(ApplyDat[,1])

apply(ApplyDat,1,myfun)

#####
ApplyDat <- data.frame(Income=rnorm(5,1400,200),
                       Sex=sample(c(1,2),5,replace=T))


?rnorm
ApplyDat

tapply(ApplyDat$Income,ApplyDat$Sex,mean)

table(ApplyDat$Income,ApplyDat$Sex)


dat$bazq020a <- as.numeric(dat$bazq020a)

attach(dat)

  # rückgängig machen
detach(dat)


tapply(dat$bazq020a,dat$a11d054a,mean,na.rm=T)

with(dat,tapply(bazq020a,a11d054a,mean,na.rm=T))

######################
# Lösung Aufgabe B1E

dat$Dauer <- as.numeric(dat$bfzq020a)
dat$Dauer[dat$bfzq020a %in% c(-77,-22,-33,-77,-99)] <- NA

tapply(dat$Dauer,dat$bfzh070z,mean,na.rm=T)

tapply(dat$Dauer,dat$a11d054a,mean,na.rm=T)


# nach Variablennamen suchen

which(colnames(dat)=="a11d054a")

  
grep("a11",colnames(dat),value=T)

att_dat <- attributes(dat)

grep("Alter",att_dat$var.labels,value=T)

colnames(dat)[grep("Alter",att_dat$var.labels)]

?grep

agrep("Alter",att_dat$var.labels,value=T)

#######

setwd("D:/Eigene Dateien/Downloads")
load("dat_cf2.RData")

install.packages("DT")
library(DT)
datatable(dat_cf2)

## Alternative:

DT::datatable(dat_cf2)

?datatable

##################################
# Graphiken

dat$duration <- as.numeric(dat$bfzq020a)

summary(dat$duration)
hist(dat$duration)

hist(dat$duration,col="blue",
     main="Duration of interview",ylab="Frequency",
     xlab="Duration")

hist(dat$duration,col="red",
     main="Duration of interview",ylab="Frequency",
     xlab="Duration")

hist(dat$duration,col=1,
     main="Duration of interview",ylab="Frequency",
     xlab="Duration")

hist(dat$duration,col=c("#8B0000"))

##

install.packages("colourpicker")

a <- runif(1000)
b <- runif(1000)

plot(a,b,pch=20,col=rgb(1,0,0,.2))

barplot(c(3,4),col=c("red","green"))

sex <- as.character(dat$a11d054a)
tab2 <- table(dat$bbzc024a,sex)
barplot(tab2,beside=T)


plot(tab)

plot(runif(100))

#####
# Lösung Aufgabe B2A

?barplot

barplot(VADeaths, beside = TRUE,col=1:5)

?VADeaths

VADeaths <- data.frame(VADeaths)

tab_a11d054a <- table(dat$a11d054a) 

barplot(tab_a11d054a,col=1:2)

# install.packages("mlmRev")
data(Chem97)

# install.packages("lattice")
library(lattice)

?histogram


histogram(~ duration | a11d054a,data = dat,
          layout=c(1,2))

?densityplot

###############################
# ggplot2

install.packages("ggThemeAssist")

library(ggplot2)

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) +
  geom_point() + theme(plot.subtitle = element_text(vjust = 1), 
    plot.caption = element_text(vjust = 1), 
    panel.background = element_rect(fill = "aliceblue"))

d <- diamonds[sample(nrow(diamonds), 1000), ]

p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = clarity,size = 4)) +
  geom_smooth(aes(colour = cut, fill = cut))+
  facet_wrap(~ cut)

install.packages("plotly")
library(plotly)
ggplotly(p)

####################
# lineare Regression

m1 <- lm(mpg ~ wt,data=mtcars)
m1

sum_m1 <- summary(m1)
sum_m1

sum_m1$coefficients

m3d<-lm(mpg~log(wt),data=mtcars)

log(mtcars$wt)
log2(mtcars$wt)

mtcars$wt^4

plot(m1)

par(mfrow=c(2,2))
plot(m1)

plot(x=mtcars$wt,y=mtcars$mpg)
abline(m1)

mtcars$cyl <- as.factor(mtcars$cyl)

m4 <- lm(mpg ~ cyl + wt, data = mtcars)
summary(m4)
table(mtcars$cyl)

#####################
# Lösung Aufgabe B3A

install.packages("DAAG")
library(DAAG)
data(toycars)

toycars$car <- as.factor(toycars$car)

boxplot(distance~car,data=toycars)

mod0 <- lm(distance~car,data=toycars)

sum_mod0 <- summary(mod0)

mod1 <- lm(distance~angle,data=toycars[toycars$car==1,])
mod2 <- lm(distance~angle,data=toycars[toycars$car==2,])
mod3 <- lm(distance~angle,data=toycars[toycars$car==3,])

toycars$col <- "red"
toycars$col[toycars$car==2] <- "blue" 
toycars$col[toycars$car==3] <- "green" 

plot(y=toycars$distance,x=toycars$angle,col=toycars$col)
abline(mod1,col="red")
abline(mod2,col="blue")
abline(mod3,col="green")


head(toycars)

mod <- lm(distance~angle+car,data=toycars)
sum_mod <- summary(mod)

sum_mod$r.squared

####
# Regressionsoutput darstellen

install.packages("stargazer")

library(stargazer)

stargazer(m1)
