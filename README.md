# Markdown Extractor

A simple tool to extract a chunk of markdown and all dependents.

## Usage

```bash
$ ./extract-markdown.sh "Usage" < README.md

\```bash
$ ./extract-markdown.sh "Usage" < README.md
\```

```

## Haskell implementation

There is also a (much faster) Haskell implementation available. By default, this will return all children of any matched
header until a header at the same level of the match is encountered.

To compile:

```bash
$ ghc --make Extract.hs
```

To invoke:
```bash
$ ./Extract "Usage" README.md
```
