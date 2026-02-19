# Thrombectomy Complication CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Thrombectomy Complication CodeSystem**

## CodeSystem: Thrombectomy Complication CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/thrombectomy-complication-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:ThrombectomyComplicationCS |

 
Local CodeSystem for complications occurring during mechanical thrombectomy. 
**When to use** 
* If you need a controlled internal vocabulary for adverse events/complications, especially when upstream systems do not provide SNOMED-coded diagnoses.
 
**How it is used in FHIR R5** 
* Usually referenced from `Procedure.complication` which is a `CodeableReference(Condition)` in R5.
* You may represent the complication as a `Condition` (preferred), and/or record a code directly depending on your implementation pattern.
 
**Why it exists** 
* Supports minimum-set reporting across sites and enables consistent quality/safety analytics.
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ThrombectomyComplicationVS](ValueSet-thrombectomy-complication-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "thrombectomy-complication-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/thrombectomy-complication-cs",
  "version" : "0.1.0",
  "name" : "ThrombectomyComplicationCS",
  "title" : "Thrombectomy Complication CodeSystem",
  "status" : "active",
  "date" : "2026-02-19T14:52:32+00:00",
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
  "description" : "Local CodeSystem for complications occurring during mechanical thrombectomy.\n\n**When to use**\n- If you need a controlled internal vocabulary for adverse events/complications, especially when upstream systems do not provide SNOMED-coded diagnoses.\n\n**How it is used in FHIR R5**\n- Usually referenced from `Procedure.complication` which is a `CodeableReference(Condition)` in R5.\n- You may represent the complication as a `Condition` (preferred), and/or record a code directly depending on your implementation pattern.\n\n**Why it exists**\n- Supports minimum-set reporting across sites and enables consistent quality/safety analytics.",
  "content" : "complete",
  "count" : 1,
  "concept" : [
    {
      "code" : "perforation",
      "display" : "Vessel Perforation",
      "definition" : "Vessel perforation occurred during the mechanical thrombectomy"
    }
  ]
}

```
