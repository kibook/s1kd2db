<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="acronym">
    <xsl:choose>
      <xsl:when test="$spell.out.acronyms = 0">
        <xsl:apply-templates select="acronymTerm"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$acronym.term.first = 0">
            <xsl:apply-templates select="acronymDefinition"/>
            <xsl:text> (</xsl:text>
            <xsl:apply-templates select="acronymTerm"/>
            <xsl:text>)</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="acronymTerm"/>
            <xsl:text> (</xsl:text>
            <xsl:apply-templates select="acronymDefinition"/>
            <xsl:text>)</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="acronymTerm">
    <acronym>
      <xsl:apply-templates/>
    </acronym>
  </xsl:template>

  <xsl:template match="acronymDefinition">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
