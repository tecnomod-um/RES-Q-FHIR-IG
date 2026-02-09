# TimingMetricObservationExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TimingMetricObservationExample**

## Example Observation: TimingMetricObservationExample

Profile: [Stroke Timing Metric Observation Profile (R5)](StructureDefinition-timing-metric-observation-profile.md)

**status**: Final

**category**: Procedure

**code**: Door to Needle

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)

**value**: 30 minute (Details: ucum codemin = 'min')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "TimingMetricObservationExample",
  "meta" : {
    "profile" : [
      "http://tecnomod-um.org/StructureDefinition/timing-metric-observation-profile"
    ]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "procedure"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/timing-metric-codes-cs",
        "code" : "D2N",
        "display" : "Door to Needle"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "encounter" : {
    "reference" : "Encounter/StrokeEncounterExample"
  },
  "valueQuantity" : {
    "value" : 30,
    "unit" : "minute",
    "system" : "https://ucum.org/ucum",
    "code" : "min"
  }
}

```
