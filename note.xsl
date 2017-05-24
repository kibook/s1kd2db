<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="note">
    <note>
      <xsl:apply-templates/>
    </note>
  </xsl:template>

  <xsl:template match="notePara">
    <para>
      <xsl:apply-templates/>
    </para>
  </xsl:template>

</xsl:stylesheet>
