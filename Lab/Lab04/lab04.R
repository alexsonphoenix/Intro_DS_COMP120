library(tidyverse)

info.204 <- read_tsv("INFO204-2017-results-mod.tsv", na="?")
info.204$Gender <- factor(info.204$Gender, 
                          levels=c("F", "M", "U"), 
                          labels=c("Female", "Male", "Unspecified"))
info.204$Grade <- ordered(info.204$Grade, 
                          levels=c("E", "D", 
                                   "C-", "C", "C+", 
                                   "B-", "B", "B+",
                                   "A-", "A", "A+"))

nrow(info.204)
ncol(info.204)
rownames(info.204)
colnames(info.204)

head(info.204)


plot(info.204$Internal, info.204$Exam)

with(info.204, plot(Internal, Exam))

with(info.204, plot(Internal, Exam, 
                    main="INFO 204 2017, Internal vs. Exam Performance",
                    xlim=c(0, 45), xlab="Internal Mark (/45)", 
                    ylim=c(0, 55), ylab="Exam Performance (/55)",
                    pch=19, col="orange"))

with(info.204, plot(Internal, Exam, 
                    main="INFO 204 2017, Internal vs. Exam Performance",
                    xlim=c(0, 45), xlab="Internal Mark (/45)", 
                    ylim=c(0, 55), ylab="Exam Performance (/55)",
                    pch=19, col=ifelse(PassedTutorials, "orange", "purple")))
legend("topleft", ## the legend position - the top-left corner,
       c("Passed Tutorials", "Failed Tutorials"), ## the legend text
       pch=19, ## point style to use for the legend (solid dots)
       col=c("orange", "purple"), ## the colours to use for each dot
       ## in the legend
       bty="n" ## should a box be placed around the legend (NO!)
)


plot.data <- data.frame(x=seq(-2*pi, 2*pi, length.out=201) + 
                          rnorm(201, sd=0.05))
plot.data$f <- with(plot.data, x^2 + 10*sin(x))
plot.data$y <- plot.data$f + rnorm(201)

with(plot.data, plot(x, y, col="orange"))
with(plot.data, lines(x, f, col="black"))


otago.blue <- "#00508F" ## the official colour code for the blue in
## the University of Otago crest!
## Hexadecimal RGB colour value(0, 80, 143)

breaks <- seq(0, 100, 5) ## the histogram broken down into bins
## of five marks from 0 to 100
with(info.204, hist(Internal+Exam, breaks=breaks, 
                    col=otago.blue, 
                    xlab="Mark (/100)",
                    main="INFO 204 2017 Final Marks"))

with(info.204, hist(Final, breaks=breaks, 
                    col=otago.blue, 
                    xlab="Mark (/100)",
                    main="INFO 204 2017 Final Marks"))

grade.tally <- table(info.204$Grade)
grade.tally

barplot(grade.tally,main = "Grades Frequency")

## ggplot2
ggplot(info.204) + 
  geom_point(aes(x=Internal, y=Exam,colour=PassedTutorials))

ggplot(info.204, aes(x=Internal, y=Exam)) + 
  geom_point(aes(colour=PassedTutorials)) +
  xlab("Internal Mark (/45)") + ylab("Exam Mark (/55)") +
  scale_colour_manual( ## sets colours manually
    values=c("orange", "purple"), 
    labels=c("Passed Tutorials", "Failed Tutorials")) +
  theme(legend.position="bottom") ## legend is set at the bottom

