<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="levelledPara">
    <d:section>
      <xsl:call-template name="unique.id.attr"/>
      <xsl:apply-templates/>
    </d:section>
  </xsl:template>

</xsl:stylesheet>
