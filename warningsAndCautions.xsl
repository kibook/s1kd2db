<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="caution">
    <caution>
      <xsl:apply-templates/>
    </caution>
  </xsl:template>

  <xsl:template match="warning">
    <warning>
      <xsl:apply-templates/>
    </warning>
  </xsl:template>

  <xsl:template match="warningAndCautionPara">
    <para>
      <xsl:apply-templates/>
    </para>
  </xsl:template>

</xsl:stylesheet>
