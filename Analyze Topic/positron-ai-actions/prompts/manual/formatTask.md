Your task is to convert to a DITA task all the content of a document which is encoded in a different format or it is provided as plain text or Markdown. 

If the content contains information about multiple tasks then split the initial content to reflect the content for each task and then generate multiple task topics inside a dita composite document.

Start the response topic with the XML declaration and the task or dita DOCTYPE declaration:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE task PUBLIC "-//OASIS//DTD DITA General Task//EN" "generalTask.dtd">
```
or 
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE dita PUBLIC "-//OASIS//DTD DITA Composite//EN" "ditabase.dtd">
```

Generate id attribute for the task root element and for additional tasks if any.
Preserve metadata information such as: altenative titles, navtitles, prolog information.
Preserve profiling information defined by profiling attributes such as product, audience, platform, deliveryTarget, props, otherprops.
Include content references, elements that contain conref or conkeyref or keyref attributes, you may use the resolve_dita_key_or_content_reference function if you want to find the actual content they exand to.

Below you find information about DITA tasks.

Information about DITA tasks
=====================
The <task> element is the top-level element for a task topic. Tasks are the main building blocks for task-oriented user assistance. They generally provide step-by-step instructions that will enable a user to perform a task. A task answers the question of "how to?" by telling the user precisely what to do and the order in which to do it. Tasks have the same high-level structure as other topics, with a title, short description and body.
The <taskbody> element is the main body-level element inside a task topic. A task body is designed to contain information specific to completing a task, such as prerequisites, contextual information, and steps.
The <context> element provides background information for a task. This information helps the user understand what the purpose of the task is and what they will gain by completing the task. This section should be brief and does not replace or recreate a concept topic on the same subject, although the context section might include some conceptual information.
<context> contains [general DITA block elements].
The <prereq> element of a task contains prerequisites that the user needs to know or do before starting the current task. 
The <steps> element provides the main content of a task topic. The task is described as a series of steps that the user must follow to accomplish the task. At least one <step> element is required inside the <steps> element.
Like the <steps> element, the <steps-unordered> element provides the main content of a task topic, but particularly for cases in which the order of steps might vary from one situation to another. At least one <step> element is required inside the <steps-unordered> element.
The <steps-informal> element allows authors to describe procedural task information without placing each step in an individual container element, which is a requirement of the related <steps> and <steps-unordered> elements. For example, <steps-informal> might contain a paragraph that describes more than one step in a single sentence, or it might contain sentences that mix steps together with information about the steps.
The <result> element describes the expected outcome for the task as a whole. 
The <tasktroubleshooting> element provides information designed to help users remedy the situation when a task does not complete as expected. In particular, this element can be used to explain how users can recover when the results of a task do not match those listed in the <result> element. The troubleshooting remedy typically contains one or more actions for solving a problem. For complex remedies, link to another task.
The <example> element is a section that contains examples that illustrate or support the current topic. Use <example> to contain both sample code (or similar artifacts) and the discussion that illustrates the sample. For example, a DITA topic about programming code could use the <example> element to contain both the sample code and the text that describes the code. Similarly, a sample that included preformatted text might use the <pre> element along with a paragraph or list to elaborate upon sections of that text.
The <postreq> element describes steps or tasks that the user should do after the successful completion of the current task. It is often supported by links to the next task or tasks in the <related-links> section.
The <stepsection> element provides expository text before a <step> element. Although the element is specialized from <li> and has the same content model as a list item, it is not intended to represent a step in a task.
The <step> element represents an action that a user must follow to accomplish a task. Each step in a task must contain a command <cmd> element which describes the particular action the user must do to accomplish the overall task. It is possible to place a <note> element before the command in order to notify the user of dangers or other important information about the step. The <step> element can also contain additional optional information about the step, such as sub-steps, a list of choices, or result information.
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

<task> contains: 
<title>, <titlealts>?, (<abstract> | <shortdesc>)?, <prolog>?, <taskbody>?, <related-links>?, <task>*

<taskbody> contains: 
(<context> | <prereq> | <section>)*, (<steps> | <steps-informal> | <steps-unordered>)?, <result>?, <tasktroubleshooting>?, <example>*, <postreq>*

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

<prereq> or <steps-informal> or <result> or <tasktroubleshooting> or <postreq> or <stepsection> or <choice> or <choptionhd> or <chdeschd> or <choption> or <chdesc> or <info> or <cmd> or <itemgroup> or <stepxmp> or <tutorialinfo> or <stepresult> or <steptroubleshooting> contain:
(text data | <abbreviated-form> | <apiname> | <b> | <boolean> | <cite> | <cmdname> | <codeblock> | <codeph> | <data> | <data-about> | <div> | <dl> | <draft-comment> | <equation-block> | <equation-figure> | <equation-inline> | <fig> | <filepath> | <fn> | <foreign> | <hazardstatement> | <i> | <image> | <imagemap> | <indexterm> | <indextermref> | <keyword> | <line-through> | <lines> | <lq> | <markupname> | <mathml> | <menucascade> | <msgblock> | <msgnum> | <msgph> | <note> | <numcharref> | <object> | <ol> | <option> | <overline> | <p> | <parameterentity> | <parml> | <parmname> | <ph> | <pre> | <q> | <required-cleanup> | <screen> | <sectiondiv> | <simpletable> | <sl> | <sort-as> | <state> | <sub> | <sup> | <svg-container> | <synph> | <syntaxdiagram> | <systemoutput> | <table> | <term> | <text> | <textentity> | <tm> | <tt> | <u> | <uicontrol> | <ul> | <unknown> | <userinput> | <varname> | <wintitle> | <xmlatt> | <xmlelement> | <xmlnsname> | <xmlpi> | <xref>)*

<example> contains:
(text data | <b> | <boolean> | <cite> | <data> | <data-about> | <div> | <dl> | <draft-comment> | <fig> | <fn> | <foreign> | <hazardstatement> | <i> | <image> | <imagemap> | <indexterm> | <indextermref> | <keyword> | <line-through> | <lines> | <lq> | <note> | <object> | <ol> | <overline> | <p> | <ph> | <pre> | <q> | <required-cleanup> | <simpletable> | <sl> | <sort-as> | <state> | <sub> | <sup> | <table> | <term> | <text> | <title> | <tm> | <tt> | <u> | <ul> | <unknown> | <xref>)*

Content to be converted to task follows
============================
