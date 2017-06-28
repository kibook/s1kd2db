<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="refs"/>

  <xsl:template name="refs">
    <xsl:param name="refs"/>
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <d:bridgehead>References</d:bridgehead>
        <xsl:call-template name="refs.table">
          <xsl:with-param name="refs" select="$refs"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>References</d:title>
          <xsl:call-template name="refs.table">
            <xsl:with-param name="refs" select="$refs"/>
          </xsl:call-template>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="refs.table">
    <xsl:param name="refs"/>
    <d:table>
      <d:title>References</d:title>
      <d:tgroup cols="2">
        <d:thead>
          <d:row>
            <d:entry>Data module/Technical publication</d:entry>
            <d:entry>Title</d:entry>
          </d:row>
        </d:thead>
        <d:tbody>
          <xsl:if test="not($refs)">
            <d:row>
              <d:entry>None</d:entry>
              <d:entry/>
            </d:row>
          </xsl:if>
          <xsl:apply-templates select="$refs/*" mode="refs"/>
        </d:tbody>
      </d:tgroup>
    </d:table>
  </xsl:template>

  <xsl:template match="dmRef" mode="refs">
    <d:row>
      <d:entry>
        <xsl:apply-templates select=".">
          <xsl:with-param name="dmref.link.text">s1000d</xsl:with-param>
        </xsl:apply-templates>
      </d:entry>
      <d:entry>
        <xsl:apply-templates select="dmRefAddressItems/dmTitle"/>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="pmRef" mode="refs"/>

  <xsl:template match="externalPubRef" mode="refs"/>

</xsl:stylesheet>
