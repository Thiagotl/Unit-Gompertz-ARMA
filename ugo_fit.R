rm(list = ls())




uGoarma.fit <-function(y, ar = NA, ma = NA, tau = .5, link = "logit", h = NA, 
                       diag = 0, X = NA, X_hat = NA){
  
  source("ugo_functions.R")
  
  if (min(y) <= 0 & max(y) >= 1) {
    stop("OUT OF RANGE (0,1)!")
  }
  
  if(is.ts(y) == T) {
    
    freq<-frequency(y)
    } 
  else{
    
    stop("data can be a time-series object")
  }
  
  
  z<-c()
  maxit1<-50
  p <- max(ar)
  q <- max(ma)
  n <- length(y)
  m <- max(p,q,na.rm=T)
  y1 <- y[(m+1):n]
  p1 <- length(ar)  
  q1 <- length(ma)
  error <- rep(0,n) 
  eta <- rep(NA,n)
  
  
  
}

uGoarma.fit(y)
