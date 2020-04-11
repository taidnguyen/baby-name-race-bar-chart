library(data.table)

# Make sure to set Working Directory
df <- read.csv('./data/NationalNames.csv')
# Post 1960
df <- df[df$Year > 1960,]
# Female
df_f <- df[df$Gender == 'F',]
df_f <- df_f[with(df_f, order(Name,-Year)),] 
row.names(df_f) <- NULL #reset index

data
