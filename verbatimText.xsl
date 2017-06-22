<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="verbatimText">
    <d:literal>
      <xsl:apply-templates/>
    </d:literal>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs11']">
    <d:programlisting>
      <xsl:apply-templates/>
    </d:programlisting>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs23']">
    <d:screen>
      <xsl:apply-templates/>
    </d:screen>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs24']">
    <d:programlisting>
      <xsl:apply-templates/>
    </d:programlisting>
  </xsl:template>

</xsl:stylesheet>
