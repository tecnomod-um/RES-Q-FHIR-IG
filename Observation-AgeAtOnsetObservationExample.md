# AgeAtOnsetObservationExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AgeAtOnsetObservationExample**

## Example Observation: AgeAtOnsetObservationExample

**Example:** Age at stroke onset recorded as 65 years, linked to the stroke encounter.



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
