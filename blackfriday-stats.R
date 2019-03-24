df = read.csv("BlackFriday-AgeGroups.csv")

library(userfriendlyscience)
library(rlist)


city_tests = c()

cities = c('A','B','C')

for(city in cities){
  df_city = subset(df, City_Category == city)
  
  print(paste('Games_Howell Test for City: ', city))
  print(oneway(y = df_city$Purchase, x = df_city$Age, posthoc = 'games-howell'))
  print('Means Between Age Groups:')
  print(aggregate(df_city[, c('Purchase')], list(df_city$Age), mean))
  print('-------')
  
 
  
  
}


print(oneway(y = df$Purchase, x = df$Age, posthoc = 'games-howell'))
print(aggregate(df[, c('Purchase')], list(df$Age), mean))


