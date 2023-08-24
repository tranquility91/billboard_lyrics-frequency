library(tidyverse)
library(readxl)
bill=read_csv("C:/Users/USER/Documents/R/billboard_lyrics.csv")
bill_help <- bill %>%
    mutate(word_count = str_count(Lyrics, "help"))
bill_help_year <- bill_help %>%
    group_by(Year) %>%
    summarise(mean_frequency = mean(word_count, na.rm = TRUE))

ggplot(bill_help_year, aes(x = Year, y = mean_frequency)) +
    geom_bar(stat = "identity") +
    labs(title = "Average Frequency of the Word 'Help' in Billboard Lyrics by Year",
         x = "Year", y = "Average Frequency") +
    theme(plot.title = element_text(hjust = 0.5))
