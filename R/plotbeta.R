#' @title plotbeta

#' perform beta coefficient barplot on Cox results
#' @param df results coxbycol function
#' @param nb number of covariates to plot
#' @param title title of the graph
#' @param size size of labels
#' @usage data(cancer)
#' @usage library(dplyr)
#' @usage cancer%>%select(3:7)->data
#' @usage df<-coxbycol(cancer$OS.TIME ,cancer$OS.STATUS ,data)
#' @usage plotbeta(df,5)
#' @examples data(cancer)
#' @examples library(dplyr)
#' @examples cancer%>%select(3:7)->data
#' @examples df<-coxbycol(cancer$OS.TIME ,cancer$OS.STATUS ,data)
#' @examples plotbeta(df,5)


plotbeta<-function(df,nb=10,title="Univariate Cox analysis",size=18){

		## load necessary packages
		  	if(!require(ggplot2)){
    	install.packages("ggplot2")
    	library(ggplot2)}
		df<-head(df,n=nb)
		
		
	
		## perform the barplot
		p=ggplot(data=df,aes(x=reorder(identifiers,NLP),y=coef.beta,fill=significance))+geom_bar(stat="identity")+
			ylim(min(df$coef.beta),max(df$coef.beta)+(max(df$coef.beta)/5))+
			coord_flip()+
			theme_minimal()+
			xlab("Covariates")+
			ylab("Coefficient beta Cox / (p.values)")+
			scale_fill_manual(values=c("lightskyblue1","plum2"))+
			geom_text(aes(label=round(pvalues,5)),hjust=0, vjust=0.5,color="navy",position= position_dodge(0),size=5,angle=0)+
			ggtitle(title) +theme(text = element_text(size = size))+theme(legend.position="bottom")

		return(p)
}
