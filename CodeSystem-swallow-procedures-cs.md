# Swallow Procedures Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Swallow Procedures Code System**

## CodeSystem: Swallow Procedures Code System 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/swallow-procedures-cs | *Version*:0.1.0 |
| Active as of 2026-02-17 | *Computable Name*:SwallowProceduresCS |

 
Codes representing various swallowing assessment procedures. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SwallowProceduresValueset](ValueSet-swallow-procedures-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "swallow-procedures-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/swallow-procedures-cs",
  "version" : "0.1.0",
  "name" : "SwallowProceduresCS",
  "title" : "Swallow Procedures Code System",
  "status" : "active",
  "date" : "2026-02-17T08:49:13+00:00",
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
  "description" : "Codes representing various swallowing assessment procedures.",
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "assist",
      "display" : "ASSIST",
      "definition" : "Assisted Swallowing Test (ASSIST)"
    },
    {
      "code" : "other",
      "display" : "Other Swallow Procedure",
      "definition" : "Other specified swallowing assessment procedure"
    },
    {
      "code" : "v-vst",
      "display" : "V-VST",
      "definition" : "Volume-Viscosity Swallow Test (V-VST)"
    }
  ]
}

```
