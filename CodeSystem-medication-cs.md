# Discharge Medication Category CodeSystem - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Discharge Medication Category CodeSystem**

## CodeSystem: Discharge Medication Category CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/medication-cs | *Version*:1.0.0 |
| Draft as of 2026-02-20 | *Computable Name*:MedicationCS |

 
Local CodeSystem providing **coarse medication categories** used in discharge prescribing when the source system cannot (or does not) provide a specific coded drug product/substance. 
**Primary use-cases** 
* Minimum-data capture for discharge medication classes relevant to stroke secondary prevention (e.g., anticoagulant vs antiplatelet).
* Registry reporting where only “medication class prescribed at discharge” is available.
* Analytics and quality indicators (e.g., “antithrombotic at discharge”) when specific agent is unknown.
 
**How it is used in FHIR** 
* Included in `MedicationVS` so it can be used in `MedicationRequest.medication` (CodeableConcept).
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [MedicationVS](ValueSet-medication-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "medication-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/medication-cs",
  "version" : "1.0.0",
  "name" : "MedicationCS",
  "title" : "Discharge Medication Category CodeSystem",
  "status" : "draft",
  "date" : "2026-02-20T10:17:22+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Local CodeSystem providing **coarse medication categories** used in discharge prescribing when the source system cannot\n(or does not) provide a specific coded drug product/substance.\n\n**Primary use-cases**\n- Minimum-data capture for discharge medication classes relevant to stroke secondary prevention (e.g., anticoagulant vs antiplatelet).\n- Registry reporting where only “medication class prescribed at discharge” is available.\n- Analytics and quality indicators (e.g., “antithrombotic at discharge”) when specific agent is unknown.\n\n**How it is used in FHIR**\n- Included in `MedicationVS` so it can be used in `MedicationRequest.medication` (CodeableConcept).\n",
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "other-anticoagulant",
    "display" : "Other Anticoagulant",
    "definition" : "Any anticoagulant medication"
  },
  {
    "code" : "antiplatelet",
    "display" : "Any Antiplatelet",
    "definition" : "Any antiplatelet medication"
  },
  {
    "code" : "antidiabetic",
    "display" : "Any Antidiabetic",
    "definition" : "Any antidiabetic medication"
  },
  {
    "code" : "other",
    "display" : "Other Medication",
    "definition" : "A medication other than those specifically listed was prescribed at discharge"
  }]
}

```
