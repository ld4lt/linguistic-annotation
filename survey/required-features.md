# Necessary features

List of identified unsupported use cases in NIF and/or Web Annotation, still incomplete

## LLOD compliancy

### RDF serialization

- The vocabulary must foresee a serialization in RDF or any standardized RDF format (JSON-LD, RDF/XML, Turtle, ...)
- Trivially fulfulled by RDF vocabularies such as Web Annotation, but not by, say, ISO standards such as the Linguistic Annotation Framework (LAF), conventional TSV formats ("CoNLL") or XML formats (TEI).

Counter-example (https://tei-c.org/release/doc/tei-p5-doc/en/html/ref-relation.html):

```
<relation resp="http://viaf.org/viaf/44335536/"
 ref="http://purl.org/saws/ontology#isVariantOf"
 active="http://www.ancientwisdoms.ac.uk/cts/urn:cts:greekLit:tlg3017.Syno298.sawsGrc01:divedition.divsection1.o14.a107"
 passive="http://data.perseus.org/citations/urn:cts:greekLit:tlg0031.tlg002.perseus-grc1:9.35"/>
```

This example records a relationship, defined by the SAWS ontology, between a passage of text identified by a CTS URN, and a variant passage of text in the Perseus Digital Library, and assigns the identification of the relationship to a particular editor (all using resolvable URIs). This is a counter-example in the sense that the TEI does not support a (W3C- or otherwise) standardized way to encode RDF statements but introduces TEI-specific formalisms. 

### Extent of standardization

Are candidate vocabularies standardized by a formal standardization body (e.g., ISO, W3C, etc., mark as `++`), community standards used by multiple providers (mark as `+`) or tool- or application-specific solutions (mark as `-`)?

Web Annotation is a regular W3C standard (`++`). NIF is a widely used community standard (i.e., `+`), and referred to in W3C standards, hence `(++)` (in parentheses). 

### Documentation

The vocabulary/standard should be
- fully documented using public, freely accessible online documentation, mark as `+`, or
- fully documented using proprietary, internally accessible documentation, mark as `(+)`.
- If partially documented using public, freely accessible online documentation, mark as `(-)`.
- Otherwise, mark as `-`.

NIF 2.0 and Web Annotation is fully documented using public, freely accessible online documentation `+`.
NIF 2.1 documentation does not properly reflect the latest advancements in NIF 2.1, hence `(-)`.
ISO standards (LAF, etc.) are usually proprietary. If internal copies or drafts are accessible, use `(+)` and describe how to access them. If 'only' supporting documentation (e.g., secondary literature such as scientific papers about the standard) are accessible, use `(-)`. If only the proprietary standard itself is accessible, without either secondary literature or drafts, use `-`.

## Expressiveness

This mostly refers to the capability of providing 'generic' data structures as defined by [ISO 24612-2012 (LAF)](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf): generic linguistic data structures from which annotation-specific datastructures can be derived. These are

- pointers to primary data ("media")
  - Anchor (pointer to a piece of primary data)
  - Region (group of anchors that define a markable that can be annotated)
- units of annotation ("graph")
  - node (annotatable element linked with a region)
  - edge (relation from one or multiple nodes to one or multiple nodes)
  - graph (collection of nodes and edges)
- annotations
  - annotation (linguistic information attached to any node or edge)
  - annotation space (groups together annotations of the same type, say, POS)

Note that it is not required here to provide an RDF encoding, but 'any' solution.

Web Annotation does not define any specifically 'linguistic' data structures. It does provide pointers ('targets') and an abstract `oa:Annotation` class.

NIF defines:

- String (for the annotation of strings)
  - Word
  - Sentence
  - Phrase
  - Title
  - Paragraph
- AnnotationUnit (for annotations that need to be distinguished from a particular way, note that these must not be any of the String subclasses)

Generic linguistic data structures (as in LAF) are missing. For specific levels of description (e.g., morphology), see below.

### Pointers to primary data

In RDF vocabularies either by IRI fragment identifiers or explicit RDF statements (and vocabulary for that).

Examples for IRI fragment identifiers as pointers:

`http://example.com/text.txt#char=100` (RFC 5147 character offset = LAF anchor)
`http://example.com/text.txt#char=100,105` (RFC 5147 string URI = LAF region)

The default mechanism to define pointers in Web Annotation is by means of selectors that use application-specific information to address elements of a web document using explicit RDF statements.

### Pointers: Vocabulary for explicit references

Provide (optional) RDF statements to explicate pointer information (e.g., offsets).

### Pointers: User-provided selectors

Allow users to define application-specific pointers.

Web Annotation provides the class `oa:Selector`. For different media, users can provide selector subclasses that encode the information an appication needs to identify the annotated element.

### Pointers: Support the annotation of continuous strings

### Pointers: Annotation of discontinuous strings

Example:
`Diego Maradona is from Argentina.`

If one wants to "highlight" all entities (or particular words/phrases/strings), he/she would need to annotate each entity mention (word/phrases/strings).
```
ext:offset_0_14 -> Diego Maradona
ext:offset_23_32 -> Argentina
```

In NIF, annotations such as `ext:offset_0_14_23_32` are not considered nor supported, mark as `-`.
In Web Annotations, multiple selectors can be combined into an aggregate selector, mark as `+`.

### Generic data structures for linguistic annotation: node != pointer

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) pointers are distinguished from units of annotation. Conceptually, it is important that pointers and units of annotations are (or: can be) distinguished, because the same string may have multiple, independent annotations. 

Example: tbc.

In NIF, the function of `node` may be compared to `nif:AnnotationUnit`, but by default, the basis of annotation is a `nif:String` which conflates characteristics of LAF `region` and `node`. Hence, mark as `(+)` (with parentheses). NIF is well-suited for word-based annotations, but `nif:String` is not capable to differentiate annotations of the same string on multiple annotation layers.

In Web Annotation, `node` may be compared to `oa:Annotation` or the body (depending on perspective), but note that Web Annotation doesn't seem to support nodes without an associated target (region), hence mark as `(+)`.

### Generic data structures for linguistic annotation: zero nodes

For textual data, the vocabulary does 
- support annotations that exist independently from their string seriaization: mark as `+`
- support the annotation of empty strings: mark as `(+)` (with parentheses)
- require the annotation target to be an non-empty string: mark as `-`.

The default encoding for annotations in NIF is by subclasses of `nif:String`, and this would be `(+)`. Web annotation requires some target, and this would be `(+)`. 

### Generic data structures for linguistic annotation: edge ('relation')

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) edge is a relation from one or multiple nodes to one or multiple nodes. Edges are, for example, syntactic dependencies. The vocabulary should provide a way to mark an RDF statement as being a edge/relation in the sense of LAF, e.g., a property or class that annotation-specific edges can provide sub-classes/-properties for.

No explicit data structures for edges in NIF nor Web Annotation.

### Reified representation of edges (annotation relations)

For an edge (relation), it must be possible to annotate it with additional data, e.g., linguistic data categories. The vocabulary should support a reified view on, say, dependency relations.

### Generic data structures for linguistic annotation: graphs

In LAF, a graph a is a collection of nodes and edges. In RDF, this corresponds to an RDF graph (often representing the document that a particular set of RDF statements originates from). We do not require explicit data structures for graphs beyond that (do we?).

### Generic data structures for linguistic annotation: annotations

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) defines generic linguistic data structures from which annotation-specific datastructures can be derived. These are

- pointers to primary data ("media")
- units of annotation ("graph")
- annotations
  - annotation (linguistic information attached to any node or edge)
  - annotation space (groups together annotations of the same type, say, POS)

The vocabulary should provide a designated class for linguistic annotations. In Web Annotation, this would be either `oa:Annotation` or a body (depending on interpretation). In NIF, such an element is missing. For annotations of a particular string, this function is taken over by `nif:String`, for more complex constellations, `nif:AnnotationUnit` can be used, but is not the default way of modelling.

### Generic data structures for linguistic annotation: annotation space ("tagset")

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) defines generic linguistic data structures from which annotation-specific datastructures can be derived. These are

- pointers to primary data ("media")
- units of annotation ("graph")
- annotations
  - annotation (linguistic information attached to any node or edge)
  - annotation space (groups together annotations of the same type, say, POS)

The vocabulary should provide a standard way to assign annotations a particular type or class. This corresponds to user-provided subclasses of (the abstract) `oa:Annotation` class in Web Annotation. 

### Provenance

The vocabulary should provide a way to
- assert provenance about (annotations of) nodes and edges, mark as `+`, or
- assert provenance about (annotatios of) nodes, mark as `(+)`.
- Otherwise, mark as `-`.

NIF 2.1 defines `nif:AnnotationUnit` which can use used to distinguish annotations comming from different NLP tools on same strings (same offsets).

### Enumeration

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

> To be discussed whether necessary at the vocabulary level, this can be inferred from relations between words within a sentence, e.g., counting all `nif:nextWord` before a particular word.

## Levels of linguistic analysis

For a particular level of linguistic analysis, the vocabulary should
- define (`+`) or address (`(+)`) the relevant units of annotation, and 
- permit to navigate among units of annotation (e.g., retrieving the next annotation of the same kind)

As for "navigation" relations between adjacent units: For different levels of linguistic annotation (e.g., morphology, word-level annotations), the vocabulary should provide an explicit means to identify the next (or preceding) unit of annotation. For pre-RDF vocabularies, this can be encoded in the structure of a a file (e.g., in XML or CoNLL formats), for RDF vocabularies, this must be explicit triples.

In Web Annotation, this is absent, hence `-`.
NIF defines such properties for limited number of possible relations among concepts, e.g. `nif:nextWord` or `nif:nextSentance`, but not for others (e.g., morphs).

### Word-level annotations: word unit

The vocabulary must support the annotation of individual words (tokens), e.g., for entity linking or part-of-speech tagging:
- If it provides a concept for words or tokens, mark as `+`
- If it can address/express words or tokens, but does not provide a designated concept, mark as `(+)`
- If it does not allow to annotate words, mark as `-`.

`nif:Word`, hence `+`.
No concept in Web Annotation, but tokens can be targets, hence `(+)`.

### Word-level annotation: relation between adjacent words

`nif:nextWord`, hence `+`.
Lacking in Web Annotation, hence `-`.

### Sentence-level annotation: sentence unit

`nif:Sentence`, hence `+`.
Lacking in Web Annotation, hence `(+)`.

### Annotation of morphology: morphological segments

Example:
`cats` = `cat` + `s`
```
ext:offset_0_4 -> cats

=

ext:offset_0_3 -> cat
ext:offset_3_4 -> s
```

Not addressed by NIF, neither WA. No NIF vocabulary, but can be accessed as substrings, hence `(+)`.
Web Annotation: `(+)`

It is unclear how to use NIF in combination with the Lemon Morphology Module: https://www.w3.org/community/ontolex/wiki/Morphology

### Morphology: sequence of morphological segments

`cats` = `cat` + `s` with `cat "directly precedes" s`.

Lacking in NIF and Web Annotation, hence `-`.

