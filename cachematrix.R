## The functions are used to cache the inverse of a matrix

## makeCacheMatrix creates a list of four functions: set, get,
## setinverse, getinverse.


makeCacheMatrix <- function(x = numeric()) {
            m <- NULL
            set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function() x
            setinverse <- function(solve) m <<- solve
            getinverse <- function() m
            list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
    }

## cacheSolve returns the inverse of the matrix in one of two 
## ways. If it exists, it returns the previously calculated and 
## cached value of the matrix's inverse. If it does not find a 
## previously calculated value, it calculates it.

cacheSolve <- function(x, ...) {
            m <- x$getinverse()
            if(!is.null(m)) {
                    message("getting cached data")
                    return(m)
			##If m is not null, output its content
            }
            data <- x$get()
            m <- solve(data, ...)
            x$setinverse(m)
            m
        ## If m is null, calculate the inverse and output it
}
