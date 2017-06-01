<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:template match="identAndStatusSection">
    <info>
      <title>
        <xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle"/>
      </title>
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
