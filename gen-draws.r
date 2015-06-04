###########################################################
### Class to generate draws for play
###########################################################

###########################################################
### returns list of five lists with same mega and different
### regular numbers
###########################################################
makedraws_mm <- function() {
    out <- list()
    mega<- sample(1:15, 1, replace = FALSE)
    for (i in 1:5){
        reg <- sort(sample(1:75, 5, replace = FALSE))
        out[[length(out) + 1]] <- list(mega, I(reg))
    }
    return(out)
}

makedraws_pb <- function() {
    out <- list()
    mega<- sample(1:35, 1, replace = FALSE)
    for (i in 1:5){
        reg <- sort(sample(1:59, 5, replace = FALSE))
        out[[length(out) + 1]] <- list(mega, I(reg))
    }
    return(out)
}
###########################################################
### returns list of n complete draws
###########################################################
getdraws <- function(n, game){
    out <- list()
    for (i in 1:n){
        if (game=="mm"){out[[length(out) + 1]] <- makedraws_mm()}
        if (game=="pb"){out[[length(out) + 1]] <- makedraws_pb()}
    }
    return(out)
}

### get the numbers to play
numbers <- getdraws(2, "mm")

do.call(rbind, test <- lapply(seq_along(numbers), function(i){
    data.frame(ticket=i, unlist(numbers[[i]], recursive=FALSE))
    }))

lapply(seq_along(numbers), function(i){unlist(numbers[[i]])})
lapply(seq_along(numbers[[1]]), function(j){unlist(numbers[[1]][[j]])})
