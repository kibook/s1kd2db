<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="acronym">
    <xsl:apply-templates select="acronymTerm"/>
    <xsl:if test="$spell.out.acronyms != 0">
      <xsl:apply-templates select="acronymDefinition"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="acronymTerm">
    <acronym>
      <xsl:apply-templates/>
    </acronym>
  </xsl:template>

  <xsl:template match="acronymDefinition">
    <xsl:text> (</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:template>

</xsl:stylesheet>
