# StrokeDiagnosisConditionExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeDiagnosisConditionExample**

## Example Condition: StrokeDiagnosisConditionExample

Profile: [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md)

**clinicalStatus**: Active

**category**: Encounter Diagnosis

**code**: Transient ischemic attack (disorder)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "StrokeDiagnosisConditionExample",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-diagnosis-condition-profile"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-category",
      "code" : "encounter-diagnosis",
      "display" : "Encounter Diagnosis"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "266257000",
      "display" : "Transient ischemic attack (disorder)"
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
