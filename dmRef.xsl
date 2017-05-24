<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="dmRef">
    <xsl:apply-templates select="dmRefIdent"/>
  </xsl:template>

  <xsl:template match="dmRefIdent">
    <xsl:apply-templates select="dmCode"/>
  </xsl:template>

</xsl:stylesheet>
