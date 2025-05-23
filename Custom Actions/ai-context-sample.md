# Project context

The current DITA XML project contains technical documentation for a fun and easy to drive beach vehicle named the Sharkfin Rover.

# Audience

Technical documentation must be precise and easy to understand. Our clients are not technical, they are usually beginners when it comes to driving and their understanding of English may vary.

# Terminology

Specific terms in the DITA XML content must be wrapped in the <term> element. Preserve all such terms and do not attempt to replace them with possible synonyms.

Always prefer to use the terms below instead of possible synonyms:
```
Sharkfin Rover (instead of 'Sharkfin Buggy')
vehicle (instead of 'car')
lorry (instead of 'truck')
rear position lamp (instead of 'tailgate')
powertrain (instead of 'drivetrain')
petrol engine (instead of 'Otto engine')
motorcycle (instead of 'motor-bike')
engine (instead of 'motor')
electronic stability control (instead of 'ESP')
motor vehicle chassis (instead of 'vehicle frame')
```

# Style guide

There is a set of company specific Style Guide rules which are important to follow when rewriting or creating new content, the most important rules are mentioned below:


- Never use a metaphor, simile, or other figure of speech.
- Never use a long word where a short one will do.
- Keep sentences short. If it is possible to cut a word out, always cut it out.
- Never use the passive where you can use the active.
- Never use a foreign phrase, a scientific word, or a jargon word if you can think of an everyday English equivalent.
- Don’t use text that points to other topics such as "In the document below" or "in the following section."
- Some words or phrases are disallowed to be used. Mapping of disallowed phrases to their valid equivalent constructs:
```
as well as, in addition to => and
at this time, at this/that point in time => currently, now/then
advance planning => planning
by means of => by
by reason of => because of
due to the fact => because
during the course of => during
end result => result
```

# Vocabulary Changes

DITA XML topics generated for our project's user's manual have the following structure and DOCTYPE declaration:

```
<!DOCTYPE oxyTopic PUBLIC "OXY-PUB-TOPIC" "oxy-system-topic">
<oxyTopic>
    <title>&lt;/title>
    <body>
           
    </body>
</oxyTopic>
```

DITA XML concepts generated for our project's user's manual have the following structure and DOCTYPE declaration:

```
<!DOCTYPE oxyConcept PUBLIC "OXY-PUB-CONCEPT" "oxy-system-concept">
<oxyConcept>
    <title>&lt;/title>
    <conbody>
           
    </conbody>
</oxyConcept>
```

DITA XML tasks generated for our project's user's manual have the following structure and DOCTYPE declaration:

```
<!DOCTYPE oxyTask PUBLIC "OXY-PUB-TASK" "oxy-system-task">
<oxyTask>
    <title>&lt;/title>
    <taskbody>
        <context>
            <p></p>
        </context>
        <steps>
            <step>
                <cmd></cmd>
            </step>
        </steps>
    </taskbody>
</oxyConcept>
```

New DITA XML elements are defined in our specific DITA XML vocabulary as follows:

There is a new <part-term> XML element which must be used to tag various car parts.
There is a new <product> XML element which must be used to tag product names.

Example:

The <product>Hisense</product> <part-term>engine</part-term> is more efficient. 