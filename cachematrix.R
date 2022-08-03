## Put comments here that give an overall description of what your
## functions do

## Functio to make a matrix cache

makeCacheMatrix <- function(x = matrix()) {
  # The original matrix
  data <- x
  # the inverse result
  i <- NULL
  # Returns the original matrix
  get <- function () {
    data
  }
  # If a new matrix is seted, reset the inverse
  set <- function(x) {
    data <<- x
    i <<- NULL
  }
  # returns the inverse value
  getinverse <- function(...) {
    i
  }
  # set the inverse to a new value
  setinverse <- function(inv) {
    i <<- inv
  }
  
  # reference list to all functions
  list (set=set, get=get, getinverse=getinverse, setinverse=setinverse)
}


## Solve the inverse to a matrix

cacheSolve <- function(x, ...) {
  # Verify if the inverse for the matrix is already loaded
  # If not, solve and load the inverse
  m <- x$getinverse()
  if (!is.null(m)) {
    print("Returning the loaded inverse")
    return (m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinverse(m)
  print("Returning the new solved inverse")
  m
}
