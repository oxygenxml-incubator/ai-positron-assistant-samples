# Sort Glossentries in a DITA Map

You are given the XML content of the current opened DITA Map.

Find in it the <glossref> elements, for each element use the @href attribute value to build an absolute URL reference (relative to the URL of the current opened document) to the glossary topic, obtain the XML content from each glossary topic and compute its title. 

Sort the <glossref> elements inside the main DITA Map based on their titles and then return the DITA Map content with the <glossref> elements sorted and all other content unchanged
