###########################################################
### Class to generate draws for play
###########################################################

###########################################################
### returns list of five lists with same mega and different
### regular numbers
###########################################################
makedraws <- function() {
    out <- list()
    mega<- sample(1:15, 1, replace = FALSE)
    for (i in 1:5){
        reg <- sort(sample(1:75, 5, replace = FALSE))
        out[[length(out) + 1]] <- list(mega, I(reg))
    }
    return(out)
}

###########################################################
### returns list of n complete draws
###########################################################
getdraws <- function(n){
    out <- list()
    for (i in 1:n){
        out[[length(out) + 1]] <- makedraws()
    }
    return(out)
}

### get the numbers to play
numbers <- getdraws(2)
