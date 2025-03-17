Your will generate a DITA concept from the all content of given document that contains conceptual information but is encoded in a different format or it is provided as plain text or Markdown. 
If the content contains consistent information about multiple concepts then split the initial content to reflect the content for each concept and then generate multiple concept topics inside a dita composite document.

Start the response with the XML declaration and the concept or dita DOCTYPE declaration:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE concept PUBLIC "-//OASIS//DTD DITA Concept//EN" "concept.dtd">
```
or 
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE dita PUBLIC "-//OASIS//DTD DITA Composite//EN" "ditabase.dtd">
```

Generate id attribute for the concept root element and for additional concepts if any.
Preserve metadata information such as: altenative titles, navtitles, prolog information.
Preserve profiling information defined by profiling attributes such as product, audience, platform, deliveryTarget, props, otherprops.
Include content references, elements that contain conref or conkeyref or keyref attributes, you may use the resolve_dita_key_or_content_reference function if you want to find the actual content they exand to.

Below you find information about DITA concepts.

Information about DITA concepts
========================

The <concept> element is the top-level element for a topic that answers the question "what is?" Concepts provide background information that users must know before they can successfully work with a product or interface. Often, a concept is an extended definition of a major abstraction such as a process or function.

The <conbody> element is the main body-level element for a concept.
<conbody> allows paragraphs, lists, and other elements as well as sections and examples. However, <conbody> has a restriction that a <section> or an <example> can be followed only by other sections, examples, or <conbodydiv> elements that group sections and examples.

The <conbodydiv> element provides an informal container for content that might be grouped within a concept. There are no additional semantics attached to the <conbodydiv> element; it is purely a grouping element provided to help organize content.
The <conbodydiv> element, which allows groupings of sections and examples, keeps the same restriction in place; once used, only sections, examples, or other <conbodydiv> groups are allowed.

Tips
=======
* Preserve codeblock from the original content exactly as it is, including all whitespaces and indenting.
* Do not loose content references (elements with conref, keyref or conkeyref attribute) such as <note conref="…"/>.
* Do not replace content references (elements with conref, keyref or conkeyref attribute) with the expanded content.
* The <codeph> element represents a snippet of code within the main flow of text.
* Make sure you close an element with the same tag name as its start tag.

Content model information 
====================

In the models below "?" means optional, "," delimits sequence items, "*" means zero or more, "|" represents choice and "(" and ")" are used for grouping. Always make sure that these content models are respected when you generate content.

<concept> contains: 
<title>, <titlealts>?, (<abstract> | <shortdesc>)?, <prolog>?, <conbody>?, <related-links>?, <concept>*

conbody contains:
(<codeblock> | <data> | <data-about> | <div> | <dl> | <draft-comment> | <equation-block> | <equation-figure> | <fig> | <foreign> | <hazardstatement> | <image> | <imagemap> | <lines> | <lq> | <mathml> | <msgblock> | <note> | <object> | <ol> | <p> | <parml> | <pre> | <required-cleanup> | <screen> | <simpletable> | <sl> | <sort-as> | <svg-container> | <syntaxdiagram> | <table> | <ul> | <unknown>)*, (<conbodydiv> | <example> | <section>)*

<conbodydiv> contains:
(<example> | <section>)*


Content to be converted to concept follows
============================