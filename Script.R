ls()
# We are testing ....
x = 1 + 1
y = seq(1, 100)
z = seq(1, 200, 3)
set.seed(123)
xx = rnorm(200, mean = 2, sd =3)
yy = c(1,3,8,6,10)
hist(xx)
?seq
zz = scan()
fivemorethan7 = 5 > 7
fivemorethan7
7 <= 5
zzz = 7 != 7
7 == 7
typeof(zz)
x <- 7
7 -> y
rm(zzz)
rm(xx)

x <- seq(1, 20)
y <- seq(1, 60, 3)
z <- x + y

student <- c("John", "Max", "Terry", "Richard")
student[c(2,3)]
student[2:3]
student[-3]
student[c(-1,-3)]
student[c(2,4)]
score <- c(67, 89, 50, 90)
score[score>=90 & score < 60]
student[score>=90 | score < 60]
mean(score)
summary(score)
read.table("survey_data.csv",header=TRUE, sep=",")
survey <- read.csv("survey_data.csv", header=TRUE)
view(survey)
head(survey, 10)
tail(survey)
str(survey)
summary(survey)
c <- c("pink","blue","green")
barplot(summary(survey$Program),
        col=c("pink","blue","green"),
        main="Distribution of program",
        xlab="program",
        ylab="number of students")
plot(survey$TVhours)
hist(rnorm(300), 
     main="Distribution of TV Hours",
     xlab="Hours", col=c("red","white","blue","white","red"))


survey[["Program"]]
survey$Program
survey[ ,c(1,3)]
sd(survey[survey$Program =="PPM" & survey$OperatingSystem == "Mac OS X", 5])


dataframe[  row , col   ]
subset(survey,
       select=c(OperatingSystem,TVhours),
       subset=OperatingSystem=="Windows")
?subset
survey.new <- transform(survey, TVminute = 60 * TVhours)
table(survey$Program, survey$OperatingSystem)

assignLabel <- function(x) {
  if (x >= 20) {
    label <- "Addicted"
  } else if (x >= 10) {
    label <- "Too much"
  } else if (x >= 5) {
    label <- "OK"
  } else {
    label <- "Too little"
  }
  label
}

sapply(survey$TVhours, FUN=assignLabel)

survey.messy <- read.csv("survey_messy.csv", header=TRUE)
survey.messy.string <- as.character(survey.messy$TVhours)
transform(survey.messy, 
          TVhours=as.numeric(gsub("[^0-9.]","", survey.messy.string)))

index.set = rnorm(10)
for (i in index.set) {
  print(abs(i))
}
?rnorm
fake.data <- matrix(rnorm(100, 5), ncol=5)
colMeans(fake.data)
apply(fake.data, MARGIN=1, FUN=mean)
tapply(survey.new$TVhours, 
       INDEX=survey.new[c("Program","Rexperience")], 
       FUN=mean)

with(survey, tapply(TVhours, 
                   INDEX=list(Program,Rexperience), 
                   FUN=mean))
library(knitr)
kable(with(survey, tapply(TVhours, 
                    INDEX=list(Program,Rexperience), 
                    FUN=mean)), format="markdown")

with(survey, aggregate(TVhours, 
                    by=list(Program,Rexperience), 
                    FUN=mean))

par(mfrow = c(2,3))
hist(survey$TVhours,col="magenta")
barplot(summary(survey$Rexperience), col="pink")
barplot(summary(survey$PriorExp), col="orange")
barplot(summary(survey$OperatingSystem), col="blue")
barplot(summary(survey$Editor), col="yellow")
barplot(summary(survey$Program),
        col=c("pink","blue","green"),
        main="Distribution of program",
        xlab="program",
        ylab="number of students")
par(mfrow = c(1,1))
pie(survey$TVhours, labels = survey$Program)
