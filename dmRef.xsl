<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template name="get.dmodule.id">
    <xsl:param name="dm.ref.code"/>
    <xsl:choose>
      <xsl:when test="$smart.dmref = 0">
        <xsl:text>ID_</xsl:text>
        <xsl:value-of select="$dm.ref.code"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="$all.dmodules">
          <xsl:variable name="dm.code">
            <xsl:call-template name="get.dmcode"/>
          </xsl:variable>
          <xsl:if test="$dm.ref.code = $dm.code">
            <xsl:call-template name="unique.id"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="dmRef">
    <xsl:param name="dmref.link.text" select="$link.text"/>
    <xsl:variable name="dm.ref.code">
      <xsl:apply-templates select="dmRefIdent/dmCode"/>
    </xsl:variable>
    <xsl:variable name="id">
      <xsl:call-template name="get.dmodule.id">
        <xsl:with-param name="dm.ref.code" select="$dm.ref.code"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$id">
        <d:link linkend="{$id}">
          <xsl:choose>
            <xsl:when test="$dmref.link.text = 'title' and dmRefAddressItems/dmTitle">
              <xsl:apply-templates select="dmRefAddressItems/dmTitle"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="dmRefIdent"/>
            </xsl:otherwise>
          </xsl:choose>
        </d:link>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="dmRefIdent"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="dmRefIdent">
    <xsl:apply-templates select="dmCode"/>
  </xsl:template>

</xsl:stylesheet>
