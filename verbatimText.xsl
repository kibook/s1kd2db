<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="verbatimText">
    <literal>
      <xsl:apply-templates/>
    </literal>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs11']">
    <programlisting>
      <xsl:apply-templates/>
    </programlisting>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs23']">
    <screen>
      <xsl:apply-templates/>
    </screen>
  </xsl:template>

  <xsl:template match="verbatimText[@verbatimStyle = 'vs24']">
    <programlisting>
      <xsl:apply-templates/>
    </programlisting>
  </xsl:template>

</xsl:stylesheet>
