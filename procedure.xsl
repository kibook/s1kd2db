<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="procedure">
    <xsl:choose>
      <xsl:when test="$use-procedure = 1">
        <task>
          <xsl:apply-templates/>
        </task>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="preliminaryRqmts">
    <bridgehead>Preliminary requirements</bridgehead>
    <xsl:choose>
      <xsl:when test="$use-procedure = 1">
        <taskprerequisites>
          <xsl:apply-templates/>
        </taskprerequisites>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="reqCondGroup">
    <table>
      <title>Required conditions</title>
      <tgroup cols="2">
        <thead>
          <row>
            <entry>
              <para>Action/Condition</para>
            </entry>
            <entry>
              <para>Data module/Technical publication</para>
            </entry>
          </row>
        </thead>
        <tbody>
          <xsl:apply-templates/>
        </tbody>
      </tgroup>
    </table>
  </xsl:template>

  <xsl:template match="noConds">
    <row>
      <entry>
        <para>None</para>
      </entry>
      <entry>
        <para/>
      </entry>
    </row>
  </xsl:template>

  <xsl:template match="reqCondNoRef">
    <row>
      <entry>
        <xsl:apply-templates/>
      </entry>
      <entry>
        <para/>
      </entry>
    </row>
  </xsl:template>

  <xsl:template match="reqCond">
    <para>
      <xsl:apply-templates/>
    </para>
  </xsl:template>

  <xsl:template match="reqSupportEquips|reqSupplies|reqSpares">
    <table>
      <title>
        <xsl:choose>
          <xsl:when test="self::reqSupportEquips">Support equipment</xsl:when>
          <xsl:when test="self::reqSupplies">Consumables, materials, and expendables</xsl:when>
          <xsl:when test="self::reqSpares">Spares</xsl:when>
        </xsl:choose>
      </title>
      <tgroup cols="4">
        <thead>
          <row>
            <entry>
              <para>Name/Alternate name</para>
            </entry>
            <entry>
              <para>Identification/Reference</para>
            </entry>
            <entry>
              <para>Quantity</para>
            </entry>
            <entry>
              <para>Remark</para>
            </entry>
          </row>
        </thead>
        <tbody>
          <xsl:apply-templates/>
        </tbody>
      </tgroup>
    </table>
  </xsl:template>

  <xsl:template match="noSupportEquips|noSupplies|noSpares">
    <row>
      <entry>
        <para>None</para>
      </entry>
      <entry>
        <para/>
      </entry>
      <entry>
        <para/>
      </entry>
      <entry>
        <para/>
      </entry>
    </row>
  </xsl:template>

  <xsl:template match="supportEquipDescr">
    <row>
      <entry>
        <para>
          <xsl:call-template name="unique-id-attr"/>
          <xsl:choose>
            <xsl:when test="name">
              <xsl:apply-templates select="name"/>
            </xsl:when>
            <xsl:when test="shortName">
              <xsl:apply-templates select="shortName"/>
            </xsl:when>
          </xsl:choose>
        </para>
      </entry>
      <entry>
        <para>
          <xsl:apply-templates select="identNumber"/>
        </para>
      </entry>
      <entry>
        <para>
          <xsl:apply-templates select="reqQuantity"/>
        </para>
      </entry>
      <entry>
        <para>
          <xsl:apply-templates select="remark"/>
        </para>
      </entry>
    </row>
  </xsl:template>

  <xsl:template match="mainProcedure">
    <bridgehead>Procedure</bridgehead>
    <xsl:choose>
      <xsl:when test="$use-procedure = 1">
        <procedure>
          <xsl:apply-templates/>
        </procedure>
      </xsl:when>
      <xsl:otherwise>
        <orderedlist>
          <xsl:apply-templates/>
        </orderedlist>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="proceduralStep">
    <xsl:choose>
      <xsl:when test="$use-procedure = 1">
        <step>
          <xsl:apply-templates select="*[not(self::proceduralStep)]"/>
          <xsl:if test="proceduralStep">
            <substeps>
              <xsl:apply-templates select="proceduralStep"/>
            </substeps>
          </xsl:if>
        </step>
      </xsl:when>
      <xsl:otherwise>
        <listitem>
          <xsl:apply-templates select="*[not(self::proceduralStep)]"/>
          <xsl:if test="proceduralStep">
            <orderedlist>
              <xsl:apply-templates select="proceduralStep"/>
            </orderedlist>
          </xsl:if>
        </listitem>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="closeRqmts">
    <bridgehead>Requirements after job completion</bridgehead>
    <xsl:choose>
      <xsl:when test="$use-procedure = 1">
        <taskrelated>
          <xsl:apply-templates/>
        </taskrelated>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
