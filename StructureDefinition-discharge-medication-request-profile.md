# Discharge Medication Request Profile - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Discharge Medication Request Profile**

## Resource Profile: Discharge Medication Request Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/discharge-medication-request-profile | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:DischargeMedicationRequestProfile |

 
Represents a medication prescription made as part of the patient's discharge plan, categorized as community administration. 

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
  "title" : "Discharge Medication Request Profile",
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
  "description" : "Represents a medication prescription made as part of the patient's discharge plan, categorized as community administration.",
  "fhirVersion" : "5.0.0",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
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
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location",
              "code" : "community"
            }
          ]
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
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
          }
        ],
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
      }
    ]
  }
}

```
