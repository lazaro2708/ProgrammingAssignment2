#CacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix

## this function create an object that cache the inverse of that matrix 

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() {
        x
        }
        setinv<- function(inverse) {
        m <<-inverse
        }
        getinv <- function() {
        m
        }
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## compute the inverse of the matrix returned by the first function  

cacheSolve <- function(x, ...) {

        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)%*%data
        x$setinv(m)
        m
        
}
