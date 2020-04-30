# Necessary features

List of identified unsupported use cases in NIF and/or Web Annotation, still incomplete

## LLOD compliancy & expressiveness

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

### Generic data structures for linguistic annotation: pointers

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) defines generic linguistic data structures from which annotation-specific datastructures can be derived. These are

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

examples for pointers :

`http://example.com/text.txt#char=100` (RFC 5147 character offset = anchor)
`http://example.com/text.txt#char=100,105` (RFC 5147 string URI)

The default mechanism to define pointers in Web Annotation is by means of selectors that use application-specific information to address elements of a web document using explicit RDF statements.

### Pointers: Vocabulary for explicit references

Provide (optional) RDF statements to explicate pointer information (e.g., offsets).

### Pointers: User-provided selectors

Allow users to define application-specific pointers.

Web Annotation provides the class `oa:Selector`. For different media, users can provide selector subclasses that encode the information an appication needs to identify the annotated element.

### Pointers: Support the annotation of continuous strings

### Pointers: Support the annotation of discontinuous strings

### Generic data structures for linguistic annotation: node != pointer

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) defines generic linguistic data structures from which annotation-specific datastructures can be derived. These are

- pointers to primary data ("media")
- units of annotation ("graph")
  - node (annotatable element linked with a region)
  - edge (relation from one or multiple nodes to one or multiple nodes)
  - graph (collection of nodes and edges)
- annotations

Conceptually, it is important that pointers and units of annotations are (or: can be) distinguished, because the same string may have multiple, independent annotations. 

Example: tbc.

In NIF, the function of `node` may be compared to `nif:AnnotationUnit`, but by default, the basis of annotation is a `nif:String` which conflates characteristics of LAF `region` and `node`.

In Web Annotation, `node` may be compared to `oa:Annotation` or the body (depending on perspective), but note that Web Annotation doesn't seem to support nodes without an associated target (region)

### Generic data structures for linguistic annotation: edge

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) defines generic linguistic data structures from which annotation-specific datastructures can be derived. These are

- pointers to primary data ("media")
- units of annotation ("graph")
  - node (annotatable element linked with a region)
  - edge (relation from one or multiple nodes to one or multiple nodes)
  - graph (collection of nodes and edges)
- annotations

Edges are, for example, syntactic dependencies. The vocabulary should provide a property or class that annotation-specific edges can provide sub-classes/-properties for.

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

## Levels of linguistic analysis



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

### Differentiate annotations

- NIF is well-suited for word-based annotations, e.g., for entity linking, but it is not capable to differentiate annotations of the same string on multiple annotation layers.

Example: ?

### Annotation of multiple strings

Example:
`Diego Maradona is from Argentina.`

If one wants to "highlight" all entities (or particular words/phrases/strings), he/she would need to annotate each entity mention (word/phrases/strings).
```
ext:offset_0_14 -> Diego Maradona
ext:offset_23_32 -> Argentina
```

Annotations such as `ext:offset_0_14_23_32` are not considered nor supported.

### Lack of data structures

Currently NIF defines:

- Word
- Sentence
- Phrase
- Title
- Paragraph

Following data structures are missing: ...

### Provenance and NIF documentation

NIF 2.1 defines `nif:AnnotationUnit` which can use used to distinguish annotations comming from different NLP tools on same strings (same offsets).

The NIF documentation does not properly reflect the latest advancements in NIF 2.1.

### Relations between annotations

NIF defines limited number of possible relations among concepts, e.g. `nif:nextWord` or `nif:nextSentance`.
Dependency parsing related relations are not covered.

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
