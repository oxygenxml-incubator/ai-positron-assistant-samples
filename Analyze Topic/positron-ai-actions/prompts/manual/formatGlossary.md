Your will generate a DITA glossary entry from all the content of given document that contains glossary information but is encoded in a different format or it is provided as plain text or Markdown. 
If the content contains consistent information about multiple glossary entries then split the initial content to reflect the content for each glossaey entry and then generate multiple glossary entries inside a glossary group (glossgroup) document.

Start the response with the XML declaration and the glossentry or glossgroup DOCTYPE declaration:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE glossentry PUBLIC "-//OASIS//DTD DITA Glossary Entry//EN" "glossaryentry.dtd">
```
or 
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE glossgroup PUBLIC "-//OASIS//DTD DITA Glossary Group//EN" "glossgroup.dtd">
```

Generate id attribute for the glossgroup or glossentry root element and for additional glossentry if any.
Preserve metadata information such as: altenative titles, navtitles, prolog information.
Preserve profiling information defined by profiling attributes such as product, audience, platform, deliveryTarget, props, otherprops.
Include content references, elements that contain conref or conkeyref or keyref attributes, you may use the resolve_dita_key_or_content_reference function if you want to find the actual content they exand to.

Below you find information about DITA glossary entry and glossary group.

Information about DITA glossentry and glossgroup
========================

  The <glossentry> element defines a single sense of a glossary term. Glossary entries for different term senses can be reused independently of one another.

  The <glossterm> element specifies the preferred term that is associated with a definition of a sense. If the same term has multiple senses, create a separate <glossentry> topic for each sense.

    The <glossdef> element specifies the definition of one sense of a term. If a term has multiple senses, create a separate <glossentry> topic to define each sense.

    The <glossAbbreviation> element provides an abbreviated form of the term that is contained in a <glossterm> element.

    The <glossAcronym> element defines an acronym for the term that is defined in the <glossterm> element.

    The <glossAlt> element contains a variant term for the preferred term. The variant should have the same meaning as the term in the <glossterm> element; the variant is simply another way to refer to the same term. There might be many ways to refer to a term; each variant is placed in its own <glossAlt> element. The <glossUsage> element can be used within <glossAlt> to indicate when use of the alternate term is appropriate.

    The <glossAlternateFor> element indicates when a variant term has a relationship to another variant term in addition to the preferred term.

    The <glossBody> element is used to provide details about a glossary term (such as part of speech or additional forms of the term).

    The <glossPartOfSpeech> element identifies the part of speech for the preferred and alternate terms. Alternate terms must have the same part of speech as the preferred term, because all terms in the <glossentry> topic designate the same subject.

    The <glossProperty> element is a specialization of the <data> element. You can use it to specify additional details about the preferred term or its subject, for example, the gender of a noun.

    The <glossScopeNote> element contains a clarification of the subject that is designated by the <glossterm>, such as examples of included or excluded companies or products. For instance, a scope note for "Linux" might explain that the term doe not apply to UNIX products; it might give examples of Linux products that are included as well as UNIX products that are excluded.

    The <glossShortForm> element provides a shorter alternative to the primary term that is specified in the <glossterm> element.

    The <glossStatus> element identifies the usage status of a preferred or alternate term. If the status isn't specified, the <glossterm> provides a preferred term and an alternate term provides an allowed term.

    The <glossSurfaceForm> element specifies an unambiguous presentation of the <glossterm> that might combine multiple forms. The surface form is suitable to introduce the term in new contexts.

    The <glossSymbol> element identifies a standard image that is associated with the subject of the <glossterm> element.

    The <glossSynonym> element provides a term that is a synonym of the primary value in the <glossterm> element.

    The <glossUsage> element provides information about the correct use of a term, such as where or how it can be used.

    The <abbreviated-form> element represents a reference to a term that might appear in an abbreviated form (often an acronym). The long and short forms of the term are generally defined in a <glossentry> topic. Processors display the referenced term when rendering an <abbreviated-form> element.

    The <glossref> element is a convenience element in maps for creating a reference to a glossary topic. It has a required @keys attribute, which forces the author to create a key by which inline terms can reference their definition. For example, when <glossentry> topics are used to define acronyms, this reminds authors to create a key which <abbreviated-form> elements can use to reference the short and expanded versions of that acronym.

   The <glossgroup> is a specialized topic that can contain multiple <glossentry> topics within a single document.

Tips
=======
* Do not loose content references (elements with conref, keyref or conkeyref attribute) such as <note conref="…"/>.
* Do not replace content references (elements with conref, keyref or conkeyref attribute) with the expanded content.
* The <codeph> element represents a snippet of code within the main flow of text.
* Make sure you close an element with the same tag name as its start tag.


Content model information 
====================

In the models below "?" means optional, "," delimits sequence items, "*" means zero or more, "|" represents choice and "(" and ")" are used for grouping. Always make sure that these content models are respected when you generate content.

<glossgroup> contains:
<title>, <prolog>?, (<glossentry> | <glossgroup>)*

<glossentry> contains:
<glossterm>, <glossdef>?, <prolog>?, <glossBody>?, <related-links>?

<glossBody> contains:
<glossPartOfSpeech>?, <glossStatus>?, <glossProperty>*, <glossSurfaceForm>?, <glossUsage>?, <glossScopeNote>?, <glossSymbol>*, (<hazardstatement> | <note>)*, <glossAlt>*

<glossAlt> contains:
(<glossAbbreviation> | <glossAcronym> | <glossShortForm> | <glossSynonym>)?, <glossStatus>?, <glossProperty>*, <glossUsage>?, (<hazardstatement> | <note>)*, <glossAlternateFor>*

<glossterm> contains:
(text data | <abbreviated-form> | <apiname> | <b> | <boolean> | <cite> | <cmdname> | <codeph> | <data> | <data-about> | <draft-comment> | <equation-inline> | <filepath> | <foreign> | <i> | <image> | <keyword> | <line-through> | <markupname> | <mathml> | <menucascade> | <msgnum> | <msgph> | <numcharref> | <option> | <overline> | <parameterentity> | <parmname> | <ph> | <q> | <required-cleanup> | <sort-as> | <state> | <sub> | <sup> | <svg-container> | <synph> | <systemoutput> | <term> | <text> | <textentity> | <tm> | <tt> | <u> | <uicontrol> | <unknown> | <userinput> | <varname> | <wintitle> | <xmlatt> | <xmlelement> | <xmlnsname> | <xmlpi>)*

<glossdef> or <glossUsage> or <glossScopeNote> contain:
(text data | <abbreviated-form> | <apiname> | <b> | <boolean> | <cite> | <cmdname> | <codeblock> | <codeph> | <data> | <data-about> | <div> | <dl> | <draft-comment> | <equation-block> | <equation-figure> | <equation-inline> | <fig> | <filepath> | <fn> | <foreign> | <hazardstatement> | <i> | <image> | <imagemap> | <indexterm> | <indextermref> | <keyword> | <line-through> | <lines> | <lq> | <markupname> | <mathml> | <menucascade> | <msgblock> | <msgnum> | <msgph> | <note> | <numcharref> | <object> | <ol> | <option> | <overline> | <p> | <parameterentity> | <parml> | <parmname> | <ph> | <pre> | <q> | <required-cleanup> | <screen> | <shortdesc> | <simpletable> | <sl> | <sort-as> | <state> | <sub> | <sup> | <svg-container> | <synph> | <syntaxdiagram> | <systemoutput> | <table> | <term> | <text> | <textentity> | <tm> | <tt> | <u> | <uicontrol> | <ul> | <unknown> | <userinput> | <varname> | <wintitle> | <xmlatt> | <xmlelement> | <xmlnsname> | <xmlpi> | <xref>)*

<glossProperty> contains:
(text data | <abbreviated-form> | <apiname> | <b> | <boolean> | <cite> | <cmdname> | <codeph> | <data> | <data-about> | <draft-comment> | <equation-inline> | <filepath> | <foreign> | <i> | <image> | <keyword> | <line-through> | <markupname> | <mathml> | <menucascade> | <msgnum> | <msgph> | <numcharref> | <object> | <option> | <overline> | <parameterentity> | <parmname> | <ph> | <q> | <required-cleanup> | <sort-as> | <state> | <sub> | <sup> | <svg-container> | <synph> | <systemoutput> | <term> | <text> | <textentity> | <title> | <tm> | <tt> | <u> | <uicontrol> | <unknown> | <userinput> | <varname> | <wintitle> | <xmlatt> | <xmlelement> | <xmlnsname> | <xmlpi> | <xref>)*

<glossSurfaceForm> or <glossAbbreviation> or <glossAcronym> or <glossShortForm>  or <glossSynonym>  contain:
(text data | <abbreviated-form> | <apiname> | <cmdname> | <keyword> | <markupname> | <msgnum> | <numcharref> | <option> | <parameterentity> | <parmname> | <term> | <text> | <textentity> | <tm> | <varname> | <wintitle> | <xmlatt> | <xmlelement> | <xmlnsname> | <xmlpi>)*

<glossSymbol> contains
<alt>?, <longdescref>?

Empty elements:
<glossPartOfSpeech/>, <glossStatus/>, <glossAlternateFor/>

Example glossentry document
==========
<glossentry id="usbfd">
  <glossterm>USB flash drive</glossterm>
  <glossdef>A small portable drive.</glossdef>
  <glossBody>
    <glossPartOfSpeech value="noun"/>
    <glossUsage>Do not provide in upper case (as in "USB Flash
Drive") because that suggests a trademark.</glossUsage>
    <glossAlt>
      <glossAcronym>UFD</glossAcronym>
      <glossUsage>Explain the acronym on first occurrence.</glossUsage>
    </glossAlt>
    <glossAlt id="memoryStick">
      <glossSynonym>memory stick</glossSynonym>
      <glossUsage>This is a colloquial term.</glossUsage>
    </glossAlt>
    <glossAlt>
      <glossAbbreviation>stick</glossAbbreviation>
      <glossStatus value="prohibited"/>
      <glossUsage>This is too colloquial.</glossUsage>
      <glossAlternateFor href="#usbfd/memoryStick"/>
    </glossAlt>
    <glossAlt>
      <glossAbbreviation>flash</glossAbbreviation>
      <glossStatus value="prohibited"/>
      <glossUsage>This short form is ambiguous.</glossUsage>
    </glossAlt>
  </glossBody>
</glossentry>


Content to be converted to glossay entry ot group follows
============================

