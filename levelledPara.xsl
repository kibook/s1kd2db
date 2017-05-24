<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="levelledPara">
    <section>
      <xsl:call-template name="unique-id-attr"/>
      <xsl:apply-templates/>
    </section>
  </xsl:template>

</xsl:stylesheet>
