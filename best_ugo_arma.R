
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
  
  # Data Frame for results
  
  best_aic <- rep(Inf, nbest)
  
  best <- data.frame(
    p = integer(nbest),
    q = integer(nbest),
    AIC = rep(Inf, nbest)
  )
  
  tot<-0  # combinations (p, q) tested
  bug<-0
  
  for (p in 0:pmax) {
    
    for (q in 0:qmax){
      
      ar1 <- if(p==0) NA else 1:p
      ma1 <- if(p==0) NA else 1:q
      
      if(!is.na(ar1) | !is.na(ma1)){
        message("Testing (p, q) = (", p, ", ", q, ")")
        
        fit_ugo <- uGoarma.fit(y, ar = ar1, ma = ma1, tau = tau, link = link, X = X, X_hat = X_hat)
        
        tot<-tot+1
        
        if(fit_ugo$aic != 0){
          message("NO CONVERGENCE for (p, q) = (", p, ", ", q, ")")
          bug <- bug + 1
          next
        }
        
        if(aic_min > fit_ugo$aic){
          
          aic_min <- fit_ugo$aic
          best_model_aic <- fit_ugo$model
          message("########################")
          message("New Best AIC: ", aicmin)
          
        }
        
      }
      
      
      
      
      
    }
  }
  
  
}

test<-best.ugo(y, sf)


