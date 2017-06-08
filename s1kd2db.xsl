<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Make dmTitle/techName the title and dmTitle/infoName the subtitle,
       instead of using them together in the form of "techName - infoName" -->
  <xsl:param name="info-name-is-subtitle">0</xsl:param>

  <!-- Use docbook task/procedure elements. The alternative representation will
       use orderedlists for steps -->
  <xsl:param name="use-procedure">1</xsl:param>

  <xsl:param name="procedure-sections">1</xsl:param>

  <xsl:include href="includes.xsl"/>

  <xsl:output method="xml"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
