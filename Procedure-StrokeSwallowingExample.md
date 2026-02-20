# StrokeSwallowingExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeSwallowingExample**

## Example Procedure: StrokeSwallowingExample

Profile: [Stroke Swallow Procedure Profile](StructureDefinition-stroke-swallow-procedure-profile.md)

**Swallowing Screening Timing Category**: Within 4 hours

**Procedure Timing Context Extension**: Acute Phase (<24h)

**status**: Completed

**code**: Assessment using Gugging Swallowing Screen (procedure)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**occurrence**: 2025-03-01 10:00:00+0000

### Useds

| | |
| :--- | :--- |
| - | **Concept** |
| * | Assessment using Gugging Swallowing Screen (procedure) |



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "StrokeSwallowingExample",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-swallow-procedure-profile"]
  },
  "extension" : [{
    "url" : "http://tecnomod-um.org/StructureDefinition/swallowing-screening-timing-category-ext",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://tecnomod-um.org/CodeSystem/swallow-screen-time-cs",
        "code" : "T4H",
        "display" : "Within 4 hours"
      }]
    }
  },
  {
    "url" : "http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://tecnomod-um.org/CodeSystem/procedure-timing-context-cs",
        "code" : "acute",
        "display" : "Acute Phase (<24h)"
      }]
    }
  }],
  "status" : "completed",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1290000005",
      "display" : "Assessment using Gugging Swallowing Screen (procedure)"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "occurrenceDateTime" : "2025-03-01T10:00:00Z",
  "used" : [{
    "concept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "1290000005",
        "display" : "Assessment using Gugging Swallowing Screen (procedure)"
      }]
    }
  }]
}

```
