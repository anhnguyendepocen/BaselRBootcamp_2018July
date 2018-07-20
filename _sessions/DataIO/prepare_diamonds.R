
# prepare diamonds

data("diamonds")
diamonds = read_csv('1_Data/diamonds.csv')
# 
# 
# diamonds = diamonds[sample(nrow(diamonds),100),1:7]
# 
# diamonds$carat[17] = "0,37"
# 
# readr::write_csv(diamonds, '1_Data/diamonds.csv',col_names = F)


a = read_csv('1_Data/airbnb_zuerich.csv')
haven::write_sas(a, '1_Data/airbnb_zuerich.sas7bdat')
