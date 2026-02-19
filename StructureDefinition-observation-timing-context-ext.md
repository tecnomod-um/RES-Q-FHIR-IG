# Observation Timing Context Extension - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Observation Timing Context Extension**

## Extension: Observation Timing Context Extension 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/observation-timing-context-ext | *Version*:0.1.0 |
| Draft as of 2026-02-19 | *Computable Name*:ObservationTimingContextExtension |

This extension captures the clinical timing context (relative phase) in which an observation or assessment was made (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up). It is particularly important for functional outcomes and severity scores whose interpretation depends on **when** they were assessed.

The extension complements Observation.effective[x]:

* effective[x] records the actual date/time (when known),
* this extension records the standardized phase label used for reporting and comparability across sites.

The value is a required CodeableConcept bound to AssessmentContextVS (required), ensuring only supported timing contexts are used in this implementation guide.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Functional Score Observation Profile (R5, Timing Ext)](StructureDefinition-functional-score-observation-profile.md)
* Examples for this Extension: [Observation/FunctionalScoreObservationExample](Observation-FunctionalScoreObservationExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/observation-timing-context-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-observation-timing-context-ext.csv), [Excel](StructureDefinition-observation-timing-context-ext.xlsx), [Schematron](StructureDefinition-observation-timing-context-ext.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "observation-timing-context-ext",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://tecnomod-um.org/StructureDefinition/observation-timing-context-ext",
  "version" : "0.1.0",
  "name" : "ObservationTimingContextExtension",
  "title" : "Observation Timing Context Extension",
  "status" : "draft",
  "date" : "2026-02-19T08:12:22+00:00",
  "publisher" : "UMU",
  "contact" : [
    {
      "name" : "UMU",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://tecnomod-um.org"
        }
      ]
    }
  ],
  "description" : "This extension captures the clinical timing context (relative phase) in which an observation or assessment was made (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up). It is particularly important for functional outcomes and severity scores whose interpretation depends on *when* they were assessed.\n\nThe extension complements Observation.effective[x]:\n- effective[x] records the actual date/time (when known),\n- this extension records the standardized phase label used for reporting and comparability across sites.\n\nThe value is a required CodeableConcept bound to AssessmentContextVS (required), ensuring only supported timing contexts are used in this implementation guide.",
  "fhirVersion" : "5.0.0",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Observation"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://tecnomod-um.org/StructureDefinition/observation-timing-context-ext"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://tecnomod-um.org/ValueSet/assessment-context-vs"
        }
      }
    ]
  }
}

```
