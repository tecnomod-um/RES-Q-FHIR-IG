# Swallowing Screening Timing Category CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Swallowing Screening Timing Category CodeSystem**

## CodeSystem: Swallowing Screening Timing Category CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/swallow-screen-time-cs | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:SwallowScreenTimeCS |

 
Local CodeSystem that categorizes when a swallowing screening occurred relative to stroke onset/admission. 
**Primary use-case** 
* Support process metrics such as “screening completed within 4 hours”.
 
**FHIR placement** 
* Used as a CodeableConcept in a Procedure extension (`SwallowingScreeningTimingCategoryExt`).
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SwallowingScreeningTimingCategoryVS](ValueSet-swallowing-screening-timing-category-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "swallow-screen-time-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/swallow-screen-time-cs",
  "version" : "0.1.0",
  "name" : "SwallowScreenTimeCS",
  "title" : "Swallowing Screening Timing Category CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-20T09:39:34+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Local CodeSystem that categorizes when a swallowing screening occurred relative to stroke onset/admission.\n\n**Primary use-case**\n- Support process metrics such as “screening completed within 4 hours”.\n\n**FHIR placement**\n- Used as a CodeableConcept in a Procedure extension (`SwallowingScreeningTimingCategoryExt`).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 1,
  "concept" : [{
    "code" : "T4H",
    "display" : "Within 4 hours",
    "definition" : "Screening performed within 4 hours of symptom onset."
  }]
}

```
