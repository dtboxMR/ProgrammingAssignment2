## At first we are going to create a special "matrix object" which is a list 
## containing 4 functions that can set the value of the matrix, 
## set the value of its inverse and also get those values respectively. Then 
## we'll create another function which takes a "matrix object" and returns 
## its inverse either by taking it from the cache if it is there 
## or otherwise it calculates the inverse and puts it into the cache.

## The following function creates a matrix object, which can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        inv<<-NULL
        setmatrix<-function(y){
                x<<-y
                inv<<-NULL
        } 
        setinv<-function(x=matrix()){
                inv<<-x
        }
        getmatrix<-function() x
        getinv<-function() inv
        
        list(setmatrix=setmatrix, setinv=setinv, getmatrix=getmatrix, 
             getinv=getinv)
}


## The following fuction gets the inverse of the matrix by calculating it 
## if it is not in the cache or it takes the inverse from the cache 
## if it's already there

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        mtr<-x$getinv()
        if (is.null(mtr)) {
                message("calculating")
                inv_mtr<-solve(x$getmatrix())
                x$setinv(inv_mtr)
                inv_mtr
        }
        else {
                
                message("loading from cache")
                return(mtr)
                
        }
        
        
}
