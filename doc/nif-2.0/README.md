
# NIF 2.0 specification and documentation
Local copy of the original specifications and documentation maintained via the [NLP2RDF GitHub repositories](https://github.com/NLP2RDF) and published by the [University of Leipzig, Germany (NIF 1.0 and 2.0)](https://persistence.uni-leipzig.org/nlp2rdf/), resp., [Read the Docs (NIF 2.1 draft)](https://nif.readthedocs.io/en/latest/). Converted to Markdown to facilitate subsequent collaborative editing, otherwise unchanged.

* NIF 2.0 core ontology (ontology.md)
* NIF 2.0 core specification (core.md)
* NIF 2.0 API specification (api.md)

Profiles:

* NIF 2.0 Stanbol profile (stanbol.md)

Draft extensions:

* NIF 2.1 extensions for provenance and confidence (prov-and-conf.md)

History (as given under https://persistence.uni-leipzig.org/nlp2rdf/):
*   **September 6th, 2013**: Added resource list to [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/)
*   **July 7th, 2013**: [Initial draft of API parameters published.](https://persistence.uni-leipzig.org/nlp2rdf/specification/api.html)
*   **July 7th, 2013**: [Initial draft of Versioning and License specifications published.](https://persistence.uni-leipzig.org/nlp2rdf/specification/version.html)
*   **May 17, 2013**: [Integrating NLP using Linked Data](http://svn.aksw.org/papers/2013/ISWC_NIF/public.pdf). Sebastian Hellmann, Jens Lehmann, Sören Auer, and Martin Brümmer. accepted at ISWC 2013
* **NIF 1.0**: from [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/specification/about.html):
	> [T]he deprecated NIF 1.0 specification[:] During NIF 1.0, we did not track revisions or versions. The old specification can be found [here](http://nlp2rdf.org/nif-1-0](http://nlp2rdf.org/nif-1-0) (Note 2020-03-27: URL not found.)

## About NIF

from the [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/)

> The NLP Interchange Format (NIF) is an RDF/OWL-based format that aims to achieve interoperability between Natural Language Processing (NLP) tools, language resources and annotations. NIF consists of specifications, ontologies and software ([overview](http://persistence.uni-leipzig.org/nlp2rdf)), which are combined under the version identifier "NIF 2.0", but are [versioned individually](http://persistence.uni-leipzig.org/nlp2rdf/specification/version.html).
> 
> [This document](https://persistence.uni-leipzig.org/nlp2rdf/) contains pointers to all the important resources relevant for the NLP Interchange Format (NIF), Version 2.0. 
> ...
> NIF 2.0 is a set of resources which constitute a major, not backward-compatible improvement upon the previous version NIF 1.0. Since NIF 2.0 is very diverse and it consists of specifications, ontologies, implementations and corpora. NIF is maintained by the [NLP2RDF community project](http://nlp2rdf.org) If you are interested in NLP2RDF, you can write emails to the [nlp2rdf discussion list](http://lists.informatik.uni-leipzig.de/mailman/listinfo/nlp2rdf)

from the [NLP Interchange Format 2.1-RC documentation](https://nif.readthedocs.io/en/latest/)

> [T]he upcoming _NIF 2.1_ release [is] currently under revision by the broader community.

from the [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/)

> Although the road to complete interoperability is still long, NIF is already successful in providing best practices and a solid foundation for the most frequent use cases. This foundation is created by:
>
>*   **Reusing existing standards** such as [RDF](http://www.w3.org/TR/rdf-primer/), [OWL 2](http://www.w3.org/TR/owl2-overview/), [the PROV Ontology](http://www.w3.org/TR/prov-o/), [LAF (ISO 24612)](http://www.cs.vassar.edu/~ide/papers/ISO+24612-2012.pdf) and [RFC 5147](http://tools.ietf.org/html/rfc5147)
> *   Furthermore, NIF identifiers are used in the [Internationalization Tag Set (ITS) Version 2.0](http://www.w3.org/TR/its20/)
>*   All parts of NIF are **royality-free** and are published under an **open license**.
>*   NIF comprises a set of RDF vocabularies and ontologies, which have **stable identifiers**, **persistent hosting**, an **open license** and a **community approved meaning**.
>*   NIF publishes and maintains a set of **specifications** (NIF 2.0 Core Spec, [Public Api Spec](http://persistence.uni-leipzig.org/nlp2rdf/specification/api.html), [Version Information](http://persistence.uni-leipzig.org/nlp2rdf/specification/version.html) ) with best practices, complementary implementations and examples on how to use the ontologies.
>*   NIF is driven by its open and weclome-to-join community project NLP2RDF, consisting of a [mailing list](http://lists.informatik.uni-leipzig.de/mailman/listinfo/nlp2rdf), a [GitHub Project](https://github.com/NLP2RDF) and a [blog web site](http://nlp2rdf.org)
>*   NIF has received good uptake by industry, open-source projects and developers. We would like to thank all contributors in the [attribution section](#attribution)

For license, persistence, versioning, see the [original NLP2RDF documentation](http://persistence.uni-leipzig.org/nlp2rdf/specification/version.html).

### How to attribute NIF?
from [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/specification/about.html):
> We try to maintain an up-to-date page with acknowledgements to the large community of contributors. If you refer to NIF in an academic context, please cite the recent paper published at the ISWC in Use track 2013:
> *   [Integrating NLP using Linked Data](http://svn.aksw.org/papers/2013/ISWC_NIF/public.pdf). Sebastian Hellmann, Jens Lehmann, Sören Auer, and Martin Brümmer. 12th International Semantic Web Conference, 21-25 October 2013, Sydney, Australia, (2013)
>
>There is also a list of further [NIF-related scientific publications](http://nlp2rdf.org/publications).

The [original acknowledgements page](http://nlp2rdf.org/acknowledgements) are no longer available, but more detailed attribution information and a list of contributors is available from the [NLP2RDF Attribution and Contact page](https://persistence.uni-leipzig.org/nlp2rdf/page/attribution.html). 

### Author and Licence
from [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/specification/about.html):
> This document is edited by [Sebastian Hellman](http://bis.informatik.uni-leipzig.de/SebastianHellmann) from the [AKSW research group](http://aksw.org).
>
> If you'd like to leave feedback, please [open an issue on GitHub](https://github.com/NLP2RDF/specification/issues) or send an email to the [mailing list](http://lists.informatik.uni-leipzig.de/mailman/listinfo/nlp2rdf)
> [Creative Commons - CC BY 3.0](http://creativecommons.org/licenses/by/3.0/)

### How to contribute resources (software, implementations, ontologies, corpora) to NIF 2.0?
from [NLP2RDF website](https://persistence.uni-leipzig.org/nlp2rdf/specification/about.html):
> In order to contribute resources to the project, they have to have open licenses, a versioning procedure consistent with [this document](http://persistence.uni-leipzig.org/nlp2rdf/specification/version.html) and a pledge of maintenance for some years. Furthermore, they need to be added to the resource list and announced on the [NLP2RDF blog](http://nlp2rdf.org>). Please ask on the [public mailing list](http://lists.informatik.uni-leipzig.de/mailman/listinfo/nlp2rdf) or get into [contact](http://nlp2rdf.org/contactimprint), directly.

from [NIF specification repo](https://github.com/NLP2RDF/specification/blob/master/README.md):
> **NOTE:** Please use the issue tracker of the [NIF specification repository](https://github.com/NLP2RDF/specification) only for issues that
 are directly related to media content (text, figures) for the specification
 sites or implementation details for these sites.
 More specifically, please use the [NIF ontologies issue tracker](https://github.com/NLP2RDF/ontologies/issues/)
 for all discussions about the NIF vocabulary itself and it's usage.
 
