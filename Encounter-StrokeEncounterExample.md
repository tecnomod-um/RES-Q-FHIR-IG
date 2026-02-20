# StrokeEncounterExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeEncounterExample**

## Example Encounter: StrokeEncounterExample

Profile: [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md)

**First Hospital Indicator Extension**: true

**Initial Care Intensity Extension**: ICU / Stroke Unit

**Required Post-Acute Care Extension**: false

**Discharge Department/Service Extension**: Neurology

**status**: Completed

**type**: Inpatient Encounter

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**actualPeriod**: 2025-03-01 08:00:00+0000 --> 2025-03-10 12:00:00+0000

### Admissions

| | | |
| :--- | :--- | :--- |
| - | **AdmitSource** | **DischargeDisposition** |
| * | EMS from Home | Discharge to home (procedure) |



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "StrokeEncounterExample",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-encounter-profile"]
  },
  "extension" : [{
    "url" : "http://tecnomod-um.org/StructureDefinition/first-hospital-ext",
    "valueBoolean" : true
  },
  {
    "url" : "http://tecnomod-um.org/StructureDefinition/initial-care-intensity-ext",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://tecnomod-um.org/CodeSystem/initial-care-intensity-cs",
        "code" : "icu-stroke",
        "display" : "ICU / Stroke Unit"
      }]
    }
  },
  {
    "url" : "http://tecnomod-um.org/StructureDefinition/required-post-acute-care-ext",
    "valueBoolean" : false
  },
  {
    "url" : "http://tecnomod-um.org/StructureDefinition/discharge-department-service-ext",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://tecnomod-um.org/CodeSystem/discharge-dept-cs",
        "code" : "neurology",
        "display" : "Neurology"
      }]
    }
  }],
  "status" : "completed",
  "type" : [{
    "coding" : [{
      "code" : "inpatient",
      "display" : "Inpatient Encounter"
    }]
  }],
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "actualPeriod" : {
    "start" : "2025-03-01T08:00:00Z",
    "end" : "2025-03-10T12:00:00Z"
  },
  "admission" : {
    "admitSource" : {
      "coding" : [{
        "system" : "http://tecnomod-um.org/CodeSystem/stroke-arrival-mode-cs",
        "code" : "ems-home",
        "display" : "EMS from Home"
      }]
    },
    "dischargeDisposition" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "306689006",
        "display" : "Discharge to home (procedure)"
      }]
    }
  }
}

```
