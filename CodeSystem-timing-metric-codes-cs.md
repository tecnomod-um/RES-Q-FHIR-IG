# Stroke Timing Metric Codes CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Timing Metric Codes CodeSystem**

## CodeSystem: Stroke Timing Metric Codes CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/timing-metric-codes-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:TimingMetricCodesCS |

 
This CodeSystem defines codes for key time-interval process metrics in acute stroke care used for quality monitoring and pathway optimization. Each code represents a duration measured in minutes between two clinically meaningful events (e.g., hospital arrival to thrombolysis start). 
These metrics are commonly used in performance dashboards, registry submissions, and quality improvement programs. The intent is to store the **measured interval** (a duration) in Observation.valueQuantity (UCUM minutes), while event timestamps (arrival time, needle time, groin puncture time) may be stored separately when available. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TimingMetricCodesVS](ValueSet-timing-metric-codes-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "timing-metric-codes-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/timing-metric-codes-cs",
  "version" : "0.1.0",
  "name" : "TimingMetricCodesCS",
  "title" : "Stroke Timing Metric Codes CodeSystem",
  "status" : "active",
  "date" : "2026-02-19T11:36:03+00:00",
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
  "description" : "This CodeSystem defines codes for key time-interval process metrics in acute stroke care used for quality monitoring and pathway optimization. Each code represents a duration measured in minutes between two clinically meaningful events (e.g., hospital arrival to thrombolysis start).\n\nThese metrics are commonly used in performance dashboards, registry submissions, and quality improvement programs. The intent is to store the *measured interval* (a duration) in Observation.valueQuantity (UCUM minutes), while event timestamps (arrival time, needle time, groin puncture time) may be stored separately when available.",
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "D2G",
      "display" : "Door to Groin",
      "definition" : "Elapsed time (minutes) from documented hospital arrival (‘door’) to arterial groin puncture for mechanical thrombectomy (first puncture attempt)."
    },
    {
      "code" : "D2N",
      "display" : "Door to Needle",
      "definition" : "Elapsed time (minutes) from documented hospital arrival (‘door’) to initiation of intravenous thrombolysis (commonly alteplase/tenecteplase administration start, per local definition)."
    }
  ]
}

```
