<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="internalRef">
    <xsl:variable name="target.id" select="@internalRefId"/>
    <xsl:variable name="target" select="ancestor::dmodule//*[@id = $target.id]"/>
    <xsl:variable name="target.type" select="@internalRefTargetType"/>
    <xsl:variable name="target.uid">
      <xsl:call-template name="unique.id">
        <xsl:with-param name="id" select="$target.id"/>
      </xsl:call-template>
    </xsl:variable>
    <d:link>
      <xsl:attribute name="linkend">
        <xsl:value-of select="$target.uid"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$link.text = 'title' and $target/title">
          <xsl:apply-templates select="$target/title/node()"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="$target" mode="internal-ref"/>
        </xsl:otherwise>
      </xsl:choose>
    </d:link>
  </xsl:template>

  <xsl:template match="table" mode="prefix">
    <xsl:text>Table</xsl:text>
  </xsl:template>

  <xsl:template match="table" mode="number">
    <xsl:number level="any" from="dmodule"/>
  </xsl:template>

  <xsl:template match="figure" mode="prefix">
    <xsl:text>Fig</xsl:text>
  </xsl:template>
  
  <xsl:template match="figure" mode="number">
    <xsl:number level="any" from="dmodule"/>
  </xsl:template>

  <xsl:template match="proceduralStep" mode="prefix">
    <xsl:text>Step</xsl:text>
  </xsl:template>

  <xsl:template match="proceduralStep" mode="number">
    <xsl:number level="multiple" from="dmodule"/>
  </xsl:template>

  <xsl:template match="levelledPara" mode="prefix">
    <xsl:text>Para</xsl:text>
  </xsl:template>

  <xsl:template match="levelledPara" mode="number">
    <xsl:number level="multiple" from="dmodule"/>
  </xsl:template>

  <xsl:template match="*" mode="internal-ref">
    <xsl:apply-templates select="." mode="prefix"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="." mode="number"/>
  </xsl:template>

  <xsl:template match="supportEquipDescr|supplyDescr|spareDescr" mode="internal-ref">
    <xsl:apply-templates select="(shortName|name)[1]"/>
  </xsl:template>

</xsl:stylesheet>
