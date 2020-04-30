# NIF 2.0 examples and schemas

Ontologies

* NIF Core Ontology: nif-core.owl, nif-core.ttl (from [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/nif-core.owl)]
* NIF Stanbol profile: nif-stanbol.ttl (from [NLP2RDF repo](https://github.com/NLP2RDF/ontologies/blob/master/nif-core/nif-stanbol.ttl))

Data samples

* NIF Core example: data/nif-core.ttl (from [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/example.ttl))
* Relfinder example: data/relfinder.ttl (from [NLP2RDF repo](https://github.com/NLP2RDF/website/blob/master/examples/relfinder/2013_12_06/nifexample.ttl))
* NIF 2.1 examples: data/nif21-acquisition-companion-properties.ttl, data/nif21-acquisition-generic-properties.ttl, data/nif21-itsrdf.ttl, data/nif21-translation.ttl (from [NIF 2.1 documentation](https://github.com/NLP2RDF/documentation/tree/master/docs/includes))


## Potential extensions

List of identified unsupported use cases in NIF.

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
