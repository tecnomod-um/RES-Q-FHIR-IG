# Discharge MedicationRequest Profile - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Discharge MedicationRequest Profile**

## Resource Profile: Discharge MedicationRequest Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/discharge-medication-request-profile | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:DischargeMedicationRequestProfile |

 
Profile for representing a medication prescription issued as part of the patient’s **discharge plan** following a stroke encounter. 
**Primary use-case** 
* Capture secondary prevention and chronic therapy prescriptions intended to be taken **after discharge** (community setting), enabling: 
* discharge medication reconciliation,
* continuity of care between hospital and primary care,
* registry submission and quality improvement (e.g., antithrombotic/statin at discharge),
* episode-linked analytics (tie to the index stroke Encounter).
 
 
**Key elements and how to use them** 
* `status` (fixed to active): indicates the prescription is currently intended/valid at the time of discharge documentation. 
* Use `stopped` or `cancelled` in your broader implementation if a discharge prescription is later withdrawn (not constrained here).
 
* `category` (fixed to community): indicates the medication is intended for administration in the community/outpatient context. 
* This helps distinguish discharge prescriptions from inpatient medication orders.
 
* `medication` (required; bound to MedicationVS): identifies the prescribed agent or, if unavailable, a coarse category. 
* Prefer specific SNOMED CT substance concepts (e.g., aspirin) when available.
* Use `MedicationCS` category codes only when the specific agent cannot be coded.
 
* `subject` (required): the patient who will take the medication.
* `encounter` (required): links the prescription to the index stroke admission encounter.
* `authoredOn` (optional but recommended): the date/time the discharge prescription was authored.
 

**Usages:**

* Examples for this Profile: [MedicationRequest/discharge-medication-request-001](MedicationRequest-discharge-medication-request-001.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/discharge-medication-request-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-discharge-medication-request-profile.csv), [Excel](StructureDefinition-discharge-medication-request-profile.xlsx), [Schematron](StructureDefinition-discharge-medication-request-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "discharge-medication-request-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/discharge-medication-request-profile",
  "version" : "0.1.0",
  "name" : "DischargeMedicationRequestProfile",
  "title" : "Discharge MedicationRequest Profile",
  "status" : "active",
  "date" : "2026-02-20T08:47:00+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Profile for representing a medication prescription issued as part of the patient’s **discharge plan** following a stroke encounter.\n\n**Primary use-case**\n- Capture secondary prevention and chronic therapy prescriptions intended to be taken **after discharge** (community setting),\n  enabling:\n  - discharge medication reconciliation,\n  - continuity of care between hospital and primary care,\n  - registry submission and quality improvement (e.g., antithrombotic/statin at discharge),\n  - episode-linked analytics (tie to the index stroke Encounter).\n\n**Key elements and how to use them**\n- `status` (fixed to active): indicates the prescription is currently intended/valid at the time of discharge documentation.\n  - Use `stopped` or `cancelled` in your broader implementation if a discharge prescription is later withdrawn (not constrained here).\n- `category` (fixed to community): indicates the medication is intended for administration in the community/outpatient context.\n  - This helps distinguish discharge prescriptions from inpatient medication orders.\n- `medication` (required; bound to MedicationVS): identifies the prescribed agent or, if unavailable, a coarse category.\n  - Prefer specific SNOMED CT substance concepts (e.g., aspirin) when available.\n  - Use `MedicationCS` category codes only when the specific agent cannot be coded.\n- `subject` (required): the patient who will take the medication.\n- `encounter` (required): links the prescription to the index stroke admission encounter.\n- `authoredOn` (optional but recommended): the date/time the discharge prescription was authored.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "script10.6",
    "uri" : "http://ncpdp.org/SCRIPT10_6",
    "name" : "Mapping to NCPDP SCRIPT 10.6"
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
  "type" : "MedicationRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationRequest",
      "path" : "MedicationRequest"
    },
    {
      "id" : "MedicationRequest.status",
      "path" : "MedicationRequest.status",
      "patternCode" : "active",
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.category",
      "path" : "MedicationRequest.category",
      "min" : 1,
      "max" : "1",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location",
          "code" : "community"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.medication",
      "path" : "MedicationRequest.medication",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/medication-vs"
      }
    },
    {
      "id" : "MedicationRequest.subject",
      "path" : "MedicationRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.encounter",
      "path" : "MedicationRequest.encounter",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "MedicationRequest.authoredOn",
      "path" : "MedicationRequest.authoredOn",
      "mustSupport" : true
    }]
  }
}

```
