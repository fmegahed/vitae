

# from https://issueantenna.com/repo/mitchelloharawild/vitae/issues/208
swap_initials <- function(author.name) {
  sub("(.*) (.*)", "\\2, \\1.", trimws(author.name))
}

# modified from scholar package
format_publications_mod = function (pubs, author.name = NULL) 
{
  pubs2 <- pubs %>% strsplit(x = .$author, split = ",")
  pubs$author <- lapply(pubs2, function(x) {
    x <- swap_initials(x)
    x[length(x)] <- paste0("& ", x[length(x)])
    x <- paste0(x, collapse = ", ")
    ifelse(startsWith(x, "& "), sub("& ", "", x), x)
  })
  author.name2 <- swap_initials(author.name)
  res <- pubs %>% 
    arrange(desc(.data$year)) %>%
    mutate(journal = paste0("*", .data$journal, "*"), 
           Publications = paste0(
             .data$author, " (", .data$year, "). ", .data$title, ". ",
             .data$journal,". ", .data$number)) %>% 
    pull(.data$Publications)
  
  if (is.null(author.name2)) 
    return(res)
  gsub(author.name2, paste0("**", author.name2, "**"), res)
}
