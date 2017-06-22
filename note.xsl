<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="note">
    <d:note>
      <xsl:apply-templates/>
    </d:note>
  </xsl:template>

  <xsl:template match="notePara">
    <d:para>
      <xsl:apply-templates/>
    </d:para>
  </xsl:template>

</xsl:stylesheet>
