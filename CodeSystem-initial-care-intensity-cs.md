# Initial Care Intensity CodeSystem - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Initial Care Intensity CodeSystem**

## CodeSystem: Initial Care Intensity CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/initial-care-intensity-cs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:InitialCareIntensityCS |

 
Local CodeSystem representing the **initial intensity of care** during the first day(s) of the stroke encounter. 
**Primary use-case** 
* Populate `InitialCareIntensityExtension` on Encounter to support: 
* case-mix characterization (ICU/stroke unit vs monitored vs standard bed),
* operational benchmarking and staffing analysis,
* research stratification where initial level-of-care is a confounder.
 
 
**Interpretation guidance** 
* `standard`: no continuous monitoring beyond standard nursing observation.
* `monitored`: telemetry or continuous monitoring outside ICU.
* `icu-stroke`: ICU or dedicated stroke unit level care (per local definitions).
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [InitialCareIntensityVS](ValueSet-initial-care-intensity-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "initial-care-intensity-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/initial-care-intensity-cs",
  "version" : "1.0.0",
  "name" : "InitialCareIntensityCS",
  "title" : "Initial Care Intensity CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-20T09:50:49+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Local CodeSystem representing the **initial intensity of care** during the first day(s) of the stroke encounter.\n\n**Primary use-case**\n- Populate `InitialCareIntensityExtension` on Encounter to support:\n  - case-mix characterization (ICU/stroke unit vs monitored vs standard bed),\n  - operational benchmarking and staffing analysis,\n  - research stratification where initial level-of-care is a confounder.\n\n**Interpretation guidance**\n- `standard`: no continuous monitoring beyond standard nursing observation.\n- `monitored`: telemetry or continuous monitoring outside ICU.\n- `icu-stroke`: ICU or dedicated stroke unit level care (per local definitions).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "standard",
    "display" : "Standard bed",
    "definition" : "Patient placed in a standard inpatient bed without continuous telemetry/continuous physiologic monitoring."
  },
  {
    "code" : "monitored",
    "display" : "Monitored bed",
    "definition" : "Patient placed in a monitored setting (e.g., telemetry) without full ICU-level care."
  },
  {
    "code" : "icu-stroke",
    "display" : "ICU / Stroke Unit",
    "definition" : "Patient managed in an ICU or specialized stroke unit providing high-intensity care and monitoring."
  }]
}

```
