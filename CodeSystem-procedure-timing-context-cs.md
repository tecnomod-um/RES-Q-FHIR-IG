# Procedure Timing Context Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Procedure Timing Context Code System**

## CodeSystem: Procedure Timing Context Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/procedure-timing-context-cs | *Version*:0.1.0 |
| Active as of 2026-02-18 | *Computable Name*:ProcedureTimingContextCS |

 
Codes defining the timing phase of a procedure relative to the encounter start (e.g., acute vs. post-acute). 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ProcedureTimingContextVS](ValueSet-procedure-timing-context-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "procedure-timing-context-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/procedure-timing-context-cs",
  "version" : "0.1.0",
  "name" : "ProcedureTimingContextCS",
  "title" : "Procedure Timing Context Code System",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-18T14:43:59+00:00",
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
  "description" : "Codes defining the timing phase of a procedure relative to the encounter start (e.g., acute vs. post-acute).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "acute",
      "display" : "Acute Phase (<24h)",
      "definition" : "Procedure performed within 24 hours of encounter start time."
    },
    {
      "code" : "post-acute",
      "display" : "Post-Acute Phase (>=24h)",
      "definition" : "Procedure performed 24 hours or more after encounter start time."
    },
    {
      "code" : "unknown",
      "display" : "Unknown/Not Applicable",
      "definition" : "Timing relative to encounter start is unknown or not applicable."
    }
  ]
}

```
