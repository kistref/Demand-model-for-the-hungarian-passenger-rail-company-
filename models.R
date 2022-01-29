second_class_szombathely=lm(formula = Second_class ~ (Peak) + ((From + To):((Day + Season + 
                                                                               Holiday + Temperature + Conditions + Distances + Price_2 + 
                                                                               Date + Population_From + Population_To))), data = database_szombathely)
summary(second_class_szombathely)

gam_szombathely=gam(econd_class ~ (Peak) + ((Number) + (Date + From + 
                                                          To + s(Distances, bs = "cr") + s(Price_2, bs = "cr") + 
                                                          Day + Season + Holiday + s(Temperature, bs = "cr") + 
                                                          Conditions + Weekday + s(Population_From, bs = "cr") + 
                                                          s(Population_To, bs = "cr"))), data = database_szombathely)
summary(gam_szombathely)

forest_szombathely=randomForest::randomForest(Second_class ~ Peak:(Number:(Price_2 + 
                                                          Distances + Population_From + Population_To + Day + Season)), 
                           data = database_szombathely, mtry = 5, ntree = 30, importance = TRUE)

summary(forest_szombathely)


#using the predict function to create the predictions.