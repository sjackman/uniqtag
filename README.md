uniqtag
=======

Abbreviate strings to short unique identifiers

For each string in a set of strings, determine a unique tag that is a
substring of fixed size *k* unique to that string, if it has one. If
no such unique substring exists, the least frequent substring is used.
If multiple unique substrings exist, the lexicographically smallest
substring is used. This lexicographically smallest substring of size
*k* is called the uniqtag of that string.
