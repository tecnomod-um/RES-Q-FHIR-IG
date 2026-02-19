# Stroke Procedure Not Done Reasons CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Procedure Not Done Reasons CodeSystem**

## CodeSystem: Stroke Procedure Not Done Reasons CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/stroke-proc-not-done-reason-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:StrokeProcNotDoneReasonCS |

 
Local CodeSystem enumerating standardized reasons why a key stroke procedure (e.g., IV thrombolysis or mechanical thrombectomy) was **not performed**. 
**Primary use-case** 
* Populate `Procedure.statusReason` when `Procedure.status = not-done`.
 
**Why it matters** 
* Captures the difference between: 
* clinical ineligibility (contraindication),
* time-based ineligibility (outside window),
* operational constraints (unavailable),
* patient choice (refusal),
* care pathway differences (performed elsewhere / transfer).
 
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [StrokeProcNotDoneReasonVS](ValueSet-stroke-proc-not-done-reason-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "stroke-proc-not-done-reason-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/stroke-proc-not-done-reason-cs",
  "version" : "0.1.0",
  "name" : "StrokeProcNotDoneReasonCS",
  "title" : "Stroke Procedure Not Done Reasons CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-19T14:25:22+00:00",
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
  "description" : " Local CodeSystem enumerating standardized reasons why a key stroke procedure (e.g., IV thrombolysis or mechanical thrombectomy) was **not performed**.\n\n**Primary use-case**\n- Populate `Procedure.statusReason` when `Procedure.status = not-done`.\n\n**Why it matters**\n- Captures the difference between:\n  - clinical ineligibility (contraindication),\n  - time-based ineligibility (outside window),\n  - operational constraints (unavailable),\n  - patient choice (refusal),\n  - care pathway differences (performed elsewhere / transfer).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 16,
  "concept" : [
    {
      "code" : "time-window",
      "display" : "Outside therapeutic window",
      "definition" : "The patient presented/evaluated outside the time window defined by protocol/guidelines for benefit."
    },
    {
      "code" : "no-lvo",
      "display" : "No Large Vessel Occlusion (LVO)",
      "definition" : "No eligible large vessel occlusion for thrombectomy was identified."
    },
    {
      "code" : "contraindication",
      "display" : "Contraindication present",
      "definition" : "A medical contraindication existed (e.g., bleeding risk or other high-risk factor)."
    },
    {
      "code" : "patient-refusal",
      "display" : "Patient/family refusal",
      "definition" : "The patient or legal representative declined the intervention after discussion."
    },
    {
      "code" : "transfer",
      "display" : "Transferred to another facility",
      "definition" : "The patient was transferred to a different facility for the intervention."
    },
    {
      "code" : "unavailable",
      "display" : "Procedure unavailable",
      "definition" : "The facility could not provide the procedure (equipment, staffing, service availability)."
    },
    {
      "code" : "disability",
      "display" : "Severe preexisting disability",
      "definition" : "Baseline disability made benefit unlikely per clinical judgement/protocol."
    },
    {
      "code" : "mild-deficit",
      "display" : "Mild deficit",
      "definition" : "Neurological deficit severity was judged too mild to justify risk/benefit."
    },
    {
      "code" : "done-elsewhere",
      "display" : "Performed elsewhere",
      "definition" : "The procedure had already been performed at another facility prior to arrival/transfer."
    },
    {
      "code" : "cost",
      "display" : "Cost / no insurance",
      "definition" : "Financial or coverage constraints prevented the procedure (use only where applicable)."
    },
    {
      "code" : "unknown",
      "display" : "Reason unknown",
      "definition" : "Reason was not documented or is unknown."
    },
    {
      "code" : "consent",
      "display" : "Consent not obtained",
      "definition" : "Informed consent required for the procedure was not obtained."
    },
    {
      "code" : "only-mt",
      "display" : "Only mechanical thrombectomy considered",
      "definition" : "Only MT was considered; IV thrombolysis was not performed."
    },
    {
      "code" : "technically-not-possible",
      "display" : "Technically not possible",
      "definition" : "Technical/anatomical factors prevented completion."
    },
    {
      "code" : "no-angiography",
      "display" : "Angiography not performed",
      "definition" : "Required angiographic assessment was not performed."
    },
    {
      "code" : "other",
      "display" : "Other reason",
      "definition" : "Other reason not listed. Prefer adding explanatory text in statusReason.text where possible."
    }
  ]
}

```
