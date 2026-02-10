# Stroke Procedure Not Done Reason Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Procedure Not Done Reason Code System**

## CodeSystem: Stroke Procedure Not Done Reason Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/stroke-proc-not-done-reason-cs | *Version*:0.1.0 |
| Active as of 2026-02-10 | *Computable Name*:StrokeProcNotDoneReasonCS |

 
Codes specifying the reason principal for not performing a key stroke procedure (Thrombolysis, Thrombectomy). 

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
  "title" : "Stroke Procedure Not Done Reason Code System",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-10T07:57:24+00:00",
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
  "description" : "Codes specifying the reason principal for not performing a key stroke procedure (Thrombolysis, Thrombectomy).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 16,
  "concept" : [
    {
      "code" : "time-window",
      "display" : "Outside Therapeutic Window",
      "definition" : "Patient presented or evaluated outside the established time limit for the procedure."
    },
    {
      "code" : "no-lvo",
      "display" : "No Large Vessel Occlusion (LVO)",
      "definition" : "An eligible large vessel occlusion for thrombectomy was not identified."
    },
    {
      "code" : "contraindication",
      "display" : "Contraindication Present",
      "definition" : "A medical contraindication to the procedure existed (e.g., bleeding risk)."
    },
    {
      "code" : "patient-refusal",
      "display" : "Patient/Family Refusal",
      "definition" : "The patient or their legal representative refused the procedure."
    },
    {
      "code" : "transfer",
      "display" : "Transferred to Another Facility",
      "definition" : "The patient was transferred to another hospital for the procedure."
    },
    {
      "code" : "unavailable",
      "display" : "Procedure Unavailable",
      "definition" : "The procedure was not available at the facility (e.g., lack of equipment, staff)."
    },
    {
      "code" : "disability",
      "display" : "Severe Preexisting Disability",
      "definition" : "Patient's baseline disability made benefit from the procedure unlikely."
    },
    {
      "code" : "mild-deficit",
      "display" : "Mild Deficit",
      "definition" : "Patient's neurological deficit was too mild to warrant the procedure."
    },
    {
      "code" : "done-elsewhere",
      "display" : "Performed Elsewhere",
      "definition" : "The procedure had already been performed at another facility prior to arrival/transfer."
    },
    {
      "code" : "cost",
      "display" : "Cost / No Insurance",
      "definition" : "Financial or coverage reasons prevented the procedure."
    },
    {
      "code" : "unknown",
      "display" : "Reason Unknown",
      "definition" : "The reason was not documented or is unknown."
    },
    {
      "code" : "consent",
      "display" : "Consent Not Obtained",
      "definition" : "Informed consent for the procedure was not obtained."
    },
    {
      "code" : "only-mt",
      "display" : "Only Mechanical Thrombectomy Considered",
      "definition" : "Only mechanical thrombectomy was considered, and thrombolysis was not performed."
    },
    {
      "code" : "other",
      "display" : "Other Reason",
      "definition" : "A reason not specifically defined."
    },
    {
      "code" : "technically-not-possible",
      "display" : "Technically Not Possible",
      "definition" : "The procedure could not be performed due to technical or anatomical challenges."
    },
    {
      "code" : "no-angiography",
      "display" : "Angiography Not Performed",
      "definition" : "Angiography to assess the situation was not performed."
    }
  ]
}

```
