# Assessment Context Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Assessment Context Code System**

## CodeSystem: Assessment Context Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/assessment-context-cs | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:AssessmentContextCS |

 
This CodeSystem defines normalized codes for the **clinical context / relative timepoint** at which a stroke-related assessment is performed. It is primarily used to contextualize instruments whose interpretation depends on phase (e.g., mRS/NIHSS at baseline vs discharge vs follow-up). 
**Primary use-case** 
* Use as the value in `ObservationTimingContextExtension.valueCodeableConcept` to label the phase of an assessment.
 
**How it complements effective[x]** 
* `Observation.effective[x]` records the actual date/time (when known).
* This CodeSystem records the standardized phase label used for reporting and comparability.
 
**Why this is needed** 
* Many workflows report outcomes by phase even when the exact timestamp is unknown or operationally variable (“mRS at 90 days”).
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [AssessmentContextVS](ValueSet-assessment-context-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "assessment-context-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/assessment-context-cs",
  "version" : "0.1.0",
  "name" : "AssessmentContextCS",
  "title" : "Assessment Context Code System",
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
  "description" : "This CodeSystem defines normalized codes for the **clinical context / relative timepoint** at which a stroke-related assessment is performed.\nIt is primarily used to contextualize instruments whose interpretation depends on phase (e.g., mRS/NIHSS at baseline vs discharge vs follow-up).\n\n**Primary use-case**\n- Use as the value in `ObservationTimingContextExtension.valueCodeableConcept` to label the phase of an assessment.\n\n**How it complements effective[x]**\n- `Observation.effective[x]` records the actual date/time (when known).\n- This CodeSystem records the standardized phase label used for reporting and comparability.\n\n**Why this is needed**\n- Many workflows report outcomes by phase even when the exact timestamp is unknown or operationally variable (“mRS at 90 days”).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "pre-stroke",
    "display" : "Pre-stroke",
    "definition" : "Assessment reflects the patient’s baseline state prior to the index stroke event (pre-morbid status), typically derived from history or collateral information."
  },
  {
    "code" : "admission",
    "display" : "Admission",
    "definition" : "Assessment performed at, or shortly after, presentation/admission for the index stroke event (acute phase baseline for in-hospital care)."
  },
  {
    "code" : "discharge",
    "display" : "Discharge",
    "definition" : "Assessment performed at the time of discharge from the acute admission (or the end of the index hospitalization episode)."
  },
  {
    "code" : "3-month",
    "display" : "3-Month Follow-up",
    "definition" : "Assessment performed at approximately 3 months (≈90 days) after discharge/index event, acknowledging operational windows used in routine follow-up and research."
  }]
}

```
