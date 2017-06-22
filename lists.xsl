<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="randomList">
    <d:itemizedlist>
      <xsl:apply-templates/>
    </d:itemizedlist>
  </xsl:template>

  <xsl:template match="sequentialList">
    <d:orderedlist>
      <xsl:apply-templates/>
    </d:orderedlist>
  </xsl:template>

  <xsl:template match="listItem">
    <d:listitem>
      <xsl:apply-templates/>
    </d:listitem>
  </xsl:template>

  <xsl:template match="definitionList">
    <d:variablelist>
      <xsl:apply-templates/>
    </d:variablelist>
  </xsl:template>

  <xsl:template match="definitionListItem">
    <d:varlistentry>
      <xsl:apply-templates/>
    </d:varlistentry>
  </xsl:template>
  
  <xsl:template match="listItemTerm">
    <d:term>
      <xsl:apply-templates/>
    </d:term>
  </xsl:template>

  <xsl:template match="listItemDefinition">
    <d:listitem>
      <xsl:apply-templates/>
    </d:listitem>
  </xsl:template>

</xsl:stylesheet>
