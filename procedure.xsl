<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <xsl:template match="procedure">
    <d:task>
      <xsl:apply-templates/>
    </d:task>
  </xsl:template>

  <xsl:template match="preliminaryRqmts">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <d:bridgehead>Preliminary requirements</d:bridgehead>
        <d:taskprerequisites>
          <xsl:apply-templates/>
        </d:taskprerequisites>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Preliminary requirements</d:title>
          <d:taskprerequisites>
            <xsl:apply-templates/>
          </d:taskprerequisites>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="reqCondGroup">
    <d:table>
      <d:title>Required conditions</d:title>
      <d:tgroup cols="2">
        <d:thead>
          <d:row>
            <d:entry>
              <d:para>Action/Condition</d:para>
            </d:entry>
            <d:entry>
              <d:para>Data module/Technical publication</d:para>
            </d:entry>
          </d:row>
        </d:thead>
        <d:tbody>
          <xsl:apply-templates/>
        </d:tbody>
      </d:tgroup>
    </d:table>
  </xsl:template>

  <xsl:template match="noConds">
    <d:row>
      <d:entry>
        <d:para>None</d:para>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="reqCondNoRef">
    <d:row>
      <d:entry>
        <xsl:apply-templates/>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="reqCond">
    <d:para>
      <xsl:apply-templates/>
    </d:para>
  </xsl:template>

  <xsl:template match="reqSupportEquips|reqSupplies|reqSpares">
    <xsl:variable name="title">
      <xsl:choose>
        <xsl:when test="self::reqSupportEquips">Support equipment</xsl:when>
        <xsl:when test="self::reqSupplies">Consumables, materials, and expendables</xsl:when>
        <xsl:when test="self::reqSpares">Spares</xsl:when>
      </xsl:choose>
    </xsl:variable>
    <d:bridgehead>
      <xsl:value-of select="$title"/>
    </d:bridgehead>
    <d:table>
      <d:title>
        <xsl:value-of select="$title"/>
      </d:title>
      <d:tgroup cols="4">
        <d:thead>
          <d:row>
            <d:entry>
              <d:para>Name/Alternate name</d:para>
            </d:entry>
            <d:entry>
              <d:para>Identification/Reference</d:para>
            </d:entry>
            <d:entry>
              <d:para>Quantity</d:para>
            </d:entry>
            <d:entry>
              <d:para>Remark</d:para>
            </d:entry>
          </d:row>
        </d:thead>
        <d:tbody>
          <xsl:apply-templates/>
        </d:tbody>
      </d:tgroup>
    </d:table>
  </xsl:template>

  <xsl:template match="noSupportEquips|noSupplies|noSpares">
    <d:row>
      <d:entry>
        <d:para>None</d:para>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
      <d:entry>
        <d:para/>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="supportEquipDescr">
    <d:row>
      <d:entry>
        <d:para>
          <xsl:call-template name="unique.id.attr"/>
          <xsl:choose>
            <xsl:when test="name">
              <xsl:apply-templates select="name"/>
            </xsl:when>
            <xsl:when test="shortName">
              <xsl:apply-templates select="shortName"/>
            </xsl:when>
          </xsl:choose>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="identNumber"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="reqQuantity"/>
        </d:para>
      </d:entry>
      <d:entry>
        <d:para>
          <xsl:apply-templates select="remark"/>
        </d:para>
      </d:entry>
    </d:row>
  </xsl:template>

  <xsl:template match="mainProcedure">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <d:bridgehead>Procedure</d:bridgehead>
        <xsl:call-template name="main.procedure"/>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Procedure</d:title>
          <xsl:call-template name="main.procedure"/>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="main.procedure">
    <xsl:choose>
      <xsl:when test="$use.procedure = 1">
        <d:procedure>
          <xsl:apply-templates/>
        </d:procedure>
      </xsl:when>
      <xsl:otherwise>
        <d:orderedlist>
          <xsl:apply-templates/>
        </d:orderedlist>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="proceduralStep">
    <xsl:choose>
      <xsl:when test="$use.procedure = 1">
        <d:step>
          <xsl:apply-templates select="*[not(self::proceduralStep)]"/>
          <xsl:if test="proceduralStep">
            <d:substeps>
              <xsl:apply-templates select="proceduralStep"/>
            </d:substeps>
          </xsl:if>
        </d:step>
      </xsl:when>
      <xsl:otherwise>
        <d:listitem>
          <xsl:apply-templates select="*[not(self::proceduralStep)]"/>
          <xsl:if test="proceduralStep">
            <d:orderedlist>
              <xsl:apply-templates select="proceduralStep"/>
            </d:orderedlist>
          </xsl:if>
        </d:listitem>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="closeRqmts">
    <xsl:choose>
      <xsl:when test="$extra.sections = 0">
        <d:bridgehead>Requirements after job completion</d:bridgehead>
        <xsl:apply-templates select="*"/>
      </xsl:when>
      <xsl:otherwise>
        <d:section>
          <d:title>Requirements after job completion</d:title>
          <d:taskrelated>
            <xsl:apply-templates select="*"/>
          </d:taskrelated>
        </d:section>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
