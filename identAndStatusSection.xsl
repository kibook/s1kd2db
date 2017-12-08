<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="identAndStatusSection">
    <xsl:if test="$include.dmodule.info = 0 or $dmodule.db.titlereq.info = 0">
      <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle" mode="idstatus"/>
    </xsl:if>
    <xsl:if test="$include.dmodule.info != 0">
      <d:info>
        <xsl:apply-templates select="dmAddress/dmIdent" mode="idstatus"/>
        <xsl:if test="$dmodule.db.titlereq.info != 0">
          <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle" mode="idstatus"/>
        </xsl:if>
        <xsl:if test="$include.date != 0">
          <xsl:apply-templates select="dmAddress/dmAddressItems/issueDate" mode="idstatus"/>
        </xsl:if>
        <xsl:apply-templates select="dmStatus" mode="idstatus"/>
      </d:info>
    </xsl:if>
  </xsl:template>

  <xsl:template match="*" mode="idstatus">
    <xsl:apply-templates select="*" mode="idstatus"/>
  </xsl:template>

  <xsl:template match="dmTitle" mode="idstatus">
    <xsl:choose>
      <xsl:when test="$info.name.is.subtitle = 0">
        <d:title>
          <xsl:apply-templates select="."/>
        </d:title>
      </xsl:when>
      <xsl:otherwise>
        <d:title>
          <xsl:apply-templates select="techName"/>
        </d:title>
        <d:subtitle>
          <xsl:apply-templates select="infoName"/>
        </d:subtitle>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="issueDate" mode="idstatus">
    <d:date>
      <xsl:apply-templates select="."/>
    </d:date>
  </xsl:template>

  <xsl:template match="originator" mode="idstatus">
    <d:author>
      <xsl:apply-templates select="."/>
    </d:author>
  </xsl:template>

  <xsl:template match="responsiblePartnerCompany" mode="idstatus">
    <xsl:if test="$include.publisher != 0">
      <d:publisher>
        <xsl:apply-templates select="*" mode="idstatus"/>
      </d:publisher>
    </xsl:if>
  </xsl:template>

  <xsl:template match="responsiblePartnerCompany/enterpriseName" mode="idstatus">
    <d:publishername>
      <xsl:apply-templates select="."/>
    </d:publishername>
  </xsl:template>

  <xsl:template match="originator" mode="idstatus">
    <xsl:if test="$include.author != 0">
      <d:author>
        <xsl:apply-templates select="*" mode="idstatus"/>
      </d:author>
    </xsl:if>
  </xsl:template>

  <xsl:template match="originator/enterpriseName" mode="idstatus">
    <d:orgname>
      <xsl:apply-templates select="."/>
    </d:orgname>
  </xsl:template>

  <xsl:template match="brexDmRef" mode="idstatus"/>

  <xsl:template match="dmIdent" mode="idstatus">
    <xsl:if test="$include.dmc != 0">
      <xsl:apply-templates select="dmCode" mode="idstatus"/>
    </xsl:if>
    <xsl:if test="$include.issue.info != 0">
      <xsl:apply-templates select="issueInfo" mode="idstatus"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="dmCode" mode="idstatus">
    <d:biblioid class="other" otherclass="S1000D">
      <xsl:apply-templates select="."/>
    </d:biblioid>
  </xsl:template>

  <xsl:template match="issueInfo" mode="idstatus">
    <d:issuenum>
      <xsl:apply-templates select="."/>
    </d:issuenum>
  </xsl:template>

  <xsl:template match="applic" mode="idstatus"/>

</xsl:stylesheet>
