
library(magrittr)
library(ymlthis)
library(yaml)
library(rmarkdown)

# copy readme

file.copy("README.md", "index.md", overwrite = T)

# use this to set up top bar

yml_empty() %>%
  yml_site_opts(
    name = ,
    output_dir =  ".",
  ) %>%
  yml_navbar(
    title = "Herper",
    left = list(
      navbar_page("Home", href = "index.html"),
      navbar_page("Guides", menu=list(
        navbar_page(text="Walkthrough",href="vignettes/Herper.html"),
        navbar_page(text="Outdated GCC",href="vignettes/SetupForOutdatedGCC.html"))
        #,
      # navbar_page("Reference",menu=),
      # navbar_page("Change Log",menu=),
  )),
  right = list(
    navbar_page("Getting help!",href="https://github.com/RockefellerUniversity/Herper/issues"),
    navbar_page(icon="ion-social-twitter",href="https://twitter.com/Rockefeller_BRC"))
  ) %>%
  yml_output(html_document(toc = TRUE,theme="cosmo", toc_float=TRUE,highlight = "textmate")) %>%
  as.yaml %>%
  writeLines(con = "_site.yml")

# set up top bar but small correction for vignettes

yml_empty() %>%
  yml_site_opts(
    name = ,
    output_dir =  ".",
  ) %>%
  yml_navbar(
    title = "Herper",
    left = list(
      navbar_page("Home", href = "../index.html"),
      navbar_page("Guides", menu=list(
        navbar_page(text="Walkthrough",href="vignettes/Herper.html"),
        navbar_page(text="Outdated GCC",href="vignettes/SetupForOutdatedGCC.html"))
        #,
        # navbar_page("Reference",menu=),
        # navbar_page("Change Log",menu=),
      )),
    right = list(
      navbar_page("Getting help!",href="https://github.com/RockefellerUniversity/Herper/issues"),
      navbar_page(icon="ion-social-twitter",href="https://twitter.com/Rockefeller_BRC"))
  ) %>%
  yml_output(html_document(toc = TRUE,theme="cosmo", toc_float=TRUE,highlight = "textmate")) %>%
  as.yaml %>%
  writeLines(con = "vignettes/_site.yml")



rmarkdown::render_site(input = "index.md")
rmarkdown::render_site(input = "vignettes/Herper.Rmd")
rmarkdown::render_site(input = "vignettes/SetupForOutdatedGCC.Rmd")



#rmarkdown::render_site(input = "~/Desktop/To Review/20220218_BN_ATACseq/reportRMDsChIPseq/ChIPQC.Rmd")
