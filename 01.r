# in case ggplot2 is not yet installed 
# install.packages("ggplot2")

# import packages
library(ggplot2)

# set up working directory
getwd()
setwd("project_folder_path")
getwd()

# read csv and save the data to sr
sr <- read.csv(
      file="01.csv",
      stringsAsFactors = FALSE
      )

# check dataFrame after loading data, optional
class(sr)
head(sr, 3)
str(sr)

# plot the multiple time series data in one chart
ggplot(sr, aes(x = year)) + 
geom_line(aes( y = sugarEx, colour="legend_1")) + 
geom_line(aes( y = riceIm, colour="legend_2")) + 
#  label for y and x axis
ylab (label = "y_axis_label") + 
xlab (label = "x_axis_label") + 
# legend title
labs(colour = "") + 
# chart title
labs(title = "Time Series Visualisation with R") + 
# centering the chart title
theme(plot.title = element_text(hjust = 0.5)) +
# spacing ticks on x and y axes
scale_x_continuous(breaks=seq(1875,1940,10)) +
scale_y_continuous(breaks=seq(0,2600,500)) +
# colors, vermilion #E34234 for legend_1, bluish green #21B6A8 for legend_2
scale_colour_manual(values=c("#21B6A8", "#E34234"))

# save chart to the working directory
ggsave("plot.jpg", width=9, height=6, dpi=300)