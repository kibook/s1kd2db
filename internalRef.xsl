<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="internalRef">
    <xsl:variable name="target.id" select="@internalRefId"/>
    <xsl:variable name="target" select="//*[@id = $target.id]"/>
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
          <xsl:call-template name="target.text">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="target.type" select="$target.type"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </d:link>
  </xsl:template>

  <xsl:template name="target.text">
    <xsl:param name="target"/>
    <xsl:param name="target.type"/>
    <xsl:choose>
      <xsl:when test="$target/shortName">
        <xsl:apply-templates select="$target/shortName"/>
      </xsl:when>
      <xsl:when test="$target/name">
        <xsl:apply-templates select="$target/name"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="type">
          <xsl:choose>
            <xsl:when test="$target.type">
              <xsl:call-template name="target.title.by.type">
                <xsl:with-param name="target.type" select="$target.type"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="target.title.by.element">
                <xsl:with-param name="element" select="$target"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$type"/>
        <xsl:text> </xsl:text>
        <xsl:call-template name="target.number">
          <xsl:with-param name="type" select="$type"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="target.title.by.type">
    <xsl:param name="target.type"/>
    <xsl:choose>
      <xsl:when test="$target.type = 'irtt01'">Fig</xsl:when>
      <xsl:when test="$target.type = 'irtt02'">Table</xsl:when>
      <xsl:when test="$target.type = 'irtt07'">Para</xsl:when>
      <xsl:when test="$target.type = 'irtt08'">Step</xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="target.title.by.element">
    <xsl:param name="element"/>
    <xsl:choose>
      <xsl:when test="name($element) = 'figure'">Fig</xsl:when>
      <xsl:when test="name($element) = 'table'">Table</xsl:when>
      <xsl:when test="name($element) = 'levelledPara'">Para</xsl:when>
      <xsl:when test="name($element) = 'proceduralStep'">Step</xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="target.number">
    <xsl:param name="type"/>
    <xsl:choose>
      <xsl:when test="$type = 'Fig' or $type = 'Table'">
        <xsl:number level="any" from="dmodule"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:number level="multiple" from="dmodule"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
