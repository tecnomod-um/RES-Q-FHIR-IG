# Stroke Encounter Profile - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Encounter Profile**

## Resource Profile: Stroke Encounter Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/stroke-encounter-profile | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeEncounterProfile |

 
Profile for an Encounter representing a patient's **inpatient admission and hospital stay** for an index stroke event. 
**Primary use-case** 
* Acts as the episode anchor that Conditions, Observations, and Procedures reference via `encounter`, enabling consistent episode-level analytics.
 
**Captures** 
* `status`: lifecycle state of the encounter (required).
* `class`: fixed to inpatient (IMP) to represent an admission.
* `actualPeriod`: start/end of the admission (required; end is required for completed stays).
* `admission.admitSource`: arrival mode/origin (required binding to StrokeArrivalModeVS when present).
* `admission.dischargeDisposition`: discharge destination (required binding to StrokeDischargeDestinationVS).
* Episode-level extensions for operational/registry attributes: 
* first hospital indicator,
* initial care intensity,
* required post-acute care flag,
* discharge department/service.
 
 
**Typical scenarios** 1) Direct admission via EMS from home: admitSource=EMS-from-home, isFirstHospital=true. 2) Transfer-in: admitSource=another-hospital or stroke-center, isFirstHospital=false. 3) Discharge home vs rehab vs death: dischargeDisposition captures destination/outcome; dischargeDepartmentService can capture service. 

**Usages:**

* Examples for this Profile: [Encounter/StrokeEncounterExample](Encounter-StrokeEncounterExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/stroke-encounter-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-stroke-encounter-profile.csv), [Excel](StructureDefinition-stroke-encounter-profile.xlsx), [Schematron](StructureDefinition-stroke-encounter-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "stroke-encounter-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/stroke-encounter-profile",
  "version" : "0.1.0",
  "name" : "StrokeEncounterProfile",
  "title" : "Stroke Encounter Profile",
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
  "description" : "Profile for an Encounter representing a patient's **inpatient admission and hospital stay** for an index stroke event.\n\n**Primary use-case**\n- Acts as the episode anchor that Conditions, Observations, and Procedures reference via `encounter`, enabling consistent episode-level analytics.\n\n**Captures**\n- `status`: lifecycle state of the encounter (required).\n- `class`: fixed to inpatient (IMP) to represent an admission.\n- `actualPeriod`: start/end of the admission (required; end is required for completed stays).\n- `admission.admitSource`: arrival mode/origin (required binding to StrokeArrivalModeVS when present).\n- `admission.dischargeDisposition`: discharge destination (required binding to StrokeDischargeDestinationVS).\n- Episode-level extensions for operational/registry attributes:\n  - first hospital indicator,\n  - initial care intensity,\n  - required post-acute care flag,\n  - discharge department/service.\n\n**Typical scenarios**\n1) Direct admission via EMS from home: admitSource=EMS-from-home, isFirstHospital=true.\n2) Transfer-in: admitSource=another-hospital or stroke-center, isFirstHospital=false.\n3) Discharge home vs rehab vs death: dischargeDisposition captures destination/outcome; dischargeDepartmentService can capture service.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 V2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Encounter",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Encounter",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Encounter",
      "path" : "Encounter"
    },
    {
      "id" : "Encounter.extension",
      "path" : "Encounter.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Encounter.extension:isFirstHospital",
      "path" : "Encounter.extension",
      "sliceName" : "isFirstHospital",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://tecnomod-um.org/StructureDefinition/first-hospital-ext"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Encounter.extension:initialCareIntensity",
      "path" : "Encounter.extension",
      "sliceName" : "initialCareIntensity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://tecnomod-um.org/StructureDefinition/initial-care-intensity-ext"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Encounter.extension:requiredPostAcuteCare",
      "path" : "Encounter.extension",
      "sliceName" : "requiredPostAcuteCare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://tecnomod-um.org/StructureDefinition/required-post-acute-care-ext"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Encounter.extension:dischargeDepartmentService",
      "path" : "Encounter.extension",
      "sliceName" : "dischargeDepartmentService",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://tecnomod-um.org/StructureDefinition/discharge-department-service-ext"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Encounter.status",
      "path" : "Encounter.status",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.class",
      "path" : "Encounter.class",
      "patternCodeableConcept" : {
        "coding" : [{
          "code" : "IMP",
          "display" : "inpatient encounter"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Encounter.type",
      "path" : "Encounter.type",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.subject",
      "path" : "Encounter.subject",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Encounter.actualPeriod",
      "path" : "Encounter.actualPeriod",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Encounter.actualPeriod.start",
      "path" : "Encounter.actualPeriod.start",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.actualPeriod.end",
      "path" : "Encounter.actualPeriod.end",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Encounter.admission",
      "path" : "Encounter.admission",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Encounter.admission.admitSource",
      "path" : "Encounter.admission.admitSource",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/stroke-arrival-mode-vs"
      }
    },
    {
      "id" : "Encounter.admission.dischargeDisposition",
      "path" : "Encounter.admission.dischargeDisposition",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/stroke-discharge-destination-vs"
      }
    }]
  }
}

```
