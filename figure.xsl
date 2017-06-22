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

  <xsl:template match="graphic">
    <d:mediaobject>
      <d:imageobject>
        <d:imagedata>
          <xsl:apply-templates select="@*"/>
        </d:imagedata>
      </d:imageobject>
    </d:mediaobject>
  </xsl:template>

  <xsl:template match="@infoEntityIdent">
    <xsl:attribute name="fileref">
      <xsl:value-of select="unparsed-entity-uri(.)"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reproductionWidth">
    <xsl:attribute name="width">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@reproductionHeight"/>

  <xsl:template match="@reproductionScale">
    <xsl:attribute name="scale">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
