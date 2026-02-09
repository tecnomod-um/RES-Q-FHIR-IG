# Stroke Circumstance Codes CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Circumstance Codes CodeSystem**

## CodeSystem: Stroke Circumstance Codes CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/stroke-circumstance-codes-cs | *Version*:0.1.0 |
| Active as of 2026-02-09 | *Computable Name*:StrokeCircumstanceCodesCS |

 
Codes for findings related to the circumstances of stroke onset (In-hospital, Wake-up). 

 This Code system is referenced in the content logical definition of the following value sets: 

* [StrokeCircumstanceCodesVS](ValueSet-stroke-circumstance-codes-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "stroke-circumstance-codes-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/stroke-circumstance-codes-cs",
  "version" : "0.1.0",
  "name" : "StrokeCircumstanceCodesCS",
  "title" : "Stroke Circumstance Codes CodeSystem",
  "status" : "active",
  "date" : "2026-02-09T11:30:19+00:00",
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
  "description" : "Codes for findings related to the circumstances of stroke onset (In-hospital, Wake-up).",
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "in-hospital",
      "display" : "In-hospital Stroke",
      "definition" : "Indicates that the stroke occurred while the patient was already admitted to the hospital for another reason."
    },
    {
      "code" : "wake-up",
      "display" : "Wake-up Stroke",
      "definition" : "Indicates that the stroke symptoms were first noticed upon waking from sleep, with an unknown time of onset."
    }
  ]
}

```
