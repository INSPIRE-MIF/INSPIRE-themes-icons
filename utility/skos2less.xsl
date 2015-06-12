<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/" 
    xmlns:foaf="http://xmlns.com/foaf/0.1/" 
    xmlns:dcterms="http://purl.org/dc/terms/" 
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
    xmlns:gemet="http://www.eionet.europa.eu/gemet/2004/06/gemet-schema.rdf#"
    exclude-result-prefixes="#all">
    
    <!-- 
    Convert SKOS thesaurus with INSPIRE themes
    to less files for the labels of the INSPIRE themes icon set.
    -->
    <xsl:output encoding="UTF-8" method="text"/>
    
    <!-- The language code to generate -->
    <xsl:param name="lang" select="'en'"/>
    
    <xsl:variable name="concepts" 
        select="document('https://raw.githubusercontent.com/geonetwork/util-gemet/master/thesauri/inspire-theme.rdf')"/>
    
    <xsl:template match="/">
        <xsl:text>.iti-box.full {</xsl:text>
        <xsl:for-each select="$concepts//skos:Concept">
          <xsl:sort select="@rdf:about"/>
  &amp;.<xsl:value-of select="concat(skos:altLabel, '-', $lang)"/> .label:before {
    content: "<xsl:value-of select="skos:prefLabel[@xml:lang = $lang]"/>";
  }</xsl:for-each>
        <xsl:text>
}</xsl:text>
    </xsl:template>
</xsl:stylesheet>