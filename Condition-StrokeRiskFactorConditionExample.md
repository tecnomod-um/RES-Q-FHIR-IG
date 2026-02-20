# StrokeRiskFactorConditionExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeRiskFactorConditionExample**

## Example Condition: StrokeRiskFactorConditionExample

Profile: [Stroke Risk Factor Condition Profile](StructureDefinition-stroke-risk-factor-condition-profile.md)

**clinicalStatus**: Remission

**category**: Problem List Item

**code**: Ischemic stroke (disorder)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)

**onset**: 2025-03-31 12:00:00+0000

**recordedDate**: 2025-03-31 12:00:00+0000



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "StrokeRiskFactorConditionExample",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "remission"
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
      "code" : "422504002",
      "display" : "Ischemic stroke (disorder)"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "encounter" : {
    "reference" : "Encounter/StrokeEncounterExample"
  },
  "onsetDateTime" : "2025-03-31T12:00:00Z",
  "recordedDate" : "2025-03-31T12:00:00Z"
}

```
