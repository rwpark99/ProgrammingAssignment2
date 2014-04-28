## ver 0.5
## Calculate Inverse of a Matrix using cache.
## If cached Inverse of a Matrix exists in the memory, then display it.
## Or, there is no one, calculate it.
## To do this, use a special function containing 4 sub-functions.

## "makeCacheMatrix": This function contains 4 sub-functions in it.
## Why use this complicating function?
## -> To hold the calculation results in memory without noticing it.
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        # set <- function(y) {
        #        x <<- y
        #        #m <<- NULL
        #}
        get <- function() {
                x
        }
        setInverse <- function(Inverse) {
                m <<- Inverse
        }
        getInverse <- function() {
                m
        }  
        list(#set = set, 
                get = get, 
                setInverse = setInverse,
                getInverse = getInverse)
}

## Cacalute the inverse of of a matrix .
## If it was already calculated and cashed,  then the cached results are simply returned.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()  # get the cashed data
        if(!is.null(m)) {    # If cashed, 
                message("getting cached data")
                return(m)
        }
        data <- x$get()      # If there is no cashed data, then use the new data
        m <- solve(data, ...)# Calculate 'Inverse of a Matrix'
        x$setInverse(m)      # Cashe the solved matrix into memory.
        m
}

## An example how to use the functions
matrix.1 <- c(0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0) 
matrix.1 <- matrix(matrix.1, ncol=5, byrow=TRUE) 

fx.inverse <- makeCacheMatrix(matrix.1)
matrix.1                          #original matrix
cacheSolve(fx.inverse)            #New solved matrix (You will not see any message except solved matrix)
cacheSolve(fx.inverse)            #CASHED solved matrix. You wil see "getting cached data".  
matrix.1%*%cacheSolve(fx.inverse) #check whether the solved matrix is correct 
#(If you see diagnonal matrix, then it's correct!).
