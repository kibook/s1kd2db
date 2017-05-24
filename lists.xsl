<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="randomList">
    <itemizedlist>
      <xsl:apply-templates/>
    </itemizedlist>
  </xsl:template>

  <xsl:template match="sequentialList">
    <orderedlist>
      <xsl:apply-templates/>
    </orderedlist>
  </xsl:template>

  <xsl:template match="listItem">
    <listitem>
      <xsl:apply-templates/>
    </listitem>
  </xsl:template>

  <xsl:template match="definitionList">
    <variablelist>
      <xsl:apply-templates/>
    </variablelist>
  </xsl:template>

  <xsl:template match="definitionListItem">
    <varlistentry>
      <xsl:apply-templates/>
    </varlistentry>
  </xsl:template>
  
  <xsl:template match="listItemTerm">
    <term>
      <xsl:apply-templates/>
    </term>
  </xsl:template>

  <xsl:template match="listItemDefinition">
    <listitem>
      <xsl:apply-templates/>
    </listitem>
  </xsl:template>

</xsl:stylesheet>
