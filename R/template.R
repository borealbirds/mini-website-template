## Writing species pages and TOC
library(whisker)

## Example species info
sptab <- structure(
    list(
        id = c(
            "ALFL",
            "AMCR",
            "AMGO"),
        scientific = c(
            "Empidonax alnorum",
            "Corvus brachyrhynchos",
            "Spinus tristis"),
        english = c(
            "Alder Flycatcher",
            "American Crow",
            "American Goldfinch"),
        french = c(
            "Moucherolle des aulnes",
            "Corneille d'Am&eacute;rique",
            "Chardonneret jaune")),
    row.names = c("ALFL", "AMCR", "AMGO"),
class = "data.frame")

## Species IDs to loop over
SPP <- sptab$id

## Template for TOC
TOC <-
'---
title: List of Species
---
Click on a species to see the summaries.
'

## Template for species page
TMP <-
'---
title: {{ENG}}
subtitle: {{SCI}}
---

This is the page for {{ENG}}.

![Distribution map](https://borealbirds.github.io/api/v4/species/{{ID}}/images/mean-pred.png)
'

for (spp in SPP) {

    cat("Writing page for", spp, "\n")
    flush.console()

    ## get info from table for spp
    o <- sptab[spp,]

    ## Add a TOC entry
    NAM <- sprintf("%s &ndash; %s (_%s_)", o$english, o$french, o$scientific)
    LINK <- sprintf("{{ site.baseurl }}/species/%s/", spp)
    TOC <- c(TOC, sprintf("- [%s](%s)", NAM, LINK))

    ## Make the species page
    LIST <- list(
        ID=o$id,
        ENG=o$english,
        SCI=o$scientific)
    ## Write the species page
    if (!dir.exists(paste0("docs/species/", spp)))
        dir.create(paste0("docs/species/", spp))
    writeLines(whisker.render(TMP, LIST),
        paste0("docs/species/", spp, "/index.md"))


}

## Write the TOC
writeLines(TOC, "docs/species/index.md")

