# mTICI Score Codes CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mTICI Score Codes CodeSystem**

## CodeSystem: mTICI Score Codes CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/mtici-code-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:MTICICodeCS |

 
This CodeSystem defines the assessment concept code(s) used to indicate that an Observation is reporting an mTICI reperfusion grade. It is intentionally separated from the MticiScoreCS CodeSystem, which contains the actual mTICI grade values (0–3 with 2a/2b/2c). 
In practice: 
* Observation.code identifies the **kind of measurement/assessment** (“mTICI reperfusion grade”).
* Observation.valueCodeableConcept carries the **result** (one of the mTICI grades from MticiScoreVS).
 
This separation improves semantic clarity and supports consistent validation and analytics across systems. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [MTICICodeVS](ValueSet-mtici-code-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mtici-code-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/mtici-code-cs",
  "version" : "0.1.0",
  "name" : "MTICICodeCS",
  "title" : "mTICI Score Codes CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-19T08:12:22+00:00",
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
  "description" : "This CodeSystem defines the assessment concept code(s) used to indicate that an Observation is reporting an mTICI reperfusion grade. It is intentionally separated from the MticiScoreCS CodeSystem, which contains the actual mTICI grade values (0–3 with 2a/2b/2c).\n\nIn practice:\n- Observation.code identifies the *kind of measurement/assessment* (“mTICI reperfusion grade”).\n- Observation.valueCodeableConcept carries the *result* (one of the mTICI grades from MticiScoreVS).\n\nThis separation improves semantic clarity and supports consistent validation and analytics across systems.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 1,
  "concept" : [
    {
      "code" : "mTICI",
      "display" : "mTICI",
      "definition" : "Assessment concept representing the modified Thrombolysis in Cerebral Infarction reperfusion grade to be reported as an Observation value."
    }
  ]
}

```
