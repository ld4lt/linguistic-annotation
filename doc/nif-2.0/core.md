NLP Interchange Format (NIF) 2.0
--------------------------------

Core Specification
==================

Document Version 0.0.0-draft (not versioned yet)
------------------------------------------------
Markdown edition of the original [NIF 2.0 Core Specification](https://persistence.uni-leipzig.org/nlp2rdf/specification/core.html)  developed via the [NLP2RDF GitHub repository](https://github.com/NLP2RDF/specification/). Retrieved 2020-03-26.

Summary
=======

The NLP Interchange Format (NIF) is an RDF/OWL-based format that aims to achieve interoperability between Natural Language Processing (NLP) tools, language resources and annotations. NIF consists of specifications, ontologies and software ([overview](http://persistence.uni-leipzig.org/nlp2rdf)), which are combined under the version identifier "NIF 2.0", but are [versioned individually](http://persistence.uni-leipzig.org/nlp2rdf/specification/version.html).

This document specifies the core of NIF, consisting of:

*   A conformance checklist telling you exactly what has to be implemented
*   The initial conversion of text to NIF and how to assign URIs to Unicode Strings, so you can annotate them.

Conformance checklist
---------------------

The keywords “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC 2119](http://www.ietf.org/rfc/rfc2119.txt). In order to produce an interoperable implementation the following checklist MUST be followed:

1.  All texts in NIF MUST be unicode strings. Furthermore, these unicode strings SHOULD be in Unicode Normal Form C (NFC), which is the recommendation for RDF Literals. In some fringe cases, other normal forms of unicode are legit.
2.  All strings MUST be counted in Unicode Code Points. We provide detailed information below.
3.  All NIF implementations that expose their interfaces via web service or command line MUST implement the [Public API Specification of NIF 2.0](http://persistence.uni-leipzig.org/nlp2rdf/specification/api.html).
4.  All NIF implementations MUST validate their RDF output with the provided [Validator](#validator)
5.  For each nif:Context, taken out of another nif:Context, implementers must provide a `nif:wasConvertedFrom` provenance link.

Creation
========

NIF is primarily designed to store and transfer text and text annotations. In order to enter the NIF and RDF world, the text, also called the primary data, must be (1) converted to an RDF literal as an object of the `nif:isString` property and (2) we require a way to programatically mint URIs to add annotations to the text. In the example below annotations can be added to the <SubjectURI> which serves as the context, i.e. a representative for the string in `nif:isString`.


> <SubjectURI> nif:isString "Your text, e.g. a single sentence or the content 
	of a whole document; bascially any sequence of characters." .

In the following, we will use two running examples throughout this specification: a simple sentence and a more complex .txt document as primary data.

Example 1: Web service
----------------------

The primary use case of NIF is to work as an input and output format for web services. The simple sentence "My favourite actress is Natalie Portman." serves as an example.

>curl --data-urlencode input="My favourite actress is Natalie Portman."   -d informat=text "http://nlp2rdf.lod2.eu/nif-ws.php" 

generates the following output:

>
>@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix nif: <http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#> .
<http://nlp2rdf.lod2.eu/nif-ws.php#char=0,40> 
	rdf:type nif:RFC5147String , nif:Context ;
	nif:beginIndex "0" ;
	nif:endIndex "40" ;
	nif:isString "My favourite actress is Natalie Portman." . 

Example 2: Hosting a language resource as linked data
-----------------------------------------------------

We will give a running example here on how text and annotations can be published as linked data. Given a published text available on the web under the URL [http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124.txt](http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david_lynch_dune_quoteid_124.txt "http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david_lynch_dune_quoteid_124.txt"), we can create a new Linked Data URI `http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david_lynch_dune_quoteid_124` as non-information resource URI (a global identifier independent of the data and representation). A web server such as Apache can now be configured to return various information resources via content negotiation (HTTP \`\`Accept:'' header) and \`\`303 - See Other'' redirects as is common practice in Linked Data:

*   `text/plain` 303-redirects to david\_lynch\_dune\_quoteid\_124.txt
*   `text/html` 303-redirects to an HTML visualization: david\_lynch\_dune\_quoteid\_124.php
*   `text/turtle` 303-redirects to RDF in Turtle: david\_lynch\_dune\_quoteid\_124.ttl
*   `application/ld+json` or `application/json` 303-redirects to RDF in Json-LD: david\_lynch\_dune\_quoteid\_124.json
*   `application/rdf+xml` 303-redirects to RDF in JSON-LD: david\_lynch\_dune\_quoteid\_124.owl

Note that the returned Turtle data looks like this:

><http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124#char=0,600> 
	rdf:type nif:RFC5147String , nif:Context ;
	nif:sourceUrl <http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124.txt>
	nif:beginIndex "0" ;
	nif:endIndex "600" ;
	nif:isString """# Quote 124 from David Lynch's Dune	... 

The turtle file was created by this script (feel free to use the web service): Download: `http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david_lynch_dune_quoteid_124.ttl`

> curl --data-urlencode input@david\_lynch\_dune\_quoteid\_124.txt --data-urlencode prefix="http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124#" -d informat=text  "http://nlp2rdf.lod2.eu/nif-ws.php" >  david\_lynch\_dune\_quoteid\_124.ttl	

Furthermore, we provide the used [.htaccess file in the GitHub repository](https://github.com/NLP2RDF/specification/tree/master/example) and an [alternative tutorial in the Wiki](https://github.com/NLP2RDF/software/wiki/How-to-publish-a-txt-corpora-with-NIF-as-Linked-Data).

Definition of Strings
---------------------

Achieving interoperability starts at the lowest level. In the following, we will define conventions that technically define strings in a reproducible and therefore interoperable way.

### Unicode Normalization Forms, Encoding

According to the RDF 1.1 specification ([3.3 Literals](http://www.w3.org/TR/rdf11-concepts/#section-Graph-Literal)), RDF literals are Unicode strings, which should be in [Normal Form C (NFC)](http://unicode.org/reports/tr15/#Norm_Forms). In NIF, we will follow this recommendation in general. There are, however, circumstances which require the use of Normal Form D (NFD) or even NFKC or NFKD. Therefore NIF allows NFD, NFKC and NFKD, if the use case justifies the usage.

One such use case is, if a linguistic annotator has the requirement to annotate individual diacritics or parts of precomposed characters and syllables. For linguists with this use case or applicable languages, using NFD is obvious and well-justified. We will only give examples here and refer the interested reader to these three documents: [Gernot Katzer's page about the Korean Writing system](http://gernot-katzers-spice-pages.com/var/korean_hangul_unicode.html#), [Wikipedia article about the Korean Hangul](https://en.wikipedia.org/wiki/Hangul), [Unicode Normal Form specification](http://unicode.org/reports/tr15/#Norm_Forms).

Example 1 (taken from the [Unicode Normal Form spec](http://unicode.org/reports/tr15/#Norm_Forms)):

>Composed (NFD and NFC): ﬁ or ñ
Decomposed (NFD and NFC): f , i or n ~

Example 2 (taken from [Gernot Katzer)](http://gernot-katzers-spice-pages.com/var/korean_hangul_unicode.html#):

>Precomposed Hangul 훯, three conjoining Jamo (H+WEO+LH) 훯,
the same three Jamo enclosed in some markup to prevent their joining 
훠 ᆶ and three Compatibility Jamo  ㅎㅝㅀ.  
Ideally, only the first two should render identically as compound Hangul. 

### String Counting and Determination of Length

NIF builds on the current best practices for counting strings and creating offsets. The relevant documents are:

1.  [Section 2.4, Code Points and Characters](http://www.unicode.org/versions/Unicode6.2.0/ch02.pdf#G25564)
2.  [Section 2 of RFC 5147](http://tools.ietf.org/html/rfc5147#section-2) (for newlines all code points must be counted in NIF)
3.  ISO 24612:2012 - Language resource management -- Linguistic annotation framework (LAF): ![](image/iso+24612-2012.png)

#### NIF Requirements

1.  Begin and end offsets MUST always count the gaps between characters starting from 0 before the first character as specified in the three standards above.
2.  Strings MUST always be counted in Unicode code points. NIF provides a text document to test implementations. The document is available at [http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124.txt](http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david_lynch_dune_quoteid_124.txt) and the content consists of **exactly 600**characters (code points).

The following functions (or equivalent) are safe to use:

*   Java [length()](http://docs.oracle.com/javase/7/docs/api/java/lang/String.html#length%28%29): `"ä".lenght() == 1`
*   PHP [utf8\_decode()](http://php.net/manual/en/function.utf8-decode.php): `strlen(utf8_decode("ä"))===1`
*   Python [len()](http://docs.python.org/2/library/functions.html#len) in combination with [decode()](http://docs.python.org/2/library/stdtypes.html#str.decode) `len("ä".decode("UTF-8"))`

Below we list some examples, which are not compatible:

*   [Unix wc](https://en.wikipedia.org/wiki/Wc_%28Unix%29): `echo -n "ä" | wc` is 2
*   PHP `strlen("ä")===2`
*   Python `len("ä")===2`

Representation of Document Content with the nif:Context Class
-------------------------------------------------------------

In NIF, we consider the definition of "document" as highly problematic and not practical for NLP purposes. As soon as we start using the term "document" we are suddently facing many modelling problems, which are only of minor interest for NLP. The biggest modelling problems are the well-known "Theseus's paradox" problem of abstract identity as well as versioning, retrieval, authorship, etc. We would like to state some pertinent examples here:

*   **Theseus's paradox**: Tim Berners-Lee web publication about [Design Issues for Linked Data](http://www.w3.org/DesignIssues/LinkedData.html) was edited several times since it's creation, but was always published under the same URL. For each change, an NLP engine would receive different textual input, but the document URI and therefore the abstract identity would remain the same, regardless of versioning and content changes.
*   **Authorship**: The Wikipedia page of [George W. Bush](https://en.wikipedia.org/wiki/George_W._Bush) has been edited over 45 thousand times. Who is the author of the document? What about user contributions that were deleted (e.g. due to vandalism)? What about the software developer who created the boilerplate HTML such as the navigation bar? Note that authorship on the content-level is much easier to trace.
*   **Equivalence of redundant documents**: When the content of a document is copied to another URL, both exist in parallel. The content of the document is obviously the same and an NLP engine will (given it is deterministic) produce the same annotations. We are easily able to determine content equality via a string comparison, however, judging whether the documents are equivalent is difficult. The new document has a different URI, was copied there by an activity and therefore has many other properties which are different such as the HTTP headers upon a retrieval action (last-modified, e-tag). Identity according to Leibniz can not be assumed automatically, but requires an explicit statement that sets both documents equal.

For these reasons, we define that instances of `nif:Context` always refer to the content of the `nif:isString` property. One of the topics, during the creation of the RDF specification, was to allow literals as subjects in RDF statements ([Discussion summary](http://www.w3.org/2001/sw/wiki/Literals_as_Subjects)). The discussion concluded that in principle, there were no predominant technical reasons to deem this approach infeasible. Notation 3 even permits literals as [subjects of statements](http://lists.w3.org/Archives/Public/www-rdf-comments/2002JanMar/0127.html). Therefore instances of nif:Context could be considered as:

><http://example.com/demo?cid=83848#char=0,40> owl:sameAs "My favourite actress is Natalie Portman." .

or alternatively

>"My favourite actress is Natalie Portman." rdf:type nif:Context . 

NIF allows the following linking between contexts and document, as well as between two NIF URIs:

### Linking to the document

We can use `nif:sourceUrl`, which is a subproperty of `prov:hadPrimarySource`, to link nif:Context to documents.

><http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124#char=0,600> 
	  rdf:type nif:RFC5147String , nif:Context ;
	  nif:beginIndex "0" ;
	  nif:endIndex "600" ;
	  nif:sourceUrl  <http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124.txt>
	  nif:isString "# Quote 124 from David Lynch's Dune ...

### Further partitioning

Some use cases require to have linked data URIs per paragraph or per sentence. Then they must use NIF in a way so that the orginal context can be reconstructed or traced with `nif:wasConvertedFrom` which is a subproperty of `prov:wasDerivedFrom`. For each nif:Context, taken out of another nif:Context, implementers must provide a `nif:wasConvertedFrom` provenance link between these contexts. Note the change of the prefix in the following example.

><http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124\_sentence1#char=0,44> 
	  rdf:type nif:RFC5147String , nif:Context ;
	  nif:beginIndex "0" ;
	  nif:endIndex "44" ;
	  nif:wasConvertedFrom  <http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david\_lynch\_dune\_quoteid\_124#char=47,91>
	  nif:isString "It is by will alone I set my mind in motion. """ . 

URI Schemes
-----------

According to RFC 5147, the following URI can address the first occurrence of the substring \`\`Semantic Web'' in the text (26610 characters) of the document [http://www.w3.org/DesignIssues/LinkedData.html](http://www.w3.org/DesignIssues/LinkedData.html) with the separator '#':  
[http://www.w3.org/DesignIssues/LinkedData.html#char=717,729](http://www.w3.org/DesignIssues/LinkedData.html#char=717,729)  
The whole text contained in the document is addressed by \`\`#char=0,26610'' or just \`\`#char=0,''. NIF offers several such URI schemes which can be selected according to the requirements of the use case. Their advantages and disadvantages have been investigated in [Linked-Data Aware URI Schemes for Referencing Text Fragments](http://jens-lehmann.org/files/2012/ekaw_nif.pdf) and we will limit ourselves to RFC 5147 here. For practical reasons, the document URI and the separator are henceforth called the `prefix` part of the URI scheme and the remainder (i.e. \`\`char=717,729'') will be called the `identifier` part. NIF recommends the prefix to end on slash ('/'), hash (‘#’) or on a query component ('?').

Extensions of NIF  
(Vocabulary Modules)
========================================

See also: [Towards Web-Scale Collaborative Knowledge Extraction](http://svn.aksw.org/papers/2012/PeoplesWeb/public_preprint.pdf‎), Sebastian Hellmann, and Sören Auer. The People's Web Meets NLP, Springer Berlin Heidelberg, (2013), page 21 .

Validator
---------

In order to improve conformance with this specification, we provide a validator that can help implementers to systematically detect errors in their NIF ouptut. An up-to-date version can be downloaded at [http://persistence.uni-leipzig.org/nlp2rdf/specification/validate.jar](http://persistence.uni-leipzig.org/nlp2rdf/specification/validate.jar) (We plan host an online web service, soon). The validator is the one important step to an interoperable NIF implementation. Implementers MUST validate their tool output with the validator. The validator itself is a valid NIF implementation and follows this specification as well as the [Public API Specification](http://persistence.uni-leipzig.org/nlp2rdf/specification/api.html).

### Show version and help:

>./validate.jar -v  or  ./validate.jar -h

### Validate NIF RDF in a Turtle file

>cat file.ttl | ./validate.jar -i - 
#or
./validate.jar -i file.ttl -t file

### Validate a NIF Web Service:

>curl --data-urlencode input="My favourite actress is Natalie Portman." 
  -d informat=text "http://nlp2rdf.lod2.eu/nif-ws.php" |\\
 ./validate.jar -i - --outformat text

Note that `-o text` or `--outformat text` gives you a human readable answer, while the default output is RDF using the [RLOG - RDF Logging Ontology](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog#). More technical information is documented at the [README](https://github.com/NLP2RDF/software#nif-validator). The used SPARQL queries can be found here: [http://persistence.uni-leipzig.org/nlp2rdf/ontologies/testcase/lib/nif-2.0-suite.ttl](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/testcase/lib/nif-2.0-suite.ttl)

### Validate Linked Data Hosting

If annotations in NIF are hosted, implementers MAY additionally validate their linked data set up with tools such as [http://validator.linkeddata.org/vapour](http://validator.linkeddata.org/vapour)

Access
------

NIF requires that implementers MUST follow the [Public API Specification](http://persistence.uni-leipzig.org/nlp2rdf/specification/api.html) for your NIF implementation.
