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

### bar plot graph output
```r
library(patchwork)
## nb : number of covariates to put on the graph
p1<-plotbeta(df,nb=5,title="",size=16)
p2<-plotnlphr(df,nb=5,title="",size=16)
p1+p2
```
![plot](https://github.com/cdesterke/loopcolcox/blob/main/patchwork.png)

### Volcanoplot output (added in version 1.0.1)
```r

## font.size : size of the font in the graph
coxvolcano(df,font.size=18)
```
![plot](https://github.com/cdesterke/loopcolcox/blob/main/volcano.png)

### references article using this software:

> Christophe Desterke, Yao Xiang, Rima Elhage, Clémence Duruel, Yunhua Chang, Ahmed Hamaï 2023. "Ferroptosis Inducers Upregulate PD-L1 in Recurrent Triple-Negative Breast Cancer".Cancers (Basel). 2023 Dec 28;16(1):155. https://doi.org/10.3390/cancers16010155.
