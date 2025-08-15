# Analysis project template

The structure is inspired by the [gin-tonic](https://gin-tonic.netlify.app/standard/) project and the file naming conventions of [The Turing Way](https://book.the-turing-way.org/reproducible-research/rdm/rdm-storage#rr-rdm-storage-organisation).


If you are starting the project for the first time, run the `00_setup/python_setup.sh` or `00_setup/r_setup.sh` scripts as necessary to initiate project-level package management. If you're checking out an existing project, us `python_join.sh` or `r_join.sh` as necessary.

```
00_setup                          # Scripts to run the first time you start, join, or clone a project
| *<.def,.dockerfile>             # Compute environments defining system dependencies needed for packages
│ py_setup.sh                     # Setup project-level python package management through UV
│ py_join.sh                      # Use existing project .venv and package cache
| py_install_common_deps.sh       # Quick startup for adding common Python packages to UV project
│ r_setup.sh                      # Setup project-level R package manamenet with Renv
│ r_join.sh                       # Use existing project library or public cache
| r_install_common_deps.r         # Quick startup script for adding common R packages to Renv project
|
01_documentation                  
│ project-notebook.txt            # Running account of efforts
│ project-details.txt
02_data                           # Data generated as *inputs* to analysis
└─── 01_raw-data                  # Symlinks, copies, or directions for retrieving raw data
└─── 02_data-processing           # Code or receipts from data processing
└─── 03_processed-data            # processed data (include instructions for retrieval)
03_analysis
└─── 01_config                    # Project level definitions that affect multiple scripts.
└─── 02_src                       # Source files for helper code/functions
└─── 03_notebooks                 # Data exploration and manipulation experiments
│   └─── 01_primary-analyses      # Main workflow notebooks
│       │   01_first-script.rmd/ipynb/etc
│       │   02...
│   └─── 02_secondary-analyses    # Separate lines of inquiry that may not continue
│       │   02.1_spinoff.rmd/ipynb/etc                           
└─── 04_checkpoints               # Saved objects reflecting a checkpoint after computationally expensive portions of an analysis
│
04_results                        # Tables, models, etc that represent outputs of an analysis for dissemination
└─── tables
└─── figures
│   qc_pics.svg
│   └─── figure-scripts           # Isolated script to iterate on figures for publication
│       │   qc_pics.R
│   └─── figure-data              # Tables of values to accomapny generated figures, for reference & publication
│       │   qc_pics.txt
05_disseminations                 # More comprehensive outputs. Reports, slides, tweets, manuscripts, etc.
```

