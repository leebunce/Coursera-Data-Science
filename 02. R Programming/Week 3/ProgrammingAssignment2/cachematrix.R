## Functions for calculating and caching the inverse of a matrix

## This function creates a 'makeCacheMatrix' object from a matrix.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse) i <<- inverse
  get_inverse <- function() i
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)

}

## This function returns the inverse of a 'makeCacheMatrix', either by accessing a cached value or calculating the inverse afresh.

cacheSolve <- function(x, ...) {
  i <- x$get_inverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$set_inverse(i)
  i
}

#Some examples of how the functions wwork
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2)) # Create a new object
my_matrix$get() # Get the matrix
my_matrix$get_inverse() #Get the inverse, which at this point has not been calcuated so returns NULL
my_matrix$set(matrix(5:8, 2, 2)) # Set a new matrix value
my_matrix$get() # Get the new matrix
cacheSolve(my_matrix) # Calculate the inverse
cacheSolve(my_matrix) # Get the inverse value that we previously cached
