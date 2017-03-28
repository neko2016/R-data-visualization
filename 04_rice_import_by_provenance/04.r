# import libraries
library(tidyr)
library(ggplot2)

# set up working path
setwd("project_folder")
getwd()

# I/O
df <- read.csv(file="04.csv",
      stringsAsFactors = FALSE)

# convert format from wide to long
df_wide <- df
df_long <- gather(df_wide, country, trade, Saigon:Singapore, factor_key=TRUE)

# the simplest way to plot a stacked area chart
# ggplot(df_long, aes(x=Year,y=trade, fill=country)) + geom_area(position="fill")

ggplot(df_long, aes(x=Year,y=trade, fill=country)) + 
geom_area(position="fill", colour="black", size=.2, alpha=.8) + 

# color palatte
scale_fill_manual(values=c("#2B83BA", "#ABDDA4", "#FDAE61", "#D7191C")) +

# title, labels # http://docs.ggplot2.org/0.9.3/theme.html
labs(title = "Rice Import in the Netherlands Indies 1901-1940", x="", y="") + 
theme(plot.title = element_text(hjust = 0.5, size = rel(1.2))) +

# change ticks on y-axis to percentage
scale_y_continuous(breaks=seq(0,1,0.1),labels = scales::percent) +
# space the tick on x-axis
scale_x_continuous(breaks=seq(1901,1940,3)) + 
# change legend title 
guides(fill=guide_legend(title="Provenance"))

ggsave("plot.jpg", width=9, height=6, dpi=300)