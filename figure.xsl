<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="figure">
    <figure>
      <xsl:apply-templates/>
    </figure>
  </xsl:template>

  <xsl:template match="graphic">
    <mediaobject>
      <imageobject>
        <imagedata fileref=""/>
      </imageobject>
    </mediaobject>
  </xsl:template>

</xsl:stylesheet>
