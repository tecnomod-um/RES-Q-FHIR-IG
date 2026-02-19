# Stroke Circumstance Codes CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Circumstance Codes CodeSystem**

## CodeSystem: Stroke Circumstance Codes CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/stroke-circumstance-codes-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:StrokeCircumstanceCodesCS |

 
This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant for eligibility decisions, diagnostic reasoning, and reporting—particularly when the exact onset time is unknown or atypical. 
These codes are intended to be used as Observation.code in the StrokeCircumstanceObservationProfile to assert that a given onset circumstance applies to the index stroke event. They do not encode the precise onset timestamp, last-known-well time, or location of onset; those details should be represented separately (e.g., dedicated Observations, Encounter/Condition attributes, or extensions). 

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
  "date" : "2026-02-19T10:59:57+00:00",
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
  "description" : " This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant for eligibility decisions, diagnostic reasoning, and reporting—particularly when the exact onset time is unknown or atypical.\n\nThese codes are intended to be used as Observation.code in the StrokeCircumstanceObservationProfile to assert that a given onset circumstance applies to the index stroke event. They do not encode the precise onset timestamp, last-known-well time, or location of onset; those details should be represented separately (e.g., dedicated Observations, Encounter/Condition attributes, or extensions).",
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "in-hospital",
      "display" : "In-hospital Stroke",
      "definition" : "Indicates that stroke onset occurred while the patient was already admitted to the hospital for another reason (inpatient onset)."
    },
    {
      "code" : "wake-up",
      "display" : "Wake-up Stroke",
      "definition" : "Indicates that stroke symptoms were first recognized on awakening from sleep, implying an unknown onset time within the sleep interval (time last known well precedes symptom recognition)."
    }
  ]
}

```
