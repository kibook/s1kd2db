<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="internalRef">
    <xsl:variable name="target-id" select="@internalRefId"/>
    <xsl:variable name="target" select="//*[@id = $target-id]"/>
    <xsl:variable name="target-type" select="@internalRefTargetType"/>
    <link>
      <xsl:attribute name="linkend">
        <xsl:call-template name="unique-id">
          <xsl:with-param name="id" select="$target-id"/>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="@internalRefTargetType">   
          <xsl:call-template name="target-title-by-type"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="target-title-by-element">
            <xsl:with-param name="element" select="$target"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text> </xsl:text>
      <xsl:for-each select="$target">
        <xsl:number level="multiple" from="dmodule"/>
      </xsl:for-each>
    </link>
  </xsl:template>

  <xsl:template name="target-title-by-type">
    <xsl:choose>
      <xsl:when test="@internalRefTargetType = 'irtt01'">Fig</xsl:when>
      <xsl:when test="@internalRefTargetType = 'irtt02'">Table</xsl:when>
      <xsl:when test="@internalRefTargetType = 'irtt07'">Para</xsl:when>
      <xsl:when test="@internalRefTargetType = 'irtt08'">Step</xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="target-title-by-element">
    <xsl:param name="element"/>
    <xsl:choose>
      <xsl:when test="name($element) = 'figure'">Fig</xsl:when>
      <xsl:when test="name($element) = 'table'">Table</xsl:when>
      <xsl:when test="name($element) = 'levelledPara'">Para</xsl:when>
      <xsl:when test="name($element) = 'proceduralStep'">Step</xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
