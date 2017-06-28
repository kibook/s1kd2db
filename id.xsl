<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="unique.id">
    <xsl:param name="id" select="@id"/>
    <xsl:choose>
      <xsl:when test="$use.unique.id = 0">
        <xsl:value-of select="$id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>ID_</xsl:text>
        <xsl:apply-templates select="ancestor-or-self::dmodule/identAndStatusSection/dmAddress/dmIdent"/>
        <xsl:if test="$id">
          <xsl:text>_</xsl:text>
          <xsl:value-of select="$id"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="unique.id.attr">
    <xsl:if test="@id">
      <xsl:attribute name="xml:id">
        <xsl:call-template name="unique.id"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="force.unique.id.attr">
    <xsl:attribute name="xml:id">
      <xsl:call-template name="unique.id"/>
    </xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
