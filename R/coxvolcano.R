#' @title coxvolcano

#' perform volcanoplot between beta coefficient and p-values from Cox
#' @param df results coxbycol function
#' @param font.size size of font in the graph
#' @usage library(loopcolcox)
#' @usage data(cancer)
#' @usage library(dplyr)
#' @usage cancer%>%select(3:7)->data
#' @usage df<-coxbycol(cancer$OS.TIME ,cancer$OS.STATUS ,data)
#' @usage coxvolcano(df,20)
#' @examples library(loopcolcox)
#' @examples data(cancer)
#' @examples library(dplyr)
#' @examples cancer%>%select(3:7)->data
#' @examples df<-coxbycol(cancer$OS.TIME ,cancer$OS.STATUS ,data)
#' @examples coxvolcano(df,20)



coxvolcano<-function(df,font.size=20){

	## load necessary packages
	  	if(!require(ggplot2)){
    install.packages("ggplot2")
    library(ggplot2)}

	  	if(!require(ggrepel)){
    install.packages("ggrepel")
    library(ggrepel)}

		if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)}

	## compute a new column to discriminates three colors on graph

	df$conca<-paste(df$significance,df$prognosis,sep=".")
	df%>%mutate(conca=recode(conca,"no.favorable"="not.significant","no.unfavorable"="not.significant"))->df
	df%>%mutate(conca=recode(conca,"no.unfavorable"="not.significant"))->df


	## draw the volacanoplot
	ggplot(data=df,mapping=aes(x=coef.beta,y=NLP,col=conca))+geom_point()+
		theme_minimal()+
		scale_color_manual(values=c("grey", "royalblue", "tomato")) +
		geom_hline(yintercept=c(1.33), col="darkgreen",linetype="dashed",size=1) +
		geom_vline(xintercept=c(0), col="darkgreen",linetype="dashed",size=1) +
		geom_text_repel(data=df,aes(x=coef.beta, y=NLP,label=identifiers))+
		theme(text = element_text(size = font.size))+
		xlab("Cox beta.coefficients")+
		ylab("Negative log10 Cox p-values")+
		theme(legend.position="none")



}
