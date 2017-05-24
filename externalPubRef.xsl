<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:template match="externalPubRef">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="externalPubRefIdent">
    <xsl:apply-templates select="externalPubTitle"/>
  </xsl:template>

  <xsl:template match="externalPubCode"/>

  <xsl:template match="externalPubTitle">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
