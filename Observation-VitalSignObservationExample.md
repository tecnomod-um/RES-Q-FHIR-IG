# VitalSignObservationExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VitalSignObservationExample**

## Example Observation: VitalSignObservationExample

Profile: [Stroke Vital Sign Observation Profile (R5)](StructureDefinition-vital-sign-observation-profile.md)

**status**: Final

**category**: Vital Signs

**code**: Taking patient vital signs (procedure)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**encounter**: [Encounter: extension = true,ICU / Stroke Unit,false,Neurology; status = completed; type = Inpatient Encounter; actualPeriod = 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000](Encounter-StrokeEncounterExample.md)

> **component****code**: Systolic blood pressure**value**: 120 millimeter Mercury column (Details: ucum codemm[Hg] = 'mm[Hg]')

> **component****code**: Diastolic blood pressure (observable entity)**value**: 80 millimeter Mercury column (Details: ucum codemm[Hg] = 'mm[Hg]')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "VitalSignObservationExample",
  "meta" : {
    "profile" : [
      "http://tecnomod-um.org/StructureDefinition/vital-sign-observation-profile"
    ]
  },
  "status" : "final",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "vital-signs"
        }
      ]
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "61746007",
        "display" : "Taking patient vital signs (procedure)"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "encounter" : {
    "reference" : "Encounter/StrokeEncounterExample"
  },
  "component" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://snomed.info/sct",
            "code" : "271649006",
            "display" : "Systolic blood pressure (observable entity)"
          }
        ],
        "text" : "Systolic blood pressure"
      },
      "valueQuantity" : {
        "value" : 120,
        "unit" : "millimeter Mercury column",
        "system" : "https://ucum.org/ucum",
        "code" : "mm[Hg]"
      }
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://snomed.info/sct",
            "code" : "271650006",
            "display" : "Diastolic blood pressure (observable entity)"
          }
        ]
      },
      "valueQuantity" : {
        "value" : 80,
        "unit" : "millimeter Mercury column",
        "system" : "https://ucum.org/ucum",
        "code" : "mm[Hg]"
      }
    }
  ]
}

```
