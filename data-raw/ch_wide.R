## code to prepare 'ch_wide` dataset goes here

library(telemetyr)
library(dplyr)
library(tidyr)
library(stringr)
library(readr)

data("compressed")
data("tag_releases")
data("site_metadata")

example_sites = site_metadata %>%
  select(site = site_code,
         receivers) %>%
  group_by(site) %>%
  nest() %>%
  ungroup() %>%
  mutate(receiver = purrr::map(data,
                        .f = function(x) {
                          str_split(x, "\\,") %>%
                            magrittr::extract2(1) %>%
                            str_trim()
                        })) %>%
  select(-data) %>%
  unnest(cols = receiver) %>%
  mutate_at(vars(site, receiver),
            list(~ factor(., levels = unique(.))))

# prepare capture histories
ch_wide = prep_capture_history(compressed,
                               tag_data = tag_releases %>%
                                 filter(release_site == 'LLRTP'),
                               n_obs_valid = 3,
                               rec_site = example_sites,
                               delete_upstream = T,
                               location = "site",
                               output_format = "wide")

write_csv(ch_wide, "data-raw/ch_wide.csv")
usethis::use_data(ch_wide, overwrite = TRUE)
