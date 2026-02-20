# StrokeThrombolysisExample - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeThrombolysisExample**

## Example Procedure: StrokeThrombolysisExample

Profile: [Stroke Thrombolysis Procedure Profile](StructureDefinition-stroke-mechanical-procedure-profile.md)

**Procedure Timing Context Extension**: Unknown/Not Applicable

**status**: Completed

**code**: Thrombolysis of cerebral artery by intravenous infusion (procedure)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**occurrence**: 2025-03-01 10:00:00+0000 --> 2025-03-01 10:30:00+0000



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "StrokeThrombolysisExample",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-mechanical-procedure-profile"]
  },
  "extension" : [{
    "url" : "http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://tecnomod-um.org/CodeSystem/procedure-timing-context-cs",
        "code" : "unknown",
        "display" : "Unknown/Not Applicable"
      }]
    }
  }],
  "status" : "completed",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "472191000119101",
      "display" : "Thrombolysis of cerebral artery by intravenous infusion (procedure)"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "occurrencePeriod" : {
    "start" : "2025-03-01T10:00:00Z",
    "end" : "2025-03-01T10:30:00Z"
  }
}

```
