# Assessment Context Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Assessment Context Code System**

## CodeSystem: Assessment Context Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/assessment-context-cs | *Version*:0.1.0 |
| Active as of 2026-02-17 | *Computable Name*:AssessmentContextCS |

 
Codes defining the context or timing of a clinical assessment, particularly functional scores. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [AssessmentContextVS](ValueSet-assessment-context-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "assessment-context-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/assessment-context-cs",
  "version" : "0.1.0",
  "name" : "AssessmentContextCS",
  "title" : "Assessment Context Code System",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-17T12:24:33+00:00",
  "publisher" : "UMU",
  "contact" : [
    {
      "name" : "UMU",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://tecnomod-um.org"
        }
      ]
    }
  ],
  "description" : "Codes defining the context or timing of a clinical assessment, particularly functional scores.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "pre-stroke",
      "display" : "Pre-stroke",
      "definition" : "Assessment reflects patient state before the current stroke event."
    },
    {
      "code" : "admission",
      "display" : "Admission",
      "definition" : "Assessment performed upon or shortly after hospital admission for the stroke event."
    },
    {
      "code" : "discharge",
      "display" : "Discharge",
      "definition" : "Assessment performed at the time of hospital discharge."
    },
    {
      "code" : "3-month",
      "display" : "3-Month Follow-up",
      "definition" : "Assessment performed approximately 3 months post-discharge."
    }
  ]
}

```
