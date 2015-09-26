## This script allows the user to generate a matrix-like object that can
## store its inverted matrix for later use.

## Usage example : 
# mat=makeCacheMatrix(matrix(c(1,2,3,2,2,4,3,4,2),nrow=3,ncol=3))
# cacheSolve(mat)
# mat$set(matrix(c(1,2,3,2,1,4,3,4,1),nrow=3,ncol=3))
# cacheSolve(mat)


## makeCacheMatrix:
# Creates the matrix-like object that can store it's inverse
#
# Arguments:
#     x: matrix that will be inversed
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    set_inverse <- function(solve) inv <<- solve
    get_inverse <- function() inv
    list(set = set, get = get,
         set_inverse = set_inverse,
         get_inverse = get_inverse)
}


## cacheSolve
# Solves the matrix-like object created by makeCacheMatrix
# and manages the cache
#
# Arguments:
#     x: matrix-like object, created from makeCacheMatrix,
#        to solve and cache
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$get_inverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$set_inverse(inv)
    inv
}
