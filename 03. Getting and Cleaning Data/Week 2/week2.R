# Question 1 --------------------------------------------------------------
library(httr)

gitapp <- oauth_app("github",
                    key = "6ccae0129901ee323c04",
                    secret = "ec9a00c4f6fc2c1f29d7c96b0646c453b70ee0f2")

github_token <- oauth2.0_token(oauth_endpoints("github"), gitapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
output[[11]]$updated_at

# Question 2 --------------------------------------------------------------
library(sqldf)
acs <- read_csv("3. Getting and Cleaning Data/Week 2/getdata_data_ss06pid.csv")
sqldf("select * from acs where AGEP < 50")


# Questionn 4 -------------------------------------------------------------
web <- readLines('http://biostat.jhsph.edu/~jleek/contact.html')
nchar(web[10])
nchar(web[20])
nchar(web[30])
nchar(web[100])


# Question 5 --------------------------------------------------------------
getdata <- read.fwf('3. Getting and Cleaning Data/Week 2/getdata_wksst8110.for', skip=4, widths=c(12, 7,4, 9,4, 9,4, 9,4))
sum(getdata[,4])
