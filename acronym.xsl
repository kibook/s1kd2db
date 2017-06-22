<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <!--<xsl:template match="acronym">
    <acronym>
      <xsl:apply-templates/>
    </acronym>
  </xsl:template>

  <xsl:template match="acronymTerm">
    <xsl:choose>
      <xsl:when test="@internalRefId">
        <xsl:variable name="ref" select="@internalRefId"/>
        <acronym>
          <xsl:apply-templates/>
          <xsl:apply-templates select="//acronym[@id = $ref]/acronymDefinition"/>
        </acronym>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="acronymDefinition">
    <alt>
      <xsl:apply-templates/>
    </alt>
  </xsl:template>-->

  <xsl:template match="acronymDefinition"/>

</xsl:stylesheet>
