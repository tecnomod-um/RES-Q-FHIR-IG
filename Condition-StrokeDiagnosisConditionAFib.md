# StrokeDiagnosisConditionAFib - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeDiagnosisConditionAFib**

## Example Condition: StrokeDiagnosisConditionAFib

Profile: [Stroke Risk Factor Condition Profile](StructureDefinition-stroke-risk-factor-condition-profile.md)

**clinicalStatus**: Active

**verificationStatus**: Differential

**category**: Problem List Item

**code**: Atrial fibrillation (disorder)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "StrokeDiagnosisConditionAFib",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "verificationStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code" : "differential"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-category",
      "code" : "problem-list-item",
      "display" : "Problem List Item"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "49436004",
      "display" : "Atrial fibrillation (disorder)"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "encounter" : {
    "reference" : "Encounter/StrokeEncounterExample"
  }
}

```
