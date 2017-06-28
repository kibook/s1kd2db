<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <!-- S1000D allows certain elements after <levelledPara>, but DocBook 5
       requires sections to be terminal (can only be followed by other
       sections). -->
  <xsl:template match="table">
    <xsl:choose>
      <xsl:when test="ancestor::levelledPara">   
        <d:table>
          <xsl:call-template name="unique.id.attr"/>
          <xsl:copy-of select="@pgwide|@orient|@frame|@rowsep|@colsep"/>
          <xsl:apply-templates/>
        </d:table>
      </xsl:when>
      <xsl:otherwise>
        <d:simplesect>
          <d:title/>
          <d:table>
            <xsl:call-template name="unique.id.attr"/>
            <xsl:copy-of select="@pgwide|@orient|@frame|@rowsep|@colsep"/>
            <xsl:apply-templates/>
          </d:table>
        </d:simplesect>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="table[not(title)]">
    <d:informaltable>
      <xsl:call-template name="unique.id.attr"/>
      <xsl:copy-of select="@pgwide|@orient|@frame|@rowsep|@colsep"/>
      <xsl:apply-templates/>
    </d:informaltable>
  </xsl:template>

  <xsl:template match="tgroup">
    <d:tgroup>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </d:tgroup>
  </xsl:template>

  <xsl:template match="colspec">
    <d:colspec>
      <xsl:copy-of select="@*"/>
    </d:colspec>
  </xsl:template>

  <xsl:template match="thead">
    <d:thead>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </d:thead>
  </xsl:template>

  <xsl:template match="tbody">
    <d:tbody>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </d:tbody>
  </xsl:template>

  <xsl:template match="row">
    <d:row>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </d:row>
  </xsl:template>

  <xsl:template match="entry">
    <d:entry>
      <xsl:copy-of select="@align"/>
      <xsl:copy-of select="@colsep"/>
      <xsl:apply-templates/>
    </d:entry>
  </xsl:template>

</xsl:stylesheet>
