# StrokeCircumstanceObservationExampleWakeUp - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeCircumstanceObservationExampleWakeUp**

## Example Observation: StrokeCircumstanceObservationExampleWakeUp

Profile: [Stroke Circumstance Observation Profile (R5)](StructureDefinition-stroke-circumstance-observation-profile.md)

**status**: Final

**code**: Wake-up Stroke

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**focus**: `ConditionExample`

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "StrokeCircumstanceObservationExampleWakeUp",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-circumstance-observation-profile"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://tecnomod-um.org/CodeSystem/stroke-circumstance-codes-cs",
      "code" : "wake-up",
      "display" : "Wake-up Stroke"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "focus" : [{
    "reference" : "ConditionExample"
  }],
  "encounter" : {
    "reference" : "Encounter/StrokeEncounterExample"
  }
}

```
