Project setup steps:

1. Use the template repo to create a new repository for your project. Clone the 
project to `/fh/fast/_IRC/FHIL/grp/analyses/`
2. Use the quicklanch repos to create an Rstudio (or Jupyter) IDE on a compute 
node.
  - https://github.com/Fred-Hutch-Innovation-Lab/jupyter-lab-launcher
  - https://github.com/Fred-Hutch-Innovation-Lab/rstudio-server-launcher
3. Save a copy here (00_setup) of the Apptainer definition file(s) used to create the compute 
environment used for this project.
4. Run the `py_setup.sh` and/or `r_setup.sh` files as needed. These are meant to
quickly set up `uv` and `renv` to manage python and R packages respectively, so 
if they don't work for some reason, try to set those dependency managers up yourself.
5. Run `r/py_install_common_deps.sh` as needed to quickly sync the project cache
with the shared cache to quickly grab libraries.
6. Move to `01_documentation` and start preparing for the analysis!
