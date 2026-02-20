# DischargeMedicationRequest - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DischargeMedicationRequest**

## Example MedicationRequest: DischargeMedicationRequest

Profile: [Discharge MedicationRequest Profile](StructureDefinition-discharge-medication-request-profile.md)

**status**: Active

**intent**: Order

**category**: Community

### Medications

| | |
| :--- | :--- |
| - | **Concept** |
| * | Warfarin (substance) |

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "discharge-medication-request-001",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/discharge-medication-request-profile"]
  },
  "status" : "active",
  "intent" : "order",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location",
      "code" : "community"
    }]
  }],
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
    "reference" : "Encounter/StrokeEncounterExample"
  }
}

```
