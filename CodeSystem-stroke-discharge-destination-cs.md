# Stroke Discharge Destination CodeSystem - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Discharge Destination CodeSystem**

## CodeSystem: Stroke Discharge Destination CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/stroke-discharge-destination-cs | *Version*:1.0.0 |
| Active as of 2026-02-24 | *Computable Name*:StrokeDischargeDestinationCS |

 
Local CodeSystem for discharge disposition values that are not sufficiently covered (or not consistently available) in the chosen standard terminology set. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [StrokeDischargeDestinationVS](ValueSet-stroke-discharge-destination-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "stroke-discharge-destination-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/stroke-discharge-destination-cs",
  "version" : "1.0.0",
  "name" : "StrokeDischargeDestinationCS",
  "title" : "Stroke Discharge Destination CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-24T10:24:43+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Local CodeSystem for discharge disposition values that are not sufficiently covered (or not consistently available)\nin the chosen standard terminology set.",
  "content" : "complete",
  "count" : 1,
  "concept" : [{
    "code" : "dead",
    "display" : "Patient Deceased",
    "definition" : "The patient died during the hospital stay."
  }]
}

```
