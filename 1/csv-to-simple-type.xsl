<?xml version="1.0" encoding="UTF-8"?>
<stylesheet 
   xmlns="http://www.w3.org/1999/XSL/Transform"
   xmlns:c="http://wr.gatech.edu/namespace/csv-to-xml/"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   version="2.0">

  <output method="xml" version="1.0" indent="yes"/>

  <template match="/c:file">
    <xs:top-level>
      <xs:simpleType name="HazmatTitle49CodeSimpleType">
        <xs:restriction base="xs:token">
          <apply-templates select="c:row[position() &gt; 1]"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:top-level>
  </template>

  <template match="c:row">
    <xs:enumeration value="{c:column[1]}">
      <xs:annotation>
        <xs:documentation><value-of select="c:column[2]"/>. Hazmat class is &quot;<value-of select="c:column[3]"/>&quot;.</xs:documentation>
      </xs:annotation>
    </xs:enumeration>
  </template>

</stylesheet>
