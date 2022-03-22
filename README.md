# Herper: Install and manage Conda
packages and environments from within the R console.


**ADD BADGES HERE**

## What is Herper?

Unfortunately many tools for data analysis are not available in R, but
are present in public repositories like conda. With Herper users can
install, manage, record and run conda tools from the comfort of their R
session.

Furthermore, many R packages require the use of these external
dependencies. Again these dependencies can be installed and managed with
the Conda package repository. For example 169 Bioconductor packages have
external dependencies listed in their System Requirements field (often
with these packages having several requirements) \[03 September, 2020\].

<img src="pkg_deps_bar_mask-1.png" width="1000px" style="display: block; margin: auto;" />

Herper provides an ad-hoc approach to handling external system
requirements for R packages.

<br>

## Installation

Use the `BiocManager` package to download and install the package from
our Github repository:

```
if (!requireNamespace("BiocManager", quietly = TRUE)) {
      install.packages("BiocManager")
  }
BiocManager::install("Herper")
```

<br> Once installed, load it into your R session:

```
library(Herper)
```

## Usage

The **install\_CondaTools()** function allows the user to specify
required Conda software and the desired environment to install into.

```
install_CondaTools(tools="salmon", env="herper", pathToMiniConda = myMiniconda)
```

Using **with\_CondaEnv** allows users to run external software while taking care of the required PATH and environmental variables required to access all the dependencies installed in your new conda environment. 

``` r
res <- with_CondaEnv("herper",
                      system2(command="salmon",args = "-h",stdout = TRUE),
                      pathToMiniConda=myMiniconda)
res
```

Check the [documentation website]() for more detailed information and use case examples.

The Herper package was developed by [Matt
Paul](https://github.com/matthew-paul-2006), [Doug
Barrows](https://github.com/dougbarrows) and [Thomas
Carroll](https://github.com/ThomasCarroll) at the [Rockefeller
University Bioinformatics Resources
Center](https://rockefelleruniversity.github.io) with contributions from
[Kathryn Rozen-Gagnon](https://github.com/kathrynrozengagnon).