
# Examples for dependency annotation in RDF

## NIF 2.0

old wrapper demo, see https://github.com/NLP2RDF/software/blob/master/java-maven/implementation/stanfordcorenlp/src/main/java/org/nlp2rdf/implementation/stanfordcorenlp/StanfordWrapper.java

	  PREFIX stanford: <http://purl.org/olia/stanford.owl#>
	  _:nif_uri_for_dep stanford:nsubj _:nif_uri_for_head .
	  # replace blank nodes by actual string URIs

Note that `http://purl.org/olia/stanford.owl#nsubj` resolves to an invididual, not to a property. This is semantically not correct, but compact. 

## CoNLL-RDF

https://github.com/acoli-repo/conll-rdf: CoNLL-RDF is not a formal ontology, a library that maps columns in a TSV file to properties in the `conll:` namespace. Beyond that, it builds on NIF data structures. The user-provided label produces the local name.
Most labels produce datatype properties, but `HEAD` and `ID` (plus some column labels for semantic role annotation) are treated in a special way: 
- `ID` is consulted to derive a row URI (if missing, this will be the token number in the current sentence) 
- `HEAD` produces a object property that points to the syntactic head (or Sentence as a virtual root)

With the following data

	  1 He    PRON 2 nsubj
	  2 came  VERB 0 root
	  3 home  ADV  2 advmod

and the column labels

	  ID WORD POS HEAD EDGE

We produce
  
	  :s1_1 conll:WORD "He"; conll:HEAD _:s1_2; conll:EDGE "nsubj"; nif:nextWord :s1_2 .
	  # etc

## POWLA

POWLA an OWL2/DL formalization of the Linguistic Annotation Framework (http://purl.org/powla/powla.owl). It does provide linguistic data structures, but not how to ground them in a particular text. So, it should be combined with NIF, WA, CoNLL-RDF, or whatever.
Here combined with CoNLL-RDF token URIs.

	  :s1_1 powla:isSourceOf [ a powla:Relation; powla:hasTarget :s1_2; powla:hasAnnotation "nsubj" ].

Note that powla:hasAnnotation should normally not be directly used, but via a task-specific subproperty, say `my:dependency rdfs:subPropertyOf powla:hasAnnotation`. Then, that would be 

	  my:dependency rdfs:subPropertyOf powla:hasAnnotation.
	  :s1_1 powla:isSourceOf [ a powla:Relation; powla:hasTarget :s1_2; my:dependency "nsubj" ].

Alternatively, we can link to individuals in an ontology, e.g., using `nif:oliaLink` (which is, however, reserved for POS information in NIF 2.0) or `lexinfo:partOfSpeech` (normally for dictionaries, only; but note that `lexinfo:subject` is a property):

	  :s1_1 powla:isSourceOf [ a powla:Relation; powla:hasTarget :s1_2; my:dependency stanford:nsubj ].

Or to a particular class (as recommended within OLiA, http://purl.org/olia)

	  :s1_10 powla:isSourceOf [ a powla:Relation; powla:hasTarget _:s1_11; a stanford:NominalSubject ].

So far, this was source- (dependent-) centered.
In POWLA, the relation between source (dependent) and target (head) can also be expressed in a relation-centered way:

	  [ a stanford:NominalSubject; powla:hasSource :s1_10; powla:hasTarget :s1_11 ] .

Or in a target- (head-) centered way:

	  :s_11 powla:isTargetOf [ a powla:Relation, stanford:NominalSubject; powla:hasSource :s1_10 ] .
  
## Discussion

The non-reified representation of NIF 2.0 has the advantage of being compact and intuitive. It has the disadvantage that provenance, metadata and explicit annotations of the relation cannot be represented. A reified representation is thus necessary, but a non-reified representation could be introduced as a short-hand.
But unlike the introduction of ad hoc properties as in the NIF 2.0 example, those should at least be defined as properties that express a dependency (or other directed) relation. Suggestion: If a non-reified representation is to be maintained, let it be defined as subproperty of a generic property, maybe `xy:SyntacticHead` or, more generally, `xy:Relation`.

The latter is exactly what POWLA (and LAF) proposed. Has the advantage of being able to add provenance and further annotations, disadvantage: relatively verbose.

