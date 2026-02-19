# Assessment Context Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Assessment Context Code System**

## CodeSystem: Assessment Context Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/assessment-context-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:AssessmentContextCS |

 
This CodeSystem defines normalized codes for the clinical context / relative timepoint at which a stroke-related assessment was performed. It is primarily used to contextualize functional and severity instruments (e.g., mRS and NIHSS) where interpretation depends on whether the score reflects baseline status, acute presentation, discharge status, or follow-up. 
These codes represent **relative phases** (pre-stroke baseline, admission, discharge, ~3-month follow-up) rather than precise timestamps. The actual date/time of measurement should be recorded in Observation.effective[x] when known; the context code complements effective[x] by expressing the clinical phase, which is often necessary for reporting and comparability (e.g., “mRS pre-stroke” vs “mRS at discharge”). 

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
  "description" : "This CodeSystem defines normalized codes for the clinical context / relative timepoint at which a stroke-related assessment was performed. It is primarily used to contextualize functional and severity instruments (e.g., mRS and NIHSS) where interpretation depends on whether the score reflects baseline status, acute presentation, discharge status, or follow-up.\n\nThese codes represent *relative phases* (pre-stroke baseline, admission, discharge, ~3-month follow-up) rather than precise timestamps. The actual date/time of measurement should be recorded in Observation.effective[x] when known; the context code complements effective[x] by expressing the clinical phase, which is often necessary for reporting and comparability (e.g., “mRS pre-stroke” vs “mRS at discharge”).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
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
    }
  ]
}

```
