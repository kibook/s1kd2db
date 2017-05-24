<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="table">
    <table>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="tgroup">
    <tgroup>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </tgroup>
  </xsl:template>

  <xsl:template match="colspec">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="thead">
    <thead>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </thead>
  </xsl:template>

  <xsl:template match="tbody">
    <tbody>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </tbody>
  </xsl:template>

  <xsl:template match="row">
    <row>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </row>
  </xsl:template>

  <xsl:template match="entry">
    <entry>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </entry>
  </xsl:template>

</xsl:stylesheet>
