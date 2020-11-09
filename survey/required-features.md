# Required features

Feature requests for a LLOD-compliant, native RDF vocabulary for linguistic annotations on the web
(includes current NIF/WebAnnotation/LAF features, unsupported use cases in NIF and/or Web Annotation, and prospective use cases)

List will be used to compile a compliancy table for NIF, Web Annotation and other vocabularies, with primary values `+`, `(+)`, `(-)` and `-`.
Note: The section numbers below are used to identify entries in the result table. Do not change! (Instead, mark a section/feature as deprecated if it's dropped or replaced by a different feature request.)

Add required features for a reference vocabuilary for linguistic annotations on the web here *or* [as an issue](https://github.com/ld4lt/linguistic-annotation/issues). 

## Table of contents
(auto-generated using https://magnetikonline.github.io/markdown-toc-generate/, needs to be updated when changes are being made)

- [A. LLOD compliancy](#a-llod-compliancy)
	- [A.1 RDF serialization](#a1-rdf-serialization)
	- [A.2 Extent of standardization](#a2-extent-of-standardization)
	- [A.3 Documentation](#a3-documentation)
	- [A.4 IRI fragment identifiers for strings](#a4-iri-fragment-identifiers-for-strings)
	- [A.5 Explicit selectors](#a5-explicit-selectors)
	- [A.6 Explicit context strings](#a6-explicit-context-strings)
	- [A.7 API specifications for web services](#a7-api-specifications-for-web-services)
	- [A.8 Assign data categories](#a8-assign-data-categories)
	- [A.9 Compatible with Web Annotation vocabulary](#a9-compatible-with-web-annotation-vocabulary)
	- [A.10 Compatible with NIF 2.0 core vocabulary](#a10-compatible-with-nif-20-core-vocabulary)
	- [A.11 Compatible with ISO standards](#a11-compatible-with-iso-standards)
- [B. Expressiveness](#b-expressiveness)
	- [B.1 Pointers to primary data](#b1-pointers-to-primary-data)
	- [B.2 Pointers: Vocabulary for explicit references](#b2-pointers-vocabulary-for-explicit-references)
	- [B.3 Pointers: User-provided selectors](#b3-pointers-user-provided-selectors)
	- [B.4 Pointers: Support the annotation of continuous strings](#b4-pointers-support-the-annotation-of-continuous-strings)
	- [B.5 Pointers: Annotation of discontinuous strings](#b5-pointers-annotation-of-discontinuous-strings)
	- [B.6 Pointers: Annotation of media files](#b6-pointers-annotation-of-media-files)
	- [B.7 Pointers: Support the annotation of timestamps/timelines](#b7-pointers-support-the-annotation-of-timestampstimelines)
	- [B.8 Pointers: standoff annotation](#b8-pointers-standoff-annotation)
	- [B.9 Generic data structures for linguistic annotation: node != pointer](#b9-generic-data-structures-for-linguistic-annotation-node--pointer)
	- [B.10 Generic data structures for linguistic annotation: zero nodes](#b10-generic-data-structures-for-linguistic-annotation-zero-nodes)
	- [B.11 Generic data structures for linguistic annotation: edge ('relation')](#b11-generic-data-structures-for-linguistic-annotation-edge-relation)
	- [B.12 Reified representation of edges (annotation relations)](#b12-reified-representation-of-edges-annotation-relations)
	- [B.13 Generic data structures for linguistic annotation: graphs](#b13-generic-data-structures-for-linguistic-annotation-graphs)
	- [B.14 Generic data structures for linguistic annotation: annotations](#b14-generic-data-structures-for-linguistic-annotation-annotations)
	- [B.15 Generic data structures for linguistic annotation: annotation space ("tagset")](#b15-generic-data-structures-for-linguistic-annotation-annotation-space-tagset)
	- [B.16 Provenance](#b16-provenance)
	- [B.17 Concurrent annotation](#b17-concurrent-annotation)
	- [B.18 Sequence of annotation units](#b18-sequence-of-annotation-units)
	- [B.19 annotation values: plain literals](#b19-annotation-values-plain-literals)
	- [B.20 annotation values: feature structures](#b20-annotation-values-feature-structures)
- [C. Levels of linguistic analysis: units of annotation](#c-levels-of-linguistic-analysis-units-of-annotation)
	- [C.1 Word-level annotations: word unit](#c1-word-level-annotations-word-unit)
	- [C.2 Sentence-level annotation: sentence unit](#c2-sentence-level-annotation-sentence-unit)
	- [C.3 morphology: morphological segments](#c3-morphology-morphological-segments)
	- [C.4 syntax/text structure: node labels/types](#c4-syntaxtext-structure-node-labelstypes)
	- [C.5 semantics: node labels/types](#c5-semantics-node-labelstypes)
- [D. Levels of linguistic analysis: sequential structure](#d-levels-of-linguistic-analysis-sequential-structure)
	- [D.1 Word-level annotation: sequence of words](#d1-word-level-annotation-sequence-of-words)
	- [D.2 Sentence-level annotation: sequence of sentences](#d2-sentence-level-annotation-sequence-of-sentences)
	- [D.3 Morphology: sequence of morphological segments](#d3-morphology-sequence-of-morphological-segments)
	- [D.4 Syntax: discontinuous multi-word segments](#d4-syntax-discontinuous-multi-word-segments)
	- [D.5 Syntax/text structure: sequence of elements within a phrase](#d5-syntaxtext-structure-sequence-of-elements-within-a-phrase)
- [E. Levels of linguistic analysis: relational structure](#e-levels-of-linguistic-analysis-relational-structure)
	- [E.1 Morphology: relations](#e1-morphology-relations)
	- [E.2 Dependency syntax](#e2-dependency-syntax)
	- [E.3 Phrase structure syntax: hierarchical relations](#e3-phrase-structure-syntax-hierarchical-relations)
	- [E.4 Phrase structure syntax: other relations](#e4-phrase-structure-syntax-other-relations)
	- [E.5 Semantics: relations](#e5-semantics-relations)
	- [Other (to be added)](#other-to-be-added)
- [F. Data structures for novel applications](#f-data-structures-for-novel-applications)
	- [F.1 Intertextual relations](#f1-intertextual-relations)
	- [F.2 Collation and alignment](#f2-collation-and-alignment)
	- [F.3 Links with lexical resources](#f3-links-with-lexical-resources)
	- [F.4 Dialog annotation](#f4-dialog-annotation)
	- [Other (please add)](#other-please-add)

## A. LLOD compliancy

### A.1 RDF serialization

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

NIF: `+` (RDF)

Web Annotation: `+` (RDF, preference for JSON-LD)

CoNLL-RDF: `+`

POWLA: `+`

Ligt: `+`

LAF: `-`

MAF: `-`

SynAF: `-`

SemAF: `-`

### A.2 Extent of standardization

Are candidate vocabularies standardized by a formal standardization body (e.g., ISO, W3C, etc., mark as `+`), community standards used by multiple providers (mark as `(+)`) or tool- or application-specific solutions (mark as `-`)?

Web Annotation: `+` (regular W3C standard)

NIF: `(+)` (widely used community standard, and referred to in W3C standards)

CoNLL-RDF: `(-)` (some usage, not standardized)

POWLA: `(+)` (this basically implements LAF)

Ligt: `-`

LAF: `+`

MAF: `+`

SynAF: `+`

SemAF: `+`

### A.3 Documentation

The vocabulary/standard should be
- fully documented using public, freely accessible online documentation, mark as `+`, or
- fully documented using proprietary, internally accessible documentation, mark as `(+)`.
- If partially documented using public, freely accessible online documentation, mark as `(-)`.
- Otherwise, mark as `-`.

NIF: `+` (for NIF 2.0)

NIF 2.1: `(-)` (NIF 2.1 documentation does not properly reflect the latest advancements since NIF 2.0)

Web Annotation: `+`

ISO standards (LAF, etc.) are usually proprietary. If internal copies or drafts are accessible, use `(+)` and describe how to access them. If 'only' supporting documentation (e.g., secondary literature such as scientific papers about the standard) are accessible, use `(-)`. If only the proprietary standard itself is accessible, without either secondary literature or drafts, use `-`.

LAF: `(+)` (via https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf)

MAF: `+` (link tbc.)

SynAF: `-` (unless link/information provided)

SemAF: `-` (unless link/information provided)

CoNLL-RDF: `+`

POWLA: `(+)` (on-line documentation dated, more up-to-date documentation in Cimiano et al. 2020, but this is not open access)

Ligt: `(-)` (partially documented only)

### A.4 IRI fragment identifiers for strings

A highly praised feature of NIF (in comparison to Web Annotation) is that it supports compact String URIs that can be interpreted in isolation (but whose information can [should] be made explicit in RDF statements).

Example:
`http://example.com#hash_4_8_7049dd7875989b97e8568f5c0fd1f12b_favorite` (NIF String URI)
`http://example.org/document/1#char=0,11` (RFC5147 String URI)

In NIF, this is part of the specification (`+`). In Web Annotation, this is possible, but not part of the standard, but only described in a [working note](https://w3c.github.io/web-annotation/selector-note/), hence `(+)`. For a list of relevant standards for IRI fragment identifiers see https://en.wikipedia.org/wiki/Web_annotation#Related_specifications. 

NIF: `+`

Web Annotation: `(+)`

CoNLL-RDF: `-` (provides *token* identifiers, not string identifiers. surface string lost in the underlying CoNLL format)

Ligt: `-`

POWLA: `(-)` (not specified, to be provided by complementary vocabulary, e.g., NIF or WA)

LAF: `-` (proprietary means of defining selectors)

### A.5 Explicit selectors

Aside from string IRIs, it should be possible to decode their information (e.g., offset information) into RDF statements.

Example (NIF):
```
<http://example.org/document/1#char=0,11>
 a nif:String ;
 nif:isString "the content"^^xsd:string;
 nif:beginIndex "0"^^xsd:nonNegativeInteger;
 nif:endIndex "11"^^xsd:nonNegativeInteger;
 nif:sourceUrl <http://differentday.blogspot.com/2007_01_01_archive.html>.
```

Example (Web Annotation):

```
[] a oa:ResourceSelection;
     oa:hasSource <http://example.org/ebook1> ;
     oa:hasSelector [
        a oa:TextPositionSelector ;
        oa:start 412 ;
        oa:end 795
     ].
```

NIF: `+`

Web Annotation: `+`

CoNLL-RDF: `-`

POWLA: `(+)` (recent publications recommend to rely on external vocabularies instead)

Ligt: `-`

Doesn't apply to LAF, etc.

### A.6 Explicit context strings

In order to facilitate interpretability and robustness of string URIs (regardless of changes in underlying resource or differences in, say, Unicode normalization), the vocabulary should permit to provide explicit contexts that contain the text that a string IRI refers to (e.g., its offsets).

Example (NIF):
```
<http://example.org/document/1#char=0,21> 		# context object 
 a nif:String , nif:Context ;
 nif:isString "We talk about Xiamen."^^xsd:string;	# string value of context
 nif:beginIndex "0"^^xsd:nonNegativeInteger;		# selector properties for context within source
 nif:endIndex "21"^^xsd:nonNegativeInteger;
 nif:sourceUrl <http://differentday.blogspot.com/2007_01_01_archive.html> .	# source URL

<http://example.org/document/1#char=14,20> a nif:String ;
 nif:referenceContext <http://example.org/document/1#char=0,3680> ;	# points to reference context
 nif:anchorOf "Xiamen"^^xsd:string ;					# string value of annotation unit
 nif:beginIndex "14"^^xsd:nonNegativeInteger ;				# selector properties for string within context
 nif:endIndex "20"^^xsd:nonNegativeInteger ;
 a nif:Word.
```

NIF: `+`

Web Annotation: `-`

CoNLL-RDF: `-`

POWLA: `-`

Ligt: `-`

Doesn't apply to LAF, etc.

### A.7 API specifications for web services

In addition to modelling aspects, the vocabulary should provide API specifications for web services that perform linguistic annotation, e.g., POS tagging, or that provide access to and/or manipulation of data.

NIF: `+` (https://persistence.uni-leipzig.org/nlp2rdf/specification/api.html)

Web Annotation: `+` (https://www.w3.org/TR/annotation-protocol/)

None of the other vocabularies specify web service protocols.

For independent APIs, also cf. DTS: https://distributed-text-services.github.io/specifications/ (esp. for applications in the humanities)

### A.8 Assign data categories

A vocabulary for linguistic annotation should either provide an exhaustive inventory of possible data categories (this is not possible, because more and novel annotation [schemes] keep emerging) or define how to link to a community-maintained repository of reference categories (this is the solution adopted in LAF and NIF).

A vocabulary can either provide its own properties (e.g. `nif:oliaLink`) or use standard RDF properties (`rdf:type`, etc.), but the strategy should be made explicit. 

NIF: `(+)` (`nif:oliaLink`, pointing to [OLiA](http://purl.org/olia/; for string annotations only; not for relational annotations)

Web Annotation: `(-)` (No reference vocabulary defined, but annotations can be defined as subclasses of OLiA classes) 

LAF: `(+)` (LAF and other ISO/TC37 standards: pointing to [ISOCat](http://www.isocat.org/), no longer maintained, successor solutions are only emerging: [CCR](https://www.clarin.eu/ccr), [DatCatInfo](http://www.datcatinfo.net/#/))

MAF: `(+)`

SemAF: `(+)`

SynAF: `(+)`

CoNLL-RDF: `(+)` (Publications and examples feature OLiA links, but only via `rdf:type` assignments; CoNLL-RDF is a NIF fragment, so, `nif:oliaLink` could be used)

Ligt: `(+)` (Not specified, but designed as a NIF fragment, so, `nif:oliaLink` could be used)

### A.9 Compatible with Web Annotation vocabulary

Web Annotation is an important standard, and the only actual W3C standard for RDF-based annotations on the web. Compatibility with Web Annotation is thus a requirement.

If a vocabulary
- builds and refines Web Annotation data structures, mark as `+`
- is transformable into / can be used in combination with Web Annotation, but is redundant (i.e., provides its own vocabulary for aspects covered by Web Annotation), mark as `(+)`
- can be used for some (which?) use cases in combination with Web Annotation, but has incompatible conceptualizations, mark as `(-)`
- otherwise, `-`

NIF: `(+)` (Hellmann et al. 2013 describe the use of NIF string URIs as Web Annotation targets)

Web Annotation: `+`

POWLA: `(+)`

CoNLL-RDF: `(+)`

Ligt: `(+)`

LAF: `(+)` (A partial reconstruction of LAF within WA has been described by Verspoor et al. 2012, but this does not seem to have been adopted in subsequent research nor evaluated by any third party.)

MAF: `(+)` (not checked in detail, but cf. LAF)

SemAF: `(+)`  (not checked in detail, but cf. LAF)

SynAF: `(+)`  (not checked in detail, but cf. LAF)

### A.10 Compatible with NIF 2.0 core vocabulary

NIF has an indepndent user and developer community that should be involved in the results of any harmonization effort, compatibility with NIF is thus a requirement.

If a vocabulary
- builds and refines NIF data structures, mark as `+`
- is transformable into / can be used in combination with NIF, but is redundant (i.e., provides its own vocabulary for aspects covered by NIF), mark as `(+)`
- can be used for some (which?) use cases in combination with NIF, but has incompatible conceptualizations, mark as `(-)`
- otherwise, `-`

NIF: `+`

Web Annotation: `(-)` (conversion restricted to types of annotation supported by NIF, potential loss of information, e.g., distinction between target and annotation, resp., body and annotation is unclear)

CoNLL-RDF: `+` (extends NIF vocabulary with data structures for one-word-per-line annotations, e.g., CoNLL, SketchEngine formats, see [here](https://github.com/acoli-repo/conll-rdf/); note the [extension for the encoding of trees](https://github.com/acoli-repo/conll-rdf/blob/master/examples/tree-example.sh) by means of [POWLA](http://purl.org/powla/powla.owl))

Ligt: `+` (extends NIF vocabulary with specifications for morphology (interlinear glossed text); still under development, see [here](https://github.com/acoli-repo/ligt)

POWLA: `(+)`

LAF: `-` (NIF systematically conflates LAF data structures, see A.11)

### A.11 Compatible with ISO standards

Much community work on standardization has been going into a standardization process conducted within ISO TC37. Unfortunately, documentation is partially available only, so we consider compliancy with [LAF](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) only, here. For application-specific substandards of LAF (MAF, SynAF, SemAF), cf. discussion below.

ISO standards by themselves are not directly compatible with NIF or Web Annotation as long as they are lacking an RDF serialization. A LAF serialization has been the basis for developing [POWLA](http://purl.org/powla/powla.owl)) that can be used in combination with either NIF or Web Annotation.

NIF: `-` (no generic data structures for linguistic annotation; conflates regions and nodes, see below)

Web Annotation: `(+)` (regions ~ targets, nodes ~ annotation, annotation ~ body; but no linguistic data structures, combination has been explored by [Verspoor et al. (2012)](https://www.aclweb.org/anthology/W12-3610.pdf).

CoNLL-RDF: `-` (only a specific subset, possibly SynAF)

Ligt: `-` (only a specific subset, possibly MAF)

LAF: `+`

MAF: `+`

SemAF: `+`

SynAF: `+`

## B. Expressiveness

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

### B.1 Pointers to primary data

In RDF vocabularies either by IRI fragment identifiers or explicit RDF statements (and vocabulary for that).

Examples for IRI fragment identifiers as pointers:

`http://example.com/text.txt#char=100` (RFC 5147 character offset = LAF anchor)
`http://example.com/text.txt#char=100,105` (RFC 5147 string URI = LAF region)

The default mechanism to define pointers in Web Annotation is by means of selectors that use application-specific information to address elements of a web document using explicit RDF statements.

NIF: `+`

Web Annotation: `+`

CoNLL-RDF: `(-)` (pointers to tokens, not primary data)

Ligt: `(-)` (pointers to data structures, not primary data)

POWLA: `(+)` (offset-based pointers possible, last publications recommend to use external vocabularies)

LAF: `+` (XPointers)

MAF: `+` (from LAF)

SemAF: `+` (from LAF)

SynAF: `+` (from LAF)

### B.2 Pointers: Vocabulary for explicit references

Provide (optional) RDF statements to explicate pointer information (e.g., offsets).

Example (NIF):

```
<http://example.org/document/1#char=14,20>
 nif:beginIndex "14"^^xsd:nonNegativeInteger ;
 nif:endIndex "20"^^xsd:nonNegativeInteger .
```

NIF: `+`

Web Annotation: `+`

POWLA: `(+)` (offset-based pointers possible, last publications recommend to use external vocabularies)

CoNLL-RDF: `-`

Ligt: `-`

LAF: `-` (no RDF statements)

### B.3 Pointers: User-provided selectors

Allow users to define application-specific pointers.

Web Annotation: `+`, provides the class `oa:Selector`. For different media, users can provide selector subclasses that encode the information an appication needs to identify the annotated element.

NIF: `-` (would be considered out of scope)

POWLA: `(+)` (in combination with Web Annotation)

CoNLL-RDF: `-`

LAF: `(-)` (actually, this is hard to tell, technically, this would be possible, but there don't seem to be documented examples)

### B.4 Pointers: Support the annotation of continuous strings

represent continuous multi-word segments, necessary for syntactic phrases, semantic annotations

Example (basic phrase structure syntax)

```
[NP ten books]
```

NIF: `+`

Web Annotation: `+`

POWLA: `+`

CoNLL-RDF: `+`

Ligt: `+`

LAF: `+`

MAF: `+`

SemAF: `+`

SynAF: `+`

### B.5 Pointers: Annotation of discontinuous strings

If one wants to "highlight" all entities (or particular words/phrases/strings), he/she would need to annotate each entity mention (word/phrases/strings).

Example:
`Diego Maradona is from Argentina.`

```
ext:offset_0_14 -> Diego Maradona
ext:offset_23_32 -> Argentina
```

NIF: `-` (annotations such as `ext:offset_0_14_23_32` are not considered nor supported)

Web Annotation: `+` (multiple selectors can be combined into an aggregate selector)

CoNLL-RDF: `(-)` (not natively, but in combination with POWLA)

POWLA: `(+)` (a terminal is offset-defined, so it apparently has to be a continuous string, but nonterminals can aggregate discontinuous sequences of terminals)

Ligt: `(-)` (in principle, discontinuous aggregates could exist, but there are no examples for that nor any model in current IGT annotation)

LAF: `(+)` (the existence of discontinuous anchors needs to be confirmed, but nodes can aggregate other nodes regardless of their position)

MAF, SemAF, SynAF: tbc.

### B.6 Pointers: Annotation of media files

Annotation of non-textual data, e.g., audio, video, images.

Web Annotation: `+` (core feature)

NIF: `-`

CoNLL-RDF: `-`

Ligt: `-`

LAF: `(-)` (tbc.)

### B.7 Pointers: Support the annotation of timestamps/timelines

For multi-media annotation, timeline-based annotation is the primary annotation strategy adopted by tools such as [ELAN](https://tla.mpi.nl/tools/tla-tools/elan/) and [Exmaralda](https://exmaralda.org/en/about-exmaralda/). Here, textual data is the value (body) of an annotation, the timeline is correlated with one or multiple mediafiles, but the mediafile is not directly the target of the annotation.

Example and motivation: see https://www.exmaralda.org/files/SFB_AzM62.pdf (Fig. 2)

Web Annotation: `(+)` (users may provide a specialized selector for such data)

NIF: `-`

CoNLL-RDF: `-`

POWLA: `(+)` (if combined with Web Annotation)

Ligt: `-`

LAF: `(+)` (tbc.; CC: I'm pretty sure this has been addressed)

MAF, SynAF, SemAF: tbc.

### B.8 Pointers: standoff annotation

Vocabulary should be able to annotate content residing in a separate file or resource.

NIF: `+`

Web Annotation: `+`

LAF: `+`

CoNLL-RDF: `+`

POWLA: `+`

Ligt: `(+)` (no examples known)

MAF, SemAF, SynAF: tbc.

### B.9 Generic data structures for linguistic annotation: node != pointer

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) pointers are distinguished from units of annotation. Conceptually, it is important that pointers and units of annotations are (or: can be) distinguished, because the same string may have multiple, independent annotations. 

Example:

```
[S [VF [NP [NE Peter ] ] ] [LK [V war ] ] [MF [ADVX [ADV nicht] [ADV zuhause] ] ] ]
```

German, 'Peter wasn't home', example inspired by [TüBa-D/Z corpus](http://www.sfs.uni-tuebingen.de/en/ascl/resources/corpora/tueba-dz.html) 

```
VF -> Peter (Vorfeld, syntactic position)
NP -> Peter (Noun Phrase, constituent at VF position)
NE -> Peter (Named Entity that constitutes the NP)
```

These are co-extensional, but their hierarchical organization (in the annotation) is meaningful and must be preserved even though they refer to the same string value.

Web Annotation: `+` (pointer = target, node = annotation or body -- depending on interpretation)

NIF: `-`

CoNLL-RDF: `(+)` (in combination with POWLA)

POWLA: `+`

Ligt: `(-)` (unclear)

LAF: `+`

MAF, SemAF, SynAF: tbc.

### B.10 Generic data structures for linguistic annotation: zero nodes

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

NIF: `(+)` (the default encoding for annotations in NIF is by subclasses of `nif:String`)

Web Annotation: `(+)` (Web annotation requires some target.)

POWLA: `+` (from LAF)

LAF: `+`

Ligt: `+`

CoNLL-RDF: `(+)` (for zero tokens in underlying CoNLL format)

MAF, SemAF, SynAF: tbc.

### B.11 Generic data structures for linguistic annotation: edge ('relation')

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) edge is a relation from one or multiple nodes to one or multiple nodes. Edges are, for example, syntactic dependencies. The vocabulary should provide a way to mark an RDF statement as being a edge/relation in the sense of LAF, e.g., a property or class that annotation-specific edges can provide sub-classes/-properties for.

Example ([POWLA](http://purl.org/powla/powla.owl)):
`powla:Relation` (concept) with properties `powla:isSourceOf` and `powla:isTargetOf`

No explicit data structures for edges in NIF nor Web Annotation.

NIF: `-`

Web Annotation: `-`

CoNLL-RDF: `(+)` (restricted to syntactic dependencies and semantic roles)

Ligt: `-`

LAF: `+`

POWLA: `+`

MAF: tbc.

SemAF: `+` (tbc: restricted to certain relation types)

SynAF: `+` (part of the old TIGER format, SynAF is marketed as TIGER2, so, it should keep that) 

#### B.11.a Non-reified representation of edges

It should be possible to encode edges with a single RDF statement (if provider decides not provide metadata, etc.).

Example ([POWLA](http://purl.org/powla/powla.owl); BUT: restricted to hierachical reations):
`powla:hasParent` resp. `powla:hasChild`

NIF: `(-)` (`nif:subStringOf` could be abused for this purpose, for hierarchical relations only, operates on regions/strings, not annotations. Default strategy in NIF is to introduce ad hoc properties, cf. [NIF Stanford Core demo](http://stanford.nlp2rdf.aksw.org/stanfordcorenlpn?f=text&i=This+is+a+test.&t=direct))

Web Annotation: `-`

POWLA: `(+)` (for hierarchical relations only)

Ligt: `-`

CoNLL-RDF: `(+)` (for semantic roles only)

LAF, MAF, SemAF, SynAF: not applicable, no RDF

### B.12 Reified representation of edges (annotation relations)

For an edge (relation), it must be possible to annotate it with additional data, e.g., linguistic data categories. The vocabulary should support a reified view on, say, dependency relations.

Example  ([POWLA](http://purl.org/powla/powla.owl)):
```
:relation a powla:Relation, powla:DominanceRelation;
 a olia:SyntacticAdjunct;
 powla:hasSource :someElement; powla:hasTarget :someOtherElement.
```

Web Annotation: `-`

NIF: `-`

POWLA: `+`

CoNLL-RDF: `-` (only in combination with POWLA)

Ligt: `-`

LAF: `(+)` ("reification" is not directly applicable to non-RDF data)

### B.13 Generic data structures for linguistic annotation: graphs

In LAF, a graph a is a collection of nodes and edges. In RDF, this corresponds to an RDF graph (often representing the document that a particular set of RDF statements originates from). We do not require explicit data structures for graphs beyond that (do we?). A vocabulary that provides explicit data structures would be `+`, any other RDF vocabulary would be `(+)`, non-RDF vocabularies without explicit data structures would be `-`.

NIF: `(+)`

Web Annotation: `(+)`

POWLA: `+`

LAF: `+`

CoNLL-RDF: `(+)`

Ligt: `(+)`

MAF, SemAF, SynAF: tbc.

### B.14 Generic data structures for linguistic annotation: annotations

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) defines generic linguistic data structures from which annotation-specific datastructures can be derived. These are

- pointers to primary data ("media")
- units of annotation ("graph")
- annotations
  - annotation (linguistic information attached to any node or edge)
  - annotation space (groups together annotations of the same type, say, POS)

The vocabulary should provide a designated class for linguistic annotations that different application can create application-specific subclasses for. In Web Annotation, this would be either `oa:Annotation` or a body (depending on interpretation). In NIF, such an element is missing. For annotations of a particular string, this function is taken over by `nif:String`, for more complex constellations, `nif:AnnotationUnit` can be used, but is not the default way of modelling.

Web Annotation: `+`

NIF: `(-)` (`nif:String`), resp. `(+)` (`nif:AnnotationUnit`, not the default encoding, though)

LAF: `+`

POWLA: `(+)` (tbc)

CoNLL-RDF: `(-)` (not created by default)

Ligt: `(-)` (tbc)

MAF, SemAF, SynAF: tbc

### B.15 Generic data structures for linguistic annotation: annotation space ("tagset")

[ISO 24612-2012](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) defines generic linguistic data structures from which annotation-specific datastructures can be derived. These are

- pointers to primary data ("media")
- units of annotation ("graph")
- annotations
  - annotation (linguistic information attached to any node or edge)
  - annotation space (groups together annotations of the same type, say, POS)

The vocabulary should provide a standard way to assign annotations a particular type or class. This corresponds to user-provided subclasses of (the abstract) `oa:Annotation` class in Web Annotation. In NIF, this could be treated as part of provenance metadata, but a designated property seems to be missing.

Web Annotation: `+`

NIF: `(+)` (via OLiA)

POWLA: `(+)` (via OLiA)

CoNLL-RDF: `(+)` (via OLiA)

Ligt: `(-)` (no example known)

LAF: `+`

MAF, SemAF, SynAF: tbc.

### B.16 Provenance

The vocabulary should provide a way to
- assert provenance about (annotations of) nodes and edges, mark as `+`, or
- assert provenance about (annotatios of) nodes, mark as `(+)`.
- If it can be complemented with an external RDF vocabulary to assert provenance, mark as `(-)`.
- Otherwise, mark as `-`.

NIF 2.1 defines `nif:AnnotationUnit` which can use used to distinguish annotations comming from different NLP tools on same strings (same offsets).

Web Annotation does not prescribe a reference vocabulary for provenance, but can be combined with, say, [PROV-O](https://www.w3.org/TR/prov-o/).

NIF: `(-)` (NIF 2.0)

NIF 2.1: `(+)`

Web Annotation: `(-)`

CoNLL-RDF: `(-)`

LAF: `-` (no RDF extension possible)

POWLA: `(-)`

Ligt: `(-)`

### B.17 Concurrent annotation

It should be possible to provide alternative, and distinct annotations of the same phenomenon with different provenance, e.g., for combining entity linking services or for comparing the output of different parsers.

In addition to provenance, this requires to identify the "annotation space" (LAF terminology).

Example (two alternative parses of the same sentence):
'He saw the man with the telescope.'

```
(S (NP He)             # high PP attachment, tool A
   (VP saw
       (NP the man)
       (PP with the telescope)))

(S (NP He)             # low PP attachment, tool B
   (VP saw
       (NP the man
           (PP with the telescope)))
```

For TSV ("CoNLL") annotations, a file with multiple annotations can be created with [CoNLL-Merge](https://github.com/acoli-repo/conll):

```
# WORD     PARSE-A         PARSE-B
He         (S (NP *)       (S NP *)
saw           (VP *           (VP *
the               (NP *           (NP *
man                   *)              *              # difference!
with              (PP *               (PP *
the                   *                   *
telescope             *)))                *))))      # difference!
```

Real-world examples: concurrent annotations of Brown corpus ([Susanne](https://www.grsampson.net/RSue.html), [Penn](https://catalog.ldc.upenn.edu/LDC2019T05)), concurrent annotations of WSJ corpus ([Penn](https://catalog.ldc.upenn.edu/LDC2019T05), [OntoNotes](https://catalog.ldc.upenn.edu/ldc2013t19)).

NIF: `-`

Web Annotation: `-`

POWLA: `+`

LAF: `+`

CoNLL-RDF: `(-)` (different properties in different columns, controlled by the user)

Ligt: `(-)` (no example known)

MAF, SemAF, SynAF: tbc.

### B.18 Sequence of annotation units

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

NIF: `(+)` (only for selected annotation units, e.g., `nif:nextWord`, `nif:nextSentence`)

Web Annotation: `-`

Ligt: `(+)` (for native annotation units)

CoNLL-RDF: `(+)` (for native CoNLL-RDF annotation units)

POWLA: `+`

LAF: `+`

MAF, SynAF, SemAF: tbc.

### B.19 annotation values: plain literals

The vocabulary should support annotation (annotation value/body) with plain literals, e.g., strings.

Example:
```
:some_region_uri nif:lemma "tree" .
```

NIF: `+`

Web Annotation: `+`

CoNLL-RDF: `+`

Ligt: `+`

POWLA: `+`

LAF: `+`

MAF, SynAF, SemAF: tbc.

### B.20 annotation values: feature structures

The vocabulary should support annotation (annotation value/body) with feature structures, i.e., root nodes of directed (acyclic) graphs. In RDF, this requirement can be reformulated as permitting RDF resources (URIs) as annotations.

Example:
```
:some_region_uri nif:oliaLink penn:NN.
```

NIF: `+`

Web Annotation: `+`

POWLA: `+` (e.g., using OLiA)

CoNLL-RDF: `(+)` (can be represented, but are not created by default conversion)

Ligt: `(+)` (no example known)

LAF: `+`

MAF: `+` (tbc)

SynAF: `+` (tbc)

SemAF: `+`

## C. Levels of linguistic analysis: units of annotation

For a particular level of linguistic analysis, the vocabulary should
- define (`+`) or address (`(+)`) the relevant units of annotation, and 
- permit to navigate among units of annotation (e.g., retrieving the next annotation of the same kind)

### C.1 Word-level annotations: word unit

The vocabulary must support the annotation of individual words (tokens), e.g., for entity linking or part-of-speech tagging:
- If it provides a concept for words or tokens, mark as `+`
- If it can address/express words or tokens, but does not provide a designated concept, mark as `(+)`
- If it does not allow to annotate words, mark as `-`.

Example: part-of-speech annotation

```
book/NN
```

NIF: `+` (`nif:Word`)

Web Annotation: `(+)` (no designated concept)

CoNLL-RDF: `+` (`nif:Word`)

POWLA: `(+)` (`powla:Terminal`, but can be sub-token)

LAF: `+`

Ligt: `+`

MAF: `+`

SynAF: `+`

SemAF: `+`

### C.2 Sentence-level annotation: sentence unit

NIF: `+` (`nif:Sentence`)

Web Annotation: `(+)` (no explicit data structure, but can be added)

CoNLL-RDF: `+` (`nif:Sentence`)

Ligt: `+`

POWLA: `(+)` (`powla:Root`, but this doesn't have to be sentential)

LAF: `(-)` (tbc.)

MAF: tbc.

SynAF: `+`

SemAF: `+` (tbc.)

### C.3 morphology: morphological segments

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

Not addressed by NIF, neither WA. 

NIF: `(-)` (no designated vocabulary, can be accessed as substrings, but not in all cases.)

Web Annotation: `(+)` (no designated vocabulary, but can be added)

CoNLL-RDF: `-`

Ligt: `+`

LAF: `(+)` (no designated vocabulary, but can be modelled as segments)

MAF: `+` (tbc.)

SynAF: `-` (tbc)

SemAF: tbc

POWLA: `(+)` (no designated vocabulary, but can be added)

A candidate vocabulary to relate with is the OntoLex Morphology module:  https://www.w3.org/community/ontolex/wiki/Morphology.
The interface between morphological dictionary and corpus has not been defined yet.

### C.4 syntax/text structure: node labels/types

The vocabulary should provide (or refer to) an inventory of syntactic categories, e.g., phrase. Note that this must be extensible to accomodate novel types of annotation.

Web Annotation: `(+)` (via user-provided subclasses of `oa:Annotation`)

NIF: `(+)` (predefined datatypes `nif:Word`, `nif:Phrase`, `nif:Paragraph`, etc.; but note that these do not describe nodes in the sense of LAF, but regions)

In addition, NIF allows to use `nif:oliaLink` to refer to an external terminology base, here [OLiA](http://purl.org/olia). An alternative to OLiA is the [CLARIN Concept Registry](https://www.clarin.eu/ccr), but note that it is extensible only by national CLARIN representatives whereas OLiA is an [open source project on GitHub](https://github.com/acoli-repo/olia). AFAIK, NIF uses `nif:oliaLink` for part of speech information only, so this is partial solution, again, hence, `(+)`.

POWLA: `+` (using an external vocabulary, OLiA)

CoNLL-RDF: `(+)` (phrase structures can only be expressed in combination with POWLA)

Ligt: `-` (no examples for phrase-level annotations)

LAF: `+` (ISOcat)

SynAF: `(+)` (ISOcat, for syntax, but hard-wired data structures only)

MAF: `-` (no syntax nodes)

SemAF: `(+)` (ISOcat, for text/discourse, but hard-wired data structures only)

### C.5 semantics: node labels/types

Similar as for syntax/text structure, details to be determined from SemAF, [NERD](http://nerd.eurecom.fr/ontology) (for named entities), [GlobalWordNet Interlingual Index](https://github.com/globalwordnet/ili) (for word senses), etc. 

This requires a very rich and extensible inventory of data categories, so better as an external resource. Again, [OLiA](http://purl.org/olia) and the [OLiA Discourse Extensions](http://www.acoli.informatik.uni-frankfurt.de/resources/discourse/) are a candidate resources here, but note that this would require extensions wrt. lexical semantics.

NIF: `(-)`. NIF supports entity linking, but no other form of semantic annotation, hence `(-)`.

Web Annotation: `(-)`. Web Annotation is widely used for entity linking, but it does not provide a designated vocabulary for entities, hence `(-)`.

POWLA: `+` (using an external vocabulary, OLiA)

CoNLL-RDF: `(-)` (can be created from CoNLL-RDF data)

Ligt: `-` (morphology only)

MAF: `-` (morphology only)

SynAF: `-` (tbc)

SemAF: `+` (tbc)

LAF: `+` (ISOcat)

## D. Levels of linguistic analysis: sequential structure

For a particular level of linguistic analysis, the vocabulary should
- define (`+`) or address (`(+)`) the relevant units of annotation, and 
- permit to navigate among units of annotation (e.g., retrieving the next annotation of the same kind)

As for "navigation" relations between adjacent units: For different levels of linguistic annotation (e.g., morphology, word-level annotations), the vocabulary should provide an explicit means to identify the next (or preceding) unit of annotation. For pre-RDF vocabularies, this can be encoded in the structure of a a file (e.g., in XML or CoNLL formats), for RDF vocabularies, this must be explicit triples.

In Web Annotation, this is absent, hence `-`.
NIF defines such properties for limited number of possible relations among concepts, e.g. `nif:nextWord` or `nif:nextSentance`, but not for others (e.g., morphs).

### D.1 Word-level annotation: sequence of words

NIF: `+` (`nif:nextWord`)

Web Annotation: `-` (no sequence properties whatsoever)

CoNLL-RDF: `+` (`nif:nextWord`)

Ligt: `+`

POWLA: `(+)` (words are not a designated datatype)

LAF: `(+)` (tbc., implicitly via offsets?)

SynAF: `(+)` (tbc: implicitly via XML?)

MAF: `(+)` (tbc: implicitly via XML?)

SemAF: `(+)` (tbc: implcitly via XML?)

### D.2 Sentence-level annotation: sequence of sentences

NIF: `+` (`nif:nextSentence`)

Web Annotation: `-`

CoNLL-RDF: `+`

Ligt: `+`

LAF: `(+)` (tbc)

MAF: `(+)` (tbc)

SemAF: `(+)` (tbc)

SynAF: `(+)` (tbc)

### D.3 Morphology: sequence of morphological segments

`cats` = `cat` + `s` with `cat "directly precedes" s`.

NIF: `-`

Web Annotation: `-`

For a possible solution, cf. [Ligt](https://github.com/acoli-repo/ligt).

Ligt: `+`

CoNLL-RDF: `-`

LAF: `(+)` (tbc)

MAF: `+`

SynAF: `(-)` (tbc)

SemAF: `(-)` (tbc)

### D.4 Syntax: discontinuous multi-word segments

represent discontinuous multi-word segments	represent syntactic phrases, regardless of their sequential order

Example:
```
[What] did they laugh [about]?
```

At a deep level, the phrase here is `[about what]`. If this can be represented directly, mark `+`. If the system requires the introduction of a zero element, mark as `(-)`.

Note that this is different from the annotation of discontinuous strings, as the words being connected can have an internal syntactic structure.

Web Annotation: `(-)` (no vocabulary for phrase-level structures, could be added, e.g., from POWLA)

NIF: `-` (NIF phrases are strings, i.e., necessarily continuous)

POWLA: `+`

LAF: `+`

CoNLL-RDF: `(-)` (no phrases, could be added when combined with POWLA)

Ligt: `(-)` (no examples known)

MAF: tbc.

SynAF: `(+)` (tbc., syntax is likely the reason for having such nodes in LAF)

SemAF: `(+)` (tbc., in analogy with SynAF?)


### D.5 Syntax/text structure: sequence of elements within a phrase

Within the vocabulary, we should be able to quickly navigate from one sibling to the next.

Lacking in NIF and Web Annotation, hence `-`, but provided by [POWLA](http://purl.org/powla), an RDF/OWL reconstruction of LAF.

NIF: `(-)` (depends on internal structure of the phrase, if these are words, this could be `nif:nextWord`, if these are phrases, this is undefined)

Web Annotation: `-`

POWLA: `+`

Ligt: `+`

CoNLL-RDF: `-` (no phrases)

LAF: `(+)` (tbc)

SynAF: `+` (tbc)

MAF: `-` (tbc)

SemAF: `+` (tbc., e.g., for discourse annotation)

## E. Levels of linguistic analysis: relational structure

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

### E.1 Morphology: relations

hierachical/other relations to be confirmed, cf. OntoLex-Morph and MAF

Vocabulary should either provide the vocabulary or refer to an external terminology repository that provides the necessary vocabulary

### E.2 Dependency syntax
 
no hierarchical relations, to be confirmed whether primary and secondary dependencies are to be distinguished (cf. https://universaldependencies.org/), cf. SynAF (other standards?)

### E.3 Phrase structure syntax: hierarchical relations

hierarchical relations, must be annotatable, see SynAF, to be confirmed whether primary and secondary edges are to be distinguished (cf. [TIGER XML](https://www.ims.uni-stuttgart.de/forschung/ressourcen/werkzeuge/TIGERSearch/doc/html/TigerXML.html))

### E.4 Phrase structure syntax: other relations

to be confirmed, e.g., for movement/traces, see SynAF. 
Note that an indirect encoding by means of empty elements may be possible under certain circumstances, cf. the modelling of syntactic movement by means of traces in generative syntax.

### E.5 Semantics: relations

cf. SemAF, must cover a broad inventory of relations, including TimeML, PropBank/FrameNet-style semantic roles, different forms of discourse annotation (RST: hierarchical, PDTB: non-hierarchical), coreference, etc.

In order to prevent unlimited growth of the vocabulary, semantic annotations should use refer to a(n extensible) terminology repository rather than aiming to provide an exhaustive list 'within the vocabulary'. 

### Other (to be added)


## F. Data structures for novel applications

Aside from the types of annotation listed below, RDF-based technology enables better support for phenomena that no community standard currently does exist for. These are usecases that involve linking across documents. Note that requirements for "conventional annotations" (such as covered by existing W3C, ISO or other standards) are listed below.

### F.1 Intertextual relations

Link text passages from different documents that correspond to each other, e.g., because of text reuse. There should be an encoding for undirected overlap (if two sources derive from the same, anonymous source or the direction of reuse is uncear) and a different encoding for confirmed text reuse.

Motivation: Digital Humanities

Currently no native vocabulary within Web Annotation or NIF, but both can be extended with user-provided properties for the purpose, hence `(-)`.

### F.2 Collation and alignment

Alignment: Parallel corpora are conventionally used, but current technology is restricted to bilingual pairs (e.g., [TreeAligner](https://www.cl.uzh.ch/en/texttechnologies/research/corpus-linguistics/paralleltreebanks/treealigner.ht). For developing language-independent applications and tools, it would be beneficial to support alignment between more than two languages. Different kinds of alignments need to be distinguished: Undirected alignment (the intuitive default) and directed alignment (as produced by standard alignment tools that produce either m:1 or 1:n alignments).

Collation: For different editions of the same document (e.g., different manuscripts), align corresponding passages in an order-insensitive way. Note that collation typically extends to *much* more than two sources. For existing tools, cf. [CollateX](https://collatex.net/doc/), but note that it does not support annotated data. Collation as such is undirected, but it should be possible to assert the direction of text reuse.

Motivation: NLP (parallel corpora) and Digital Humanities (collation)

Currently no native vocabulary within Web Annotation or NIF, but both can be extended with user-provided properties or classes for the purpose, hence `(-)`.

Web Annotation: `(-)` (extensible for undirected alignment for more than 2 languages: "alignment" as subclass of `oa:Annotation` with multiple targets)

NIF: `(-)`

For original TSV ("CoNLL") annotations, such data can be created with [CoNLL-Merge](https://github.com/acoli-repo/conll) and represented in RDF using the [CoNLL-RDF vocabulary](https://github.com/acoli-repo/conll-rdf).

CoNLL-RDF: `(+)` (directed alignment only, encoded in CoNLL columns, i.e., CoNLL-RDF properties, cf. [here](https://github.com/acoli-repo/rdf4discourse/blob/master/discourse-markers/parcor/opus/Europarl.de-it.annotated-sample.conll))

### F.3 Links with lexical resources

Link an expression with a glossary or a dictionary, e.g., to provide attestation information (within a dictionary) or to provide lexical information (within a corpus). Approach should be coordinated with [OntoLex-FrAC](https://github.com/acoli-repo/ontolex-frac).

Motivation: Digital Philologies

Currently no native vocabulary within Web Annotation or NIF, but both can be extended with user-provided properties for the purpose, hence `(-)`.

### F.4 Dialog annotation

Represent contributions of different dialog partners as indepndent texts/documents/media files and annotate them separately, but within the same annotation graph (tbc: could be required by SemAF).

This is necessary, for example, if multiple recorders are being used, and annotation may switch from the (best) recorder for participant A to the (best) recorder for participant B.

Not addressed in NIF: `-`
Web Annotation allows to annotate multiple targets simultaneously, but it lacks the vocabulary to create links between annotations, e.g., for marking turn shifts), hence `(+)` 

### Other (please add)
...
