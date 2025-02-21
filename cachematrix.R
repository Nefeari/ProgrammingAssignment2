## Matrix inversion is most of the time a costly computation and there may be a 
## benefit to caching the inverse of a matrix rather than compute it repeatedly 
## over and over again.

## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(y = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() y
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## This function computes the inverse of the special matrix created by 
## makeCacheMatrix above. If everything is done correctly
## without changes it should retrieve the inverse from the cache.


cacheSolve <- function(y, ...) {
  
    inv <- y$getInverse()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    mat <- y$get()
    inv <- solve(mat, ...)
    y$setInverse(inv)
    inv
}