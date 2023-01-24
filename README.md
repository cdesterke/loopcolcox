# loopcolcox
R-package to perform loop of univariate cox analyses on columns of a dataframe



### compute analyses
```r
library(devtools)
install_github("cdesterke/loopcolcox")
```



### compute analyses
```r
##load package
library(loopcolcox)

data(cancer)
library(dplyr)
cancer%>%select(3:7)->data
df<-coxbycol(cancer$OS.TIME ,cancer$OS.STATUS ,data)
head(df)
```


![res](https://github.com/cdesterke/loopcolcox/blob/main/results.png)

### graph output
```r
library(patchwork)
## nb : number of covariates to put on the graph
p1<-plotbeta(df,nb=5,title="",size=16)
p2<-plotnlphr(df,nb=5,title="",size=16)
p1+p2
```
![plot](https://github.com/cdesterke/loopcolcox/blob/main/patchwork.png)
