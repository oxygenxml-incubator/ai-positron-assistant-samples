What  you need  to do
========

1. Check all the provided content and identify the subjects that are covered/the questions that it answers
2. If the content  covers a single subject:
    a. Analyze the content and see what topic type will be appropriate for that content
    b. Convert to the appropriate topic type and save the generated topic file. 
3. If the topic covers multiple subjects
    a. Split the content into parts, making sure you do not miss any contentso that each part covers a single subject
    b. determine the the appropriate topic type for each part.
    c. Write down a summary and explain the plan that you are about to execute.
    d. Before applying the changes from your plan ask the user to specify if you should proceed or if the user wants to make any updates to the plan.
    e. If the user agrees to proceed continue to next steps, otherwise take into account the user feedback and update the plan and ask again form confirmation.
    f. Perform the conversion of each part to the appropriate topic type that was determined in the plan and save the newly created topics.
    c. Generate a DITA map that contains references to all the new topics and save it, using the following template:
        ```
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE map PUBLIC "-//OASIS//DTD DITA Map//EN" "map.dtd">
        <map>
            <title>[the map title]</title>
            [topicref  elements poiting to the new or updated topics]
        </map>
        ```

Use the title element to generate appropriate file names. 
Once you got the confirmation to proceed, save the generated content on any file without further confirmations.
