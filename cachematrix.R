# Pair of functions that cache the inverse of a matrix:
    # 1. makeCacheMatrix:   This function creates a special "matrix" object that can cache its inverse.
    # 2. cacheSolve:        This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.


# 1: Create a special object that stores a matrix and cache's its inverse

    makeCacheMatrix <- function(x = matrix()) {
        
        m <- NULL
        
        set <- function(y) {
            x <<- y
            m <<- NULL
        }
        
        get <- function() x
        
        setinverse <- function(solve) m <<- solve
       
        getinverse <- function() m
        
        list(set = set, 
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)
    }


# 2: Compute the inverse of the special "matrix" returned by makeCacheMatrix above

    cacheSolve <- function(x, ...) {
        
        m <- x$getinverse()
        
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        
        else {
            data <- x$get()
            m <- solve(data, ...)
            x$setinverse(m)
            m
        }
        
    }

