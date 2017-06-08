<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="unique-id">
    <xsl:param name="id" select="@id"/>
    <xsl:text>ID_</xsl:text>
    <xsl:apply-templates select="ancestor::dmodule/identAndStatusSection/dmAddress/dmIdent"/>
    <xsl:text>_</xsl:text>
    <xsl:value-of select="$id"/>
  </xsl:template>

  <xsl:template name="unique-id-attr">
    <xsl:if test="@id">
      <xsl:attribute name="id">
        <xsl:call-template name="unique-id"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
