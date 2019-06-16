## `makeCacheMatrix`function creates a special "matrix"    
## `cacheSolve` function cimputes inverse of `makeCacheMatrix`function and retrieves the inverse from the cache

## `makeCacheMatrix`function creates a special "matrix" object that can cache its inverse.    

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(i) inverse <- i
	getinverse <- function() inverse
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## `cacheSolve` function cimputes inverse of `makeCacheMatrix`function and retrieves the inverse from the cache

cacheSolve <- function(x, ...) {
        inverse <- x$getinverse()
        if(!is.null(inverse)) {
        	message("Getting Cache Inversed")
        	return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setinverse(inverse)
        inverse
}
