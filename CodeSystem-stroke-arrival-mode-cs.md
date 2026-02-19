# Initial Care Intensity Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Initial Care Intensity Code System**

## CodeSystem: Initial Care Intensity Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/stroke-arrival-mode-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:StrokeArrivalModeCS |

 
Codes indicating the level of care provided during the patient's initial day(s) in the hospital. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [StrokeArrivalModeVS](ValueSet-stroke-arrival-mode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "stroke-arrival-mode-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/stroke-arrival-mode-cs",
  "version" : "0.1.0",
  "name" : "StrokeArrivalModeCS",
  "title" : "Initial Care Intensity Code System",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-19T10:15:59+00:00",
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
  "count" : 6,
  "concept" : [
    {
      "code" : "priv-transport-home",
      "display" : "Private Transportation from Home/Scene",
      "definition" : "The patient arrived via personal or non-medical transport from their home or directly from the scene of the incident."
    },
    {
      "code" : "priv-transport-gp",
      "display" : "Private Transportation from GP",
      "definition" : "The patient was referred and transported privately from GP."
    },
    {
      "code" : "ems-gp",
      "display" : "EMS from GP",
      "definition" : "Emergency Medical Services (EMS) transported the patient from GP."
    },
    {
      "code" : "stroke-center",
      "display" : "Stroke Center",
      "definition" : "The patient was transferred from a specialized stroke center, indicating prior specialized care"
    },
    {
      "code" : "ems-home",
      "display" : "EMS from Home",
      "definition" : "Emergency Medical Services (EMS) transported the patient from their home or directly from the scene where the stroke symptoms began."
    },
    {
      "code" : "another-hosp",
      "display" : "Another Hospital",
      "definition" : "The patient was transferred from another hospital"
    }
  ]
}

```
