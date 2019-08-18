#' @title load db table
#' @description DB Helper function to load table
#' @param dbConnection The DB Connection
#' @param tableToLoad The table to load
#' @keywords database
#' @export
#' @examples
db.load.table <- function(dbConnection, tableToLoad) {
    data <- dbReadTable(dbConnection, tableToLoad)

    names(data) <- gsub("_", "\\.", names(data))

    dbDisconnect(dbConnection)
    rm(dbConnection)
    data
}

#' @title save db table
#' @description DB Helper function to save table
#' @param dbConnection The DB Connection
#' @param dataToSave The data to save
#' @param tableToSaveTo The table to save
#' @keywords database
#' @export
#' @examples
db.save.table <- function(dbConnection, dataToSave, tableToSaveTo, overwrite = TRUE, append = FALSE, ...) {
    names(dataToSave) <- gsub("\\.", "_", names(dataToSave))
    dbWriteTable(
        dbConnection,
        tableToSaveTo,
        dataToSave,
        overwrite = overwrite,
        append = append,
        ...
    )
    dbDisconnect(dbConnection)
    rm(dbConnection)
    return(TRUE)
}

#' @title Update db table
#' @description DB Helper function to Update table
#' @param dbConnection The DB Connection
#' @param dataToUpdate The data to Update
#' @param tableToUpdate The table to save
#' @keywords database
#' @export
#' @examples
db.update.table <- function(dbConnection, dataToUpdate, tableToUpdate) {
    db.statement(
        dbConnection,
        paste("DELETE FROM ", tableToUpdate, " WHERE id in (", paste(dataToUpdate$id, collapse = ","), ")", sep = "")
    )
    db.save.table(
        dbConnection,
        dataToUpdate,
        tableToUpdate,
        overwrite = FALSE,
        append = TRUE
    )
    return(TRUE)
}

#' @title DB Query helper
#' @description DB Helper function to query data - probably unsafe
#' @param dbConnection The DB Connection
#' @param sqlQuery The data to save
#' @keywords database
#' @export
#' @examples
db.query <- function(dbConnection, sqlQuery) {
    res <- dbSendQuery(dbConnection, sqlQuery)
    data <- dbFetch(res)

    dbClearResult(res)
    dbDisconnect(dbConnection)
    rm(dbConnection)

    data
}

#' @title DB Statement helper
#' @description DB Helper function to execute sql statement - probably unsafe
#' @param dbConnection The DB Connection
#' @param sqlQuery The data to save
#' @keywords database
#' @export
#' @examples
db.statement <- function(dbConnection, sqlQuery) {
    res <- dbExecute(dbConnection, sqlQuery)

    dbDisconnect(dbConnection)
    rm(dbConnection)

    data
}
