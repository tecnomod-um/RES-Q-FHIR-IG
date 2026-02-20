# Stroke Functional Score Observation Profile - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Functional Score Observation Profile**

## Resource Profile: Stroke Functional Score Observation Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/functional-score-observation-profile | *Version*:1.0.0 |
| Draft as of 2026-02-20 | *Computable Name*:FunctionalScoreObservationProfile |

 
Profile for recording stroke functional outcome and severity scores (currently mRS and NIHSS) in an interoperable, context-aware way. 
**Primary use-case** 
* Capture outcomes by phase (baseline, admission, discharge, ~90-day follow-up) using a required timing context extension.
 
**Key constraints** 
* `Observation.code` is bound to FunctionalScoreCodesVS (mRS or NIHSS).
* `extension[timingContext]` is mandatory to label the clinical phase.
* Datatype and binding rules are enforced via invariants: 
* mRS → `valueCodeableConcept` bound to MRsScoreVS.
* NIHSS → `valueInteger` as total NIHSS score.
 
 
**Typical scenarios** 1) An mRS score assessed at discharge would have `Observation.code` = mRS code, `valueCodeableConcept` = mRS grade (0–6), and the timing context extension value = discharge. 2) An NIHSS score assessed at admission would have `Observation.code` = NIHSS code, `valueInteger` = total NIHSS score, and the timing context extension value = admission. 

**Usages:**

* Examples for this Profile: [Observation/FunctionalScoreObservationExample](Observation-FunctionalScoreObservationExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/functional-score-observation-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-functional-score-observation-profile.csv), [Excel](StructureDefinition-functional-score-observation-profile.xlsx), [Schematron](StructureDefinition-functional-score-observation-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "functional-score-observation-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/functional-score-observation-profile",
  "version" : "1.0.0",
  "name" : "FunctionalScoreObservationProfile",
  "title" : "Stroke Functional Score Observation Profile",
  "status" : "draft",
  "date" : "2026-02-20T10:17:22+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Profile for recording stroke functional outcome and severity scores (currently mRS and NIHSS) in an interoperable, context-aware way.\n\n**Primary use-case**\n- Capture outcomes by phase (baseline, admission, discharge, ~90-day follow-up) using a required timing context extension.\n\n**Key constraints**\n- `Observation.code` is bound to FunctionalScoreCodesVS (mRS or NIHSS).\n- `extension[timingContext]` is mandatory to label the clinical phase.\n- Datatype and binding rules are enforced via invariants:\n  - mRS → `valueCodeableConcept` bound to MRsScoreVS.\n  - NIHSS → `valueInteger` as total NIHSS score.\n\n**Typical scenarios**\n1) An mRS score assessed at discharge would have `Observation.code` = mRS code, `valueCodeableConcept` = mRS grade (0–6), and the timing context extension value = discharge.\n2) An NIHSS score assessed at admission would have `Observation.code` = NIHSS code, `valueInteger` = total NIHSS score, and the timing context extension value = admission.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 V2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://tecnomod-um.org/StructureDefinition/base-stroke-observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.extension",
      "path" : "Observation.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Observation.extension:timingContext",
      "path" : "Observation.extension",
      "sliceName" : "timingContext",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://tecnomod-um.org/StructureDefinition/observation-timing-context-ext"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "min" : 1,
      "max" : "1",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "exam"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/functional-score-codes-vs"
      }
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]:valueInteger",
      "path" : "Observation.value[x]",
      "sliceName" : "valueInteger",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]:valueCodeableConcept",
      "path" : "Observation.value[x]",
      "sliceName" : "valueCodeableConcept",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "condition" : ["obs-mrs-code", "obs-6"],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/mrs-score-vs"
      }
    },
    {
      "id" : "Observation.value[x]:valueQuantity",
      "path" : "Observation.value[x]",
      "sliceName" : "valueQuantity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }],
      "condition" : ["obs-nihss-code", "obs-6"]
    }]
  }
}

```
