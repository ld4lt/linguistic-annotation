<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:la="https://www.w3.org/community/ld4lt"
   xmlns:doc="http://docbook.org/ns/docbook"
   xmlns:xl="http://www.w3.org/1999/xlink"
   xmlns:md2doc="http://www.markdown2docbook.com/ns/md2doc"
   version="3.0">
   <!-- APPLICATION FOR PARSING THE LINGUISTIC ANNOTATION SURVEY OF REQUIRED FEATURES -->
   
   <!-- Initial, catalyzing input: any XML file, including this one -->
   <!-- Secondary (main) input: ../survey/required-features.md -->
   <!-- Primary output: depending upon how the static parameters are configured, either:
               1. Diagnostics
                  OR
               2. An HTML page showing the aspects supported by each candidate language
   -->
   <!-- Secondary output: none -->
   
   <xsl:param name="output-diagnostics-on" static="yes" as="xs:boolean" select="false()"/>
   
   <xsl:output indent="yes" use-when="$output-diagnostics-on"/>
   <xsl:output indent="yes" method="html" use-when="not($output-diagnostics-on)" use-character-maps="keep-chars"/>
   
   
   
   <xsl:include href="inclusions/core-functions.xsl"/>
   <xsl:include href="inclusions/markdown2docbook/src/md2doc-functions.xsl"/>
   
   <xsl:param name="required-features-uri-resolved" select="resolve-uri('../survey/required-features.md', static-base-uri())"/>
   <xsl:variable name="required-features-unparsed" select="unparsed-text($required-features-uri-resolved)"/>
   <!-- The current document has a code line that begins #, throwing off the docbook parser -->
   <xsl:variable name="required-features-adjusted" select="replace($required-features-unparsed, '# WORD', ' $0')"/>
   
   <xsl:character-map name="keep-chars">
      <!-- For retaining JavaScript characters -->
      <xsl:output-character character="&lt;" string="&lt;"/>
      <xsl:output-character character="&gt;" string="&gt;"/>
      <xsl:output-character character="&amp;" string="&amp;"/>
      <xsl:output-character character="&#xd;" string=""/>
   </xsl:character-map>
   
   
   <!-- Default templates -->
   <xsl:template match="document-node()" mode="#all">
      <xsl:document>
         <xsl:apply-templates mode="#current"/>
      </xsl:document>
   </xsl:template>
   
   <!-- Turn the markdown document into DocBook -->
   <xsl:variable name="required-features-as-docbook" as="document-node()">
      <xsl:document>
         <xsl:sequence select="md2doc:convert($required-features-adjusted, 'article', '')"/>
      </xsl:document>
   </xsl:variable>
   
   <!-- Turn the markdown document into HTML -->
   <xsl:variable name="required-features-as-html" as="document-node()">
      <xsl:document>
         <xsl:sequence select="md2doc:get-html($required-features-adjusted)"/>
      </xsl:document>
   </xsl:variable>
   
   <xsl:variable name="standards-tree" as="element()">
      <standards>
         <standard>
            <name>NIF</name>
            <version>
               <name>NIF 2.0</name>
            </version>
            <version>
               <name>NIF 2.1</name>
            </version>
            <extension>
               <name>CoNLL-RDF</name>
            </extension>
            <extension>
               <name>Ligt</name>
            </extension>
         </standard>
         <standard>
            <name>Web Annotation</name>
            <name>Open Annotation</name>
         </standard>
         <group>
            <name>ISO and derivatives</name>
            <standard>
               <name>POWLA</name>
               <name>PAULA</name>
            </standard>
            <standard>
               <name>LAF</name>
            </standard>
            <standard>
               <name>MAF</name>
            </standard>
            <standard>
               <name>SynAF</name>
            </standard>
            <standard>
               <name>SemAF</name>
            </standard>
         </group>
         <standard>
            <name>TEI</name>
         </standard>
      </standards>
   </xsl:variable>
   
   <!-- Find top-level sections, to sort the HTML tables -->
   <xsl:variable name="top-level-sections" as="element()*" select="$required-features-as-docbook/doc:section/doc:section[doc:title[matches(., '^[A-Z]\. ')]]"/>
   
   <xsl:variable name="parse-pass-1" as="document-node()">
      <xsl:document>
         <survey>
            <xsl:apply-templates select="$required-features-as-docbook"
               mode="docbook-to-req-feat-db"/>
         </survey>
      </xsl:document>
   </xsl:variable>
   
   <xsl:mode name="docbook-to-req-feat-db" on-no-match="shallow-skip"/>
   <xsl:template match="doc:para" mode="docbook-to-req-feat-db">
      <xsl:variable name="this-element" select="."/>
      <xsl:variable name="this-leaf-section" select="ancestor::doc:section[1]" as="element()?"/>
      <xsl:variable name="this-support-value" select="$this-element/doc:computeroutput[matches(., '[+-]')][1]"/>
      <xsl:variable name="this-comment" select="$this-support-value/following-sibling::node()"/>
      <xsl:variable name="this-comment-norm" select="normalize-space(replace(string-join($this-comment), '^[\W]+|[\W+]$', ''))"/>
      <xsl:variable name="these-entries" as="xs:string*">
         <xsl:analyze-string select="." regex="^([,a-zA-Z .-]+):">
            <xsl:matching-substring>
               <xsl:value-of select="normalize-space(regex-group(1))"/>
            </xsl:matching-substring>
         </xsl:analyze-string>
      </xsl:variable>
      <!-- Fetch matching standards, but omit any where a descendant has been picked. This ensures that if NIF 2.0 is specified, NIF
      in general is not picked. -->
      <xsl:variable name="these-standards-tree-entries"
         select="
            $standards-tree//*[name[contains($these-entries, .)]][not(some $i in descendant::*/name
               satisfies contains($these-entries, $i))]"
         as="element()*"/>
      
      <xsl:for-each select="$these-standards-tree-entries">
         <xsl:variable name="these-versions" select=".//version" as="element()*"/>
         <!-- Let something like NIF populate down to NIF 2.0 etc. -->
         <xsl:variable name="these-names-norm"
            select="
               if (exists($these-versions)) then
                  $these-versions/name[1]
               else
                  name[1]"/>
         <item>
            <aspect>
               <xsl:value-of select="$this-leaf-section[1]/doc:title[1]"/>
            </aspect>
            <xsl:for-each select="$these-names-norm">
               <standard>
                  <xsl:value-of select="."/>
               </standard>
            </xsl:for-each>
            <support>
               <xsl:value-of select="$this-element/doc:computeroutput[matches(., '[+-]')][1]"/>
            </support>
            <xsl:if test="string-length($this-comment-norm) gt 0">
               <comment>
                  <xsl:value-of select="$this-comment-norm"/>
               </comment>
            </xsl:if>
         </item>
      </xsl:for-each>
      
   </xsl:template>
   
   <xsl:variable name="leaf-sections" as="element()+" select="$required-features-as-docbook//doc:section[not(doc:section)]"/>
   
   <xsl:variable name="parse-pass-2" as="document-node()">
      <xsl:apply-templates select="$parse-pass-1" mode="data-to-table"/>
   </xsl:variable>
   <xsl:template match="/*" mode="data-to-table">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:for-each select="$leaf-sections">
            <xsl:variable name="this-title" select="doc:title" as="element()"/>
            <xsl:variable name="these-data" select="$parse-pass-1/*/item[aspect = $this-title]"/>
            <row>
               <key>
                  <xsl:value-of select="normalize-space($this-title)"/>
               </key>
               <xsl:for-each select="$standards-tree//*[name][not(standard)][not(version)]">
                  <xsl:variable name="these-names" select="name"/>
                  <xsl:variable name="data-for-this-standard" select="$these-data[standard = $these-names]"/>
                  <cell class="{replace($these-names[1], ' ', '_')}">
                     <xsl:copy-of select="$data-for-this-standard/support"/>
                     <xsl:copy-of select="$data-for-this-standard/comment"/>
                  </cell>
               </xsl:for-each>
            </row>
         </xsl:for-each> 
      </xsl:copy>
   </xsl:template>
   
   <!-- PASS 3: CALCULATE SCORES -->
   
   <xsl:variable name="parse-pass-3" as="document-node()">
      <xsl:apply-templates select="$parse-pass-2" mode="calculate-scores"/>
   </xsl:variable>
   <xsl:mode name="calculate-scores" on-no-match="shallow-copy"/>
   <xsl:template match="/*" mode="calculate-scores">
      <xsl:variable name="these-rows" select="row" as="element()*"/>
      <xsl:variable name="standard-cell-count" select="count(row[1]/cell)"/>
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="#current"/>
         
         <!-- Add one row per category -->
         <xsl:for-each-group select="row" group-by="substring(key, 1, 1)">
            <xsl:sort select="current-grouping-key()"/>
            <xsl:variable name="this-group" select="current-grouping-key()" as="xs:string"/>
            <row class="score">
               <key>
                  <xsl:value-of select="$this-group"/>
               </key>
               <xsl:for-each select="1 to $standard-cell-count">
                  <xsl:variable name="this-pos" select="."/>
                  <xsl:variable name="these-cells" select="current-group()/cell[$this-pos]"/>
                  <cell>
                     <xsl:copy-of select="$these-cells[1]/@*"/>
                     <xsl:value-of select="la:calculate-score($these-cells)"/>
                  </cell>
               </xsl:for-each>
               <cell/>
            </row>
            
         </xsl:for-each-group> 
         
         
         <!-- Add a row that totals everything -->
         <row class="score">
            <key>all</key>
            <xsl:for-each select="1 to $standard-cell-count">
               <xsl:variable name="this-pos" select="."/>
               <xsl:variable name="these-cells" select="$these-rows/cell[$this-pos]"/>
               <cell>
                  <xsl:copy-of select="$these-cells[1]/@*"/>
                  <xsl:value-of select="la:calculate-score($these-cells)"/>
               </cell>
            </xsl:for-each>
            <cell/>
         </row>
      </xsl:copy>
   </xsl:template>
   <!-- Skip rows that have no entries -->
   <xsl:template match="row[not(cell/support)]" mode="calculate-scores"/>
   <xsl:template match="row" mode="calculate-scores">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="#current"/>
         <cell class="score">
            <xsl:value-of select="la:calculate-score(cell/support)"/>
         </cell>
      </xsl:copy>
   </xsl:template>
   
   <xsl:function name="la:calculate-score" as="xs:double?">
      <!-- Input: any items -->
      <!-- Output: a calculated score, where + alone is 1, (+) is 0.5, (-) is -0.5 and - is -1 -->
      <xsl:param name="labels" as="item()*"/>
      <xsl:variable name="these-scores" as="xs:double*">
         <xsl:for-each select="$labels">
            <xsl:choose>
               <xsl:when test=". eq '+'">
                  <xsl:sequence select="1"/>
               </xsl:when>
               <xsl:when test=". eq '(+)'">
                  <xsl:sequence select="0.5"/>
               </xsl:when>
               <xsl:when test=". eq '(-)'">
                  <xsl:sequence select="-0.5"/>
               </xsl:when>
               <xsl:when test=". eq '-'">
                  <xsl:sequence select="-1"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:sequence select="0"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
      </xsl:variable>
      <xsl:sequence select="sum($these-scores)"/>
   </xsl:function>
   
   
   
   <!-- CONVERT THE CALCULATED DATA INTO AN HTML REPORT -->
   
   <xsl:variable name="results-as-html" as="document-node()">
      <xsl:apply-templates select="$parse-pass-3" mode="parse-to-html"/>
   </xsl:variable>
   <xsl:template match="/*" mode="parse-to-html">
      <xsl:variable name="these-rows" select="row" as="element()*"/>
      <html xmlns="http://www.w3.org/1999/xhtml">
         <head>
            <title>
               <xsl:text>Linguistic Annotation Survey generated </xsl:text>
               <xsl:value-of select="current-dateTime()"/>
            </title>
            <style><xsl:value-of select="unparsed-text('inclusions/survey.css')"/></style>
         </head>
         <body>
            <h1>Linguistic Annotation Survey</h1>
            <div>Generated <xsl:value-of select="current-dateTime()"/> from stylesheet at <xsl:value-of select="static-base-uri()"/></div>
            <h2>Key</h2>
            <div>Some criteria below assign specific meaning to the four codes. Default values, however, are as follows:</div>
            <div><code>+</code>: criterium is fully supported (score 1)</div>
            <div><code>(+)</code>: criterium is partly supported, or offers potential for full support via extensions (score 0.5)</div>
            <div><code>(-)</code>: criterium is not supported, but might be extended to partial or full support (score -0.5)</div>
            <div><code>-</code>: criterium is not supported, and cannot be extended to develop partial or full support (score -1)</div>
            <div>Any code that looks like this... <div class="inline">
                  <div class="support hascomment" onclick="reveal('example')">(+)</div>
                  <div class="comment hide" id="example">comment</div>
               </div>...contains a comment. Click to reveal the comment.</div>
            <h2>Survey</h2>
            
            <!-- We repeat the first TLS as a placeholder for doing everything -->
            <xsl:for-each select="$top-level-sections, $top-level-sections[1]">
               <xsl:variable name="this-title" select="doc:title[1]"/>
               <xsl:variable name="this-is-general" select="position() gt count($top-level-sections)" as="xs:boolean"/>
               <xsl:variable name="this-table-id" select="if ($this-is-general) then 'all' else
                  analyze-string($this-title, '^[A-Z]')/*:match" as="xs:string"/>
               <xsl:variable name="this-explanatory-intro" as="element()*" select="doc:section[1]/preceding-sibling::* except doc:title"/>
               
               <xsl:choose>
                  <xsl:when test="$this-is-general">
                     <h3>All categories</h3>
                  </xsl:when>
                  <xsl:otherwise>
                     <h3>
                        <xsl:value-of select="doc:title[1]"/>
                     </h3>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:if test="exists($this-explanatory-intro)">
                  <div>
                     <div class="label" onclick="reveal('about{$this-table-id}')">About this category</div>
                     <div class="hide" id="about{$this-table-id}">
                        <xsl:apply-templates select="$this-explanatory-intro" mode="#current"/>
                     </div>
                  </div>
               </xsl:if>
               <table id="{$this-table-id}">
                  <colgroup>
                     <col class="key"/>
                  </colgroup>
                  
                  <xsl:for-each-group select="$these-rows[1]/cell"
                     group-by="($standards-tree//*[name = replace(current()/@class, '_', ' ')]/ancestor-or-self::*[name][last()]/name, position())[1]">
                     <colgroup>
                        <!--<xsl:attribute name="span" select="count(current-group())"/>-->
                        <xsl:attribute name="class" select="current-grouping-key() || ' group'"/>
                        <xsl:for-each select="current-group()">
                           <col>
                              <xsl:if test="position() eq 1">
                                 <xsl:attribute name="class" select="'borderleft'"/>
                              </xsl:if>
                           </col>
                        </xsl:for-each>
                     </colgroup>
                  </xsl:for-each-group>
                  <colgroup>
                     <col class="score"/>
                  </colgroup>
                  
                  <thead>
                     <tr>
                        <th/>
                        <xsl:for-each-group select="$these-rows[1]/cell" group-by="($standards-tree//*[name = replace(current()/@class, '_', ' ')]/ancestor-or-self::*[name][last()]/name, position())[1]">
                           <xsl:variable name="group-count" select="count(current-group())" as="xs:integer"/>
                           <xsl:choose>
                              <xsl:when test="$group-count gt 1">
                                 <th>
                                    <xsl:attribute name="colspan" select="$group-count"/>
                                    <xsl:value-of select="current-grouping-key()"/>
                                 </th>
                              </xsl:when>
                              <xsl:otherwise>
                                 <th/>
                              </xsl:otherwise>
                           </xsl:choose>
                        </xsl:for-each-group>
                        <th/>
                     </tr>
                     <xsl:apply-templates select="$these-rows[1]" mode="build-thead">
                        <xsl:with-param name="table-id" as="xs:string" tunnel="yes" select="$this-table-id"/>
                     </xsl:apply-templates>
                  </thead>
                  <tbody>
                     <xsl:choose>
                        <xsl:when test="$this-is-general">
                           <xsl:apply-templates select="$these-rows" mode="#current">
                              <xsl:with-param name="grand-total" select="true()" tunnel="yes"
                                 as="xs:boolean"/>
                           </xsl:apply-templates>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates select="$these-rows[key[starts-with(., $this-table-id)]]" mode="#current"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </tbody>
               </table>
               
            </xsl:for-each>
            <script xml:space="preserve"><xsl:value-of select="unparsed-text('inclusions/tablesorter.js')"/></script>
         </body>
      </html>
   </xsl:template>
   
   <xsl:template match="row/*" mode="build-thead">
      <xsl:param name="table-id" as="xs:string" tunnel="yes"/>
      <th xmlns="http://www.w3.org/1999/xhtml" onclick="sortTable({count(preceding-sibling::*)},'{$table-id}')">
         <xsl:copy-of select="@*"/>
         <xsl:value-of select="@class"/>
      </th>
   </xsl:template>
   <xsl:template match="row/*[last()]" priority="1" mode="build-thead">
      <xsl:param name="table-id" as="xs:string" tunnel="yes"/>
      <th xmlns="http://www.w3.org/1999/xhtml" onclick="sortTableByNumber({count(preceding-sibling::*)},'{$table-id}')">
         <xsl:copy-of select="@*"/>
         <xsl:value-of select="@class"/>
      </th>
   </xsl:template>
   <xsl:template match="row" mode="parse-to-html build-thead">
      <xsl:param name="grand-total" select="false()" tunnel="yes" as="xs:boolean"/>
      <xsl:variable name="skip-this" select="$grand-total = true() and ((@class = 'score') and not(key = 'all'))"/>
      <xsl:if test="not($skip-this)">
         <tr xmlns="http://www.w3.org/1999/xhtml">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
         </tr>
      </xsl:if>
   </xsl:template>
   <xsl:template match="key | cell" mode="parse-to-html">
      <xsl:param name="grand-total" select="false()" tunnel="yes" as="xs:boolean"/>
      
      <xsl:variable name="this-support-value" select="la:calculate-score(support)" as="xs:double?"/>
      <xsl:variable name="this-extra-class-name" as="xs:string?">
         <xsl:choose>
            <xsl:when test="$this-support-value eq 1">sup4</xsl:when>
            <xsl:when test="$this-support-value eq 0.5">sup3</xsl:when>
            <xsl:when test="$this-support-value eq -0.5">sup2</xsl:when>
            <xsl:when test="$this-support-value eq -1">sup1</xsl:when>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="comment-id-parts" as="xs:string*">
         <xsl:if test="exists(comment)">
            <xsl:if test="$grand-total eq true()">gen</xsl:if>
            <xsl:value-of select="generate-id(comment[1])"/>
         </xsl:if>
      </xsl:variable>
      
      <td xmlns="http://www.w3.org/1999/xhtml">
         <xsl:copy-of select="@*"/>
         <xsl:attribute name="class" select="string-join((@class, $this-extra-class-name), ' ')"/>
         <xsl:apply-templates mode="#current">
            <xsl:with-param name="comment-id" select="string-join($comment-id-parts)"
               as="xs:string?"/>
         </xsl:apply-templates>
      </td>
   </xsl:template>
   <xsl:variable name="master-href-base" as="xs:string" select="'https://github.com/ld4lt/linguistic-annotation/blob/master/survey/required-features.md'"/>
   <xsl:template match="key/text()" mode="parse-to-html">
      <xsl:variable name="this-text" select="."/>
      <xsl:variable name="this-toc-entry" select="$required-features-as-docbook/doc:section/doc:section[1]//doc:link[. = $this-text]"/>
      <xsl:choose>
         <xsl:when test="exists($this-toc-entry)">
            <a xmlns="http://www.w3.org/1999/xhtml" href="{$master-href-base}{$this-toc-entry/@xl:href}">
               <xsl:value-of select="."/>
            </a>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="."/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="support" mode="parse-to-html">
      <xsl:param name="comment-id" as="xs:string?"/>
      <xsl:variable name="has-comment" select="string-length($comment-id) gt 0" as="xs:boolean"/>
      <xsl:variable name="this-class-val" select="if ($has-comment) then 'support hascomment' else 'support'"/>
      <!-- For alphabetical sorting -->
      <div xmlns="http://www.w3.org/1999/xhtml" class="hide score">
         <xsl:value-of select="round((la:calculate-score(.) + 2) * 2)"/>
      </div>
      <div xmlns="http://www.w3.org/1999/xhtml" class="{$this-class-val}">
         <xsl:if test="$has-comment">
            <xsl:attribute name="onclick">reveal('<xsl:value-of select="$comment-id"
               />')</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates mode="#current"/>
      </div>
      
   </xsl:template>
   <xsl:template match="comment" mode="parse-to-html">
      <xsl:param name="comment-id" as="xs:string?"/>
      <div xmlns="http://www.w3.org/1999/xhtml" class="comment hide">
         <xsl:if test="string-length($comment-id) gt 0">
            <xsl:attribute name="id" select="$comment-id"/>
         </xsl:if>
         <xsl:apply-templates mode="#current"/>
      </div>
   </xsl:template>
   <xsl:template match="doc:itemizedlist" mode="parse-to-html">
      <ol xmlns="http://www.w3.org/1999/xhtml">
         <xsl:apply-templates mode="#current"/>
      </ol>
   </xsl:template>
   <xsl:template match="doc:listitem" mode="parse-to-html">
      <li xmlns="http://www.w3.org/1999/xhtml">
         <xsl:apply-templates mode="#current"/>
      </li>
   </xsl:template>
   <xsl:template match="row[@class = 'score']/key" mode="parse-to-html">
      <td xmlns="http://www.w3.org/1999/xhtml">score</td>
   </xsl:template>
   <xsl:template match="*" mode="parse-to-html">
      <div xmlns="http://www.w3.org/1999/xhtml" class="{name(.)}">
         <xsl:apply-templates mode="#current"/>
      </div>
   </xsl:template>
   
   
   <xsl:template match="/" priority="2" use-when="$output-diagnostics-on">
      <diagnostics>
         <!--<required-features-unparsed><xsl:copy-of select="$required-features-unparsed"/></required-features-unparsed>-->
         <required-features-as-docbook><xsl:copy-of select="$required-features-as-docbook"/></required-features-as-docbook>
         <!--<required-features-as-html><xsl:copy-of select="$required-features-as-html"/></required-features-as-html>-->
         <parse-pass-1><xsl:copy-of select="$parse-pass-1"/></parse-pass-1>
         <parse-pass-2><xsl:copy-of select="$parse-pass-2"/></parse-pass-2>
         <parse-pass-3><xsl:copy-of select="$parse-pass-3"/></parse-pass-3>
         <results-as-html><xsl:copy-of select="$results-as-html"/></results-as-html>
      </diagnostics>
   </xsl:template>
   <xsl:template match="/" priority="1">
      <xsl:copy-of select="$results-as-html"/>
   </xsl:template>
   
</xsl:stylesheet>