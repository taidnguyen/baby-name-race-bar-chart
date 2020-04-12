library(dplyr)

#setwd("~/Desktop/github-projects/baby-name-race-bar-chart")
# Make sure to set Working Directory
df <- read.csv('./data/NationalNames.csv')
# Post 1975
df <- df[df$Year >= 1975,]
df <- df[with(df, order(Name,-Year)),] 
row.names(df) <- NULL #reset index

df <-
  df %>%
  group_by(Name) %>%
  mutate(lastCount = dplyr::lead(Count, n=1, default=NA))

df <-
  df %>%
  group_by(Year) %>%
  mutate(rank = order(order(Count, Year, decreasing=TRUE)))

write.csv(df,'./data/national-names-clean.csv', row.names = FALSE)