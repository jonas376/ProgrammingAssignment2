## makeCacheMatrix first checks if we have a matrix in our cache and, if so,
## wether the input matrix matches the cached one.

## If we have no cache (because its the first time we call the function
##or the new matrix is different from the cached one we set the variable
## sameMatrix to false. Otherwise sameMatrix is true (matrices are the same 
## so we should get the cached solution)). Note we store the matrix in a 
## global environment using the variable Y.

makeCacheMatrix <- function(x = matrix()) {
        
        if ( !exists("Y") ||!identical(Y,X)){
                Y <<- X
                sameMatrix <<- FALSE
        }
        
        else {
                sameMatrix <<- TRUE
                
        }   
        
        cacheSolve(X)
        

}


## ifsameMatrix was false or our first time cacheSolve solves for the inverse 
## matrix and stores it (globally) in variable Z. Otherwise we just 
## return the value of Z that was tored without any computation necessary. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        if (sameMatrix==FALSE) {
                Z <<- solve(X)
                print("solving")
                return(Z)
        }
        else
                print("getting from cache")
        return(Z)
}
