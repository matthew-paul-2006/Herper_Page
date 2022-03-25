# Herper: Install and manage Conda packages and environments from within the R console.

**ADD BADGES HERE**

## What is Herper?

Unfortunately many tools for data analysis are not available in R, but are present in public repositories like conda. With Herper users can install, manage, record and run conda tools from the comfort of their R session.

Furthermore, many R packages require the use of these external dependencies. Again these dependencies can be installed and managed with the Conda package repository. For example 169 Bioconductor packages have external dependencies listed in their System Requirements field (often with these packages having several requirements). Herper provides an ad-hoc approach to handling external system requirements for R packages.

<br>

<img src="man/figures/pkg_deps_bar_mask-1.png" width="600px" style="display: block; margin: auto;" />


<br>

## Installation

Use the `BiocManager` package to download and install the package from our Github repository:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
      install.packages("BiocManager")
  }
BiocManager::install("Herper")
```

<br> Once installed, load it into your R session:

``` r
library(Herper)
```

<br>

## Basic Usage

The **install\_CondaTools()** function allows the user to specify required Conda software and the desired environment to install into.

``` r
install_CondaTools(tools="salmon", env="herper", pathToMiniConda = myMiniconda)
```

Using **with\_CondaEnv** allows users to run external software while taking care of the required PATH and environmental variables required to access all the dependencies installed in your new conda environment. 

``` r
res <- with_CondaEnv("herper",
                      system2(command="salmon",args = "-h",stdout = TRUE),
                      pathToMiniConda=myMiniconda)
res
```
<br>

## Going Further

For a more detailed walkthrough of using Herper and all it's functions check out this [vignette](vignettes/Herper.html).

We also have a [guide](vignettes/SetupForOutdatedGCC.html) for using Herper on system running old compilers, such as those often found on HPCs. g++ (>= 4.9.*) is required by a dependency of Herper, so installation will fail if this is not the case.

<br>

## Acknowledgements

The Herper package was developed by [Matt Paul](https://github.com/matthew-paul-2006), [Doug Barrows](https://github.com/dougbarrows) and [Thomas Carroll](https://github.com/ThomasCarroll) at the [Rockefeller University Bioinformatics Resources Center](https://rockefelleruniversity.github.io) with contributions from [Kathryn Rozen-Gagnon](https://github.com/kathrynrozengagnon).
