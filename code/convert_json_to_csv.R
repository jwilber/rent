

# Load in data
# Script taken from: Dan J on Kaggle
# Load packages and data
packages <- c("jsonlite", "dplyr", "purrr")
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)
data <- fromJSON("../data/train.json")
vars <- setdiff(names(data), c("photos", "features"))
data <- map_at(data, vars, unlist) %>% tibble::as_tibble(.)

testdata <- fromJSON("../data/test.json")
vars <- setdiff(names(testdata), c("photos", "features"))
testdata <- map_at(testdata, vars, unlist) %>% tibble::as_tibble(.)


save(data, file="../data/train.csv")
save(testdata, file="../data/test.csv")
