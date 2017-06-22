<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:variable name="all.dmodules" select="//dmodule"/>

  <xsl:template name="get.dmcode">
    <xsl:apply-templates select="ancestor-or-self::dmodule/identAndStatusSection/dmAddress/dmIdent/dmCode"/>
  </xsl:template>

  <xsl:template match="pm">
    <xsl:element name="{$pm.is}">
      <xsl:apply-templates select="*"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="pm/identAndStatusSection">
    <xsl:if test="$pm.db.titlereq.info = 0">
      <xsl:apply-templates select="pmAddress/pmAddressItems/pmTitle" mode="idstatus"/>
    </xsl:if>
    <d:info>
      <xsl:if test="$pm.db.titlereq.info != 0">
        <xsl:apply-templates select="pmAddress/pmAddressItems/pmTitle" mode="idstatus"/>
      </xsl:if>
      <xsl:apply-templates select="pmAddress/pmAddressItems/issueDate" mode="idstatus"/>
      <xsl:apply-templates select="pmStatus" mode="idstatus"/>
    </d:info>
  </xsl:template>

  <xsl:template match="pmTitle" mode="idstatus">
    <d:title>
      <xsl:apply-templates select="."/>
    </d:title>
  </xsl:template>

  <xsl:template match="pmEntry">
    <xsl:choose>
      <xsl:when test="$use.pmentry = 0">
        <xsl:apply-templates select="pmEntry|dmRef"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="{$pmentry.is}">
          <xsl:choose>
            <xsl:when test="$pmentry.db.titlereq.info = 0">
              <xsl:apply-templates select="pmEntryTitle"/>
            </xsl:when>
            <xsl:otherwise>
              <d:info>
                <xsl:apply-templates select="pmEntryTitle"/>
              </d:info>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:apply-templates select="pmEntry|dmRef"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="pmEntryTitle">
    <d:title>
      <xsl:apply-templates/>
    </d:title>
  </xsl:template>

  <xsl:template match="pmEntry/dmRef">
    <xsl:variable name="dm.ref.code">
      <xsl:apply-templates select="dmRefIdent/dmCode"/>
    </xsl:variable>
    <xsl:for-each select="$all.dmodules">
      <xsl:variable name="dm.code">
        <xsl:call-template name="get.dmcode"/>
      </xsl:variable>
      <xsl:if test="$dm.ref.code = $dm.code">
        <xsl:apply-templates select="."/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="publication">
    <xsl:apply-templates select="pm"/>
  </xsl:template>

</xsl:stylesheet>
