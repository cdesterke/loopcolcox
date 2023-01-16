# loopcolcox
R-package to perform loop of univariate cox analyses on columns of a dataframe



### compute analyses
```r
library(devtools)
install_github("cdesterke/loopcolcox")
```



### compute analyses
```r
##load functions from R files and data
source("script.R")
source("plotbeta.R")
source("plotnlphr.R")

load(file="cancer.rda")
ls()
library(dplyr)
cancer%>%select(3:7)->data
df<-coxbycol(cancer$OS.TIME ,cancer$OS.STATUS ,data)
head(df)
```


![res](https://github.com/cdesterke/loopcolcox/blob/main/results.png)

### graph output
```r
library(patchwork)
p1<-plotbeta(df,nb=5,title="",size=16)
p2<-plotnlphr(df,nb=5,title="",size=16)
p1+p2
```
![plot](https://github.com/cdesterke/loopcolcox/blob/main/patchwork.png)
