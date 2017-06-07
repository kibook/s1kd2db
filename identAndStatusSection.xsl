<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:template match="identAndStatusSection">
    <info>
      <xsl:choose>
        <xsl:when test="$info-name-is-subtitle = 0">
          <title>
            <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle"/>
          </title>
        </xsl:when>
        <xsl:otherwise>
          <title>
            <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle/techName"/>
          </title>
          <subtitle>
            <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle/infoName"/>
          </subtitle>
        </xsl:otherwise>
      </xsl:choose>
      <date>
        <xsl:apply-templates select="dmAddress/dmAddressItems/issueDate"/>
      </date>
      <author>
        <xsl:apply-templates select="dmStatus/originator"/>
      </author>
      <publisher>
        <xsl:apply-templates select="dmStatus/responsiblePartnerCompany"/>
      </publisher>
    </info>
  </xsl:template>

</xsl:stylesheet>
