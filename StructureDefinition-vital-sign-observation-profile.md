# Stroke Vital Sign Observation Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Vital Sign Observation Profile (R5)**

## Resource Profile: Stroke Vital Sign Observation Profile (R5) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/vital-sign-observation-profile | *Version*:0.1.0 |
| Draft as of 2026-02-09 | *Computable Name*:VitalSignObservationProfile |

 
Profile for recording key vital signs (Systolic/Diastolic BP) in stroke patients. 

**Usages:**

* Examples for this Profile: [Observation/VitalSignObservationExample](Observation-VitalSignObservationExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/vital-sign-observation-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-vital-sign-observation-profile.csv), [Excel](StructureDefinition-vital-sign-observation-profile.xlsx), [Schematron](StructureDefinition-vital-sign-observation-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "vital-sign-observation-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/vital-sign-observation-profile",
  "version" : "0.1.0",
  "name" : "VitalSignObservationProfile",
  "title" : "Stroke Vital Sign Observation Profile (R5)",
  "status" : "draft",
  "date" : "2026-02-09T12:28:26+00:00",
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
  "description" : "Profile for recording key vital signs (Systolic/Diastolic BP) in stroke patients.",
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
        "id" : "Observation.category",
        "path" : "Observation.category",
        "min" : 1,
        "max" : "1",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
              "code" : "vital-signs"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "61746007",
              "display" : "Taking patient vital signs (procedure)"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.component",
        "path" : "Observation.component",
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.code",
        "path" : "Observation.component.code",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://tecnomod-um.org/ValueSet/vital-sign-codes-vs"
        }
      },
      {
        "id" : "Observation.component.value[x]",
        "path" : "Observation.component.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.component.value[x].unit",
        "path" : "Observation.component.value[x].unit",
        "patternString" : "millimeter Mercury column"
      },
      {
        "id" : "Observation.component.value[x].system",
        "path" : "Observation.component.value[x].system",
        "patternUri" : "https://ucum.org/ucum"
      },
      {
        "id" : "Observation.component.value[x].code",
        "path" : "Observation.component.value[x].code",
        "patternCode" : "mm[Hg]"
      }
    ]
  }
}

```
