<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="figure">
    <d:figure>
      <xsl:apply-templates/>
    </d:figure>
  </xsl:template>

  <xsl:template name="image.object">
    <d:imageobject>
      <d:imagedata fileref="{unparsed-entity-uri(@infoEntityIdent)}">
        <xsl:if test="@reproductionWidth">
          <xsl:attribute name="width">
            <xsl:value-of select="@reproductionWidth"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@reproductionScale">
          <xsl:attribute name="scale">
            <xsl:value-of select="@reproductionScale"/>
          </xsl:attribute>
        </xsl:if>
      </d:imagedata>
    </d:imageobject>
  </xsl:template>

  <xsl:template match="graphic">
    <d:mediaobject>
      <xsl:call-template name="image.object"/>
    </d:mediaobject>
  </xsl:template>

  <xsl:template match="symbol">
    <d:inlinemediaobject>
      <xsl:call-template name="image.object"/>
    </d:inlinemediaobject>
  </xsl:template>

</xsl:stylesheet>
