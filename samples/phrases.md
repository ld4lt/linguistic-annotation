
# Phrase structure annotation in RDF

see https://github.com/ld4lt/linguistic-annotation/blob/master/samples/deps.md for pointers to documentation and the annotation of labelled edges. Except within POWLA, labelled edges do not seem to have been addressed before. Suggestion: Use conventions established there for labelled dependencies for modelling labelled edges and focus on unlabelled edges here.

## NIF

	_:child a nif:String, nif:Phrase; nif:subStringOf _:parent.
 
 TODO: replace blank nodes by NIF String URIs

For navigating within parse trees, NIF also provides `nif:nextWord` (etc.) properties. TBC: specific navigational property for phrases? 
  
## CoNLL-RDF (Chiarcos & Fäth 2017)

original model: no phrase structures support, phrase structure encoded in string annotations will not be decoded

bracket encoding:

	(S	(NP He)
		(VP came
			(NP home)
			(ADV late)))

CoNLL bracket encoding, cols `ID WORD PARSE`:

	1	He	(S (NP *)
	2	came	(VP *
	3	home	(NP *)
	4	late	(ADV *)))

CoNLL-RDF:

	:s1_1 a nif:Word; nif:nextWord :s1_2;
	      conll:WORD "He"; conll:PARSE "(S (NP *)".
	# etc

CoNLL IOBES encoding, cols `ID WORD CHUNK` (this is lossy, we encode top-level chunks only):

	1	He		S-NP
	2	came	B-VP
	3	home	I-VP
	4	late	E-VP

CoNLL-RDF:

	:s1_1 a nif:Word; nif:nextWord :s1_2;
	      conll:WORD "He"; conll:PARSE "S-NP".
	# etc

SketchEngine SGML/XML extension, cols `ID WORD`

	<S>
	<NP>
	1	He
	</NP>
	<VP>
	2	came
	<NP>
	3	home
	</NP>
	<ADV>
	4	late
	</ADV>
	</VP>
	</S>

In the original CoNLL-RDF code, XML markup over TSV data is ignored or (for selected markup elements, e.g., `<seg>`) transformed to sentence breaks.

## CoNLL-RDF  tree extension (Chiarcos & Glaser 2020)

Input as for CoNLL-RDF, but directly encoded into POWLA nodes. Supports all three input modes identified above, but with slightly different naming conventions. Two parsing modes supported, with derived URIs (as in NIF, all nodes beginning and ending with the same token are implicitly merged into a single entity) or blank nodes (co-extensional nodes are distinguished)

CoNLL bracket encoding, cols `ID WORD PHRASE`

	1	He	(S (NP *)
	2	came	(VP *
	3	home	(NP *)
	4	late	(ADV *)))

Output (using blank nodes)

	:s1_1 a nif:Word; nif:nextWord :s1_2; conll:WORD "He"; powla:hasParent _:np1.
	_:np1 a conll:PHRASE; rdf:value "NP"; powla:next _:vp; powla:hasParent _:s.
	_:s a conll:PHRASE; rdf:value "S"

## POWLA

Beyond the POWLA elements used in CoNLL-RDF, POWLA provides the inverse properties.
POWLA encodes the hierarchical structure using `powla:hasParent` and `powla:hasChild` and the sequential order *of sibling elements* using `powla:next`.

With the full POWLA vocabulary, and using blank nodes, we can actually visually emulate parse trees in Turtle (if we ignore sequential order -- which can be derived from token order, anyway):

	[ rdf:value "S"; powla:hasChild
		[ rdf:value "NP"; powla:hasChild 		:s1_1 ],
		[ rdf:value "VP"; powla:hasChild 		:s1_2,
			[ rdf:value "NP"; powla:hasChild 	:s1_3 ],
			[ rdf:value "ADV"; powla:hasChild 	:s1_4 ]]] .

## labelled edges

We add the edge label `SBJ` to the first NP.

Bracket encoding:

	(S	(NP-SBJ He)
		(VP came
			(NP home)
			(ADV late)))


CoNLL bracket encoding, cols `ID WORD PARSE`:

	1	He	(S (NP-SBJ *)
	2	came	(VP *
	3	home	(NP *)
	4	late	(ADV *)))

- NIF 2.0: no direct support, could be encoded by an ad hoc property attached to the phrase or an ad hoc object properties between phrases (as for dependencies).
- CoNLL-RDF (C&F 2017): no direct support, preserved as string value
- CoNLL-RDF tree extension (C&G 2020): no direct support, preserved as phrase label `rdf:value "NP-SBJ"` (can be subsequently transformed into more complex data structures as provided by POWLA, but not supported by the standard parser)
- POWLA *can* encode the hierarchical structure by `powla:hasParent`, encode the label like a dependency relation that connects the child (source) with the parent (target):

		_:np1 a conll:PHRASE; rdf:value "NP"; powla:next _:vp; powla:hasParent _:s;
			    powla:isSourceOf [a powla:Relation; rdf:value "SBJ"; powla:hasTarget _:s ].
		_:s a conll:PHRASE; rdf:value "S".
