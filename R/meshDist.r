meshDist <- function(mesh1,mesh2,from=NULL,to=NULL,steps=20,ceiling=FALSE,file="default",imagedim="100x800",uprange=1,ray=FALSE,raytol=50,save=FALSE,plot=TRUE)
  {
    
    ramp <- blue2green2red(steps)
    if(!ray)
      {
        dists <- projRead(t(mesh1$vb[1:3,]),mesh2,readnormals=T)$quality
      }
    else
      {
        dists <- ray2mesh(mesh1,mesh2,tol=raytol,mindist=TRUE,strict=T)$quality
      }
    nulltmp <- which(dists > 1e5)
    if (length(nulltmp == 0))
      {
        dists[nulltmp] <- 1e5
      }
    if (is.null(from))
      {from <- 0
     }
    if (is.null(to))
      {
        tmpdist <- dists
        if(ray)
          {
            
            if (!is.null(nulltmp))
              {
                tmpdist <- dists[-nulltmp]
              }
            
            to <- quantile(abs(tmpdist),probs=uprange)    
          }
      }
        if(ceiling)
          {to <- ceiling(to)
         }
        if (ray)
          {
            from <- -to
          }       
        colseq <- seq(from=from,to=to,length.out=steps)
        coldif <- abs(colseq[2]-colseq[1])
        
        if (ray)
          {
            
            distqual <- ceiling((dists+to)/coldif)
            distqual[which(distqual < 0)] <- 1e5
          }
        else
          {
            distqual <- ceiling((dists/coldif)+1e-14)
          }
        print(to)                   
        if (save)
          {
            mesh2ply(mesh1,col=ramp[distqual],filename=file)
            widxheight <- as.integer(strsplit(imagedim,split="x")[[1]])
            png(filename=paste(file,".png",sep=""),width=widxheight[1],height=widxheight[2])
            image(1,colseq, matrix(data=colseq, ncol=length(colseq),nrow=1),col=ramp,useRaster=T,ylab="Distance in mm",xlab="",xaxt="n")
            dev.off()
          }
        colorall <- ramp[distqual]
        mesh1$material$color <- apply(mesh1$it,1:2,function(x){x <- colorall[x];return(x)})
        colramp <- list(1,colseq, matrix(data=colseq, ncol=length(colseq),nrow=1),col=ramp,useRaster=T,ylab="Distance in mm",xlab="",xaxt="n")
        
        params <- list(steps=steps,from=from,to=to,uprange=uprange,ceiling=ceiling)

        out <- list(colMesh=mesh1,dists=dists,cols=ramp[distqual],colramp=colramp,params=params,distqual=distqual)
        class(out) <- "meshDist"
        if (plot)
          {
            plot(out)
          }
        return(out)
      
  }
plot.meshDist <- function(x,from=NULL,to=NULL,steps=NULL,ceiling=NULL,output=FALSE,uprange=NULL)
  {

     if (!is.null(from) || !is.null(to) || !is.null(to) || !is.null(uprange))
       {
         colMesh <- x$colMesh
         if(is.null(steps))
           {steps <- x$params$steps
          }
          if(is.null(ceiling))
           {ceiling <- x$params$ceiling
          }
         if(is.null(uprange))
           {uprange <- x$params$uprange
          }
         dists <- x$dists
         
         if (is.null(from))
             {from <- 0
            }
         if (is.null(to))
           {to <- quantile(dists,probs=uprange)    
          }
         if(ceiling)
           {to <- ceiling(to)
          }
         ramp <- blue2green2red(steps)
         colseq <- seq(from=from,to=to,length.out=steps)
         coldif <- colseq[2]-colseq[1]
         distqual <- ceiling((dists/coldif)+1e-14)
         colorall <- ramp[distqual]
         colMesh$material$color <- apply(colMesh$it,1:2,function(x){x <- colorall[x];return(x)})
         colramp <- list(1,colseq, matrix(data=colseq, ncol=length(colseq),nrow=1),col=ramp,useRaster=T,ylab="Distance in mm",xlab="",xaxt="n")
       }
     else
       {
         colramp <- x$colramp
         colMesh <- x$colMesh
       }
     shade3d(colMesh)             
     image(colramp[[1]],colramp[[2]],colramp[[3]],col=colramp[[4]],useRaster=TRUE,ylab="Distance in mm",xlab="",xaxt="n")
     out <- list(colMesh=colMesh,colramp=colramp)
     if(output)
       {return(out)
      }
   
  }

export <- function(x,...)UseMethod("export")
export.meshDist <- function(x,save=FALSE,file="default",imagedim="100x800")
{
  ramp <- x$ramp
  widxheight <- as.integer(strsplit(imagedim,split="x")[[1]])
  mesh2ply(x$colMesh,col=x$cols)
  png(filename=paste(file,".png",sep=""),width=widxheight[1],height=widxheight[2])
  image(colramp[[1]],colramp[[2]],colramp[[3]],col=colramp[[4]],useRaster=colramp[[5]],ylab="Distance in mm",xlab="",xaxt="n")
  dev.off()
  
}
