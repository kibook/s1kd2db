<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="caution">
    <d:caution>
      <xsl:apply-templates/>
    </d:caution>
  </xsl:template>

  <xsl:template match="warning">
    <d:warning>
      <xsl:apply-templates/>
    </d:warning>
  </xsl:template>

  <xsl:template match="warningAndCautionPara">
    <d:para>
      <xsl:apply-templates/>
    </d:para>
  </xsl:template>

</xsl:stylesheet>
