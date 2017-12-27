# Week 3 Practices
library(readr)

# Question 1
company_data <- read_csv('https://d3c33hcgiwev3.cloudfront.net/_cf0fd3361e05f5be5304b07b771bad48_company_data.csv?Expires=1508112000&Signature=TJmNkgO4me2CeV8ZCqdb73J7FEmQzDNPAgMoLUr8g-KaDaNIpGV-s3gQCjpNHWRMCtR28RKQ2RQ6HOIRV8mJ7meNONWKhvOK4fYegUoX9yOyHxLlq~jG00x4vSm2BpX54wZLs1EFxlHO4Vz~TjJtgpMzsnHI1jeG3CzUuH8jwlE_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A')
fit1 <- lm(y ~ x1, company_data)

#Question 2
coef(fit1)
lm(y ~ x1 + x2 + x3, company_data)

# Question 3
confint(fit1)

#Question 4
summary(fit1)
