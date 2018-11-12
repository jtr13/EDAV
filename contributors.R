# reads in contributors and updates contributor csv
# this script is adapted from r4ds (https://r4ds.had.co.nz/)

library(tidyverse)

# read in json of all contributors
contribs_all_json <- gh::gh("/repos/:owner/:repo/contributors",
                            owner = "jtr13",
                            repo = "EDAV",
                            .limit = Inf
)

# convert to tibble, store login
contribs_all <- tibble(
  login = contribs_all_json %>% map_chr("login"),
)

# read in old, merge with new
contribs_old <- read_csv("contributors.csv", col_types = list())
contribs_new <- contribs_all %>% anti_join(contribs_old)

# Get info for new contributors
needed_json <- map(
  contribs_new$login,
  ~ gh::gh("/users/:username", username = .x)
)

# store as tibble
info_new <- tibble(
  login = map_chr(needed_json, "login", .default = NA),
  name = map_chr(needed_json, "name", .default = NA)
)

# add old to the new
info_old <- contribs_old %>% select(login, name)
info_all <- bind_rows(info_old, info_new)

# write to csv
contribs_all <- contribs_all %>%
  left_join(info_all) %>%
  arrange(login)
write_csv(contribs_all, "contributors.csv")




