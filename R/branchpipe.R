#' @title "branch and merge"
#'
#' @description Create more complex data flows in a series
#' of magrittr/dplyr pipes.
#'
#' @return An object of the same time as .data, as with all pipe verbs.
#' @export
#'
#' @examples
#'
#' TIRED
#' mtcars %>%
#'     filter(wt > 2) ->
#'     heavy_cars
#'
#' heavy_cars %>%
#'     group_by(gear) %>%
#'     count() %>%
#'     filter(n > 8) %>%
#'     left_join(heavy_cars)
#'
#' WIRED?
#' mtcars %>%
#'     filter(wt > 2) %>%
#'     branch('heavy_cars') %>%
#'         group_by(gear) %>%
#'         count() %>%
#'         filter(n > 8) %>%
#'     merge() %>%
#'     left_join(x = ., y = heavy_cars)
#'
branch <- function(.data, branch_name, ...) {
    # this is certainly not the right way to do this
    temp_var_name <- paste(sample(x = c(LETTERS, 0:9), size = 10),
                           collapse = '')
    assign(x = temp_var_name, value = .data)
    attr(x = data, which = 'temp_var_name') <- temp_var_name
    return(.data)
}

merge <- function(.data, ...) {
    # not sure what to do here
}
