## The following functions are used to create a special object that stores a matrix and caches its inverse. 


## The first function, makeCacheMatrix creates a special “matrix”, which is really a list containing a function to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse


makeCacheMatrix <- function(x = matrix()) 
  {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(Inverse) m <<- Inverse
  getInverse <- function() m
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  }


## The function below solve the cached matrix. Note: Make sure to supply invertible matrix when you test it!!!

cacheSolve <- function(x, ...) 
  {
  m <- x$getInverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m      
  
  ## Return a matrix that is the Inverse of 'x'
  }
