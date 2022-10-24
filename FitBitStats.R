# Using the install.packages() function to install packages

install.packages("tidyverse")        # collection of R packages designed for data science
install.packages("dplyr")            # for transforming data sets
install.packages("janitor")          # for examining and cleaning dirty data
install.packages("lubridate")        # for date & time formats
install.packages("ggpubr")           # for creating and customizing ggplot2
install.packages("waffle")           # for waffle charts
install.packages("scales")           # scaling used by ggplots
install.packages("RColorBrewer")     # for color palette

# Using the library () function to load packages

library(tidyverse)          # collection of R packages designed for data science
library(dplyr)              # for transforming data sets
library(janitor)            # for examining and cleaning dirty data
library(lubridate)          # for date & time formats
library(ggpubr)             # for creating and customizing ggplot2
library(waffle)             # for waffle charts
library(scales)             # scaling used by ggplots
library(RColorBrewer)       # for color palette

# Reading csv files

activity_daily <- read_csv(file= "/cloud/project/bellabeat/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv") 
calories_daily <- read_csv(file= "/cloud/project/bellabeat/Fitabase Data 4.12.16-5.12.16/dailyCalories_merged.csv") 
intensities_daily <- read_csv(file= "/cloud/project/bellabeat/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv")
steps_daily <- read_csv(file= "/cloud/project/bellabeat/Fitabase Data 4.12.16-5.12.16/dailySteps_merged.csv")
steps_hourly <- read_csv(file= "/cloud/project/bellabeat/Fitabase Data 4.12.16-5.12.16/hourlySteps_merged.csv")
sleep_daily <- read_csv(file= "/cloud/project/bellabeat/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")
weight <- read_csv(file= "/cloud/project/bellabeat/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv")

# Using the head() function to get a snapshot of each data set.

head(activity_daily)
head(calories_daily)
head(intensities_daily)
head(steps_daily)
head(steps_hourly)
head(sleep_daily)
head(weight)

# Using the str() function to preview  the structure of each data set.

str(activity_daily)
str(calories_daily) 
str(intensities_daily) 
str(steps_daily) 
str(steps_hourly) 
str(sleep_daily) 
str(weight)

# To verify that the datasets calories_daily, intensities_daily, and steps_daily are subsets found in activity_daily, we will use all() funtion

all(calories_daily %in% activity_daily)
all(intensities_daily %in% activity_daily)
all(steps_daily %in% activity_daily)

# Using the rm() function to remove the data sets that are subsets of the activity_daily data set.

rm(calories_daily,intensities_daily,steps_daily)

# Changing the the column names

colnames(activity_daily) <- c("id","date","steps","distance","tracker_distance","logged_distance","active_distance","moderate_distance",
                              "light_distance","sedentary_distance","active_min","fair_min","light_min",
                              "sedentary_min","calories")

colnames(sleep_daily) <- c("id","date","sleep_records","minutes_asleep","time_in_bed")

colnames(steps_hourly) <- c("id","date","steps")


# Cleaning the the column names

clean_names(activity_daily)

clean_names(sleep_daily)

clean_names(steps_hourly)

# Using the colnames() to view the names of all the columns found in each data set

colnames(activity_daily)
colnames(sleep_daily)
colnames(steps_hourly)

# Using the sum() function to view the number of duplicates in each data set

sum(duplicated(activity_daily))
sum(duplicated(sleep_daily))
sum(duplicated(steps_hourly))

# Using the unique function return only unique 
sleep_daily <- unique(sleep_daily)

# Using the sum() function to view the number of duplicates in the sleep_daily data set 

sum(duplicated(sleep_daily))

# Double checking the data structure

head(activity_daily)
head(sleep_daily)
head(steps_hourly)

# Using the mutate() function to change the data type of the date column from chr to date

activity_daily <- activity_daily %>% 
  mutate(date= as_date(date, format= "%m/%d/%Y"))

sleep_daily <- sleep_daily %>%
  mutate(date= as.POSIXct(date, format= "%m/%d/%Y  %I:%M:%S %p", tz= Sys.timezone()))

steps_hourly <- steps_hourly %>% 
  mutate(date= as.POSIXct(date, format="%m/%d/%Y %I:%M:%S %p", tz= Sys.timezone()))


# Verifying the date column format changes
head(activity_daily)
head(sleep_daily)
head(steps_hourly)

# Using the merge() function to combine the two data sets 

activity_merged <- merge(activity_daily, sleep_daily, by= c("id","date"), all.x = TRUE)


# Verifying the merge
head(activity_merged)

# summary activity_merged data:

summary(activity_merged)

# Setting up custom themes for ggplot2

custom_theme <- function() {
  theme(
    panel.border = element_rect(colour = "black", 
                                fill = NA, 
                                linetype = 1),
    panel.background = element_rect(fill = "white", 
                                    color = 'grey50'),
    panel.grid.minor.y = element_blank(),
    axis.text = element_text(colour = "black", 
                             face = "italic", 
                             family = "Helvetica"),
    axis.title = element_text(colour = "black", 
                              family = "Helvetica"),
    axis.ticks = element_line(colour = "black"),
    plot.title = element_text(size=23, 
                              hjust = 0.5, 
                              family = "Helvetica"),
    plot.subtitle=element_text(size=16, 
                               hjust = 0.5),
    plot.caption = element_text(colour = "black", 
                                face = "italic", 
                                family = "Helvetica")
  )
}


# Correlation between calories and steps

activity_merged %>% 
  group_by(steps, calories) %>% 
  ggplot(aes(x = steps, y = calories, color = calories)) +
  geom_point() +
  geom_smooth(formula = y ~ x, method = "lm")+
  custom_theme() +
  theme(legend.position = c(.8, .3),
        legend.spacing.y = unit(1, "mm"), 
        panel.border = element_rect(colour = "black", fill=NA),
        legend.background = element_blank(),
        legend.box.background = element_rect(colour = "black")) +
  labs(title = 'Calories burned by total steps taken',
       y = 'Calories',
       x = 'Total Steps',
       caption = 'Data Source: FitBit Fitness Tracker Data')


# Analyzing user weekly activity and steps 

activity_merged %>% 
  mutate(weekdays = weekdays(date)) %>% 
  select(weekdays, steps) %>% 
  mutate(weekdays = factor(weekdays, levels = c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))) %>% 
  drop_na() %>% 
  ggplot(aes(weekdays, steps, fill = weekdays)) +
  geom_boxplot() +
  custom_theme() +
  scale_fill_brewer(palette="Pastel1") +
  theme(legend.position="none") +
  labs(
    title = "Weekly user activity",
    x = "Day", line,
    y = "Steps",
    caption = 'Data Source: FitBit Fitness Tracker Data 2016'
  )

# Establishing user nightly sleep cycle by minutes

activity_merged %>% 
  select(minutes_asleep) %>% 
  drop_na() %>% 
  mutate(sleep_quality = ifelse(minutes_asleep <= 420, 'Less than 7h',
                                ifelse(minutes_asleep <= 540, '7h to 9h', 
                                       'More than 9h'))) %>%
  mutate(sleep_quality = factor(sleep_quality, 
                                levels = c('Less than 7h','7h to 9h',
                                           'More than 9h'))) %>% 
  ggplot(aes(x = minutes_asleep, fill = sleep_quality)) +
  geom_histogram(position = 'dodge', bins = 30) +
  custom_theme() +
  scale_fill_manual(values=c("grey", "#80c7d5", "lightcoral")) +
  theme(legend.position = c(.80, .80),
        legend.title = element_blank(),
        legend.spacing.y = unit(0, "mm"), 
        panel.border = element_rect(colour = "black", fill=NA),
        legend.background = element_blank(),
        legend.box.background = element_rect(colour = "black")) +
  labs(
    title = "Sleep distribution",
    x = "Time slept (minutes)",
    y = "Count",
    caption = 'Data Source: FitBit Fitness Tracker Data'
  )

# Separating the  date and time column in steps_hourly data set

steps_hourly <- steps_hourly %>% 
  separate(date, into= c("date", "time"), sep = " ") %>% 
  mutate(date= ymd (date))

head(steps_hourly)

# Adding a weekday column to the data set

steps_weekday <- (steps_hourly)%>%
  mutate(weekday= weekdays(date))%>%
  group_by (weekday,time) %>% 
  summarize(average_steps= mean(steps), .groups = 'drop')

steps_weekday$weekday <- ordered(steps_weekday$weekday, 
                                 levels=c("Monday", "Tuesday", "Wednesday","Thursday","Friday", "Saturday", "Sunday"))

head(steps_weekday)

# Creating a heatmap to better visualize the volume and time of activity within a weekday

ggplot(steps_weekday, aes(x= time, y= weekday, 
                          fill= average_steps)) +
  theme(axis.text.x= element_text(angle = 90))+
  labs(title= "Active Time During the Week", 
       x=" ", y=" ",fill = "average\nsteps",
       caption= 'Data Source: Fitabase Data 2016')+
  scale_fill_gradient(low= "white", high="blue")+
  geom_tile(color= "white",lwd =.6,linetype =1)+
  coord_fixed()+
  theme(plot.title= element_text(hjust= 0.5,vjust= 0.8, size=16),
        panel.background= element_blank())
