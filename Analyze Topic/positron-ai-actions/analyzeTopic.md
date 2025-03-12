Your task is to analyze a DITA topic and determine if it follows the main characteristics of DITA topics and propose and execute updates on that topic to make it adhere to DITA philosophy. These updates can modify that topic, generate additional topics, update the DITA map to contain references to the newly created topic files, if any.

Information about DITA topic types
============

Topics are small, self-contained units of information designed for modularity, reuse, and consistency. 
Here it is a list of common DITA topic types and their meanings:

   - concept: explains or defines an idea, provides context, or introduces background information.
   - task: provides step-by-step instructions so a user can accomplish a specific procedure or goal.
   - reference: provides quick-look data, parameter lists, specifications, or factual details that users may refer to frequently.
   - troubleshooting: guides users through identifying, diagnosing, and solving a specific problem.
   - glossary entry defines a sense of a glossary term,  glossary entries for different term senses can be reused independently of one another.
   - glossary group groups multiple gossary entris in the same document.
   - topic: base DITA topic, if a more specific topic type cannot be determined


General Instructions
===========

 * In case there are nested topics in the DITA topic you analyze, apply the checks for each one.
 * Use the title element to generate appropriate file names. 
 * Once you got the confirmation to proceed do not ask for further confirmations.
 * When inserting related links use a tempalate such as:
```
<related-links>
    <link href="[targetTopicFile.dita]"><linktext>[Target topic title]</linktext></link>
</related-links>
```

What  you need  to do
========

Check if the topic covers a single subject or answer to a specific question

    1. If the topic covers a single subject or answer to a specific question 
        a. Write which subject or question you identified that the topic covers
        b. The existing topic type is determined by the XML element that encodes that topic 
        c. Analyze the content and see what topic type will be appropriate for that content
        d. write the determined topic type versus the appropriate topic type. 
        d. Compare existing type topic to the appropriate topic type, if they are different convert to the appropriate topic type. 

    2. If the the topic covers multiple subjects/answers more questions
        a. Write a list with all the subjects that are covered/all the questions that it answers 
        b. Split the topic content into parts, making sure you do not miss any content and that each part covers a single subject, and determine the appropriate topic type for each part, and identify which part serves as information that should remain in the existing topic (the existing topic must keep its file name unchanged, do not rename it)
        c. Write a summary and explain the plan that you are about to execute, include the topic titles and file names.
        d. Before applying the changes from your plan ask the user to confirm that you should proceed, or if the user wants to make any updates to the plan, the question should be formulated such that andwering yes will be a clear indication that the user wants to proceed with the plan.
        e. If the user agrees to proceed continue to next steps, otherwise take into account the user feedback and update the plan and ask again for confirmation.
        f. Perform the conversion of each part to the appropriate topic type that was determined in the plan.

    3. You will process now each of the generated content obtained after the conversion, as indicated furter, and write a summary of the changes you  are about to make:
        a. update the topic to add <related-links> with links between the topic and  topics with related content, if there are no related links, do not add an empty related-links element - write what related links you will add to each topic content
        b. edit the metadata to include relevant metadata from the original topic and remove metadata irrelevant to the topic content..
            
    4. Save the generated and processed content to the newly created topics and to the existing topic.
     
    5. If there were new topics generated, update the map to add references to the newly created topic files.

If there is content that is not present in the converted output so add it inside an XML comment, such as
```
<!-- content not converted -->
```


Tool information
========

To convert content to DITA task use the "invoke_ai_action" tool with the action "com.oxygenxml.ai.positron.action.dita.formatTask".
To convert content to DITA concept use the "invoke_ai_action" tool with the action "com.oxygenxml.ai.positron.action.dita.formatConcept".
To convert content to DITA reference use the "invoke_ai_action" tool with the action "com.oxygenxml.ai.positron.action.dita.formatReference".
To convert content to DITA troubleshooting use the "invoke_ai_action" tool with the action "com.oxygenxml.ai.positron.action.dita.formatTroubleshooting".
To convert content to DITA glossentry or glssgroup use the "invoke_ai_action" tool with the action "com.oxygenxml.ai.positron.action.dita.formatGlossay".
To convert to any other topic type, such as generic topic, do it yourself.
Use the "save_document" function to save a file.
