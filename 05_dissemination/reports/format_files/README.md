For quarto with python/uv, you may need to register the jupyter engine
for quarto to recognize it. See discussion [here](https://github.com/quarto-dev/quarto-cli/discussions/11257).
Then you can add a `jupyter: <kernel_name>` yaml header. (see details [here](https://github.com/quarto-dev/quarto-cli/discussions/11257#discussioncomment-11765643)).
So far, I haven't found a way to set the `jupyter` setting at a higher level (e.g. _metadata.yml),
so for now I manually add it to all `.qmd` files. Also, the Rstudio 'quarto render'
button doesn't seem to find the kernel, but if you run in the terminal:

`quarto preview <qmd file> --host $(hostname)`

you will get the desired outcome.

You may want to update the `repo` codelinks to point to the code repo
