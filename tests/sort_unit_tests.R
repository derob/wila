# quick and dirty to locate the longest running tests
x <- readLines('C:/src/github_jm/wila/tests/x64/Debug/timings.txt')
library(stringr)
y <- stringr::str_subset(x, 'completed in')
z <- str_split(y, ' +completed in +')
a <- purrr::transpose(z)
library(tibble)
runtimes <- as.numeric(str_replace_all(as.character(a[[2]]), 's', ''))
d <- tibble(desc=as.character(a[[1]]), runtime=runtimes)
d %>% arrange(-runtime)
