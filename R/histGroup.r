histGroup <- function(data,groups, main=paste("Histogram of" , dataname),xlab=dataname,ylab,col=NULL, alpha=0.5,breaks="Sturges")
  {
   
    dataname <- paste(deparse(substitute(data), 500), collapse="\n")
    
    histo <- hist(data,plot=FALSE,breaks=breaks)
    

    if(!is.factor(groups))
      {
        groups <- as.factor(groups)
      }
    lev <- levels(groups)
    nlev <- length(lev)
    if (is.null(col))
      colo <- rainbow(nlev,alpha=alpha)
    else
      {
        if (length(col) != nlev)
          stop("length of 'col' must match number of groups")
        else if (is.character(col))
          colo <- col
        else
          {
            rgbfun <- function(x)
              {
                alpha <- alpha*255
                x <- rgb(x[1],x[2],x[3],maxColorValue = 255,alpha=alpha)
                return(x)
              }
            colo <- apply(col2rgb(col),2,rgbfun)
            
          }
      }
    testrun <- 0
    for( i in 1:nlev)
     { testrun[i] <-  max(hist(data[groups==lev[i]],breaks=histo$breaks,plot=F)$counts)
     }
   ylim <- max(testrun)
    ylim <- ylim+0.15*ylim
    hist(data[groups==lev[1]],breaks=histo$breaks,col=colo[1],main=main,xlab=xlab,ylab=ylab,ylim=c(0,ylim))
    for (i in 2:nlev)
      {
        hist(data[groups==lev[i]],breaks=histo$breaks,col=colo[i],add=T)
      }
  }
