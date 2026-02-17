# Initial Care Intensity Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Initial Care Intensity Code System**

## CodeSystem: Initial Care Intensity Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/initial-care-intensity-cs | *Version*:0.1.0 |
| Active as of 2026-02-17 | *Computable Name*:InitialCareIntensityCS |

 
Codes indicating the level of care provided during the patient's initial day(s) in the hospital. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [InitialCareIntensityVS](ValueSet-initial-care-intensity-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "initial-care-intensity-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/initial-care-intensity-cs",
  "version" : "0.1.0",
  "name" : "InitialCareIntensityCS",
  "title" : "Initial Care Intensity Code System",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-17T08:59:32+00:00",
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
  "description" : "Codes indicating the level of care provided during the patient's initial day(s) in the hospital.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "standard",
      "display" : "Standard Bed",
      "definition" : "Patient placed in a standard hospital bed without continuous monitoring."
    },
    {
      "code" : "monitored",
      "display" : "Monitored Bed",
      "definition" : "Patient placed in a bed with continuous telemetry or other monitoring (outside ICU)."
    },
    {
      "code" : "icu-stroke",
      "display" : "ICU / Stroke Unit",
      "definition" : "Patient placed in an Intensive Care Unit or specialized Stroke Unit."
    }
  ]
}

```
