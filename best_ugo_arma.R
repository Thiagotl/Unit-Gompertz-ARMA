
best.ugo <- function(serie, sf, h=6, pmax=6, qmax=6, nbest=10, link="logit",X=NA,X_hat=NA){
  
  source("ugo_fit.R")
  
  y <- ts(serie,start=c(sf[1],sf[2]),frequency=sf[3])
  
  # It initializes the AIC criteria
  fit <- uGoarma.fit(y, ma = 1, diag = 0, link = link) 
  # Minimum AIC
  aic_min<-fit$aic 
  
  cat("Minimum AIC",aic_min)
  
  model1<-model2<-model3<-model4<-model5<-0
  model6<-model7<-model8<-model8<-model10<-0
  
}

test<-best.ugo(y, sf)


