## Programming assignment No 2 
## 
## Created by Anderson Ospino 16- August 2014

## This R script contains two functions, which work together in order to cache the value of 
##  the inverse of a matrix , in this way the computation time of finding the inverse of the matrix
## can be saved, in case it`s needed to find it's value more than once

## Function no 1: makeCacheMatrix()
## Arguments : x: it's the matrix, for which the user wants to find the inverse
## output: a "special matrix object" which consists of  a list of four elements(set, get setInv, getInv);  Each one of this elements is a function 

makeCacheMatrix <- function(x = matrix()) {
    Inv <- NULL
    
    # set_matrix function assigns the value y, which the user must provide to the "special" matrix object, so
    # it changes the matrix for which the user wants to compute the inverse
    set_matrix <- function(y) {
        x <<- y
        Inv <<- NULL
    }
    # get_matrix function displays  current value of the matrix
    get_matrix <- function() x
    
    # set_Inverse function feeds the object, so that the Inverse of the matrix is stored
    set_Inverse <- function(Inverse) Inv <<- Inverse
    
    # get_Inverse displays the inverse of the desired matrix
    get_Inverse <- function() Inv
    list(set = set_matrix, get = get_matrix,
         setInv = set_Inverse,
         getInv = get_Inverse)
}


## Function No 2: cacheSolve()
## Arguments : x: it's the matrix, for which the user wants to find the inverse
## output: the inverse of 'x' matrix
## general process: function first evaluates if the Inverse of the function has already been computed
## if that`s the case if just displays the stored value, if not, it computes the inverse. 
## Note: The imput of the matrix must have been generated by the makeCacheMatrix() function.


cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    Inv <- x$getInv()
    if(!is.null(Inv)) {
        message("getting cached data")
        return(Inv)
    }
    data <- x$get()
    Inv <- solve(data)
    x$setInv(Inv)
    Inv
    
}
