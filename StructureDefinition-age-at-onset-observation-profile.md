# Age at Stroke Onset Observation Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Age at Stroke Onset Observation Profile (R5)**

## Resource Profile: Age at Stroke Onset Observation Profile (R5) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/age-at-onset-observation-profile | *Version*:0.1.0 |
| Draft as of 2026-02-09 | *Computable Name*:AgeAtOnsetObservationProfile |

 
Profile specifically for recording the patient's age at stroke onset. 

**Usages:**

* Examples for this Profile: [Observation/AgeAtOnsetObservationExample](Observation-AgeAtOnsetObservationExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/age-at-onset-observation-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-age-at-onset-observation-profile.csv), [Excel](StructureDefinition-age-at-onset-observation-profile.xlsx), [Schematron](StructureDefinition-age-at-onset-observation-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "age-at-onset-observation-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/age-at-onset-observation-profile",
  "version" : "0.1.0",
  "name" : "AgeAtOnsetObservationProfile",
  "title" : "Age at Stroke Onset Observation Profile (R5)",
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
  "description" : "Profile specifically for recording the patient's age at stroke onset.",
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
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://snomed.info/sct",
              "code" : "445518008",
              "display" : "Age at onset of clinical finding (observable entity)"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "integer"
          }
        ],
        "mustSupport" : true
      }
    ]
  }
}

```
