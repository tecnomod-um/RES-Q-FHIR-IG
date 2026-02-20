# Discharge Department/Service CodeSystem - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Discharge Department/Service CodeSystem**

## CodeSystem: Discharge Department/Service CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/discharge-dept-cs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:DischargeDeptCS |

 
Local CodeSystem representing the **clinical service/department** responsible for the patient at discharge/transfer (or the service the patient is transferred to). 
**Primary use-case** 
* Populate `DischargeDepartmentServiceExtension` on Encounter to support: 
* bed management and service-level reporting,
* pathway characterization (e.g., discharge under neurology vs rehab),
* operational analytics and capacity planning.
 
 
**Modeling notes** 
* This captures **service classification**, not the physical ward/room. Physical location should be modeled using `Encounter.location` (and references to Location resources) if needed.
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [DischargeDeptVS](ValueSet-discharge-dept-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "discharge-dept-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/discharge-dept-cs",
  "version" : "1.0.0",
  "name" : "DischargeDeptCS",
  "title" : "Discharge Department/Service CodeSystem",
  "status" : "active",
  "date" : "2026-02-20T10:05:07+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Local CodeSystem representing the **clinical service/department** responsible for the patient at discharge/transfer\n(or the service the patient is transferred to).\n\n**Primary use-case**\n- Populate `DischargeDepartmentServiceExtension` on Encounter to support:\n  - bed management and service-level reporting,\n  - pathway characterization (e.g., discharge under neurology vs rehab),\n  - operational analytics and capacity planning.\n\n**Modeling notes**\n- This captures *service classification*, not the physical ward/room. Physical location should be modeled using `Encounter.location`\n  (and references to Location resources) if needed.",
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "acute",
    "display" : "Acute Rehabilitation",
    "definition" : "Patient discharged to an acute rehabilitation setting."
  },
  {
    "code" : "post-care",
    "display" : "Post Care Bed",
    "definition" : "Patient discharged to a post care bed."
  },
  {
    "code" : "neurology",
    "display" : "Neurology",
    "definition" : "Patient discharged to a neurology department or service."
  },
  {
    "code" : "another-department",
    "display" : "Another Department",
    "definition" : "Patient discharged to a different department within the same hospital."
  }]
}

```
