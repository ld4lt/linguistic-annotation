
# Towards a consolidated LOD vocabulary for linguistic annotations

The representation of linguistic annotations on the web is important for (at least) two kinds of applications:

* publication and integration of distributed, web-accessible datasets, e.g., as part of the Linguistic Linked Open Data cloud or within digital editions of philological data

* web services and workflow management systems that require or produce linguistic annotations or any form of natural language processing


For representing linguistic annotations on the web, several vocabularies are currently in use. Most frequently used for linguistic annotation (in a LOD context) are

  
  

*   NIF (NLP Interchange Format, [https://persistence.uni-leipzig.org/nlp2rdf/](https://persistence.uni-leipzig.org/nlp2rdf/), [https://github.com/NLP2RDF](https://github.com/NLP2RDF)) 
    
*   Web Annotation / Open Annotation ([https://www.w3.org/TR/annotation-model/](https://www.w3.org/TR/annotation-model/))
    
Another important family of standards is being developed by ISO ([Linguistic Annotation Framework, LAF](https://www.cs.vassar.edu/~ide/papers/LAF.pdf)). This provides a general conceptual model that can be replicated in RDF. 
  
  

Full overview on relevant LOD vocabularies and their use now under [https://github.com/ld4lt/linguistic-annotation/tree/master/survey](https://github.com/ld4lt/linguistic-annotation/tree/master/survey)

  
  

Based on a survey conducted in 2019, NIF and Web Annotation are being actively used in both academia and industry, but issues exist with respect to interoperability and expressivity. Web Annotation is a W3C recommendation and thus stable. NIF 2.0 is a stable vocabulary, as well, and referred to in W3C standards (ITS), but its development is coordinated by a single institution. More recent NIF extensions (NIF 2.1 additions for provenance) seem to be partially documented only (there is no complete definition for NIF 2.1), and updates seem to have ceased since 2016.

Approach
========

Anti-pattern:
![The anti-pattern (https://xkcd.com/927/, CC-BY-NC 2.5)](https://imgs.xkcd.com/comics/standards.png)

*   Joint work on harmonizing NIF and Web Annotation with the goal to extend one *or* the other
    
*   Extend the consolidated model both wrt. genericity and explicitness and support for use cases currently not sufficiently covered (be it from language technology, knowledge engineering, computational lexicography or philology). 
    
*   Develop a minimal consensus vocabulary that complements Web Annotation with NIF functionalities and generic linguistic data structures; can be an extension of Web Annotation or as a revision of NIF (“NIF 3.0”).
    
*   Publish this consensus model as persistent point of reference as a W3C Community Report (of LD4LT or a dedicated CG)
