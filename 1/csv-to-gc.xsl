<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/"    
   xmlns:c="http://wr.gatech.edu/namespace/csv-to-xml/"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0">

  <xsl:output method="xml" version="1.0" indent="yes"/>

  <xsl:template match="/c:file">
    <gc:CodeList>
      <Identification xmlns="">
	<ShortName>HazmatTitle49Code</ShortName>
	<Version>13.7.2</Version>
	<CanonicalUri>http://example.org/hazmat/</CanonicalUri>
	<CanonicalVersionUri>http://example.org/hazmat/13.7.2/</CanonicalVersionUri>
      </Identification>
      <ColumnSet>
	<Column Id="name" Use="required">
	  <ShortName>Name</ShortName>
	  <Data Type="token" Lang="en"/>
	</Column>
	<Column Id="descr" Use="required">
	  <ShortName>Description</ShortName>
	  <Data Type="normalizedString" Lang="en"/>
	</Column>
	<Column Id="class" Use="required">
	  <ShortName>HazmatClass</ShortName>
	  <Data Type="normalizedString" Lang="en"/>
	</Column>
	<Key Id="code-key">
	  <ShortName>Code</ShortName>
	  <ColumnRef Ref="code"/>
	</Key>
      </ColumnSet>
      <SimpleCodeList>
        <xsl:apply-templates select="c:row[position() &gt; 1]"/>
      </SimpleCodeList>
    </gc:CodeList>
  </xsl:template>

  <xsl:template match="c:row">
    <Row>
      <Value>
        <SimpleValue><xsl:value-of select="c:column[1]"/></SimpleValue>
      </Value>
      <Value>
        <SimpleValue><xsl:value-of select="c:column[2]"/></SimpleValue>
      </Value>
      <Value>
        <SimpleValue><xsl:value-of select="c:column[3]"/></SimpleValue>
      </Value>
    </Row>
  </xsl:template>

</xsl:stylesheet>
<!--
Local Variables:
mode: sgml
indent-tabs-mode: nil
fill-column: 9999
End:
-->
