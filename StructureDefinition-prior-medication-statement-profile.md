# Prior MedicationStatement Profile - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Prior MedicationStatement Profile**

## Resource Profile: Prior MedicationStatement Profile ( Experimental ) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/prior-medication-statement-profile | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:PriorMedicationStatementProfile |

 
Profile for documenting a statement about the patient’s medication use **before** the index stroke encounter. 
**Primary use-cases** 
* Medication reconciliation on admission (home medications).
* Capturing pre-event antithrombotic/anticoagulant exposure (key for hemorrhage risk, eligibility decisions, and etiology workup).
* Registry variables and analytics (e.g., “on anticoagulation at presentation”, “adherent vs non-adherent”).
* Clinical decision support and discharge planning (continuation, switching, contraindication checks).
 
**How to interpret MedicationStatement here** 
* This resource asserts **medication usage status/history**, not a prescription/order. 
* Use MedicationRequest for discharge prescriptions or new orders.
* Use MedicationStatement for what the patient was taking (or was supposed to be taking) prior to admission.
 
 
**Key elements and how to use them** 
* `medication` (required; bound to MedicationVS or an IG-specific meds ValueSet): identifies the agent/class. 
* Prefer specific coded substances/products when available.
 
* `subject` (required): patient who used the medication.
* `encounter` (required): anchors the statement to the index stroke encounter where it was collected/recorded.
* `status` (required): the lifecycle status of the statement record (e.g., recorded/entered-in-error).
* `adherence` (optional): captures whether the patient is/was taking the medication as intended. 
* If present, `adherence.code` is required and bound to the R5 adherence ValueSet.
 
* `reason` (optional, repeating): why the medication was taken (indication), represented as CodeableReference targets.
 

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
  "version" : "1.0.0",
  "name" : "PriorMedicationStatementProfile",
  "title" : "Prior MedicationStatement Profile",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-20T10:31:35+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Profile for documenting a statement about the patient’s medication use **before** the index stroke encounter.\n\n**Primary use-cases**\n- Medication reconciliation on admission (home medications).\n- Capturing pre-event antithrombotic/anticoagulant exposure (key for hemorrhage risk, eligibility decisions, and etiology workup).\n- Registry variables and analytics (e.g., “on anticoagulation at presentation”, “adherent vs non-adherent”).\n- Clinical decision support and discharge planning (continuation, switching, contraindication checks).\n\n**How to interpret MedicationStatement here**\n- This resource asserts *medication usage status/history*, not a prescription/order.\n  - Use MedicationRequest for discharge prescriptions or new orders.\n  - Use MedicationStatement for what the patient was taking (or was supposed to be taking) prior to admission.\n\n**Key elements and how to use them**\n- `medication` (required; bound to MedicationVS or an IG-specific meds ValueSet): identifies the agent/class.\n  - Prefer specific coded substances/products when available.\n- `subject` (required): patient who used the medication.\n- `encounter` (required): anchors the statement to the index stroke encounter where it was collected/recorded.\n- `status` (required): the lifecycle status of the statement record (e.g., recorded/entered-in-error).\n- `adherence` (optional): captures whether the patient is/was taking the medication as intended.\n  - If present, `adherence.code` is required and bound to the R5 adherence ValueSet.\n- `reason` (optional, repeating): why the medication was taken (indication), represented as CodeableReference targets.\n",
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
  "type" : "MedicationStatement",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationStatement",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
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
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
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
    }]
  }
}

```
