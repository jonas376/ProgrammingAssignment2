## Line by line the exact same code given to us as an example

## Creating a cache for the inverse of our matrix
makeCacheMatrix <- function(X = matrix()) {
        
        Y <- NULL
        set <- function(Y) {
                ## <<- operator allows capture from outside (global variable)
                X <<- Y
                Y <<- NULL
        }
        get <- function() X
        setinv <- function(inv) Y <<- inv
        getinv <- function() Y
        ## return a list to be used by cacheSolve
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}

## Solving for the inverse, but checking if we have the answer first
cacheSolve <- function(X, ...) {
        Y <- X$getinv()
        ## if Y is non-empty get the inverse do not solve
        if(!is.null(Y)) {
                message("getting cached data")
                return(Y)
        }
        ## otherwise solve for the inverse
        data <- X$get()
        Y <- solve(data, ...)
        X$setinv(Y)
        Y
}