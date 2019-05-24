library(data.table)
library(dplyr)
library(Hmisc)
setwd("/home/nicole/Documents/Spring 2018/Masters Thesis")

s <-readRDS('final.rds')

s[s==0] <- NA
country <- unique(sg$geo)
variables <- c('debt_to_value','debt_to_gdp','stlt','fixed_per','SFL_per','GDP','int_paid_per','app_int_rate_real','bank_size')
key <- c('debt_to_value','debt_to_gdp','stlt')
head(sg)

# S11
head(s)
m <- s[s$sector %in% "S11",]
head(m)

dfc <- data.frame(geo=character(),
                 key=character(),
                 variable=character(),
                 corr=numeric(),
                 pval=numeric(),
                 stringsAsFactors=FALSE)

for(k in key){
  for(c in country){
    for(v in variables){
      n <- list(k,v)
      if(k!=v){
        temp <- rcorr(as.matrix(m[m$geo %in% c, names(m) %in% n]), type = c("pearson"))
        r<-temp$r[1,][2]
        p<-temp$P[1,][2]
        de<-data.frame(c,k,v,r,p)
        names(de)<-c("geo","key","variable","corr","pval")
        dfc <- rbind(dfc, de)
      }
    }
  }
}
head(dfc)

df <-setnames(dfc,old="geo",new="group")
      
row.names(df) <- NULL
dval <- df[df$key %in% "debt_to_value", !(names(df) %in% "key")]
dgdp <- df[df$key %in% "debt_to_gdp", !(names(df) %in% "key")]
dstlt <- df[df$key %in% "stlt", !(names(df) %in% "key")]
dval <- reshape(dval,idvar="group", timevar="variable",direction="wide")
dgdp <- reshape(dgdp,idvar="group", timevar="variable",direction="wide")
dstlt <- reshape(dstlt,idvar="group", timevar="variable",direction="wide")

write.csv(dval,"s11dval.csv")
write.csv(dgdp,"s11dgdp.csv")
write.csv(dstlt,"s11dstlt.csv")
