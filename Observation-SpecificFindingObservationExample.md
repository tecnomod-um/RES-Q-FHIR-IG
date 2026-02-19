# SpecificFindingObservationExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SpecificFindingObservationExample**

## Example Observation: SpecificFindingObservationExample

Profile: [Specific Stroke Finding Observation Profile (R5)](StructureDefinition-specific-finding-observation-profile.md)

**status**: Final

**code**: Atrial fibrillation (disorder)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)

**value**: Detected



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "SpecificFindingObservationExample",
  "meta" : {
    "profile" : [
      "http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile"
    ]
  },
  "status" : "final",
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "49436004",
        "display" : "Atrial fibrillation (disorder)"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "encounter" : {
    "reference" : "Encounter/StrokeEncounterExample"
  },
  "valueCodeableConcept" : {
    "coding" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/afib-flutter-status-cs",
        "code" : "detected",
        "display" : "Detected"
      }
    ]
  }
}

```
