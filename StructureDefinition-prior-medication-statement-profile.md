# Prior Medication Statement Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Prior Medication Statement Profile (R5)**

## Resource Profile: Prior Medication Statement Profile (R5) ( Experimental ) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/prior-medication-statement-profile | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:PriorMedicationStatementProfile |

 
Represents a statement about the patient's medication use **before** the index event. 

**Usages:**

* Examples for this Profile: [MedicationStatement/PriorMedicationStatementExample](MedicationStatement-PriorMedicationStatementExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/prior-medication-statement-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-prior-medication-statement-profile.csv), [Excel](StructureDefinition-prior-medication-statement-profile.xlsx), [Schematron](StructureDefinition-prior-medication-statement-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "prior-medication-statement-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/prior-medication-statement-profile",
  "version" : "0.1.0",
  "name" : "PriorMedicationStatementProfile",
  "title" : "Prior Medication Statement Profile (R5)",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-19T14:52:32+00:00",
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
  "description" : "Represents a statement about the patient's medication use *before* the index event.",
  "fhirVersion" : "5.0.0",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationStatement",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationStatement",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "MedicationStatement",
        "path" : "MedicationStatement"
      },
      {
        "id" : "MedicationStatement.status",
        "path" : "MedicationStatement.status",
        "mustSupport" : true
      },
      {
        "id" : "MedicationStatement.medication",
        "path" : "MedicationStatement.medication",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://tecnomod-um.org/ValueSet/medication-vs"
        }
      },
      {
        "id" : "MedicationStatement.subject",
        "path" : "MedicationStatement.subject",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "MedicationStatement.encounter",
        "path" : "MedicationStatement.encounter",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "MedicationStatement.reason",
        "path" : "MedicationStatement.reason",
        "mustSupport" : true
      },
      {
        "id" : "MedicationStatement.adherence",
        "path" : "MedicationStatement.adherence",
        "mustSupport" : true
      },
      {
        "id" : "MedicationStatement.adherence.code",
        "path" : "MedicationStatement.adherence.code",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://hl7.org/fhir/ValueSet/medication-statement-adherence"
        }
      }
    ]
  }
}

```
