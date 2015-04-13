UniqTag
=======

Abbreviate strings to short unique identifiers

For each string in a set of strings, determine a unique tag that is a
substring of fixed size *k* unique to that string, if it has one. If
no such unique substring exists, the least frequent substring is used.
If multiple unique substrings exist, the lexicographically smallest
substring is used. This lexicographically smallest substring of size
*k* is called the uniqtag of that string.

Installation
================================================================================

Command line program
------------------------------------------------------------

```sh
curl -o ~/bin/uniqtag https://raw.githubusercontent.com/sjackman/uniqtag/master/uniqtag
chmod +x ~/bin/uniqtag
```

or using [Homebrew][] or [Linuxbrew][]

```sh
brew install uniqtag
```

[Homebrew]: http://brew.sh/
[Linuxbrew]: http://brew.sh/linuxbrew/

R package
------------------------------------------------------------

```r
# install.packages("devtools")
devtools::install_github("sjackman/uniqtag")
```

Manuscript
==========

[Shaun D. Jackman, Joerg Bohlmann, İnanç Birol (2014)][uniqtag-paper]
UniqTag: Content-derived unique and stable identifiers for gene annotation.
*bioRxiv*, [doi:10.1101/007583](http://dx.doi.org/10.1101/007583).

[uniqtag-paper]: https://github.com/sjackman/uniqtag-paper

Summary
=======

When working on an ongoing genome sequencing and assembly project, it is rather
inconvenient when gene identifiers change from one build of the assembly to the
next. The gene labelling system described here, UniqTag, addresses this common
challenge. UniqTag assigns a unique identifier to each gene that is a
representative *k*-mer, a string of length *k*, selected from the sequence of
that gene. Unlike serial numbers, these identifiers are stable between
different assemblies and annotations of the same data without requiring that
previous annotations be lifted over by sequence alignment. We assign UniqTag
identifiers to nine builds of the Ensembl human genome spanning seven years to
demonstrate this stability.
