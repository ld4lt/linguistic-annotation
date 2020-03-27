
NLP Interchange Format (NIF) 2.0
--------------------------------

NIF Stanbol Profile Specification
=================================

Document Version 0.0.0-draft (not versioned yet)
------------------------------------------------

Markdown edition of the original [NIF Stanbol Profile Specification](https://persistence.uni-leipzig.org/nlp2rdf/specification/stanbol.html)  developed via the [NLP2RDF GitHub repository](https://github.com/NLP2RDF/specification/). Retrieved 2020-03-26.


Summary
-------

The NLP Interchange Format (NIF) is an RDF/OWL-based format that aims to achieve interoperability between Natural Language Processing (NLP) tools, language resources and annotations. NIF consists of specifications, ontologies and software ([overview](http://persistence.uni-leipzig.org/nlp2rdf)), which are combined under the version identifier "NIF 2.0", but are [versioned individually](http://persistence.uni-leipzig.org/nlp2rdf/specification/version.html).

This document is an extension of the [NIF 2.0 Core Specification](/nlp2rdf/specification/core/core-draft.html). As specified in the core document, NIF has three profiles: `Simple`, `Stanbol` and `OA`. The name originates from the [Apache Stanbol project](http://stanbol.apache.org) who use a very similar formalism for their NLP tool output. This specification is a mixture of this work with NIF Simple.

Additional features provided by the NIF 2.0 Stanbol Profile:

*   Each annotation receives its own URI and can be annotated.
*   Alternative annotations (including confidence values).
*   Detailed provenance (each annotation is represented by an annotation URN that can keep provenance of the engine configuration).

Status
------

While the NIF Simple Profile is already very advanced, the NIF Stanbol profile is not yet written. The reason for this is not lack of feasability or uncertainty, but mainly lack of time. So this draft document will constantly update during the next months. Normally, we also like to produce working software, before we write a detailed specification. As you will see below, the profile is a straightforward, no-brain extension of the NIF Simple Profile. Thanks to the great work of the Apache Stanbol project filling in the details is just a matter of convention and diligence.

NIF 2.0 Stanbol Profile Example
-------------------------------

**This is just a draft, but you can see that the vocab used in NIF Simple can be reused almost directly.**

>nif:String rdfs:subclassOf nifs:Annotation .	
>
><urn:uuid:context-aaa-aaa-aaa#char=0,40>
        a                     nif:Context , nif:RFC5147String ;
        nif:beginIndex        "0" ;
        nif:endIndex          "40" ;
        nif:isString          "My favourite actress is Natalie Portman." ;
        nif:referenceContext  <urn:uuid:context-aaa-aaa-aaa#char=0,40> .	
>        
><urn:uuid:context-aaa-aaa-aaa#char=13,20>
        a                     nif:Word , nif:RFC5147String ;
        #// new classes for these annotations:
        a  nifs:TextAnnotation , nifs:Annotation ;
        nif:anchorOf          "actress" ;
        nif:beginIndex        "13" ;
        nif:endIndex          "20" ;
        nif:referenceContext  <urn:uuid:context-aaa-aaa-aaa#char=0,40> ;
        #// even tokenization can have provenance and confidence
        nifs:tokConfidence "0.99"^^xsd:decimal ;
        nifs:tokAnnotatorsRef <urn:uuid:engine-deployment-time-bbb-bbb> .
>
>#// provenance is kept
><urn:uuid:engine-deployment-time>  
		rdfs:comment "OpenNLP Tokenizer and Entity Recognition version, date, etc ....." ;
		nifs:webserviceURL <http://nlp2rdf.lod2.eu/nif-ws.php> ;
		nifs:extractionsDate "2013-09-22T15:08:44+02:00"^^xsd:dateTime .
>
><urn:uuid:annotation-bbb-bbb-bbb>
		a nifs:Annotation .
        nif:oliaCategory      olia:CommonNoun , olia:Noun ;
        nif:oliaLink          <http://purl.org/olia/penn.owl#NN> ;
        nif:oliaConf      "0.99"^^xsd:decimal ;
        nif:oliaAnnotatorsRef <urn:uuid:engine-deployment-time-bbb-bbb> ;
        nifs:extractedFrom    <urn:uuid:context-aaa-aaa-aaa#char=13,20> .
>      
><urn:uuid:annotation-ccc-ccc-ccc>
		a nifs:EntityAnnotation, nifs:Annotation .
        itsrdf:taIdentRef        <http://dbpedia.org/resource/Actor> ;
        itsrdf:taAnnotatorsRef   <urn:uuid:engine-deployment-time>  ;
        itsrdf:taConfidence      "0.99"^^xsd:decimal ;
        nifs:extractedFrom       <urn:uuid:context-aaa-aaa-aaa#char=13,20> .

  

