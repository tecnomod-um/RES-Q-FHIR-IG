# StrokeBrainImagingExample - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **StrokeBrainImagingExample**

## Example Procedure: StrokeBrainImagingExample

Profile: [Stroke Brain Imaging Procedure Profile](StructureDefinition-stroke-brain-imaging-procedure-profile.md)

**Procedure Timing Context Extension**: Acute Phase (<24h)

**status**: Completed

**code**: Computed tomography angiography of intracranial artery with contrast (procedure)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-example-patient.md)

**occurrence**: 2025-03-01 10:00:00+0000



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "StrokeBrainImagingExample",
  "meta" : {
    "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-brain-imaging-procedure-profile"]
  },
  "extension" : [{
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
      "code" : "419949007",
      "display" : "Computed tomography angiography of intracranial artery with contrast (procedure)"
    }]
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "occurrenceDateTime" : "2025-03-01T10:00:00Z"
}

```
