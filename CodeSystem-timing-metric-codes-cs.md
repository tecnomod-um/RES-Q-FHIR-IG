# Stroke Timing Metric Codes CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Timing Metric Codes CodeSystem**

## CodeSystem: Stroke Timing Metric Codes CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/timing-metric-codes-cs | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:TimingMetricCodesCS |

 
This CodeSystem defines codes for key **time-interval process metrics** in acute stroke care. Each code represents a duration measured between two clinically meaningful events (e.g., arrival to thrombolysis start). 
**Primary use-case** 
* Use as `Observation.code` in `TimingMetricObservationProfile`.
* Store the measured interval in `Observation.valueQuantity` with UCUM minutes (`min`).
 

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
  "date" : "2026-02-20T09:39:34+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This CodeSystem defines codes for key **time-interval process metrics** in acute stroke care.\nEach code represents a duration measured between two clinically meaningful events (e.g., arrival to thrombolysis start).\n\n**Primary use-case**\n- Use as `Observation.code` in `TimingMetricObservationProfile`.\n- Store the measured interval in `Observation.valueQuantity` with UCUM minutes (`min`).",
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "D2G",
    "display" : "Door to Groin",
    "definition" : "Elapsed time (minutes) from documented hospital arrival (‘door’) to arterial groin puncture for mechanical thrombectomy (first puncture attempt)."
  },
  {
    "code" : "D2N",
    "display" : "Door to Needle",
    "definition" : "Elapsed time (minutes) from documented hospital arrival (‘door’) to initiation of intravenous thrombolysis (commonly alteplase/tenecteplase administration start, per local definition)."
  }]
}

```
