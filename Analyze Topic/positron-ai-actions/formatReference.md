Your task is to generate a DITA reference topic from all the content of given document that contains reference information but is encoded in a different format or it is provided as plain text or Markdown. 

Start the response topic with the XML declaration and the reference DOCTYPE declaration:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE reference PUBLIC "-//OASIS//DTD DITA Reference//EN" "reference.dtd">
```

Generate id attribute for the reference root element and for additional references if any.
Preserve metadata information such as: altenative titles, navtitles, prolog information.
Preserve profiling information defined by profiling attributes such as product, audience, platform, deliveryTarget, props, otherprops.
Include content references, elements that contain conref or conkeyref or keyref attributes, you may use the resolve_dita_key_or_content_reference function if you want to find the actual content they exand to.

Below you find information about DITA reference topics.

Information about DITA reference topics
========================

Reference topics represent a set of factual information. 

The <reference> element defines a top-level container for a reference topic. Reference topics provide quick access to facts, but they do not contain a deeper explanation of related concepts or tasks.

The <refbody> element is a container for the main content of the reference topic, containing tables, property lists, syntax sections, sections and examples.

The <refbodydiv> element provides an informal container for content that might be grouped within a reference. There are no additional semantics attached to the <refbodydiv> element; it is purely a grouping element provided to help organize content. The <refbodydiv> element can nest itself.

The <refsyn> element is a special section inside a reference topic. The section often contains syntax or signature content (for example, the calling syntax for a command-line utility or an API signature). The <refsyn> contains a brief, possibly diagrammatic description of the subject's interface or high-level structure.

The <properties> element gives a list of properties for the subject of the current topic, for example whether a class is public or protected. Each property can include the type, value, and a description. To represent multiple values for a single type, create additional property elements and use only the <propvalue> element (and <propdesc> when needed) for each successive value. It can be placed inside <refbody> or <refbodydiv> elements.

The <proptypehd> element supports headings for the type column of a properties table.
The <proptypehd> element supports headings for the type column of a properties table.
The <propvaluehd> element supports headings for the value column of a properties table.
The <propdeschd> element supports headings for the description column of a properties table.
The <proptype> element describes the type of the property.
The <propvalue> element indicates one or more values for the current property type. Values can be placed in separate <property> elements if they need separate descriptions. The <proptype> element need not be repeated.
The <propdesc> element is used to provide a short description of the property type and its listed values.
The <example> element is a section that contains examples that illustrate or support the current topic. Use <example> to contain both sample code (or similar artifacts) and the discussion that illustrates the sample.


Tips
=======
* Preserve codeblock from the original content exactly as it is, including all whitespaces and indenting.
* Do not loose content references (elements with conref, keyref or conkeyref attribute) such as <note conref="…"/>.
* Do not replace content references (elements with conref, keyref or conkeyref attribute) with the expanded content.
* The <codeph> element represents a snippet of code within the main flow of text.
* Do not place <properties> inside a section, they are sinblings to sections, pleace properties directly insisde refbody.
* Make sure you close an element with the same tag name as its start tag.

Content model information 
====================

In the models below "?" means optional, "," delimits sequence items, "*" means zero or more, "|" represents choice and "(" and ")" are used for grouping. Always make sure that these content models are respected when you generate content.

<reference> contains: 
<title>, <titlealts>?, (<abstract> | <shortdesc>)?, <prolog>?, <refbody>?, <related-links>?, (<concept> | <glossentry> | <glossgroup> | <reference> | <task> | <topic> | <troubleshooting>)*


<refbody> contains: 
(<data> | <data-about> | <example> | <foreign> | <mathml> | <properties> | <refbodydiv> | <refsyn> | <section> | <simpletable> | <sort-as> | <svg-container> | <table> | <unknown>)*

<refbodydiv> contains:
(<data> | <data-about> | <example> | <foreign> | <mathml> | <properties> | <refbodydiv> | <refsyn> | <section> | <simpletable> | <sort-as> | <svg-container> | <table> | <unknown>)*

<properties> contains:
<prophead>?, <property>+

<prophead> contains:
<proptypehd>?, <propvaluehd>?, <propdeschd>?

<property> contains:
<proptype>?, <propvalue>?, <propdesc>?

<refsyn> or <example> contain:
(text data | <abbreviated-form> | <apiname> | <b> | <boolean> | <cite> | <cmdname> | <codeblock> | <codeph> | <data> | <data-about> | <div> | <dl> | <draft-comment> | <equation-block> | <equation-figure> | <equation-inline> | <fig> | <filepath> | <fn> | <foreign> | <hazardstatement> | <i> | <image> | <imagemap> | <indexterm> | <indextermref> | <keyword> | <line-through> | <lines> | <lq> | <markupname> | <mathml> | <menucascade> | <msgblock> | <msgnum> | <msgph> | <note> | <numcharref> | <object> | <ol> | <option> | <overline> | <p> | <parameterentity> | <parml> | <parmname> | <ph> | <pre> | <q> | <required-cleanup> | <screen> | <sectiondiv> | <simpletable> | <sl> | <sort-as> | <state> | <sub> | <sup> | <svg-container> | <synph> | <syntaxdiagram> | <systemoutput> | <table> | <term> | <text> | <textentity> | <title> | <tm> | <tt> | <u> | <uicontrol> | <ul> | <unknown> | <userinput> | <varname> | <wintitle> | <xmlatt> | <xmlelement> | <xmlnsname> | <xmlpi> | <xref>)*

Content to be converted to reference follows
============================

