<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="commonInfo">
    <section>
      <title>Common information</title>
      <tasksummary>
        <xsl:apply-templates/>
      </tasksummary>
    </section>
  </xsl:template>

  <xsl:template match="commonInfoDescrPara">
    <formalpara>
      <xsl:apply-templates/>
    </formalpara>
  </xsl:template>

</xsl:stylesheet>
