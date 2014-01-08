#' projects the vertices of a mesh along its normals onto the surface of another one.
#' 
#' projects the vertices of a mesh onto the surface of another one by searching
#' for the closest point along vertex normals on the
#' target by for each vertex.
#'
#' @param mesh1 mesh to project. Can be an object of class "mesh3d" or path to
#' an external mesh file (ply, obj, stl).
#' @param tarmesh mesh to project onto. Can be an object of class "mesh3d" or
#' path to an external mesh file (ply, obj, stl).
#' @param tol numeric: maximum distance to search along ray, closest Euclidean
#' distance will be used, if tol is exceeded.
#' @param inbound inverse search direction along rays.
#' @param sign logical: if TRUE, signed distances are returned.
#' @return returns projected mesh with additional list entries:
#' \item{quality }{integer vector containing a value for each vertex of \code{x}: 1 indicates that a ray has intersected 'tarmesh' within the given threshold, while 0 means not}
#' \item{distance }{numeric vector: distances to intersection}
#' @author Stefan Schlager
#' @seealso \code{\link{ply2mesh}}, \code{\link{closemeshKD}}
#' @importFrom Rvcg vcgRaySearch
#' @export
ray2mesh <- function(mesh1, tarmesh, tol=1e12, inbound=FALSE, mindist=FALSE,...)
{ 
    if (is.character(tarmesh))
        tarmesh <- vcgImport(tarmesh)
    if (inbound)
        mesh1$normals <- -mesh1$normals
    outmesh <- vcgRaySearch(mesh1,tarmesh,mindist=mindist)
    return(outmesh)
}
