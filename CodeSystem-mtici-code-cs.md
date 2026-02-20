# Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem**

## CodeSystem: Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/mtici-code-cs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:MTICICodeCS |

 
This CodeSystem defines the **assessment concept code** used to indicate that an Observation is reporting an mTICI reperfusion grade. 
**Design pattern** 
* `Observation.code` identifies the kind of assessment (“mTICI reperfusion grade”).
* `Observation.valueCodeableConcept` carries the result (one of the grades in MticiScoreVS).
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [MTICICodeVS](ValueSet-mtici-code-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mtici-code-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/mtici-code-cs",
  "version" : "1.0.0",
  "name" : "MTICICodeCS",
  "title" : "Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-20T10:31:35+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This CodeSystem defines the *assessment concept code* used to indicate that an Observation is reporting an mTICI reperfusion grade.\n\n**Design pattern**\n- `Observation.code` identifies the kind of assessment (“mTICI reperfusion grade”).\n- `Observation.valueCodeableConcept` carries the result (one of the grades in MticiScoreVS).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 1,
  "concept" : [{
    "code" : "mTICI",
    "display" : "mTICI",
    "definition" : "Assessment concept representing the modified Thrombolysis in Cerebral Infarction reperfusion grade to be reported as an Observation value."
  }]
}

```
