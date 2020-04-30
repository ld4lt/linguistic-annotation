# Necessary features

List of identified unsupported use cases in NIF and/or Web Annotation, still incomplete

### Annotation of morphology

- Not addressed by NIF, neither WA
- It is unclear how to use NIF in combination with the Lemon Morphology Module: https://www.w3.org/community/ontolex/wiki/Morphology

Example:
`cats` = `cat` + `s`
```
ext:offset_0_4 -> cats

=

ext:offset_0_3 -> cat
ext:offset_3_4 -> s
```


## Differentiate annotations

- NIF is well-suited for word-based annotations, e.g., for entity linking, but it is not capable to differentiate annotations of the same string on multiple annotation layers.

Example: ?

## Annotation of multiple strings

Example:
`Diego Maradona is from Argentina.`

If one wants to "highlight" all entities (or particular words/phrases/strings), he/she would need to annotate each entity mention (word/phrases/strings).
```
ext:offset_0_14 -> Diego Maradona
ext:offset_23_32 -> Argentina
```

Annotations such as `ext:offset_0_14_23_32` are not considered nor supported.

## Lack of data structures

Currently NIF defines:

- Word
- Sentence
- Phrase
- Title
- Paragraph

Following data structures are missing: ...

## Provenance and NIF documentation

NIF 2.1 defines `nif:AnnotationUnit` which can use used to distinguish annotations comming from different NLP tools on same strings (same offsets).

The NIF documentation does not properly reflect the latest advancements in NIF 2.1.

## Relations between annotations

NIF defines limited number of possible relations among concepts, e.g. `nif:nextWord` or `nif:nextSentance`.
Dependency parsing related relations are not covered.

## Enumeration

No mechanism to enumerate words, sentences, ....

Example:
`Diego Maradona is from Argentina.`

```
ext:offset_0_5 a nif:Word ; "Diego"
  nif:anchorOf "Diego" ;
  nif:enumeration "1" .
  
ext:offset_6_14 a nif:Word ; -> "Maradona"
  nif:enum "Maradona" .
  nif:enumeration "2" ;
```
