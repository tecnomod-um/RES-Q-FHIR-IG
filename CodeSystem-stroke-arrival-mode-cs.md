# Stroke Arrival Mode CodeSystem - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Arrival Mode CodeSystem**

## CodeSystem: Stroke Arrival Mode CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/stroke-arrival-mode-cs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeArrivalModeCS |

 
Local CodeSystem describing **how and from where** the patient arrived to the treating hospital for the index stroke encounter. 
**Primary use-case** 
* Populate `Encounter.admission.admitSource` (via StrokeArrivalModeVS) to support: 
* workflow analysis (EMS vs private transport),
* pathway compliance reporting (direct-to-stroke-center vs inter-facility transfer),
* operational dashboards and registries.
 
 
**Modeling notes** 
* These codes describe **arrival origin and transport pathway**, not clinical triage severity.
* If you need transport timestamps, EMS unit identifiers, or handover details, model them separately
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [StrokeArrivalModeVS](ValueSet-stroke-arrival-mode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "stroke-arrival-mode-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/stroke-arrival-mode-cs",
  "version" : "1.0.0",
  "name" : "StrokeArrivalModeCS",
  "title" : "Stroke Arrival Mode CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-20T10:05:07+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Local CodeSystem describing **how and from where** the patient arrived to the treating hospital for the index stroke encounter.\n\n**Primary use-case**\n- Populate `Encounter.admission.admitSource` (via StrokeArrivalModeVS) to support:\n  - workflow analysis (EMS vs private transport),\n  - pathway compliance reporting (direct-to-stroke-center vs inter-facility transfer),\n  - operational dashboards and registries.\n\n**Modeling notes**\n- These codes describe *arrival origin and transport pathway*, not clinical triage severity.\n- If you need transport timestamps, EMS unit identifiers, or handover details, model them separately ",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
    "code" : "priv-transport-home",
    "display" : "Private Transportation from Home/Scene",
    "definition" : "The patient arrived via personal or non-medical transport from their home or directly from the scene of the incident."
  },
  {
    "code" : "priv-transport-gp",
    "display" : "Private Transportation from GP",
    "definition" : "The patient was referred and transported privately from GP."
  },
  {
    "code" : "ems-gp",
    "display" : "EMS from GP",
    "definition" : "Emergency Medical Services (EMS) transported the patient from GP."
  },
  {
    "code" : "stroke-center",
    "display" : "Stroke Center",
    "definition" : "The patient was transferred from a specialized stroke center, indicating prior specialized care"
  },
  {
    "code" : "ems-home",
    "display" : "EMS from Home",
    "definition" : "Emergency Medical Services (EMS) transported the patient from their home or directly from the scene where the stroke symptoms began."
  },
  {
    "code" : "another-hosp",
    "display" : "Another Hospital",
    "definition" : "The patient was transferred from another hospital"
  }]
}

```
