# Required features

Feature requests for a LLOD-compliant vocabulary for linguistic annotations on the web
(includes current NIF/WebAnnotation/LAF features, unsupported use cases in NIF and/or Web Annotation, and prospective use cases)

List will be used to compile a compliancy table for NIF, Web Annotation and other vocabularies.

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

### IRI fragment identifiers for strings

A highly praised feature of NIF (in comparison to Web Annotation) is that it supports compact String URIs that can be interpreted in isolation (but whose information can [should] be made explicit in RDF statements).

In NIF, this is part of the specification (`+`). In Web Annotation, this is possible, but not part of the standard, but only described in a [working note](https://w3c.github.io/web-annotation/selector-note/), hence `(+)`.

### Explicit selectors

Aside from string IRIs, it should be possible to decode their information (e.g., offset information) into RDF statements.

NIF: `+`, WebAnnotation: `+`

### Explicit context strings

In order to facilitate interpretability and robustness of string URIs (regardless of changes in underlying resource or differences in, say, Unicode normalization), the vocabulary should permit to provide explicit contexts that contain the text that a string IRI refers to (e.g., its offsets).

NIF: `+`, WebAnnotation: `-`

### API specifications for web services

In addition to modelling aspects, the vocabulary should provide API specifications for web services that perform linguistic annotation, e.g., POS tagging, or that provide access to and/or manipulation of data.

NIF: https://persistence.uni-leipzig.org/nlp2rdf/specification/api.html `+`
Web Annotation: https://www.w3.org/TR/annotation-protocol/ `+`

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

represent continuous multi-word segments, necessary for syntactic phrases, semantic annotations

Example (basic phrase structure syntax)
```
[NP ten books]
```

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

Support the annotation of zero elements, e.g., elements of syntactic analysis that are not overtly realized, e.g., traces or zero anaphors.

Note that a zero element can have a position in the text (and can be annotated as an empty string, then), but only if its position can be inferred, e.g., by substitution. 

Example (elision):
```
Peter was looking forward to it. Mary was [0], too.
Peter was looking forward to it. Mary was [looking forward to it], too.
```

However, implicit semantic roles that are not resolvable against the context do not have a position in the text:

Example:
```
[AGENT Rome] withdrew [SOURCE from Britain] [TIME around 409 CE].
```

The frame ([withdraw](https://framenet2.icsi.berkeley.edu/fnReports/data/frameIndex.xml?frame=Removing)) defines two core arguments not realized in the sentence, THEME (object that changes location, here: troops), and CAUSE (here: to defend continental territories of the Roman Empire). These have no position in the text, but [can be annotated](https://www.aclweb.org/anthology/P10-1160.pdf).

Full-fledged zero annotation must thus permit both annotations of zero strings that are attached to a particular position in the text and zero annotations that independent from any string realization (but are indirectly evoked, here, by the verb).

For textual data, the vocabulary should thus
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

### Sequence of annotation units

An annotation vocabulary should allow to encode the sequence of annotation units of the same kind (words, sentences, ...), either by enumeration or by explicit properties.

Example (enumeration):
`Diego Maradona is from Argentina.`

```
ext:offset_0_5 a nif:Word ; "Diego"
  nif:anchorOf "Diego" ;
  nif:enumeration "1" .
  
ext:offset_6_14 a nif:Word ; -> "Maradona"
  nif:enum "Maradona" .
  nif:enumeration "2" ;
```

Example (`nif:nextWord` property):

```
ext:offset_0_5 nif:nextWord ext:offset_6_14
```

Example (`rdf:List`):

```
( ext:offset_0_5 ext:offset_6_14 ) a rdf:List .
```

The different encoding possibilities can be transformed into each other. E.g., enumeration information (with indices) can be inferred from relations between words within a sentence, e.g., counting all `nif:nextWord` before a particular word.

To facilitate encoding, a vocabulary should specify which (if any) strategy is recommended. In addition to marking whether a vocabulary provides sequence annotation vocabulary (`+`, `-`), mark the strategy.

### annotation values: plain literals

The vocabulary should support annotation (annotation value/body) with plain literals, e.g., strings.

Example:
```
:some_region_uri nif:lemma "tree" .
```

### annotation values: feature structures

The vocabulary should support annotation (annotation value/body) with feature structures, i.e., root nodes of directed (acyclic) graphs. In RDF, this requirement can be reformulated as permitting RDF resources (URIs) as annotations.

Example:
```
:some_region_uri nif:oliaLink penn:NN.
```

## Levels of linguistic analysis: units of annotation

For a particular level of linguistic analysis, the vocabulary should
- define (`+`) or address (`(+)`) the relevant units of annotation, and 
- permit to navigate among units of annotation (e.g., retrieving the next annotation of the same kind)

### Word-level annotations: word unit

The vocabulary must support the annotation of individual words (tokens), e.g., for entity linking or part-of-speech tagging:
- If it provides a concept for words or tokens, mark as `+`
- If it can address/express words or tokens, but does not provide a designated concept, mark as `(+)`
- If it does not allow to annotate words, mark as `-`.

Example: part-of-speech annotation

```
book/NN
```

`nif:Word`, hence `+`.
No concept in Web Annotation, but tokens can be targets, hence `(+)`.

### Sentence-level annotation: sentence unit

`nif:Sentence`, hence `+`.
Lacking in Web Annotation, hence `(+)`.

### morphology: morphological segments

segment a word into its parts, annotate parts individually, required for interlinear glossed text

Example (interlinear glossed text):

```
Bücher
Buch -"er
book -pl
'books'
```


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

### syntax/text structure: node labels/types

The vocabulary should provide (or refer to) an inventory of syntactic categories, e.g., phrase. Note that this must be extensible to accomodate novel types of annotation.

Web Annotation: user-provided subclasses of `oa:Annotation`, hence `(-)`

NIF predefined: `nif:Word`, `nif:Phrase`, `nif:Paragraph`, etc.; but note that these do not describe nodes in the sense of LAF, but regions, so, this is `(+)`

In addition, NIF allows to use `nif:oliaLink` to refer to an external terminology base, here [OLiA](http://purl.org/olia). An alternative to OLiA is the [CLARIN Concept Registry](https://www.clarin.eu/ccr), but note that it is extensible only by national CLARIN representatives whereas OLiA is an [open source project on GitHub](https://github.com/acoli-repo/olia). AFAIK, NIF uses `nif:oliaLink` for part of speech information only, so this is partial solution, again, hence, `(+)`.

### semantics: node labels/types

Similar as for syntax/text structure, details to be determined from SemAF, [NERD](http://nerd.eurecom.fr/ontology) (for named entities), [GlobalWordNet Interlingual Index](https://github.com/globalwordnet/ili) (for word senses), etc. 

This requires a very rich and extensible inventory of data categories, so better as an external resource. Again, [OLiA](http://purl.org/olia) and the [OLiA Discourse Extensions](http://www.acoli.informatik.uni-frankfurt.de/resources/discourse/) are a candidate resources here, but note that this would require extensions wrt. lexical semantics.

NIF supports entity linking, but no other form of semantic annotation, hence `(-)`.
Web Annotation is widely used for entity linking, but it does not provide a designated vocabulary for entities, hence `(-)`.

## Levels of linguistic analysis: sequential structure

For a particular level of linguistic analysis, the vocabulary should
- define (`+`) or address (`(+)`) the relevant units of annotation, and 
- permit to navigate among units of annotation (e.g., retrieving the next annotation of the same kind)

As for "navigation" relations between adjacent units: For different levels of linguistic annotation (e.g., morphology, word-level annotations), the vocabulary should provide an explicit means to identify the next (or preceding) unit of annotation. For pre-RDF vocabularies, this can be encoded in the structure of a a file (e.g., in XML or CoNLL formats), for RDF vocabularies, this must be explicit triples.

In Web Annotation, this is absent, hence `-`.
NIF defines such properties for limited number of possible relations among concepts, e.g. `nif:nextWord` or `nif:nextSentance`, but not for others (e.g., morphs).

### Word-level annotation: sequence of words

`nif:nextWord`, hence `+`.
Lacking in Web Annotation, hence `-`.

### Sentence-level annotation: sequence of sentences

`nif:nextSentence`, lacking in Web Annotation (`-`).

### Morphology: sequence of morphological segments

`cats` = `cat` + `s` with `cat "directly precedes" s`.

Lacking in NIF and Web Annotation, hence `-`.

### Syntax: discontinuous multi-word segments

represent discontinuous multi-word segments	represent syntactic phrases, regardless of their sequential order

Example:
```
[What] did they laugh [about]?
```

At a deep level, the phrase here is `[about what]`. If this can be represented directly, mark `+`. If the system requires the introduction of a zero element, mark as `(-)`.

Note that this is different from the annotation of discontinuous strings, as the words being connected can have an internal syntactic structure.

### Syntax/text structure: sequence of elements within a phrase

Within the vocabulary, we should be able to quickly navigate from one sibling to the next.

Lacking in NIF and Web Annotation, hence `-`, but provided by [POWLA](http://purl.org/powla), an RDF/OWL reconstruction of LAF.

## Levels of linguistic analysis: relational structure

(At least) two kinds of relations must be distinguished: Relations there one node contains the other (hierarchical structure, e.g., phrase structure syntax) and relations between independent nodes (relational structure, e.g., dependency syntax, coreference, etc.).

Web Annotation does not provide any vocabulary for relations between annotations (or bodies). Offset-based selectors do, however, permit reasoning over offsets that can be (ab)used to indicate hierarchical structures. However, this does not hold between annotations, but between bodies only, hence `(-)`, because hierarchical structures between co-extensional elements cannot be expressed.

Similarly, NIF encodes hierarchical structure by means of `nif:subString`, but note that this is 'not' a relation between LAF nodes (~ `nif:AnnotationUnit`) but between LAF regions (`nif:String`). Hence, this is `(-)`.

Example for hierarchical relations between co-extensional elements:

```
[S [VF [NP [NE Peter ] ] ] [LK [V war ] ] [MF [ADVX [ADV nicht] [ADV zuhause] ] ] ]
```

German, 'Peter wasn't home', example inspired by [TüBa-D/Z corpus](http://www.sfs.uni-tuebingen.de/en/ascl/resources/corpora/tueba-dz.html) 

```
VF -> Peter (Vorfeld, syntactic position)
NP -> Peter (Noun Phrase, constituent at VF position)
NE -> Peter (Named Entity that constitutes the NP)
```

These are co-extensional, but their hierarchical organization (in the annotation) is meaningful and must not be reversed. In the following, NIF and WA all have `(-)` for hierarchical relations.

### Morphology: relations

hierachical/other relations to be confirmed, cf. OntoLex-Morph and MAF

Vocabulary should either provide the vocabulary or refer to an external terminology repository that provides the necessary vocabulary

### Dependency syntax
 
no hierarchical relations, to be confirmed whether primary and secondary dependencies are to be distinguished (cf. https://universaldependencies.org/), cf. SynAF (other standards?)

### Phrase structure syntax: hierarchical relations

hierarchical relations, must be annotatable, see SynAF, to be confirmed whether primary and secondary edges are to be distinguished (cf. [TIGER XML](https://www.ims.uni-stuttgart.de/forschung/ressourcen/werkzeuge/TIGERSearch/doc/html/TigerXML.html))

### Phrase structure syntax: other relations

to be confirmed, e.g., for movement/traces, see SynAF. 
Note that an indirect encoding by means of empty elements may be possible under certain circumstances, cf. the modelling of syntactic movement by means of traces in generative syntax.

### Semantics: relations

cf. SemAF, must cover a broad inventory of relations, including TimeML, PropBank/FrameNet-style semantic roles, different forms of discourse annotation (RST: hierarchical, PDTB: non-hierarchical), coreference, etc.

In order to prevent unlimited growth of the vocabulary, semantic annotations should use refer to a(n extensible) terminology repository rather than aiming to provide an exhaustive list 'within the vocabulary'. 

### Other (to be added)


## Data structures for novel applications

Aside from the types of annotation listed below, RDF-based technology enables better support for phenomena that no community standard currently does exist for. These are usecases that involve linking across documents. Note that requirements for "conventional annotations" (such as covered by existing W3C, ISO or other standards) are listed below.

### Intertextual relations

Link text passages from different documents that correspond to each other, e.g., because of text reuse. There should be an encoding for undirected overlap (if two sources derive from the same, anonymous source or the direction of reuse is uncear) and a different encoding for confirmed text reuse.

Motivation: Digital Humanities

Currently no native vocabulary within Web Annotation or NIF, but both can be extended with user-provided properties for the purpose, hence `(-)`.

### Collation and alignment

Alignment: Parallel corpora are conventionally used, but current technology is restricted to bilingual pairs (e.g., [TreeAligner](https://www.cl.uzh.ch/en/texttechnologies/research/corpus-linguistics/paralleltreebanks/treealigner.ht). For developing language-independent applications and tools, it would be beneficial to support alignment between more than two languages.

Collation: For different editions of the same document (e.g., different manuscripts), align corresponding passages in an order-insensitive way. Note that collation typically extends to *much* more than two sources. For existing tools, cf. [CollateX](https://collatex.net/doc/), but note that it does not support annotated data.

Motivation: NLP (parallel corpora) and Digital Humanities (collation)

Currently no native vocabulary within Web Annotation or NIF, but both can be extended with user-provided properties for the purpose, hence `(-)`.

For original TSV ("CoNLL") annotations, such data can be created with [CoNLL-Merge](https://github.com/acoli-repo/conll) and represented in RDF using the [CoNLL-RDF vocabulary](https://github.com/acoli-repo/conll-rdf).

### Links with lexical resources

Link an expression with a glossary or a dictionary, e.g., to provide attestation information (within a dictionary) or to provide lexical information (within a corpus). Approach should be coordinated with [OntoLex-FrAC](https://github.com/acoli-repo/ontolex-frac).

Motivation: Digital Philologies

Currently no native vocabulary within Web Annotation or NIF, but both can be extended with user-provided properties for the purpose, hence `(-)`.

