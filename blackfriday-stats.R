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


library(dplyr)

df_test = subset(df, City_Category == 'A')
df_test = sample_n(df_test, 5000)

print(oneway(y = df_test$Purchase, x = df_test$Age, posthoc = 'games-howell'))
print(aggregate(df_test[, c('Purchase')], list(df_test$Age), mean))


oneway.test(Purchase ~Age, data = df_test, var.equal = FALSE)


LM = lm(Purchase ~ Age , data = df)
summary(LM)












