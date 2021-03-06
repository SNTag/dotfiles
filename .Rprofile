#!/usr/bin/env Rscript

### INTRODUCTION ===================================
## This rprofile has elements taken from:
## https://gettinggeneticsdone.blogspot.com/2013/07/customize-rprofile.html
## https://www.r-bloggers.com/fun-with-rprofile-and-customizing-r-startup/

## Don't ask me for my CRAN mirror every time
options("repos" = c(CRAN = "http://cran.rstudio.com/"))

### FUNCTIONS ======================================

#' myAlarm
#'
#' Custom alarm function. I use it when a long process is happening in the console.
mA <- function() {system("notify-send 'R notification' 'R has completed a task' --icon=dialog-information")}
#mA <- function() {system("xdg-open ~/random.mp3")}

#' mySlackAlert
#'
#' Custom Slack Alarm function. I use it when a long process is happening in the console.
#' the key was made as described here:
#' https://api.slack.com/messaging/webhooks
#' key is made available through .Renviron
mSA <- function(msg = "an R notification", key = "sl_wk") {
    key <- Sys.getenv(key)
    system(paste("curl -X POST -H 'Content-type: application/json' --data '{\"text\":\"", msg, "\"}' https://hooks.slack.com/services/", key, sep = "" ))
    print("")
}

#' mvBlogPost
#'
#' Used to move my blog posts from dropbox into my blog. Will convert
#' files into html automatically.
mvBlogPost <-
    function(blog_post) {
        file.copy(from = blog_post, to = "~/Documents/blog-hugo/content/post/")
        system(
            paste(
                "rename -f 's/\\.Rmd$/\\.html/' $HOME/Documents/blog-hugo/content/post/",
                blog_post,
                sep = ""
            ))
    }


## Not set up properly yet
# ## This avoids having to interactively select the mirror
# ## during each R session.
# ## Change to reflect the closest CRAN mirror to you.
# options(repos=c("http://cran.univ-lyon1.fr/","http://cran.r-project.org"))
# if(interactive()){
#   ## Open a new cairo device in the bottom right.
#   ## This avoids having to move/resize the plot window for each session.
#   require(grDevices)
#   X11.options(type="cairo")
#   x11(xpos=-1,ypos=-1)
# }


### ENV ============================================
## Create a new invisible environment for all the functions to go in so it doesn't clutter your workspace.
.env <- new.env()

## List objects and classes (from @_inundata, mod by ateucher)
.env$lsa <- function() {
    obj_type <- function(x) class(get(x, envir = .GlobalEnv)) # define environment
    foo = data.frame(sapply(ls(envir = .GlobalEnv), obj_type))
    foo$object_name = rownames(foo)
    names(foo)[1] = "class"
    names(foo)[2] = "object"
    return(unrowname(foo))
}

## List all functions in a package (also from @_inundata)
.env$lsp <-function(package, all.names = FALSE, pattern) {
    package <- deparse(substitute(package))
    ls(
        pos = paste("package", package, sep = ":"),
        all.names = all.names,
        pattern = pattern
    )
}

## ht==headtail, i.e., show the first and last 10 items of an object
.env$ht <- function(d) rbind(head(d,10),tail(d,10))

## Attach all the variables above
attach(.env)


### CONFIG =========================================
## pipe (%>%) is ready on start
library(magrittr)

## reconfigure prompt
options(prompt="> ")
options(continue="... ")


## disable tk menu
options(menu.graphics=FALSE)

## allows tab completion of packages in library
utils::rc.settings(ipck=TRUE)

## colouring in terminals
## if(Sys.getenv("TERM") == "xterm-256color")
##   library("colorout")

.First <- function(){
  if(interactive()){
    library(utils)
    timestamp(,prefix=paste("##------ [",getwd(),"] ",sep=""))

  }
}

.Last <- function(){
  if(interactive()){
    hist_file <- Sys.getenv("R_HISTFILE")
    if(hist_file=="") hist_file <- "~/.RHistory"
    savehistory(hist_file)
  }
}

message("n*** Successfully loaded .Rprofile ***n")
