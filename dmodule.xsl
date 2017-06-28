<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="dmodule">
    <xsl:element name="{$dmodule.is}">
      <xsl:call-template name="force.unique.id.attr"/>
      <xsl:apply-templates select="*"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dmodule/content">
    <xsl:if test="$include.refs != 0">
      <xsl:call-template name="refs">
        <xsl:with-param name="refs" select="refs"/>
      </xsl:call-template>
    </xsl:if>
    <xsl:apply-templates select="*"/>
  </xsl:template>

</xsl:stylesheet>
