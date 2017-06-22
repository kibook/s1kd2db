<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template name="get.dmodule.id">
    <xsl:param name="dm.ref.code"/>
    <xsl:for-each select="$all.dmodules">
      <xsl:variable name="dm.code">
        <xsl:call-template name="get.dmcode"/>
      </xsl:variable>
      <xsl:if test="$dm.ref.code = $dm.code">
        <xsl:call-template name="unique.id"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="get.dmodule.title">
    <xsl:param name="dm.ref.code"/>
    <xsl:for-each select="$all.dmodules">
      <xsl:variable name="dm.code">
        <xsl:call-template name="get.dmcode"/>
      </xsl:variable>
      <xsl:if test="$dm.ref.code = $dm.code">
        <xsl:apply-templates select="identAndStatusSection/dmAddress/dmAddressItems/dmTitle"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="dmRef">
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
            <xsl:when test="$link.text = 'title'">
              <xsl:call-template name="get.dmodule.title">
                <xsl:with-param name="dm.ref.code" select="$dm.ref.code"/>
              </xsl:call-template>
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
