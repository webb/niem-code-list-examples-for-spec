<?xml version="1.0" encoding="UTF-8"?>
<stylesheet 
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:doc="https://iead.ittl.gtri.org/wr24/doc/2011-09-30-2258"
    xmlns:nothing="http://example.org/nothing"
    xmlns:table="http://wr.gatech.edu/namespace/table/"
    version="2.0">

  <output method="xml" version="1.0" indent="yes" encoding="US-ASCII"/>

  <!-- just copy everything else -->
  <template match="/">
    <nothing:container>
      <doc:theadr>
        <for-each select="/table:table/table:row[1]/table:column">
          <doc:th><value-of select="."/></doc:th>
        </for-each>
      </doc:theadr>
      <for-each select="/table:table/table:row[position() != 1]">
        <doc:tr>
          <for-each select="table:column">
            <doc:td><value-of select="."/></doc:td>
          </for-each>
        </doc:tr>
      </for-each>
    </nothing:container>
  </template>

</stylesheet>
<!--
Local Variables:
mode: sgml
indent-tabs-mode: nil
fill-column: 9999
End:
-->
