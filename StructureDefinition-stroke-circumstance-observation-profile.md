# Stroke Circumstance Observation Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Circumstance Observation Profile (R5)**

## Resource Profile: Stroke Circumstance Observation Profile (R5) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/stroke-circumstance-observation-profile | *Version*:0.1.0 |
| Draft as of 2026-02-19 | *Computable Name*:StrokeCircumstanceObservationProfile |

 
Profile for documenting clinically relevant circumstances of stroke symptom onset (e.g., wake-up stroke, in-hospital onset). 
**Primary use-case** 
* Capture onset circumstance classification for eligibility reasoning, protocol stratification, and reporting when onset time is uncertain.
 
**Representation** 
* `Observation.code` bound to StrokeCircumstanceCodesVS.
* Presence of the Observation asserts the circumstance applies to the index stroke event (within the linked Encounter).
 
**Typical scenarios** 1) A patient who wakes up with stroke symptoms would have an Observation with `code` = wake-up stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is a wake-up stroke. 2) A patient who experiences stroke symptoms while already admitted for another reason would have an Observation with `code` = in-hospital stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is in-hospital onset. 

**Usages:**

* Examples for this Profile: [Observation/StrokeCircumstanceObservationExampleWakeUp](Observation-StrokeCircumstanceObservationExampleWakeUp.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/stroke-circumstance-observation-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-stroke-circumstance-observation-profile.csv), [Excel](StructureDefinition-stroke-circumstance-observation-profile.xlsx), [Schematron](StructureDefinition-stroke-circumstance-observation-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "stroke-circumstance-observation-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/stroke-circumstance-observation-profile",
  "version" : "0.1.0",
  "name" : "StrokeCircumstanceObservationProfile",
  "title" : "Stroke Circumstance Observation Profile (R5)",
  "status" : "draft",
  "date" : "2026-02-19T12:37:09+00:00",
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
  "description" : "Profile for documenting clinically relevant circumstances of stroke symptom onset (e.g., wake-up stroke, in-hospital onset).\n\n**Primary use-case**\n- Capture onset circumstance classification for eligibility reasoning, protocol stratification, and reporting when onset time is uncertain.\n\n**Representation**\n- `Observation.code` bound to StrokeCircumstanceCodesVS.\n- Presence of the Observation asserts the circumstance applies to the index stroke event (within the linked Encounter).\n\n**Typical scenarios**\n1) A patient who wakes up with stroke symptoms would have an Observation with `code` = wake-up stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is a wake-up stroke.\n2) A patient who experiences stroke symptoms while already admitted for another reason would have an Observation with `code` = in-hospital stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is in-hospital onset.\n",
  "fhirVersion" : "5.0.0",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://tecnomod-um.org/StructureDefinition/base-stroke-observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://tecnomod-um.org/ValueSet/stroke-circumstance-codes-vs"
        }
      },
      {
        "id" : "Observation.hasMember",
        "path" : "Observation.hasMember",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Observation"]
          }
        ],
        "mustSupport" : true
      }
    ]
  }
}

```
