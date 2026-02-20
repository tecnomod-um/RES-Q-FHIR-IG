# FunctionalScoreObservationExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **FunctionalScoreObservationExample**

## Example Observation: FunctionalScoreObservationExample

Profile: [Stroke Functional Score Observation Profile](StructureDefinition-functional-score-observation-profile.md)

**Observation Timing Context Extension**: Pre-stroke

**status**: Final

**category**: Exam

**code**: Modified Rankin Scale score (observable entity)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)

**value**: No symptoms



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "FunctionalScoreObservationExample",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/functional-score-observation-profile"]
  },
  "extension" : [{
    "url" : "http://tecnomod-um.org/StructureDefinition/observation-timing-context-ext",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://tecnomod-um.org/CodeSystem/assessment-context-cs",
        "code" : "pre-stroke",
        "display" : "Pre-stroke"
      }]
    }
  }],
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "exam"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1255866005",
      "display" : "Modified Rankin Scale score (observable entity)"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "encounter" : {
    "reference" : "Encounter/StrokeEncounterExample"
  },
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://tecnomod-um.org/CodeSystem/mrs-score-cs",
      "code" : "0",
      "display" : "No symptoms"
    }]
  }
}

```
