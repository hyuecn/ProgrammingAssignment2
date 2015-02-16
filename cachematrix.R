## First function, makeCacheMatrix, which creates a special vector from a matrix
##
## Example use y <- makeCacheMatrix(x) creates vector y

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}


## Inverses the matrix x from special vector created. Example of usage is cacheSolve(y)

cacheSolve <- function(x=matrix(), ...) {
  i<-x$getmatrix()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  matrix<-x$get()
  i<-solve(matrix, ...)
  x$setmatrix(i)
  i
}
