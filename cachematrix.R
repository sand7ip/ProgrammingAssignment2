## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function
#makeCacheMatrix <- function(x = matrix()) {}
## Write a short comment describing this function
#cacheSolve <- function(x, ...) {
# Return a matrix that is the inverse of 'x'}

#sand7ip code starts here

#The makeCacheMatrix will create a special matrix, that will cache  its inverse
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) i <<- inv
    getinverse <- function() i
    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )
}


## The cacheSolve function calculate the inverse of the special "matrix" created with the above
## function, reusing cached result if it is available

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    m <- x$get()
    i <- solve(m, ...)
    x$setinverse(i)
    i
}
