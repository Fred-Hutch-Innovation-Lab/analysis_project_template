#!/usr/bin/env Rscript

## Convenience script to install as many common dependencies as possible
## without failing. User may still need to manually install some packages.

if (!require("renv", quietly = TRUE, character.only = TRUE)) {
  message("renv not found, did you run the setup script?")
  exit(1)
}

renv::init(restart = FALSE)

cran_packages <- c(
  "BiocManager",
  "here",
  "tidyverse",
  "Seurat"
)

bioc_packages <- c(
#   "SingleR",
#   "BiocParallel",             ## allow parallelization
#   "MAST"                      ## DGE algorithm
)

github_packages <- c(
#   "yerkes-gencore/gencoreSC"
  # "mojaveazure/seurat-disk", ## Required for azimuth
  # "satijalab/seurat-data",   ## Required for azimuth
  # "satijalab/azimuth"
)



for (package in cran_packages) {
  tryCatch(
    {
      if (!require(package, quietly = TRUE, character.only = TRUE)) {
        renv::install(package, character.only = TRUE, clean = TRUE)
        message(paste0(package, " successfully installed"))
      } else {
        message(paste0(package, " already installed"))
      }
    },
    error = function(e) {
      message(paste0("Error installing ", package, "\nOriginal message:"))
      message(e)
    }#,
    # warning=function(w){
    #   message(paste0("Warning installing ", lib, "\nOriginal message:"))
    #   message(w)
    # }
  )
}

for (package in bioc_packages) {
  tryCatch(
    {
      if (!require(package, quietly = TRUE, character.only = TRUE)) {
        renv::install(paste0("bioc::", package))
        message(paste0(package, " successfully installed"))
      } else {
        message(paste0(package, " already installed"))
      }
    },
    error = function(e){
      message(paste0("Error installing ", package, "\nOriginal message:"))
      message(e)
    }#,
    # warning=function(w){
    #   message(paste0("Warning installing ", lib, "\nOriginal message:"))
    #   message(w)
    # }
  )
}

for (package in github_packages) {
  tryCatch(
    {
      if (!require(package, quietly = TRUE, character.only = TRUE)) {
        renv::install(paste0("github::", package))
        message(paste0(package, " successfully installed"))
      } else {
        message(paste0(package, " already installed"))
      }
    },
    error = function(e){
      message(paste0("Error installing ", package, "\nOriginal message:"))
      message(e)
    }#,
    # warning=function(w){
    #   message(paste0("Warning installing ", lib, "\nOriginal message:"))
    #   message(w)
    # }
  )
}

renv::snapshot()