check.lm <- function(dat.array,path=NULL,prefix="",suffix=".ply",col=3,radius=1,alpha=0.7,begin=1,render="w")
  {
    n <- dim(dat.array)[3]
    name <- dimnames(dat.array)[[3]]
    i <- begin
    if (render=="w")
      {rend <- wire3d
     }
    else
      {
        rend <- shade3d
      }
open3d()
    while (i <= n)
      {
        
        tmp.name <- paste(path,prefix,name[i],suffix,sep="")
        spheres3d(dat.array[,,i],radius=radius)
        if (!is.null(path))
          {
            rend(file2mesh(tmp.name),col=col,alpha=alpha)
          }
        answer <- readline(paste("viewing #",i,"next"))
        i <- i+1

        rgl.clear()
      }
  }