<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="dmodule">
    <xsl:element name="{$dmodule.is}">
      <xsl:apply-templates select="*"/>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
