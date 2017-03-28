# import packages
library(ggplot2)

# set up the working directory
getwd()
setwd("project_folder")
getwd()

df <- read.csv(
      file="05.csv",
      stringsAsFactors = FALSE
      )

# check dataFrame after loading data, optional
str(df)

# add a column, convert int/num to char with corresponding month
df$mlabels = month.abb[df$month]

ggplot(df, aes(x = month)) + 
geom_line(aes( y = gundil, colour="Java 1920-1929 (padi gundil)")) + 
geom_line(aes( y = sioka, colour="Rangoon 1930-1935 (sioka)")) + 
geom_line(aes( y = rangoon, colour="Batavia 1922-1927 (Rangoon rice)")) +

#  label for y and x axis
ylab (label = "") + 
xlab (label = "") + 
# legend title
labs(colour = "") + 
# chart title
labs(title = "Seasonality of Rice Price in Java and Burma") + 
# centering the chart title
theme(plot.title = element_text(hjust = 0.5)) +
# customizing ticks on x-axis with labels 
scale_x_discrete(limits=df$mlabels) +
# customizing ticks on y-axis to percentages
scale_y_continuous(breaks=seq(0.85,1.15,0.05),labels = scales::percent) +
# colors 
scale_colour_manual(values=c("#F8766D", "#7CAE00", "#00BFC4"))

ggsave("plot.jpg", width=9, height=6, dpi=300)




