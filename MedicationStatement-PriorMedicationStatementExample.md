# PriorMedicationStatementExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PriorMedicationStatementExample**

## Example MedicationStatement: PriorMedicationStatementExample

Profile: [Prior MedicationStatement Profile](StructureDefinition-prior-medication-statement-profile.md)

**status**: Recorded

### Medications

| | |
| :--- | :--- |
| - | **Concept** |
| * | Warfarin (substance) |

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: `EncounterExample`

### Reasons

| | |
| :--- | :--- |
| - | **Reference** |
| * | [Condition Transient ischemic attack (disorder)](Condition-StrokeDiagnosisConditionExample.md) |

### Adherences

| | |
| :--- | :--- |
| - | **Code** |
| * | Taking |



## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "PriorMedicationStatementExample",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/prior-medication-statement-profile"]
  },
  "status" : "recorded",
  "medication" : {
    "concept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "372756006",
        "display" : "Warfarin (substance)"
      }]
    }
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "encounter" : {
    "reference" : "EncounterExample"
  },
  "reason" : [{
    "reference" : {
      "reference" : "Condition/StrokeDiagnosisConditionExample"
    }
  }],
  "adherence" : {
    "code" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/CodeSystem/medication-statement-adherence",
        "code" : "taking"
      }]
    }
  }
}

```
