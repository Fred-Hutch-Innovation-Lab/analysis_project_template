library(here)
library(tidyverse)
library(svglite)

theme_fhil <- function(){ 
  font <- "Arial"   #assign font family up front
  
  theme_bw() %+replace%    #replace elements we want to change
    
    theme(
      text = element_text(size=16, family=font)
    )
}
theme_set(theme_fhil())

if (!exists(quote(figures))) {
  figures <- list()
} else {
  message('Figures object exists in environment, adding figures to existing obj. Be careful of overwrites.')
}

metadata <- read.csv(here('config/metadata.csv'), header = TRUE) |>
  mutate(Experiment = factor(Experiment, levels = c('SFFS', 'BM02')))

my_plot_save <- function(image, path, width, height, device='svglite'){
  if (!dir.exists(dirname(path))) {
    dir.create(dirname(path), recursive=TRUE)
  }
  if (device == 'svglite') {
    svglite::svglite(filename = path,
                     width = unit(width, 'in'), height = unit(height, 'in'))
    plot(image)
    dev.off()
  } else if (device == 'pdf'){
    pdf(file = path, width = unit(width, 'in'), height = unit(height, 'in'))
    plot(image)
    dev.off()
  }
}

write_plot_data <- function(plotdata, file, sep='\t', row.names = FALSE, quote = FALSE, ...){
  if (!dir.exists(dirname(file))) {
    dir.create(dirname(file), recursive=TRUE)
  }
  
  # Convert list columns to character vectors by concatenating elements
  plotdata <- as.data.frame(plotdata) |>
    mutate(across(where(is.list), 
                  ~map_chr(., function(x) {
                    if (is.null(x)) return(NA)
                    paste(as.character(x), collapse = ";")
                  })))
  
  write.table(plotdata, quote = quote, sep = sep, row.names = row.names, file=file, ...)
}
