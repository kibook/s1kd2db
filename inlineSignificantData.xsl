<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="inlineSignificantData[@significantParaDataType='psd59']">
    <emphasis role="bold">&lt;<xsl:apply-templates/>&gt;</emphasis>
  </xsl:template>

</xsl:stylesheet>
