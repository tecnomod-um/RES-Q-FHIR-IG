# StrokeCarotidImagingExample - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeCarotidImagingExample**

## Example Procedure: StrokeCarotidImagingExample

Profile: [Stroke Carotid Imaging Procedure Profile](StructureDefinition-stroke-carotid-imaging-procedure-profile.md)

**Procedure Timing Context Extension**: Post-Acute Phase (>=24h)

**status**: Not Done

**statusReason**: Reason Unknown

**code**: Angiography of carotid artery (procedure)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**occurrence**: 2025-03-01 10:00:00+0000 --> 2025-03-01 10:30:00+0000



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "StrokeCarotidImagingExample",
  "meta" : {
    "profile" : [
      "http://tecnomod-um.org/StructureDefinition/stroke-carotid-imaging-procedure-profile"
    ]
  },
  "extension" : [
    {
      "url" : "http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://tecnomod-um.org/CodeSystem/procedure-timing-context-cs",
            "code" : "post-acute",
            "display" : "Post-Acute Phase (>=24h)"
          }
        ]
      }
    }
  ],
  "status" : "not-done",
  "statusReason" : {
    "coding" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/stroke-proc-not-done-reason-cs",
        "code" : "unknown",
        "display" : "Reason Unknown"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "58920005",
        "display" : "Angiography of carotid artery (procedure)"
      }
    ]
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
