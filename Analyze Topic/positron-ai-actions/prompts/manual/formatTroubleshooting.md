Your task is to generate a DITA troubleshooting from all the content of given document that contains troubleshooting information but is encoded in a different format or it is provided as plain text or Markdown. 
If the content contains information about multiple troubleshooting topics then split the initial content to reflect the content for each troubleshooting topic and then generate multiple troubleshooting topics inside a dita composite document.

Start the response topic with the XML declaration and the troubleshooting or dita DOCTYPE declaration:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE troubleshooting PUBLIC "-//OASIS//DTD DITA Troubleshooting//EN" "troubleshooting.dtd">
<trobleshooting id="[generate an ID]">
...
```
or 
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE dita PUBLIC "-//OASIS//DTD DITA Composite//EN" "ditabase.dtd">
<dita>
...
```

Generate id attribute for the troubleshooting root element and for additional troubleshooting elements if any.
Preserve metadata information such as: altenative titles, navtitles, prolog information.
Preserve profiling information defined by profiling attributes such as product, audience, platform, deliveryTarget, props, otherprops.
Include content references, elements that contain conref or conkeyref or keyref attributes, you may use the resolve_dita_key_or_content_reference function if you want to find the actual content they exand to.

Below you find information about DITA troubleshooting

Information about DITA troubleshooting
=====================
The <troubleshooting> element is the top-level element for a troubleshooting topic. Troubleshooting topics begin with a description of a condition that the reader might want to correct, followed by one or more cause-remedy pairs. Each cause-remedy pair is a potential solution to the trouble described in the condition.

The <troublebody> element is a container for the main content of the troubleshooting topic.

The <condition> element describes a state that the troubleshooting topic is intended to remedy. This information helps the user decide whether a troubleshooting topic might contain an applicable remedy for a problem. This section should add to or clarify information that is in the tile or short description of the troubleshooting topic.

The <troubleSolution> element is a container element for cause and remedy information. The cause might be omitted if it is implicit or if the remedy is not associated with a cause. The remedy might be omitted if there is no known remedy for the cause.

The <cause> element describes a potential source of the problem that is described in the <condition> element, the topic <title> element, or the <shortdesc> element. This information should be brief; if it is not possible to make the information brief, this might be a sign that a full troubleshooting topic is needed

The <remedy> element contains steps that are a potential solution for the problem described in the <condition> element, the topic <title> element, or the <shortdesc> element. Typically, a <remedy> is preceded by a <cause>.

Use the <responsibleParty> element to identify the party who is responsible for performing a remedy procedure.

The <steps> element provides the main content of a remedy. The remedy task is described as a series of steps that the user must follow to accomplish the remedy. At least one <step> element is required inside the <steps> element.
Like the <steps> element, the <steps-unordered> element provides the main content of a task topic, but particularly for cases in which the order of steps might vary from one situation to another. At least one <step> element is required inside the <steps-unordered> element.

The <steps-informal> element allows authors to describe procedural remedy task information without placing each step in an individual container element, which is a requirement of the related <steps> and <steps-unordered> elements. For example, <steps-informal> might contain a paragraph that describes more than one step in a single sentence, or it might contain sentences that mix steps together with information about the steps.
 
The <stepsection> element provides expository text before a <step> element. Although the element is specialized from <li> and has the same content model as a list item, it is not intended to represent a step in a task.

The <step> element represents an action that a user must follow to accomplish a task. Each step in a task must contain a command 

<cmd> element which describes the particular action the user must do to accomplish the overall task. It is possible to place a <note> element before the command in order to notify the user of dangers or other important information about the step. The <step> element can also contain additional optional information about the step, such as sub-steps, a list of choices, or result information.

The <substeps> element allows you to break a step down into a series of separate actions, and should be used only if necessary. Try to describe the steps of a task in a single level of steps. If you need to use more than one level of <substep> nesting, you should probably rewrite the task to simplify it.
A <substep> does NOT allow lists of choices or sub-steps within it, in order to prevent unlimited nesting of steps, so make sure you do not add <choices> or <substeps> inside it.

The <cmd> element specifies a command, which is a required element inside the <step> or <substep> element. It provides the active voice instruction to the user for completing the step, and should not be more than one sentence. If the step or substep needs additional explanation, place the explanation in an <info> element following the <cmd>. 

The <choices> element contains a list of <choice> elements. It is used when the user will need to choose one of several actions while performing the steps of a task. 
Each <choice> element describes one way that the user could perform the current step, it does not contain <cmd>.
The <choicetable> element contains a series of optional choices available within a step of a task.
The <choptionhd> element provides a specific label for the list of options from which a user chooses in order to accomplish a step. 
The <chdeschd> element provides a specific label for the list of descriptions of options from which a user chooses in order to accomplish a step. 
The <choption> element describes an option in a choice table that a user could choose to accomplish a step of a task. In a user interface, for example, this might be the name of radio button.
The <chdesc> element is a description of an option from a choice table that a user chooses while performing a step to accomplish a task. It explains why the user would choose that option and might explain the result of the choice when it is not immediately obvious.

The <info> element occurs inside a <step> or <substep> element to provide additional information about that step or substep.

The <itemgroup> element can be used to sub-divide or organize elements that occur inside a list item, definition, or parameter definition.

The <stepxmp> element is used to illustrate a step of a task. The step example can be a couple of words, or an entire paragraph.

The <tutorialinfo> element contains additional information that is useful when the task is part of a tutorial.

The <stepresult> element provides information on the expected outcome of a step. If a user interface is being documented, the outcome could describe a dialog box opening or the appearance of a progress indicator. Step results are useful to assure a user that they are on track, but should not be used for every step as this quickly becomes tedious.

The <steptroubleshooting> element provides information that is designed to help remedy the situation when a step does not complete as expected. In particular, this element can be used to explain how users can recover when the results of a step do not match those listed in the <stepresult> element.


Tips
=======
* Do not generate a <note> or <codeblock> after </info>, generate them inside that <info> element, before the </info> closing tag.
* <info> should not be placed inside a <choice> parent element.  
* Preserve codeblock from the original content exactly as it is, including all whitespaces and indenting.
* Do not place <codeblock> directly inside a step, wrap it in <info>.
* Do not place <note> directly inside a step, if the note is after <cmd>, wrap it in <info>.
* Do not loose content references (elements with conref, keyref or conkeyref attribute) such as <note conref="…"/>.
* Do not replace content references (elements with conref, keyref or conkeyref attribute) with the expanded content.
* There is only one <steps> or <steps-informal> or <steps-unordered> allowed in a task body.
* Do not nest <substeps>.
* The <stepresult> element has parent elements <step> and <substep>, do not generate it inside <info>, generate it after the </info> closing tag.
* The <codeph> element represents a snippet of code within the main flow of text.
* Make sure you close an element with the same tag name as its start tag.


Content model information 
====================

In the models below "?" means optional, "," delimits sequence items, "*" means zero or more, "|" represents choice and "(" and ")" are used for grouping. Always make sure that these content models are respected when you generate content.

<troubleshooting> contains: 
<title>, <titlealts>?, (<abstract> | <shortdesc>)?, <prolog>?, <troublebody>?, <related-links>?, (<concept> | <glossentry> | <glossgroup> | <reference> | <task> | <topic> | <troubleshooting>)*

<troublebody> contains:
(<condition>?, <troubleSolution>+)?

<troubleSolution> contains:
(<cause>*, <remedy>*)

<remedy> contains:
<title>?, <responsibleParty>?, (<steps> | <steps-informal> | <steps-unordered>)

<steps> or <steps-unordered> contain:
(<data> | <data-about> | <sort-as>)*, <stepsection>?, (<step>)+

<step> contains:
(<hazardstatement> | <note>)*, <cmd>, (<choices> | <choicetable> | <info> | <itemgroup> | <stepxmp> | <substeps> | <tutorialinfo>)*, <stepresult>?, <steptroubleshooting>?

<substeps> contains:
(<data> | <data-about> | <sort-as>)*, <substep>+

<substep> contains:
(<hazardstatement> | <note>)*, <cmd>, (<info> | <itemgroup> | <stepxmp> | <tutorialinfo>)*, <stepresult>?

<choices> contains:
(<data> | <data-about> | <sort-as>)*, <choice>+

choicetable> contains:
<chhead>?, <chrow>+

<chhead> contains:
<choptionhd>, <chdeschd>

<chrow> contains
<choption>, <chdesc>

<condition> or <cause> contains:
<title>?, (<codeblock> | <data> | <data-about> | <div> | <dl> | <draft-comment> | <equation-block> | <equation-figure> | <fig> | <fn> | <foreign> | <hazardstatement> | <image> | <imagemap> | <indexterm> | <indextermref> | <lines> | <lq> | <mathml> | <msgblock> | <note> | <object> | <ol> | <p> | <parml> | <pre> | <required-cleanup> | <screen> | <sectiondiv> | <simpletable> | <sl> | <sort-as> | <svg-container> | <syntaxdiagram> | <table> | <ul> | <unknown>)*

<responsibleParty> or <steps-informal> or <stepsection> or <choice> or <choptionhd> or <chdeschd> or <choption> or <chdesc> or <info> or <cmd> or <itemgroup> or <stepxmp> or <tutorialinfo> or <stepresult> or <steptroubleshooting> contain:
(text data | <abbreviated-form> | <apiname> | <b> | <boolean> | <cite> | <cmdname> | <codeblock> | <codeph> | <data> | <data-about> | <div> | <dl> | <draft-comment> | <equation-block> | <equation-figure> | <equation-inline> | <fig> | <filepath> | <fn> | <foreign> | <hazardstatement> | <i> | <image> | <imagemap> | <indexterm> | <indextermref> | <keyword> | <line-through> | <lines> | <lq> | <markupname> | <mathml> | <menucascade> | <msgblock> | <msgnum> | <msgph> | <note> | <numcharref> | <object> | <ol> | <option> | <overline> | <p> | <parameterentity> | <parml> | <parmname> | <ph> | <pre> | <q> | <required-cleanup> | <screen> | <sectiondiv> | <simpletable> | <sl> | <sort-as> | <state> | <sub> | <sup> | <svg-container> | <synph> | <syntaxdiagram> | <systemoutput> | <table> | <term> | <text> | <textentity> | <tm> | <tt> | <u> | <uicontrol> | <ul> | <unknown> | <userinput> | <varname> | <wintitle> | <xmlatt> | <xmlelement> | <xmlnsname> | <xmlpi> | <xref>)*


Content to be converted to troubleshooting follows
============================

