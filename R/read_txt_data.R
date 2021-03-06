#' @title Read in Raw .txt Format Tracker Data
#'
#' @description Reads in the raw records from telemetry receivers stored in the .txt
#' format from the Tracker software
#'
#' @author Kevin See and Mike Ackerman
#'
#' @inheritParams get_file_nms
#'
#' @import dplyr purrr readr stringr lubridate
#' @export
#' @return a data frame containing all records in the .txt receiver downloads in \code{path}

read_txt_data = function(path = ".",
                         receiver_codes = NULL) {

  # df of the .txt files
  file_df = get_file_nms(path,
                         receiver_codes) %>%
    filter(grepl(".txt$", nm),
           !grepl("\\$", nm))

  raw_df = file_df %>%
    # how many files for each receiver?
    group_by(receiver) %>%
    mutate(file_num = 1:n(),
           n_files = n()) %>%
    ungroup() %>%
    # make a list of the file_name(s)
    split(list(.$file_name)) %>%
    map_df(.id = 'file_name',
           .f = function(x) {

             cat(paste('Reading file', x$file_num, 'of', x$n_files, 'from receiver', x$receiver, '\n'))

             # read in each .txt file and assign col_names
             tmp = try(suppressWarnings(read_table2(paste(path, x$file_name, sep = "/"),
                                                    skip = 3,
                                                    col_types = c("ctciiii"),
                                                    col_names = c("date",
                                                                  "time",
                                                                  "receiver",
                                                                  "valid",
                                                                  "frequency",
                                                                  "tag_code",
                                                                  "signal_strength"))))

             # in nrow of tmp (a single txt file) is 0 or class(tmp) is error or first item is <END>...
             # return error message and nothing
             if(nrow(tmp) == 0 | class(tmp)[1] == "try-error" | tmp[1,1] == "<END>") {
               cat(paste("Problem reading in receiver", x$receiver, ", file", x$nm, "\n"))
               return(NULL)
             }

             tmp = tmp %>%
               mutate(file = x$nm) %>%
               select(file, everything())

             return(tmp)

           }) %>%
    # filter out rows that aren't actually data
    filter(!is.na(valid)) %>%
    arrange(receiver, file)

  return(raw_df)

}
