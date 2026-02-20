# Procedure Timing Context CodeSystem - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Procedure Timing Context CodeSystem**

## CodeSystem: Procedure Timing Context CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/procedure-timing-context-cs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:ProcedureTimingContextCS |

 
Local CodeSystem for classifying a procedure into a **timing context** relative to encounter start. 
**Primary use-case** 
* Normalize reporting into acute (<24h) vs post-acute (>=24h) phases for stroke process measures.
 
**FHIR placement** 
* Used in `ProcedureTimingContextExtension` attached to Procedure.
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ProcedureTimingContextVS](ValueSet-procedure-timing-context-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "procedure-timing-context-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/procedure-timing-context-cs",
  "version" : "1.0.0",
  "name" : "ProcedureTimingContextCS",
  "title" : "Procedure Timing Context CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-20T10:05:07+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Local CodeSystem for classifying a procedure into a **timing context** relative to encounter start.\n\n**Primary use-case**\n- Normalize reporting into acute (<24h) vs post-acute (>=24h) phases for stroke process measures.\n\n\n**FHIR placement**\n- Used in `ProcedureTimingContextExtension` attached to Procedure.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
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
  }]
}

```
