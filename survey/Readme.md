# Existing specifications and resources

Use this directory to identify relevant specifications and resources and to deposit data samples, schemes and/or links to them.


Overview on relevant LOD vocabularies and their use
---------------------------------------------------
### State of the Art
Several vocabularies currently in use, cf. [https://link.springer.com/book/10.1007%2F978-3-030-30225-2](https://link.springer.com/book/10.1007%2F978-3-030-30225-2) (drafts of relevant chapters can be shared on a private basis, request via ResearchGate from [https://www.researchgate.net/profile/Christian\_Chiarcos/publications](https://www.researchgate.net/profile/Christian_Chiarcos/publications): 

*   Representing Annotated Texts as RDF (Chap.5)
    
*   Chap. 6 Modelling Linguistic Annotations (Chap. 6)
    
*   Chap. 8 Linguistic Categories (Chap. 8)
    

Most frequently used for linguistic annotation (in a LOD context) are

*   NIF (NLP Interchange Format, [https://persistence.uni-leipzig.org/nlp2rdf/](https://persistence.uni-leipzig.org/nlp2rdf/), [https://github.com/NLP2RDF](https://github.com/NLP2RDF)) 
    
*   Web Annotation / Open Annotation ([https://www.w3.org/TR/annotation-model/](https://www.w3.org/TR/annotation-model/))
  
#### Other important vocabularies and formats for them

*   LAF ([https://www.iso.org/standard/37326.html](https://www.iso.org/standard/37326.html), [https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf](https://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf)), pre-RDF-vocabulary
    
    *   related standoff-XML formats:
        
        *   GrAF (standard serialization of LAF, used for the American National Corpus, cf. [http://www.anc.org/software/anc-tool/](http://www.anc.org/software/anc-tool/))
            
        *   PAULA ([https://www.sfb632.uni-potsdam.de/en/paula.html](https://www.sfb632.uni-potsdam.de/en/paula.html)), also cf. its RDF/OWL serialization POWLA ([http://purl.org/powla](http://purl.org/powla)) 
            
        *   Newsreader Annotation Format ([http://wordpress.let.vupr.nl/naf/](http://wordpress.let.vupr.nl/naf/), includes a NIF-inspired RDF conversion)
            
            *   External support by [http://ixa2.si.ehu.es/ixa-pipes/](http://ixa2.si.ehu.es/ixa-pipes/) 
                
        *   TAN ([http://textalign.net](http://textalign.net/)) (TAN-A-lm and TAN-mor, two XML formats intended to build RDF statements involving texts and vocabularies like OLiA, and to define permitted grammatical features for a given language; ver. 2020 is nearly ready for release)
            
    *   related JSON-LD format:
        
        *   LAPPS Interchange Format (LIF, [https://wiki.lappsgrid.org/interchange/overview.html](https://wiki.lappsgrid.org/interchange/overview.html)) 
            
*   CoNLL-RDF (NIF extension and processing library for one-word-per-line annotation formats, [https://github.com/acoli-repo/conll-rdf/tree/master/owl](https://github.com/acoli-repo/conll-rdf/tree/master/owl))
    
*   Formats for representing Interlinear Glossed Text (formalized as NIF extensions, [https://drops.dagstuhl.de/opus/volltexte/2019/10367/pdf/OASIcs-LDK-2019-3.pdf](https://drops.dagstuhl.de/opus/volltexte/2019/10367/pdf/OASIcs-LDK-2019-3.pdf), [http://www.acoli.informatik.uni-frankfurt.de/papers/chiarcos-etal-2017-ldk-gloss.pdf](http://www.acoli.informatik.uni-frankfurt.de/papers/chiarcos-etal-2017-ldk-gloss.pdf))
    
*   Binary formats, e.g., Concrete: [http://hltcoe.github.io/concrete/](http://hltcoe.github.io/concrete/)
    
    *   Binary encoding of NLP annotations using an ad-hoc data model and Apache Thrift
        
    *   Note that we can get \*exactly\* the same functionality plus a standardized data model by using RDF and RDF-Thrift: [https://afs.github.io/rdf-thrift/](https://afs.github.io/rdf-thrift/)
        
        *   A probably more widely used binary RDF format is RDF-HDT: [http://www.rdfhdt.org/](http://www.rdfhdt.org/)
            

  
  

### Earlier/other harmonization efforts:

*   NIF+WA (use NIF String URIs in WA): [http://svn.aksw.org/papers/2013/ISWC\_NIF/public.pdf](http://svn.aksw.org/papers/2013/ISWC_NIF/public.pdf)
    
*   WA+LAF: Verspoor et al. 2012

### Indirectly related vocabularies:

 

*   Data categories for linguistic annotations 
    
    *   Ontologies of Linguistic Annotation (OLiA, [http://purl.org/olia/](http://purl.org/olia/))
        
    *   LexInfo (for lexical resources rather than annotations; [https://www.lexinfo.net/](https://www.lexinfo.net/), [https://github.com/ontolex/lexinfo](https://github.com/ontolex/lexinfo))
        
    *   ISOcat ([http://www.isocat.org/](http://www.isocat.org/); development stalled since 2014)
        
    *   CLARIN Concept Registry ([https://www.clarin.eu/ccr](https://www.clarin.eu/ccr), successor solution to ISOcat, pre-RDF)
        
    *   GOLD ([http://linguistics-ontology.org/](http://linguistics-ontology.org/); development stalled since 2010)
        
*   Cross-linguistic annotation standards
    
    *   EAGLES ([http://www.ilc.cnr.it/EAGLES/browse.html](http://www.ilc.cnr.it/EAGLES/browse.html)) and follow-up projects (PAROLE, MULTEXT, MULTEXT-East)
        
        *   MULTEXT-East does have an OWL edition: [http://nl.ijs.si/ME/](http://nl.ijs.si/ME/)
            
        *   CoRoLa [http://corola.racai.ro](http://corola.racai.ro/) or [http://89.38.230.23:1234/#](http://89.38.230.23:1234/#)
            
    *   Universal Dependencies (see [https://github.com/UniversalDependencies/docs/issues/613](https://github.com/UniversalDependencies/docs/issues/613) )
        
*   Corpus management systems (RDB/tabular)
    
    *   Cf. CoNLL formats, e.g., CoNLL-U
        
    
    *   Corpus Workbench
        
    *   SketchEngine
        
    *   Mark Davies, BYU, corpora
        
        *   **9 C[orpora](https://www.corpusdata.org/corpora.asp)** of English  -- [ iWeb](https://www.english-corpora.org/iweb/), [NOW](http://www.english-corpora.org/now/), [Wikipedia](http://www.english-corpora.org/wiki/), [COCA](http://www.english-corpora.org/coca/), [COHA](http://www.english-corpora.org/coha/), [GloWbE](http://www.english-corpora.org/glowbe/), [TV Corpus](http://www.english-corpora.org/tv/), [Movies Corpus](http://www.english-corpora.org/movies/), [SOAP Corpus](http://www.english-corpora.org/soap/) \-- as well as the [Corpus del Español](http://www.corpusdelespanol.org/web-dial/)[;](http://www.english-corpora.org/soap/) [https://www.corpusdata.org/](https://www.corpusdata.org/), [https://www.corpusdata.org/formats.asp](https://www.corpusdata.org/formats.asp) 
            
*   Corpus management systems (multi-layer/graph-based)
    
    *   ANNIS [http://corpus-tools.org](http://corpus-tools.org/) 
        
    *   KORAP - where CoRoLa is included. Languages: English, German, Romanian, Hungarian (in working process) [https://korap.ids-mannheim.de/](https://korap.ids-mannheim.de/) or [http://89.38.230.10:5555/?q=](http://89.38.230.10:5555/?q=)
        
*   Vocabularies independently developed from the above-mentioned
    
    *   JSON-NLP [https://github.com/dcavar/JSON-NLP](https://github.com/dcavar/JSON-NLP)
        
*   Vocabularies for other language resources
    
    *   RDF
        
        *   OntoLex-Lemon (for lexical resources; [https://www.w3.org/2016/05/ontolex/](https://www.w3.org/2016/05/ontolex/))
            
        *   OntoLex extensions for morphology ([https://www.w3.org/community/ontolex/wiki/Morphology](https://www.w3.org/community/ontolex/wiki/Morphology)) 
            
        *   OntoLex extensions for attestations (i.e., linking with/annotation of text, [https://acoli-repo.github.io/ontolex-frac/](https://acoli-repo.github.io/ontolex-frac/)) 
            
    *   LMF format (Arabic dictionaries: Contemporary Arabic dictionary with 32300 lexical entries generated from 5778 roots & Al wassit" Arabic dictionary with 61101 lexical entries generated from 6900 roots - [**http://arabic.emi.ac.ma/alelm/?q=Resources**](http://arabic.emi.ac.ma/alelm/?q=Resources)
        
    *   WordNets
        e.g. Arabic wordnet from [http://globalwordnet.org/arabic-wordnet](http://globalwordnet.org/arabic-wordnet)
