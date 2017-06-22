<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="externalPubRef">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="externalPubRef[@xlink:href]">
    <d:link>
      <xsl:copy-of select="@xlink:href"/>
      <xsl:apply-templates/>
    </d:link>
  </xsl:template>

  <xsl:template match="externalPubRefIdent">
    <xsl:apply-templates select="externalPubTitle"/>
  </xsl:template>

  <xsl:template match="externalPubCode"/>

  <xsl:template match="externalPubTitle">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
