library(dplyr)

# Make sure to set Working Directory
df <- read.csv('./data/NationalNames.csv')
# Post 1975
df <- df[df$Year >= 1975,]
df <- df[with(df, order(Name,-Year)),] 
row.names(df) <- NULL #reset index

df <-
  df %>%
  group_by(Name) %>%
  mutate(lastCount = dplyr::lag(Count, n=1, default=NA))

df <-
  df %>%
  group_by(Year) %>%
  mutate(rank = order(order(Count, Year, decreasing=TRUE)))

write.csv(df,'./data/clean-national-names.csv', row.names = FALSE)