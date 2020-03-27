
NLP Interchange Format (NIF) 2.0
--------------------------------

Public API Specification
========================

Document Version: 1.0.0-rc1
---------------------------
Markdown edition of the original [NIF 2.0 API Specification](https://persistence.uni-leipzig.org/nlp2rdf/specification/api.html)  developed via the [NLP2RDF GitHub repository](https://github.com/NLP2RDF/specification/). Retrieved 2020-03-26.


Summary
-------

The NLP Interchange Format (NIF) is an RDF/OWL-based format that aims to achieve interoperability between Natural Language Processing (NLP) tools, language resources and annotations. NIF consists of specifications, ontologies and software ([overview](http://persistence.uni-leipzig.org/nlp2rdf)), which are combined under the version identifier "NIF 2.0", but are [versioned individually](http://persistence.uni-leipzig.org/nlp2rdf/specification/version.html).

This specification complements the [NIF 2.0 Core specification](http://persistence.uni-leipzig.org/nlp2rdf/specification/core.html) by specifying in detail how the interface for a NIF implementation must behave. The focus here is on **how to access the tools** and web services and **not** on what the transfered data contains. We distinguish Web Service (NIF-WS) and Command Line Interface (NIF-CLI) which are called in sum NIF implementations. Note that only the parameter `input` is required during a request. If this document mentions "required" parameters, it means that in order to be introperable with other NIF implementations and clients, you are required to implement this parameter in your NIF implementation.

Overall this specification contains:

*   A conformance checklist telling you exactly what has to be implemented
*   NIF parameters, which all NIF tools must implement
*   An example section, so you can get an idea, what this is all about
*   A HTTP Request and Response header mapping to these parameters
*   Some additional parameters (informative)
*   Log output of NIF tools (informative)

Conformance checklist
---------------------

The keywords “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC 2119](http://www.ietf.org/rfc/rfc2119.txt). In order to produce an interoperable implementation the following checklist must be followed:

1.  A NIF implementation MUST implement the given parameters (short and long, all values and the default):
    
    *   `input` (`i`):
        *   No default
        *   Depends on `informat` and `intype`
        *   NIF-CLI MUST read from stdin, if `input` is "-" ("--input -" or "-i -" )
    *   `informat` (`f`):
        
        *   `turtle` (default)
        *   `text`
        
        Note that `json-ld` is scheduled to be included, if enough implementations exist.
    *   `intype` (`t`):
        *   `direct` (default)
        *   `url`
        *   `file`(only CLI)
    *   `outformat` (`o`):
        
        *   `turtle` (default)
        *   `text`
        
        Note that `json-ld` is scheduled to be included, if enough implementations exist.
    *   `urischeme` (`u`):
        *   `RFC5147String` (default)
        *   `CStringInst`
    *   `prefix` (`p`): free parameter; SHOULD implement a sensible default
    
    A NIF implementation MUST implement:
    *   both the long form and the short form (in brackets)
    *   ALL values given above values
    *   the specified default
2.  A NIF implementation MAY implement optional parameters and values. In this case, the parameter `info` or `info=true` or `help` SHOULD say which parameters are implemented.
3.  NIF implementations SHOULD implement the values `ntriples`, `rdfxml` for the parameter `informat` and `outformat`, if it does not require a lot of extra work (e.g built-in by the used RDF library).
4.  A NIF implementation MUST not produce an error, if a parameter with an existing default value is omitted.
5.  A NIF implementation MUST give an error message, if no `input` data is given.

### NIF-WS: Additional requirements

1.  NIF-WS MUST implement "Content-Type" and "Accept" Headers as specified in Section "HTTP Request and Response Headers (Normative)"
2.  NIF-WS MAY implement HTTP Status Codes as specified in Section "HTTP Status Codes (Informative)"
3.  If a NIF-WS is started from the command line, it MAY accept the parameter `port`(default: `8899`) and then listen on this port and accept all NIF-WS parameters.

### NIF-CLI: Additional requirements

1.  If `intype` is `direct`, then NIF-CLI MUST either:
    *   read the data from the parameter, e.g.  
        `--input "My favourite actress is NataliePortman" -f text`
    *   read from **stdin**, if `input` is just a "-" sign:  
        `--input -` or `-i -`

NIF Parameters (normative)
--------------------------

|Parameter|Description|
|---|---|---|---|---|
| `input`(`i`) | **Input**<br/>This is the serialized data (i.e. the text or the NIF RDF in Turtle or other formats) Since the value of the parameter contains the transfered data which has to be processed by the tool, we require additional parameters to specify the data. **Input Type** (see below) specifies how the data is retrieved (e.g. `direct`, `url` or via `file`). **Input Format** (see below) specifies in what format the retrieved data is (e.g. `text` or `turtle` or `json-ld`). NIF-CLI: If `intype` is `direct`, and input is "-", then NIF-CLI MUST read from stdin:<br/><br/><code>echo -n "My favourite actress is Natalie Portman." \|\\<br/>    java -jar nif-cli.jar --informat text -i -</code>|
| `informat`(`f`) | **Input Format** <br/>Determines in which format the `input` is given. Required values are:<br/>  **`turtle`(default)** - RDF serialized as [Turtle](http://www.w3.org/TR/turtle/)<br/>  `text` - plain text in UTF-8<br/>*Note that `json-ld` is scheduled to be included, if enough implementations exist.*  <br/><br/> Furthermore, these **optional** values MAY be implemented:<br/>`json-ld` - RDF serialized as [JSON-LD](http://www.w3.org/TR/json-ld/)<br/>  `rdfxml` - RDF serialized as [RDF/XML](http://www.w3.org/TR/rdf-syntax-grammar/)<br/>  `ntriples` - RDF serialized as [N-Triples](http://www.w3.org/TR/n-triples)<br/>`html` - an HTML document<br/>  `pdf` - a PDF document<br/>  `opl` - one sentence per line format<br/>  `timedtext` - one sentence per line format|
|`intype`(`t`)| **Input Type**<br/>Determines how `input` is accessed or retrieved. Values are:<br/>**`direct`(default)** - input is read from stdin (NIF-CLI) or via HTTP parameter using GET or POST (NIF-WS)<br/>  `url` - the NIF implementation retrieves the input from the URL<br/>  `file` (NIF-CLI only) - `input` is read from a local file (relative or absolute path) .<br/><br/>**Note:** NIF-CLI is expected to work on UNIX-like systems:  <br/><code>cat textfile.txt \| java -jar nif-cli.jar --informat text --input -</code>|
|`outformat`(`o`)| **Output Format**<br/>The format in which the output is serialized.<br/>  **`turtle`(default)** - RDF serialized as [Turtle](http://www.w3.org/TR/turtle/)<br/>  `text` - outputs the text in the isString properties for all contexts<br/>**Note that `json-ld` is scheduled to be included, if enough implementations exist.**  <br/><br/>Furthermore, these **optional** values MAY be implemented:<br/>   `json-ld` - RDF serialized as [JSON-LD](http://www.w3.org/TR/json-ld/)<br/>   `rdfxml` - RDF serialized as [RDF/XML](http://www.w3.org/TR/rdf-syntax-grammar/)<br/>   `ntriples` - RDF serialized as [N-Triples](http://www.w3.org/TR/n-triples)<br/>   `html` - HTML will be serialized using [ITS 2.0 by W3C](http://www.w3.org/TR/its20/)<br/>   `rdfa` - using RDFa. How this RDFa could look like is unknown and often not feasible.<br/>   `xml` - custom xml format<br/>   `json` - custom json format|
|`urischeme`(`u`)|**URI Scheme**<br/>The URI Scheme the NIF implementation must use.<br/>   **`RFC5147String`(default)** - produces URIs of the form "`prefix`" + "char=x,y", where x is nif:beginIndex and y is nif:endIndex<br/>   `CStringInst` - produces URIs of the form "`prefix`" + UUID<br/><br/>Furthermore, these **optional** values MAY be implemented:<br/>   `ContextHashBasedString` - produces URIs of the form "`prefix`" + "hash\_cl\_sl\_md5\_s"<br/>   `OffsetBasedString` - produces URIs of the form "`prefix`" + "offset\_x\_y"<br/><br/>Long forms are:<br/>   `http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#RFC5147String`<br/>   `http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#CStringInst`<br/>   `http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#ContextHashBasedString`<br/>   `http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#OffsetBasedString`<br/><br/>A NIF implementation MAY implement additional urischemes (e.g. their own). If they do so they MUST only accept the log form of this URI  |
| `prefix`(`p`) | **Prefix**<br/>The prefix, which the NIF implementation MUST use to create and parse URIs.<br/>1.  The NIF implementation MUST create any new URIs using this `prefix`.<br/>2.  If the prefix is given the NIF implementation MUST use it to mint new URIs as-is, without any modification.<br/>3.  The NIF implementation MUST concatenate the prefix with the identifier produced based on the `urischeme` parameter.<br/>4.  If the parameter is missing it MUST be substituted by a sensible default (e.g. the web service URI or a hash over the text or a UUID).

### Examples

`input` is "My favourite actress is Natalie Portman.";

*   Try it: [prefix=http://example.org%23](http://nlp2rdf.lod2.eu/nif-ws.php?input=My%20favourite%20actress%20is%20Natalie%20Portman.&informat=text&prefix=http://example.org%23 "http://nlp2rdf.lod2.eu/nif-ws.php?input=My%20favourite%20actress%20is%20Natalie%20Portman.&informat=text&prefix=http://example.org%23")

><http://example.org#char=0,40>
		    rdf:type nif:RFC5147String , nif:Context ;
		    nif:beginIndex "0" ;
		    nif:endIndex "40" ;
		    nif:isString "My favourite actress is Natalie Portman." .

*   Try it: [prefix=http://example.org/whatever/](http://nlp2rdf.lod2.eu/nif-ws.php?input=My%20favourite%20actress%20is%20Natalie%20Portman.&informat=text&prefix=http://example.org/whatever/ "http://nlp2rdf.lod2.eu/nif-ws.php?input=My%20favourite%20actress%20is%20Natalie%20Portman.&informat=text&prefix=http://example.org/whatever/")

><http://example.org/whatever/char=0,40> 
				   rdf:type nif:RFC5147String , nif:Context ;
				   nif:beginIndex "0" ;
				   nif:endIndex "40" ;
				   nif:isString "My favourite actress is Natalie Portman." .

*   Try it: [prefix=http://example.org/nif%3F](http://nlp2rdf.lod2.eu/nif-ws.php?input=My%20favourite%20actress%20is%20Natalie%20Portman.&informat=text&prefix=http://example.org/nif%3F "http://nlp2rdf.lod2.eu/nif-ws.php?input=My%20favourite%20actress%20is%20Natalie%20Portman.&informat=text&prefix=http://example.org/nif%3F")

><http://example.org/nif?char=0,40> 
				   rdf:type nif:RFC5147String , nif:Context ;
				   nif:beginIndex "0" ;
				   nif:endIndex "40" ;
				   nif:isString "My favourite actress is Natalie Portman." .

Working NIF implementation Examples
-----------------------------------

You can try out these examples, by downloading the NIF Stanford Core Release from: [http://nlp2rdf.lod2.eu/releases/](http://nlp2rdf.lod2.eu/releases/) ([Source Code](https://github.com/NLP2RDF/software/tree/master/java-maven/implementation/stanford-core) ) or using our provided demo webservice at: [http://nlp2rdf.lod2.eu/nif-ws.php](http://nlp2rdf.lod2.eu/nif-ws.php)([Source Code](https://github.com/NLP2RDF/software/blob/master/php/nif-ws.php)).

### NIF Web Service Examples

#### Example for converting text to NIF using Curl and GET

>curl "http://nlp2rdf.lod2.eu/nif-ws.php?input=My%20favourite%20actress%20is%20Natalie%20Portman.&informat=text"
\# or
curl --data-urlencode input="My favourite actress is Natalie Portman." -d informat=text "http://nlp2rdf.lod2.eu/nif-ws.php"
\# using Accept:
curl --data-urlencode input="My favourite actress is Natalie Portman." -H "Accept: text/plain" "http://nlp2rdf.lod2.eu/nif-ws.php"

#### Example using Curl and POST

>curl -X POST --data-urlencode input="My favourite actress is Natalie Portman." -d informat=text "http://nlp2rdf.lod2.eu/nif-ws.php"
curl -X POST --data-urlencode input="My favourite actress is Natalie Portman." -H "Accept: text/plain" "http://nlp2rdf.lod2.eu/nif-ws.php"

#### Example using the `prefix` parameter

>curl --data-urlencode input="My favourite actress is Natalie Portman." -d informat=text \\
   --data-urlencode prefix="http://example.org/nif#" "http://nlp2rdf.lod2.eu/nif-ws.php"
curl --data-urlencode input="My favourite actress is Natalie Portman." -d informat=text \\
   --data-urlencode prefix="http://example.org/nif/" "http://nlp2rdf.lod2.eu/nif-ws.php"
curl --data-urlencode input="My favourite actress is Natalie Portman." -d informat=text \\
   --data-urlencode prefix="http://example.org/nif?" "http://nlp2rdf.lod2.eu/nif-ws.php"
\# using md5("My favourite actress is Natalie Portman.") = ae0aaa2ad528f072356827042afc6011 as prefix
curl --data-urlencode input="My favourite actress is Natalie Portman." -d informat=text \\
   --data-urlencode prefix="http://example.org/ae0aaa2ad528f072356827042afc6011#" "http://nlp2rdf.lod2.eu/nif-ws.php"

### NIF Command Line Examples

#### Example for piping text into NIF-CLI (Stanford CoreNLP)

>\# -f or --informat specifies the format (text, turtle, rdfxml)
\# -t or --intype specifies the input type (direct, file, url) 
echo -n "My favourite actress is Natalie Portman." | java -jar stanfordNIF-beta.jar -f text -t direct -i - 
\# -t can be omitted since direct is the default
echo -n "My favourite actress is Natalie Portman." | java -jar stanfordNIF-beta.jar -f text -i -

#### Example for reading text from file

>\# -t or --intype specifies the input type (direct, file, url) 
\# -i or --input specifies the input
echo "My favourite actress is Natalie Portman." > text.txt
java -jar stanfordNIF-beta.jar -f text -i text.txt -t file

HTTP Request and Response Headers (Normative)
---------------------------------------------

NIF-WS implementations MUST accept HTTP Request Headers as substitute for `informat` and `outformat`. NIF-WS implementations MUST always set the appropriate `Content-Type:` Header.  
The following mapping applies for the `informat` and `outformat` to media types:

*   `turtle` is the same as `text/turtle`
*   `json-ld` is the same as `application/ld+json`
*   `text` is the same as `text/plain`

as well as:

*   `html` is the same as `text/html`
*   `rdfxml` is the same as `application/rdf+xml`
*   `ntriples` is the same as `application/n-triples` (we use the latest spec as [source](http://www.w3.org/TR/n-triples/))
*   `timedtext` is the same as `application/ttml+xml`
*   `xml` is the same as `application/xml`

HTTP Status Codes (Informative)
-------------------------------

(We have copied the HTTP Codes from [https://ner.vse.cz/thd/docs/](https://ner.vse.cz/thd/docs/) for discussion. ) The NIF implementation MAY return the following HTTP status codes:

<html>
			<table border=1>
			<tr>
				<td>Code</td>
				<td>Text</td>
				<td>Description</td>
			</tr>
			<tr>
				<td>200</td>
				<td>OK</td>
				<td>Success!</td>
			</tr>
			<tr>
				<td>400</td>
				<td>Bad Request </td>
				<td>The request was invalid. An accompanying error message will explain why. </td>
			</tr>
			<tr>
				<td>401</td>
				<td>Unauthorized</td>
				<td>Authentication credentials were missing or incorrect. </td>
			</tr>
			<tr>
				<td>406</td>
				<td>Not Acceptable </td>
				<td>Returned by the API when an invalid format is specified in the request.  </td>
			</tr>
			<tr>
				<td>500</td>
				<td>Internal Server Error</td>
				<td>Something is broken. Contacting the maintainer might be appropriate. </td>
			</tr>
			<tr>
				<td>503</td>
				<td>Service Unavailable</td>
				<td>The server is currently unable to handle the request due to a temporary overloading or maintenance of the server. </td>
			</tr>
			</table>
</html>

Additional parameters (informative)
-----------------------------------
|Parameter|Description|
|---|---|---|---|---|
|`port`  <br/>(no short form)   | **Port Number**<br/>   **`8899`(default)** - starts the NIF-WS at port 8899|
| `info`  <br/> (no short form)| **Info**<br/>If info=true the NIF implementation SHOULD display all implemented parameters. TODO this will be RDF as well in the future.|
| `apikey`(`k`)|**Api Key**<br/>If access is limited, the client MUST use this parameter to give its authentication token or api key. **Note:** If your NIF implementation doesn't require authentification, this parameter SHOULD be ignored.|
|`help`(`h`)|**Help**<br/>Print help.<br/>  **`false`(default)** - nothing should happen, print no help, normal processing<br/>   `true` - display help<br/><br/>TODO this parameter is still informative. No implementation necessary. If this parameter is "true", then some help is displayed.|
|`config`(`c`)|**Config**<br/>A string which can be used to configure the NIF implementation.<br/>No required values are specified for this parameter.<br/>  What exactly the NIF implementation requires is left underspecified for now. Can be anything.<br/>   If the NIF implementation requires configuration, it MUST use this parameter.|
|`configfile`(`cf`)|**Config File**<br/>A file which can be used to configure the NIF implementation.<br/>  No required values are specified for this parameter.<br/>Same as `config`, but it is loaded from file.|
|`logprefix`(`lp`)|**Log Prefix**<br/>TODO this parameter is still informative. No implementation necessary. Used to create prefix for log URIs in the same way as `prefix`. please use a sensible default.|
|`profile`(`pr`)|**Profile**<br/>  **`simple`(default)** - produce annotations in the NIF Simple format<br/>   `stanbol` - produce annotations in the NIF Stanbol format<br/>   `oa` - produce annotations in the NIF OA format<br/><br/>TODO this parameter is still informative. No implementation necessary. It is used to swtich between different complexity profiles. NIF implementation MAY accept values `simple`, `stanbol`, `oa`.  |
|`uspara`(`up`)|**URI Scheme Parameters**<br/>TODO this parameter is still informative. No implementation necessary. Some parameters for certain urischemes, e.g. contextlength|
|`outfile`(`of`)|**Output File**<br/>A file into which results of NIF-CLI should be written. Note: this option is for operating systems that do not use pipes.

RLOG - an RDF Logging Ontology (informative)
--------------------------------------------

For NIF we have created our own Logging Ontology - RLOG. It is available at [http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog#](http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog#). The ontology is very simple, but it covers the NIF use case very well. As of now, we have not discovered any missing features. RLOG can be combined with the [W3C Provenance Ontology](http://www.w3.org/TR/prov-o/). The logging has to follow this pattern:

>@prefix rlog: <http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog#> .
@prefix logprefix: <http://example.org/user-defined-logPrefix#> .
logprefix:user-defined-urn
	   a rlog:Entry ;
	   rlog:level rlog:ERROR ;
	   rlog:date "2013-06-08T17:00:00Z"^^xsd:datetime ;
	   rlog:message "Log message" ;
	   # optional:
	   rlog:resource  <http://example.com/some-RDF-resource> . 

Here is an example produced by the [NIF validator](https://github.com/NLP2RDF/software#nif-validator):

>\# default prefix, non dereferencable
@prefix logprefix: <http://nlp2rdf.lod2.eu/instance/log/> .
\# arbitrary id at the moment. 
logprefix:id\_ERROR\_0\_1377165120346
          a              rlog:Entry ;
          rlog:date      "2013-08-22T09:52:00.347Z"^^xsd:dateTime ;
          rlog:level     rlog:ERROR ;
          rlog:message   """http://example.com/error4.txt#char=1,25: for the context, the length of nif:isString (27) must equal nif:endIndex (25)""" ;
          rlog:resource  <http://example.com/error4.txt#char=1,25> .

  

