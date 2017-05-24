<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="commonInfo">
    <bridgehead>Common Info</bridgehead>
    <tasksummary>
      <xsl:apply-templates/>
    </tasksummary>
  </xsl:template>

  <xsl:template match="commonInfoDescrPara">
    <formalpara>
      <xsl:apply-templates/>
    </formalpara>
  </xsl:template>

</xsl:stylesheet>
