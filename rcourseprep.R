# Introduction to R Programming Week 1 Workscript #

# 1. Intro to R Studio

# R Studio is an Integrated Development Environment (IDE), which pulls 
# together otherwise disjunt, but fundamental components of programming with R.

# The upper left panel is a text editor

# 2. Priming the Pump -- Getting Familiar with R ####

## __ Working In The R Console ####

# The simplest exercise in R is to do some arithmatic in the R Console. Write  
# a mathematical expression of your choosing in the console below, then press
# Return. 

# Why is [1] printed before the output?

# Try a few more.

# Press the up arrow to scroll through your execution history. Modify some 
# expression by adding spaces. What happens?




# syllabus
# week 1: intro, installation, RStudio, calculator, atomic data types, NA, NaN, functions, package installation
# week 2: intro to data structures -- matrices, arrays, vectors, factors, lists, data frames
# week 3: matrices and arrays, matrix algebra, t(), cbind(), rbind(), rowMeans(), rowSums()

## atomic data types

logical, integer, double, character
check with typeof()

x <- c(`mean`, `sum`)

# integer is stored smaller in memory, but can only acheive relatively small values
int <- integer(length=10L)
num <- numeric(length = 10)  
object.size(int)
object.size(num)

# best data sets so far

Puromycin
ToothGrowth
infert
CO2 # grouped data

plot(uptake ~ conc, data=CO2)
plot(uptake ~ Type, data=CO2)
plot()

# apply

split(head(infert), f=1:nrow(head(infert)))
lapply(split(head(infert), f=1:nrow(head(infert))), FUN= function(x) x)

# indexing

?match
%in% same as match!
?order
?which
?switch

## math

# operations
+, -, *, /
  
#functions

?sum
?prod
?diff
?abs
?sqrt

## function building

?function()
?missing



# trig

sin()
cos()
tan()
asin()
acos()

atan
# doing stuff

?do.call
?lapply
?combn
?apply
?aggregate

# list functions

?modifyList 
?stack

# data structures

?str
?ls.str()
?c()
?matrix
?array
?list
?data.frame

# I/O

?read.csv
?read.table
?write.table

# logic

x=1; y=2; xor(x, TRUE)

c(1,2,3) == c(1,2,3) && c(2,3,4) ==c(2,3,4)

# apply testing

# c testing

x=list(1, 2)
y=list(3, 4)
c(x, y)
c(x, y, recursive=TRUE)
x=list(c(1,2), 3)

# list testing

li <- list(c(1,2,3,4), c(5,6,7,8))

li[1]
li[[1]][1] <- 2

# simulating data correlated data

mu <- rep(0,4)
Sigma <- matrix(.7, nrow=4, ncol=4) + diag(4)*.3

rawvars <- mvrnorm(n=10000, mu=mu, Sigma=Sigma)

cov(rawvars); cor(rawvars)
# We can see our normal sample produces results very similar to our 

#specified covariance levels.

# transform to probabilities
pvars <- pnorm(rawvars)

# Through this process we already have 
cov(pvars); cor(pvars)

# We can see that while the covariances have dropped significantly, 
# the simply correlations are largely the same.

plot(rawvars[,1], pvars[,2], main="Normal of Var 1 with probabilities of Var 2") 

# Poisson
poisvars <- qpois(pvars, 5)
cor(poisvars, rawvars) 

##
sapply(coms, FUN=function(x) fun(x))

# Methods play

myfun <- function(x, y) {
  
  Call <- match.call()
  return(Call)
}

funout <- myfun(1, 2)

sink(file="~/Dropbox/UNM R Course/lme.forumla.source.code.R")
lme.formula
sink()
lme.formula

`%~%` <- function(x, y) {
  
  if(!is.character(x)) x <- deparse(substitute(x)) 
  if(!is.character(y)) y <- deparse(substitute(y))
  formula(paste(x, y))
  
}

"x" %~% (y + z)
 ~ y + z

sum <- function(x, ...) mean(x, ...)
sum(c(1,2,3,4))
e <- new.env()
e$mean <- function(x, ...) 2

install.packages("ape", dependencies = TRUE)
library(ape)

bf <- bird.families
plot(bf, cex=.2)
add.scale.bar(length=1)
