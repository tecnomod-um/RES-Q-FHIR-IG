# AgeAtOnsetObservationExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AgeAtOnsetObservationExample**

## Example Observation: AgeAtOnsetObservationExample

Profile: [Age at Stroke Onset Observation Profile (R5)](StructureDefinition-age-at-onset-observation-profile.md)

**status**: Final

**code**: Age at onset of clinical finding (observable entity)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)

**value**: 65



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "AgeAtOnsetObservationExample",
  "meta" : {
    "profile" : [
      "http://tecnomod-um.org/StructureDefinition/age-at-onset-observation-profile"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "445518008",
        "display" : "Age at onset of clinical finding (observable entity)"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "encounter" : {
    "reference" : "Encounter/StrokeEncounterExample"
  },
  "valueInteger" : 65
}

```
