<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="emphasis">
    <d:emphasis>
      <xsl:if test="$include.emphasis.role != 0">
        <xsl:attribute name="role">
          <xsl:choose>
            <xsl:when test="@emphasisType = 'em02'">italic</xsl:when>
            <xsl:when test="@emphasisType = 'em03'">underline</xsl:when>
            <xsl:when test="@emphasisType = 'em04'">overline</xsl:when>
            <xsl:when test="@emphasisType = 'em05'">strikethrough</xsl:when>
            <xsl:otherwise>bold</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </d:emphasis>
  </xsl:template>

</xsl:stylesheet>
