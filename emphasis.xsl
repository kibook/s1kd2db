<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="emphasis">
    <d:emphasis>
      <xsl:apply-templates/>
    </d:emphasis>
  </xsl:template>

</xsl:stylesheet>
