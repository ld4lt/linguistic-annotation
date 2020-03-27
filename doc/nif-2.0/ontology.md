Markdown edition of the [NIF 2.0 Core Ontology edition](https://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/nif-core.html) (retrieved 2020-03-27), originally generated from the [NIF 2.0 Core Ontology](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/nif-core.owl) by processing the OWL ontology source code through [LODE](http://www.essepuntato.it/lode), _Live OWL Documentation Environment_, developed by [Silvio Peroni](http://www.essepuntato.it). The Markdown edition is provided to faciliate subsequent collaborative editing, the content is left untouched.

For convenience of reading, we also include the NIF Core Ontology diagram:

![NIF Core Ontology diagram](https://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/nif-core-ontology_web.png "NIF Core Ontology")

NIF 2.0 Core Ontology
=====================

IRI: http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#

Current version: Versioning done on resource level. See https://github.com/NLP2RDF/ontologies/blob/master/nif-core/nif-core.ttl

Authors: Sebastian Hellmann

Contributors: Martin Brümmer, Navid Nourbakhsh

Publisher: AKSW, University Leipzig

Other visualisation:
* [HTML](https://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/nif-core.html)
* [Ontology source](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/nif-core.owl)

This ontology is licensed under Apache 2.0 (http://www.apache.org/licenses/LICENSE-2.0) and CC-BY (http://creativecommons.org/licenses/by/3.0/)

* * *

Abstract
--------

The NLP Interchange Format (NIF) is an RDF/OWL-based format that aims to achieve interoperability between Natural Language Processing (NLP) tools, language resources and annotations. NIF consists of specifications, ontologies and software, which are combined under the version identifier "2.0", but are versioned individually. This ontology is developed by the NLP2RDF project (http://nlp2rdf.org) and provided as part of NIF 2.0 under CC-BY license as well as Apache 2.0. The ontology contains seven core URIs (String, RFC5147String, Context, isString, referenceContext, beginIndex, endIndex) that provide the foundation to express NLP annotations effectively in RDF.

Introduction
------------

For a more concise description about NIF, we refer the reader to the ISWC 2013 in Use paper: Integrating NLP using Linked Data by Sebastian Hellmann, Jens Lehmann, Sören Auer, and Martin Brümmer available at: http://svn.aksw.org/papers/2013/ISWC\_NIF/public.pdf Also the NLP2RDF project page (http://nlp2rdf.org) provides more general documentation and pointers.

The NIF 2.0 Core Ontology (http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#) provides classes and properties to describe the relations between substrings, text, documents by assigning URIs to strings. These URIs can then be used as subjects in RDF triples and therefore they can be annotated easily. The NIF 2.0 Core Specification defines how such URIs are created and used: http://persistence.uni-leipzig.org/nlp2rdf/specification/core.html and it makes sense to read this document first, so you can understand the definitions in this ontology better.

The main class in this ontology is nif:String, which is the class of all words over the alphabet of Unicode characters (sometimes called Σ∗). We built NIF upon the Unicode Normalization Form C, as this follows the recommendation of the RDF standard for rdf:Literal. Indices are to be counted in code units as is common in most programming language and SPARQL engines ( see 17.4.3.2 STRLEN and 17.4.3.3 SUBSTR on http://www.w3.org/TR/sparql11-query/).

Each URI Scheme (nif:URIScheme) used to address strings is a subclass of nif:String and puts further restrictions over the syntax of the URIs. For example, instances of type nif:RFC5147String have to adhere to the Syntax and Semantics of RFC 5147 (http://tools.ietf.org/html/rfc5147). Users of NIF can create their own URI schemes by subclassing nif:String and providing documentation on the Web in the rdfs:comment field.

Another important subclass of nif:String is the nif:Context OWL class. This class is assigned to the whole string of the text (i.e. all characters). The purpose of an individual of this class is special, because the string of this individual is used to calculate the indices for all substrings. Therefore, all substrings have to have a relation nif:referenceContext pointing to an instance of nif:Context. Furthermore, the datatype property nif:isString can be used to include the reference text as a literal within the RDF as is required for the web service scenario. An example of NIF Core can be seen on the top left of the example Figure.

Ontology models

This ontology is split in different complimentary parts:

* a terminological model (containing rdfs:comment, rdfs:label, rdfs:subClassOf, rdfs:subPropertyOf, rdfs:range and rdfs:domain statements)
* an inference model (containing owl:TransitiveProperty, owl:hasKey), see nif-core-inf.ttl
* a validation model (containing owl:FunctionalProperty, owl:DisjointWith), see nif-core-val.ttl
* a Stanford profile model (containing a more complex structure)

An overview is given at the bottom of: http://persistence.uni-leipzig.org/nlp2rdf/

Feedback

If you'd like to leave feedback, please open an issue on GitHub (https://github.com/NLP2RDF/ontologies/issues) and read the README (https://github.com/NLP2RDF/ontologies#readme) or write an email to the mailing list: http://lists.informatik.uni-leipzig.de/mailman/listinfo/nlp2rdf

Versioning process is explained here: http://persistence.uni-leipzig.org/nlp2rdf/specification/version.html Changelog is written to rdfs:comment (resource level versioning).

Classes
-------

*   [Annotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Annotation)
*   [Consecutive String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CString)
*   [Consecutive String Instantiation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CStringInst)
*   [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)
*   [Context Collection](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#ContextCollection)
*   [Context Hash Based String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#ContextHashBasedString)
*   [Offset-based String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#OffsetBasedString)
*   [Paragraph](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Paragraph)
*   [Phrase](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Phrase)
*   [RFC 5147 String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#RFC5147String)
*   [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
*   [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
*   [Structure](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure)
*   [Title](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Title)
*   [URI Scheme](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#URIScheme)
*   [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)

### Annotation (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Annotation

Current version: 0.0.1

Individuals of this class are annotations of strings. This class can be used if an annotation statement has to be annotated with further information, like confidence or annotation provenance (like which tool produced the annotation).

Changelog:

* 0.0.1 initial commit of class

Axioms:
* is in domain of [confidence of annotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#confidence)
* is in range of [topic](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#topic)

### Consecutive String (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CString

Current version: 0.1.0

A URI Scheme for NIF which is able to refer to a single, consecutive string in a context. Note that any scheme subclassing this class, requires the existence of beginIndex, endIndex and referenceContext .

This is an abstract class and should not be serialized.

* has super-classes [URI Scheme](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#URIScheme), [begin index](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#beginIndex) exactly 1, [end index](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#endIndex) exactly 1
* has sub-classes [Consecutive String Instantiation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CStringInst), [Offset-based String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#OffsetBasedString), [RFC 5147 String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#RFC5147String)

### Consecutive String Instantiation (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CStringInst

Current version: 0.0.0

An abitrary URI (e.g. a URN) for an arbitrary string of the context. This is roughly the same as TextAnnotations are currently implemented in Stanbol.

* has super-classes [Consecutive String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CString)

### Context (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context

Current version: 1.0.2

The string that serves as a context for its substrings. The Unicode String given in the nif:isString property must be used to calculate the begin and endIndex for all nif:Strings that have a nif:referenceContext property to this URI. For further information, see http://svn.aksw.org/papers/2013/ISWC\_NIF/public.pdf

Changelog

* 1.0.1. improved documentation
* 1.0.2. merged inf model

Axioms:
* has super-classes [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String), [reference context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#referenceContext), [is string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#isString) exactly 1
* is in domain of [broader Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#broaderContext), [is string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#isString), [narrower Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#narrowerContext), [predominant language](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#predLang), [source URL](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sourceUrl)
* is in range of [broader Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#broaderContext), [has context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#hasContext), [narrower Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#narrowerContext), [reference context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#referenceContext)

### Context Collection (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#ContextCollection

Current version: 0.1.1

A collection of contexts used to create an unordered set of context via the nif:hasContext property. This can be compared to a document collection, but here it is a collection of nif:Context and therefore a collection of annotated strings, not documents.

Open Issues

Investigate ordered collections

Changelog

* 0.1.1 improved documentation

Axioms:
* is in domain of [has context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#hasContext)

### Context Hash Based String (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#ContextHashBasedString

Current version: 1.0.0

cf. https://www.google.de/search?q=Linked-Data+Aware+URI+Schemes+for+Referencing+Text

* has super-classes [URI Scheme](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#URIScheme)

### Offset-based String (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#OffsetBasedString

Current version: 1.1.0

cf. Linked-Data Aware URI Schemes for Referencing Text Fragments by Sebastian Hellmann, Jens Lehmann und Sören Auer in EKAW 2012 http://jens-lehmann.org/files/2012/ekaw\_nif.pdf

requires the existence of begin, endIndex and referenceContext

Changelog:

* 1.0.0 originally a plain text string was attached to this uri scheme, but this was removed later, because of complaints and complexity.
* 1.1.0 subclassing of nif:CString

Axioms:
* has super-classes [Consecutive String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CString)

### Paragraph (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Paragraph

Current version: 0.1.1

A paragraph.

Changelog:

* 0.1.1 fixed spelling, added language tag

Axioms:
* has super-classes [Structure](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure)

### Phrase (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Phrase

Current version: 0.1.1

A nif:Phrase can be a nif:String, that is a chunk of several words or a word itself (e.g. a NounPhrase as a Named Entity). The term is underspecified and can be compatible with many defintitions of phrase. Please subClass it to specify the meaning (e.g. for Chunking or Phrase Structure Grammar). Example: ((My dog)(also)(likes)(eating (sausage)))

Changelog:

* 0.1.1 fixed spelling

Axioms:
* has super-classes [Structure](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure)

### RFC 5147 String (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#RFC5147String

Current version: 1.1.0

cf. http://tools.ietf.org/html/rfc5147 URIs of this class have to conform with the syntax of RFC 5147 in a way that the end on a valid identifier, if you remove the prefix. Note that unlike RFC 5147 NIF does not requrire '#' URIs. So valid URIs are http://example.org#char=0,28 , http://example.org/whatever/char=0,28 , http://example.org/nif?char=0,28

Changelog:

* 1.1.0 changed subclass to CString .
* 1.1.1 typo in rdfs:label and extension of comment

Axioms:
* has super-classes [Consecutive String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CString)

### Sentence (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence

Current version: 0.1.1

A sentence.

Changelog:

* 0.1.1 fixed spelling, added language tag

Axioms:
* has super-classes [Structure](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure)
* is in domain of [has first word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#firstWord), [has last word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lastWord), [has word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#word), [next sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentence), [next sentence trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentenceTrans), [previous sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentence), [previous sentence trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentenceTrans)
* is in range of [next sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentence), [next sentence trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentenceTrans), [previous sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentence), [previous sentence trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentenceTrans), [sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sentence)

### String (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String

Current version: 1.0.2

Individuals of this class are a string, i.e. Unicode characters, who have been given a URI and are used in the subject of an RDF statement.

This class is abstract and should not be serialized.

NIF-Stanbol (nif-stanbol.ttl):

subclassOf nifs:Annotation because it "annotates" strings for example with begin and end index. The class is similar to fise:TextAnnotation

Changelog

* 1.0.1. improved documentation
* 1.0.2. merged inf and val model

Axioms:
* has super-classes [reference context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#referenceContext) some [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)
* has sub-classes [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context), [Structure](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure), [URI Scheme](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#URIScheme)
* is in domain of [Confidence of OLiA tag](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaConf), [OLiA link](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaLink), [Part of speech tag](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#posTag), [Provenance of OLiA tag](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaProv), [after](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#after), [anchor of](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#anchorOf), [before](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#before), [begin index](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#beginIndex), [dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependency), [dependency relation type](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyRelationType), [end index](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#endIndex), [head](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#head), [inter](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#inter), [keyword](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#keyword), [language of the string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lang), [lemma](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lemma), [opinion](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#opinion), [reference context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#referenceContext), [sentiment value](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sentimentValue), [stem](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#stem), [sub string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subString), [super String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superString), [topic](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#topic), [transitive version of dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyTrans), [transitive version of subString](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subStringTrans), [transitive version of superString](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superStringTrans), [was converted from](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#wasConvertedFrom)
* is in range of [dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependency), [inter](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#inter), [sub string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subString), [super String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superString), [transitive version of dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyTrans), [transitive version of subString](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subStringTrans), [transitive version of superString](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superStringTrans), [was converted from](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#wasConvertedFrom)
* has keys

### Structure (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure

Current version: 0.1.0

A structure is a more or less arbitrary label for a partitioning of a string. We do not follow a strict approach for what a word, phrase, sentence, title, paragraph is. These labels enable the definition processes for tool chains, e.g. tool analyses nif:Paragraph and calculates term frequency.

This is an abstract class and should not be serialized.

Changelog

0.1.1 not to be serialized comment

* has super-classes [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has sub-classes [Paragraph](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Paragraph), [Phrase](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Phrase), [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence), [Title](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Title), [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)
* is in domain of [sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sentence)

### Title (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Title

Current version: 0.1.1

A title within a text.

Changelog:

* 0.1.1 fixed spelling, added language tag

Axioms:
* has super-classes [Structure](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure)

### URI Scheme (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#URIScheme

Current version: 0.1.1

A URI Scheme for NIF, subclasses need to define guidelines on the URI Scheme as well as the text it refers to. This class is just to keep some order, and should not be serialized.

This is an abstract class and should not be serialized.

Changelog:
* 0.1.1 changed comment

Axioms:
* has super-classes [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has sub-classes [Consecutive String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CString), [Context Hash Based String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#ContextHashBasedString)

### Word (class) 

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word

Current version: 0.2.2

The Word class represents strings that are tokens or words. A string is a Word, if it is a word. We don't nitpic about whether it is a a pronoun, a name, a punctuation mark or an apostrophe or whether it is separated by white space from another Word or something else. The string 'He enters the room.' for example has 5 words. Words are assigned by a tokenizer NIF Implementation. Single word phrases might be tagged as nif:Word and nif:Phrase.

Example 1: "The White House" are three Words separated by whitespace

Comment 1: We adopted the definition style from foaf:Person, see here: http://xmlns.com/foaf/spec/#term\_Person We are well aware that the world out there is much more complicated, but we are ignorant about it, for the following reasons:

Comment 2:

1\. NIF has a client-server and the client has the ability to dictate the tokenization to the server (i.e. the NIF Implementation) by sending properly tokenized NIF annotated with nif:Word. All NIF Implementations are supposed to honor and respect the current assignment of the Word class. Thus the client should decide which NIF Implementation should create the tokenization. Therefore this class is not descriptive, but prescriptive.

2\. The client may choose to send an existing tokenization to a NIF Implementation, with the capability to change (for better or for worse) the tokenization.

The class has not been named 'Token' as the NLP definition of 'token' is descriptive (and not well-defined), while the assignment of what is a Word and what not is prescriptive, e.g. "can't" could be described as one, two or three tokens or defined as being one, two or three words. For further reading, we refer the reader to: By all these lovely tokens... Merging conflicting tokenizations by Christian Chiarcos, Julia Ritz, and Manfred Stede. Language Resources and Evaluation 46(1):53-74 (2012) or the short form: http://www.aclweb.org/anthology/W09-3005

There the task at hand is to merge two tokenization T\_1 and T\_2 which is normally not the case in the NIF world as tokenization is prescribed, i.e. given as a baseline (Note that this ideal state might not be achieved by all implementations.)

Changelog:

* 0.1.1 fixed spelling
* 0.2.1 added a proper definition.
* 0.2.3 added examples and clarifications

Axioms:
* has super-classes [Structure](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure)
* is in domain of [next word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWord), [next word trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWordTrans), [previous word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWord), [previous word trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWordTrans)
* is in range of [has first word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#firstWord), [has last word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lastWord), [has word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#word), [next word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWord), [next word trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWordTrans), [previous word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWord), [previous word trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWordTrans)

Object Properties
-----------------

*   [annotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#annotation)
*   [broader Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#broaderContext)
*   [dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependency)
*   [has context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#hasContext)
*   [has first word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#firstWord)
*   [has last word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lastWord)
*   [has word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#word)
*   [inter](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#inter)
*   [language of the string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lang)
*   [narrower Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#narrowerContext)
*   [next sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentence)
*   [next sentence trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentenceTrans)
*   [next word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWord)
*   [next word trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWordTrans)
*   [OLiA link](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaLink)
*   [opinion](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#opinion)
*   [predominant language](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#predLang)
*   [previous sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentence)
*   [previous sentence trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentenceTrans)
*   [previous word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWord)
*   [previous word trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWordTrans)
*   [Provenance of OLiA tag](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaProv)
*   [reference context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#referenceContext)
*   [sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sentence)
*   [source URL](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sourceUrl)
*   [sub string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subString)
*   [super String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superString)
*   [transitive version of dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyTrans)
*   [transitive version of subString](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subStringTrans)
*   [transitive version of superString](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superStringTrans)
*   [was converted from](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#wasConvertedFrom)

### annotation (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#annotation

Current version: 0.1.1

see Towards Web-Scale Collaborative Knowledge Extraction http://svn.aksw.org/papers/2012/PeoplesWeb/public\_preprint.pdf‎ page 21 .

Changelog:

* 0.1.1 Fixed page number

Axioms:
* has sub-properties [OLiA link](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaLink)

### broader Context (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#broaderContext

Current version: 0.1.0

This property should be used to express that one Context is contained in another Context, e.g. several sentences of a document are modelled indivudally and refer to the broader context of the whole document.

* has domain [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)
* has range [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)

### dependency (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependency

Current version: 0.1.0

A dependency relation pointing from gov to dep.

Changelog:

* 0.1.0 initial commit of property "dependency"
* 0.1.1 made the property subproperty of dependencyTrans

Axioms:
* has super-properties [transitive version of dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyTrans)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### has context (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#hasContext

Current version: 0.2.0

Links a nif:ContextCollection to its contexts.

Changelog

* 0.2.0. renamed property since a lot of people where too confused by nif:context

Axioms:
* has domain [Context Collection](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#ContextCollection)
* has range [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)

### has first word (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#firstWord

Current version: 0.1.1

This property links sentences to their first word.

Changelog:

* 0.1.1 merged inf+val

**has characteristics:** functional

* has super-properties [has word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#word)
* has domain [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* has range [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)

### has last word (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lastWord

Current version: 0.1.2

This property links sentences to their last word.

Changelog:

* 0.1.1 fixed label
* 0.1.2 merged inf+val

**has characteristics:** functional

* has super-properties [has word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#word)
* has domain [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* has range [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)

### has word (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#word

Current version: 0.2.0

This property links sentences to their words.

* has sub-properties [has first word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#firstWord), [has last word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lastWord)
* has domain [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* has range [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)

### inter (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#inter

Current version: 0.2.0

This object property models a relation between two nif:Strings. The name "inter" is kept generic and can be used to express any kind of relation in between (inter) two nif:Strings. Extensions can create rdfs:subPropertyOf for "head", "dependent", nif:substring and nif:nextWord.

Changelog:

* 0.1.0 initial commit of property "dependency"
* 0.2.0 changed name to "inter" which is more general than "dependency".

Axioms:
* has sub-properties [transitive version of dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyTrans)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### language of the string (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lang

Current version: 0.0.0

Defines the language of a substring of the context. If the language for the nif:Context should be specified, nif:predominantLanguage must be used.

see nif:predominantLanguage for more info.

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

not ([Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)c)

* has range language

### narrower Context (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#narrowerContext

Current version: 0.1.0

The inverse of nif:narrowerContext

* has domain [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)
* has range [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)

### next sentence (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentence

Current version: 0.1.1

This property (and nif:previousSentence, nif:nextWord, nif:previousWord and their transitive extension) can be used to make resources of nif:Sentence and nif:Word traversable, it can not be assumed that no gaps or whitespaces between sentences or words exist, i.e. string adjacency is not mandatory. The transitivity axioms are included in nif-core-inf.ttl and need to be included separately to keep a low reasoning profile. They are modeled after skos:broader and skos:broaderTransitive

**has characteristics:** functional

* has super-properties [next sentence trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentenceTrans)
* has domain [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* has range [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* is inverse of [previous sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentence)

### next sentence trans (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentenceTrans

Current version: 0.1.1

see nif:nextSentence

**has characteristics:** transitive

* has sub-properties [next sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentence)
* has domain [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* has range [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)

### next word (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWord

Current version: 0.1.1

see nif:nextSentence

**has characteristics:** functional

* has super-properties [next word trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWordTrans)
* has domain [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)
* has range [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)
* is inverse of [previous word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWord)

### next word trans (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWordTrans

Current version: 0.1.1

see nif:nextSentence

**has characteristics:** transitive

* has sub-properties [next word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWord)
* has domain [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)
* has range [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)

### OLiA link (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaLink

Current version: 0.1.1

This property links a string to a URI from one of the OLiA Annotation model, e.g. http://purl.org/olia/penn.owl#NNP

Changelog

0.1.1 - added subproperty of nif:annotation as per http://svn.aksw.org/papers/2012/PeoplesWeb/public\_preprint.pdf‎ page 21

* has super-properties [annotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#annotation)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### opinion (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#opinion

Current version: 0.0.0

This property is used to link to a marl:Opinion. We have not investigated marl, so it might be replaced. http://marl.gi2mo.org/?page\_id=1#overview . InverseOf marl:extractedFrom

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range opinion
* is inverse of

extracted from

### predominant language (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#predLang

Current version: 0.0.0

Defines the predominant language of the text. If this annotation is given on a nif:Context, all NIF tools have to treat the text to be in this language unless specified differently for a subpart. To change the language for a smaller substring nif:lang must be used.

This property requires a uri as an argument. We expect this to be a URI from the lexvo.org namespace, e.g. http://lexvo.org/id/iso639-3/eng using ISO639-3

Examples

"The dealer says: "Rien ne va plus!" "

* has nif:predomintLanguage http://lexvo.org/id/iso639-3/eng and nif:lang http://www.lexvo.org/page/iso639-3/fra

see also: http://www.w3.org/TR/its20/#selection-local

Tests for RDFUnit (not written yet):

\- write a test for RDFUnit, so people do not use http://www.lexvo.org/page/iso639-3/eng

* has domain [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)
* has range language

### previous sentence (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentence

Current version: 0.1.1

see nif:nextSentence

**has characteristics:** functional

* has super-properties [previous sentence trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentenceTrans)
* has domain [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* has range [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* is inverse of [next sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextSentence)

### previous sentence trans (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentenceTrans

Current version: 0.1.1

see nif:nextSentence

**has characteristics:** transitive

* has sub-properties [previous sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousSentence)
* has domain [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)
* has range [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)

### previous word (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWord

Current version: 0.1.1

see nif:nextSentence

**has characteristics:** functional

* has super-properties [previous word trans](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWordTrans)
* has domain [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)
* has range [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)
* is inverse of [next word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#nextWord)

### previous word trans (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWordTrans

Current version: 0.1.1

see nif:nextSentence

**has characteristics:** transitive

* has sub-properties [previous word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#previousWord)
* has domain [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)
* has range [Word](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Word)

### Provenance of OLiA tag (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaProv

Current version: 0.1.0

Links to the URI describing the provenance

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range decimal

### reference context (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#referenceContext

Current version: 1.0.0

Links a URI of a string to its reference context of type nif:Context. The reference context determines the calculation of begin and end index

Each String that is not an instance of nif:Context MUST have exactly one reference context.

Inferences (nif-core-inf.ttl):

Instances of nif:Context do have itself as reference context, this is inferred automatically, MAY be materialized, as well.

OWL validation (nif-core-val.ttl):

This property is functional.

Changelog:

* 1.0.0: Introduced stable version.
* 1.0.1: merged val model

**has characteristics:** functional

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)

### sentence (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sentence

Current version: 0.2.0

This property links words and other structures to their sentence.

Changelog:

* 0.2.0 Changed domain from nif:Word to nif:Structure, not longer inverseOf nif:word

Axioms:
* has domain [Structure](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Structure)
* has range [Sentence](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Sentence)

### source URL (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sourceUrl

Current version: 0.2.0

The URL the context was extracted from, e.g. the blog or news article url. Doesn't matter whether it is HTML or XML or plain text. rdfs:range is foaf:Document. Subproperty of prov:hadPrimarySource. In case the string comes from another NIF String and gives the exact provenance, please use nif:wasConvertedFrom or a subProperty thereof.

Changelog:

* 0.2.0 added subPropertyOf prov:hadPrimarySource
* 0.2.1 clarification

Axioms:
* has super-properties

had primary source

* has domain [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)

### sub string (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subString

Current version: 0.1.1

This property together with nif:subString, nif:superString, and their transitive extension can be used to express that one string is contained in another one. Examples: "a" nif:subString "apple" , "apple" nif:subString "apple". The transitivity axioms are included in nif-core-inf.ttl and need to be included separately to keep a low reasoning profile. They are modeled after skos:broader and skos:broaderTransitive

* has super-properties [transitive version of subString](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subStringTrans)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* is inverse of [super String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superString)

### super String (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superString

Current version: 0.1.0

see nif:subString

* has super-properties [transitive version of superString](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superStringTrans)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* is inverse of [sub string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subString)

### transitive version of dependency (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyTrans

Current version: 0.1.1

Changelog:

* 0.1.0 initial commit of property
* 0.1.1 merged inf model

**has characteristics:** transitive

* has super-properties [inter](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#inter)
* has sub-properties [dependency](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependency)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### transitive version of subString (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subStringTrans

Current version: 0.1.1

transitive version of subString

Inferences (nif-core-inf.ttl):

Transitive definition kept in a different ontology

Changelog:

* 0.1.0: Initial version
* 0.1.1: merged inf

**has characteristics:** transitive

* has sub-properties [sub string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#subString)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### transitive version of superString (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superStringTrans

Current version: 0.1.1

see nif:subStringTrans

**has characteristics:** transitive

* has sub-properties [super String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#superString)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### was converted from (object property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#wasConvertedFrom

Current version: 0.1.0

This property should be used, when mapping one nif:String or nif:Context to another and is often confused with nif:sourceUrl.

While nif:sourceUrl is built on PROV-O and is used to link the nif:Context to the document URL for provenance information, nif:convertedFrom is more precise and pinpoints exact locations where a certain NIF String "wasConvertedFrom".

nif:wasConvertedFrom is therefore used to provide *exact* provenance during a conversion process, e.g. when removing tags from XHTML and then linking XPath URIs to NIF index based URIs (e.g. RFC 5147 with char=x,y). An example of the usage of this property can be found here: http://www.w3.org/TR/its20/#conversion-to-nif

Example

\# "Dublin"

<http://example.com/myitsservice?informat=html&intype=url&input=http://example.com/doc.html&char=11,17>

nif:wasConvertedFrom

<http://example.com/myitsservice?informat=html&intype=url&input=http://example.com/doc.html&xpath=/html/body\[1\]/h2\[1\]/span\[1\]/text()\[1\]>.

* has super-properties

was derived from

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

Data Properties
---------------

*   [after](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#after)
*   [anchor of](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#anchorOf)
*   [before](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#before)
*   [begin index](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#beginIndex)
*   [confidence of annotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#confidence)
*   [Confidence of OLiA tag](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaConf)
*   [dependency relation type](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyRelationType)
*   [end index](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#endIndex)
*   [head](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#head)
*   [is string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#isString)
*   [keyword](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#keyword)
*   [lemma](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lemma)
*   [literalAnnotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#literalAnnotation)
*   [Part of speech tag](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#posTag)
*   [sentiment value](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sentimentValue)
*   [stem](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#stem)
*   [topic](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#topic)

### after (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#after

Current version: 0.1.0

For each string you can include a snippet (e.g. 10-40 characters of text), that occurs immediately after the subject string.

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### anchor of (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#anchorOf

Current version: 1.0.0

The string, which the URI is representing as an RDF Literal. Some use cases require this property, as it is necessary for certain sparql queries.

* has sub-properties [is string](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#isString)
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### before (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#before

Current version: 0.1.0

For each string you can include a snippet (e.g. 10-40 characters of text), that occurs immediately before the subject string.

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### begin index (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#beginIndex

Current version: 1.0.1

The begin index of a character range as defined in http://tools.ietf.org/html/rfc5147#section-2.2.1 and http://tools.ietf.org/html/rfc5147#section-2.2.2, measured as the gap between two characters, starting to count from 0 (the position before the first character of a text).

Example: Index "2" is the postion between "Mr" and "." in "Mr. Sandman".

Note: RFC 5147 is re-used for the definition of character ranges. RFC 5147 is assuming a text/plain MIME type. NIF builds upon Unicode and is content agnostic.

Requirement (1): This property has the same value the "Character position" of RFC 5147 and it MUST therefore be castable to xsd:nonNegativeInteger, i.e. it MUST not have negative values.

Requirement (2): The index of the subject string MUST be calculated relative to the nif:referenceContext of the subject. If available, this is the rdf:Literal of the nif:isString property.

Changelog:

* 1.0.0: Introduced stable version.
* 1.0.1: merged val+inf, added range

**has characteristics:** functional

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range non negative integer

### confidence of annotation (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#confidence

Current version: 0.0.1

The confidence of an annotation as decimal between 0 and 1

Changelog:

* 0.0.1 initial commit of property

Axioms:
* has domain [Annotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Annotation)
* has range decimal

### Confidence of OLiA tag (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaConf

Current version: 0.2.0

The confidence is relative to the tool and can be between 0.0 and 1.0, it is for nif:oliaLink and therefore also for nif:oliaCategory.

Changelog:

0.2.0 merged confidence for category and link

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range decimal

### dependency relation type (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#dependencyRelationType

Current version: 0.0.1

String denoting the kind of dependency relation

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range string

### end index (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#endIndex

Current version: 1.0.2

The end index of a character range as defined in http://tools.ietf.org/html/rfc5147#section-2.2.1 and http://tools.ietf.org/html/rfc5147#section-2.2.2, measured as the gap between two characters, starting to count from 0 (the position before the first character of a text).

Example: Index "2" is the postion between "Mr" and "." in "Mr. Sandman".

Note: RFC 5147 is re-used for the definition of character ranges. RFC 5147 is assuming a text/plain MIME type. NIF builds upon Unicode and is content agnostic.

Requirement (1): This property has the same value the "Character position" of RFC 5147 and it must therefore be an xsd:nonNegativeInteger .

Requirement (2): The index of the subject string MUST be calculated relative to the nif:referenceContext of the subject. If available, this is the rdf:Literal of the nif:isString property.

**has characteristics:** functional

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range non negative integer

### head (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#head

Current version: 0.1.0

The first few chars of the nif:anchorOf. Typically used if the nif:anchorOf

* is to long for inclusion as RDF literal.
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)

### is string (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#isString

Current version: 1.0.2

The reference text as rdf:Literal for this nif:Context resource.

NIF requires that the reference text (i.e. the context) is always included in the RDF as an rdf:Literal.

Note, that the isString property is *the* place to keep the string itself in RDF.

All other nif:Strings and nif:URISchemes relate to the text of this property to calculate character position and indices.

Changelog

* 1.0.0: Introduced stable version.
* 1.0.1 improved documentation
* 1.0.2: merged val+inf

**has characteristics:** functional

* has super-properties [anchor of](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#anchorOf)
* has domain [Context](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Context)

### keyword (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#keyword

Current version: 0.0.1

A general keyword associated with a string

Changelog:

* 0.0.1 initial commit of property

Axioms:
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range string

### lemma (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#lemma

Current version: 0.1.0

The lemma(s) of the nif:String.

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range string

### literalAnnotation (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#literalAnnotation

Current version: 0.1.1

see Towards Web-Scale Collaborative Knowledge Extraction http://svn.aksw.org/papers/2012/PeoplesWeb/public\_preprint.pdf‎ page 21 .

Changelog:

* 0.1.1 Fixed page number

### Part of speech tag (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#posTag

Current version: discouraged

To include the pos tag as it comes out of the NLP tool as RDF Literal. This property is discouraged to use alone, please use oliaLink and oliaCategory. We included it, because some people might still want it and will even create their own property, if the string variant is missing

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range string

### sentiment value (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#sentimentValue

Current version: 0.0.0

Between -1 negative and 1 positive

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range decimal

### stem (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#stem

Current version: 0.1.0

The stem(s) of the nif:String.

* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range string

### topic (datatype property)

**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#topic

Current version: 0.0.1

The topic of a string

Changelog:

* 0.0.1 initial commit of property

Axioms:
* has domain [String](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String)
* has range [Annotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#Annotation)

Annotation Properties
---------------------

*   [category](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#category)
*   [classAnnotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#classAnnotation)
*   [most specific class reference](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#taMsClassRef)
*   [OLiA Category](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaCategory)

### category (annotation property)
**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#category

Current version: 0.2.0

A simple annotation for machine learning purposes. The object can be anything, e.g. the literal "A. PRESS: Reportage" from Brown or any URI.

ChangeLog:

* 0.2.0 changed nif:class to nif:category due to conflict with Java

### classAnnotation (annotation property)
**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#classAnnotation

Current version: 0.1.1

see Towards Web-Scale Collaborative Knowledge Extraction http://svn.aksw.org/papers/2012/PeoplesWeb/public\_preprint.pdf‎ page 12 .

Changelog:

* 0.1.1 Fixed page number

Axioms:
* has sub-properties [OLiA Category](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaCategory)

### most specific class reference (annotation property)
**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#taMsClassRef

Current version: 0.1.0

This property marks the most specific class from itsrdf:taClassRef. The rule is: from the set S of itsrdf:taClassRef attached to this resource taMscRef points to the one that does not have any subclasses in the set S except itself. So if taClassRef is owl:Thing, dbo:Agent, dbo:Person, dbp:Actor taMsClassRef is dbo:Actor

### OLiA Category (annotation property)
**IRI:** http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#oliaCategory

Current version: 0.1.3

This property links a string URI to classes of the OLiA Reference model. It provides a direct link for querying, thus it is a redundant optimization.

Changelog:
* 0.1.1 - added subproperty of nif:classAnnotation as per http://svn.aksw.org/papers/2012/PeoplesWeb/public\_preprint.pdf, page 21
* 0.1.2 - removed domain axiom for annotationproperty
* 0.1.3 - improved documentation

Axioms:
* has super-properties [classAnnotation](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#classAnnotation)

Namespace Declarations
------------------------------------------

| prefix | namespace |
| ------ | --------- |
|dc|http://purl.org/dc/elements/1.1/|
|dcterms|http://purl.org/dc/terms/|
|fise|http://fise.iks-project.eu/ontology/|
|itsrdf|http://www.w3.org/2005/11/its/rdf#|
|licenses|http://www.apache.org/licenses/|
|lvont|http://lexvo.org/ontology#|
|marl|http://purl.org/marl/ns#|
|nif|http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#|
|nif-core|http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/|
|oa|http://www.w3.org/ns/oa#|
|ontologies|https://github.com/NLP2RDF/persistence.uni-leipzig.org/commits/master/ontologies/|
|owl|http://www.w3.org/2002/07/owl#|
|prov|http://www.w3.org/ns/prov#|
|rdf|http://www.w3.org/1999/02/22-rdf-syntax-ns#|
|rdfs|http://www.w3.org/2000/01/rdf-schema#|
|skos|http://www.w3.org/2004/02/skos/core#|
|skosxl|http://www.w3.org/2008/05/skos-xl#|
|xsd|http://www.w3.org/2001/XMLSchema#|
