#' @title Show message helper
#'
#' @description Message output helper with option to stop execution
#' @param msg The message to be output
#' @param shouldStop Whether the message should stop execution
#' @keywords user messaging
#' @export
#' @examples
#' show.message("Message to show")
#' show.message("Error to show", TRUE)
show.message <- function(msg, shouldStop = FALSE) {
    if (shouldStop) {
        stop(paste("  - ", msg, "\n", sep=""))
    } else {
        cat(paste(msg, "\n", sep=""))
    }
}


#' @title Show Error message
#'
#' @description Error level wraper for outputing message to the user
#' @param msg The message to be output
#' @param shouldStop Whether the message should stop execution
#' @keywords user messaging
#' @export
#' @examples
#' show.error("Error to show")
#' show.error("Message to show", FALSE)
show.error <- function(msg, shouldStop = TRUE) {
    show.message(crayon::red(paste("Error:", msg)), shouldStop)
}

#' @title Show Warning message
#'
#' @description Warning level wraper for outputing message to the user
#' @param msg The message to be output
#' @param shouldStop Whether the message should stop execution
#' @keywords user messaging
#' @export
#' @examples
#' show.warning("Warning to show")
#' show.warning("Error to show", FALSE)
show.warning <- function(msg, shouldStop = FALSE) {
    show.message(crayon::yellow(paste("Warning:", msg)), shouldStop)
}

#' @title Show Info message
#'
#' @description Info level wraper for outputing message to the user
#' @param msg The message to be output
#' @param shouldStop Whether the message should stop execution
#' @keywords user messaging
#' @export
#' @examples
#' show.warning("Message to show")
#' show.warning("Info to show", FALSE)
show.info <- function(msg, shouldStop = FALSE) {
    show.message(crayon::blue(paste("Info:", msg)), shouldStop)
}