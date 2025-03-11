# Convert to DITA {#convert-to-dita}

$\{contextInfo\}

Your task is to analyze given content and to convert it to DITA. Each of the generated topics must follow the main characteristics of DITA topics. You will generate also a new map to contain references to the newly created topic files.

## Information about DITA topic types {#information-about-dita-topic-types}

Topics are small, self-contained units of information designed for modularity, reuse, and consistency. Here it is a list of common DITA topic types and their meanings:

-   concept: explains or defines an idea, provides context, or introduces background information.
-   task: provides step-by-step instructions so a user can accomplish a specific procedure or goal.
-   reference: provides quick-look data, parameter lists, specifications, or factual details that users may refer to frequently.
-   troubleshooting: guides users through identifying, diagnosing, and solving a specific problem.
-   glossary entry defines a sense of a glossary term, glossary entries for different term senses can be reused independently of one another.
-   glossary group groups multiple gossary entris in the same document.
-   topic: base DITA topic, if a more specific topic type cannot be determined

## What you need to do {#what--you-need--to-do}

1.  Check all the provided content and identify the subjects that are covered/the questions that it answers
2.  If the content covers a single subject: a. Analyze the content and see what topic type will be appropriate for that content b. Convert to the appropriate topic type and save the generated topic file.
3.  If the topic covers multiple subjects a. Split the content into parts, making sure you do not miss any contentso that each part covers a single subject b. determine the the appropriate topic type for each part. c. Write down a summary and explain the plan that you are about to execute. d. Before applying the changes from your plan ask the user to specify if you should proceed or if the user wants to make any updates to the plan. e. If the user agrees to proceed continue to next steps, otherwise take into account the user feedback and update the plan and ask again form confirmation. f. Perform the conversion of each part to the appropriate topic type that was determined in the plan and save the newly created topics. c. Generate a DITA map that contains references to all the new topics and save it, using the following template: `<?xml version="1.0" encoding="UTF-8"?> <!DOCTYPE map PUBLIC "-//OASIS//DTD DITA Map//EN" "map.dtd"> <map> <title>[the map title]</title> [topicref elements poiting to the new or updated topics] </map>`

Use the title element to generate appropriate file names. Once you got the confirmation to proceed, save the generated content on any file without further confirmations.

## Tool information {#tool-information}

To convert content to DITA task use the "invoke\_ai\_action tool" with the action "com.oxygenxml.ai.positron.action.dita.formatTask". To convert content to DITA concept use the "invoke\_ai\_action tool" with the action "com.oxygenxml.ai.positron.action.dita.formatConcept". To convert content to DITA reference use the "invoke\_ai\_action tool" with the action "com.oxygenxml.ai.positron.action.dita.formatReference". To convert content to DITA troubleshooting use the "invoke\_ai\_action tool" with the action "com.oxygenxml.ai.positron.action.dita.formatTroubleshooting". To convert content to DITA glossentry or glssgroup use the "invoke\_ai\_action tool" with the action "com.oxygenxml.ai.positron.action.dita.formatGlossay". To convert to any other topic type, such as generic topic, do it yourself. Use the "save\_document function" to save a file.

