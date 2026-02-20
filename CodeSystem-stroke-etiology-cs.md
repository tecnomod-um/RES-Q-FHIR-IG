# Stroke Etiology CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Etiology CodeSystem**

## CodeSystem: Stroke Etiology CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/stroke-etiology-cs | *Version*:0.1.0 |
| Active as of 2025-10-07 | *Computable Name*:StrokeEtiologyCS |
| **Copyright/Legal**: © Tecnomod. This CodeSystem is provided for use within this Implementation Guide. | |

 
Local CodeSystem defining categories for **ischemic stroke etiology** classification. 
**Primary use-case** 
* Used via `StrokeEtiologyVS` as the required vocabulary for `StrokeStrokeEtiologyExt.valueCodeableConcept` on a definitive ischemic stroke Condition.
 
**Why it exists** 
* Stroke etiology classification often mixes internationally standard categories (cardioembolic, lacunar, cryptogenic) with local operational buckets.
 
**Modeling notes** 
* This CodeSystem is intended for “final etiology classification” after diagnostic workup, not for provisional hypotheses.
 

 
To provide locally governed codes for classifying ischemic stroke etiology. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [StrokeEtiologyVS](ValueSet-stroke-etiology-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "stroke-etiology-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/stroke-etiology-cs",
  "version" : "0.1.0",
  "name" : "StrokeEtiologyCS",
  "title" : "Stroke Etiology CodeSystem",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-07",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Local CodeSystem defining categories for **ischemic stroke etiology** classification.\n\n**Primary use-case**\n- Used via `StrokeEtiologyVS` as the required vocabulary for `StrokeStrokeEtiologyExt.valueCodeableConcept`\n  on a definitive ischemic stroke Condition.\n\n**Why it exists**\n- Stroke etiology classification often mixes internationally standard categories (cardioembolic, lacunar, cryptogenic) with local operational buckets.\n\n**Modeling notes**\n- This CodeSystem is intended for “final etiology classification” after diagnostic workup, not for provisional hypotheses.",
  "purpose" : "To provide locally governed codes for classifying ischemic stroke etiology.",
  "copyright" : "© Tecnomod. This CodeSystem is provided for use within this Implementation Guide.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "atherosclerosis",
    "display" : "Stroke Etiology Atherosclerosis",
    "definition" : "Specifies that large artery atherosclerosis (for example, significant stenosis in the carotid or basilar arteries) was identified as the cause of the stroke."
  },
  {
    "code" : "other",
    "display" : "Stroke Etiology Other",
    "definition" : "Specifies that the stroke etiology falls into a rarer category not covered by the main classifications, such as vasculitis or hypercoagulable states."
  }]
}

```
