<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="commonInfo">
    <d:section>
      <d:title>Common information</d:title>
      <d:tasksummary>
        <xsl:apply-templates/>
      </d:tasksummary>
    </d:section>
  </xsl:template>

  <xsl:template match="commonInfoDescrPara">
    <d:formalpara>
      <xsl:apply-templates/>
    </d:formalpara>
  </xsl:template>

</xsl:stylesheet>
