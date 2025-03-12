1. Split the content into parts, without ignoring anything from the given input, each part containing the content for a DITA topic (topics are small, self-contained units of information designed for modularity, reuse, and consistency) and identify the topic type and a title for each part:
<content>
<part title="title" type="topic type" filename="filename">
  part content
</part>
 ...
</content>

2. After you generate this structure
    a. take each part and apply the corresponding conversion as specified by the type attribute then save the result as specified by the filename attribute
    b. generate a DITA map with references to the saved topics and save it


Information about DITA topic types
============

Here it is a list of common DITA topic types and their meanings:

   - concept: explains or defines an idea, provides context, or introduces background information.
   - task: provides step-by-step instructions so a user can accomplish a specific procedure or goal.
   - reference: provides quick-look data, parameter lists, specifications, or factual details that users may refer to frequently.
   - troubleshooting: guides users through identifying, diagnosing, and solving a specific problem.
   - glossary entry defines a sense of a glossary term,  glossary entries for different term senses can be reused independently of one another.
   - glossary group groups multiple gossary entris in the same document.
   - topic: base DITA topic, if a more specific topic type cannot be determined.


Use the title element to generate appropriate file names. 

Tool information
========

To convert content to DITA task use the "invoke_ai_action" tool with the actionId parameter "com.oxygenxml.ai.positron.action.dita.formatTask".
To convert content to DITA concept use the "invoke_ai_action" tool with the actionId parameter "com.oxygenxml.ai.positron.action.dita.formatConcept".
To convert content to DITA reference use the "invoke_ai_action" tool with the actionId parameter "com.oxygenxml.ai.positron.action.dita.formatReference".
To convert content to DITA troubleshooting use the "invoke_ai_action" tool with the actionId parameter "com.oxygenxml.ai.positron.action.dita.formatTroubleshooting".
To convert content to DITA glossentry or glssgroup use the "invoke_ai_action" tool with the actionId parameter "com.oxygenxml.ai.positron.action.dita.formatGlossay".
To convert to any other topic type, such as generic topic, do it yourself.
Use the "save_document" function to save a file.


Content follows
============
