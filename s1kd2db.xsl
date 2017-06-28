<?xml version="1.0"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  version="1.0">

  <!-- Make dmTitle/techName the title and dmTitle/infoName the subtitle,
       instead of using them together in the form of "techName - infoName" -->
  <xsl:param name="info.name.is.subtitle">0</xsl:param>

  <!-- Use docbook task/procedure elements. The alternative representation will
       use orderedlists for steps -->
  <xsl:param name="use.procedure">1</xsl:param>

  <!-- Include individual data module info section.

       Added mainly for pandoc, which seems to use the LAST set of info
       elements for the output documents main info rather than the info
       element on the top-level element. Setting this to 0 will only
       include the info (author, date) from the publication module. -->
  <xsl:param name="include.dmodule.info">1</xsl:param>

  <!-- Control whether each element uses db.titlereq.info (1) or
       db.titleforbidden.info (0) format.

       Added mainly for pandoc which seems to select the LAST title in an info
       element at any level as the title for the output document, rather than
       the top-level one. Setting this to 0 for pmentry and dmodule provides
       a workaround. -->
  <xsl:param name="pm.db.titlereq.info">1</xsl:param>
  <xsl:param name="pmentry.db.titlereq.info">1</xsl:param>
  <xsl:param name="dmodule.db.titlereq.info">1</xsl:param>

  <!-- Create sections for certain elements instead of using bridgehead. -->
  <xsl:param name="extra.sections">0</xsl:param>

  <!-- Map S1000D publication structures to DocBook ones -->
  <xsl:param name="pm.is">d:book</xsl:param>
  <xsl:param name="pmentry.is">d:part</xsl:param>
  <!-- <part> element cannot be nested, so if you have sub-pmEntry elements,
       you'll need to set these parameters differently. -->
  <xsl:param name="sub.pmentry.is"/>
  <xsl:param name="dmodule.is">d:article</xsl:param>

  <!-- Use pmEntry as another subdivision. When set to 0, all data modules are
       displayed on the same level. If there is only one pmEntry this may be
       used to avoid having an extra level. -->
  <xsl:param name="use.pmentry">1</xsl:param>

  <!-- How to generate link text.

       s1000d   Generate S1000D link text (Fig 1, Table 1, Para 1, etc.).

       title    Use the target element's <title> as the link text. If the
                target has no title, S1000D link text is used instead.
  -->
  <xsl:param name="link.text">title</xsl:param>

  <!-- Detect if a referenced data module is included in a publication. If it
       is not, don't present the dmRef as a (broken) link. Slow for large
       publications. -->
  <xsl:param name="smart.dmref">0</xsl:param>

  <!-- Include the References table. -->
  <xsl:param name="include.refs">0</xsl:param>

  <!-- Generate unique (for the whole publication) IDs for elements in data
       modules with IDs. The ID is prefixed by the data module identifier. -->
  <xsl:param name="use.unique.id">1</xsl:param>

  <xsl:include href="includes.xsl"/>

  <xsl:output method="xml"/>

</xsl:stylesheet>
