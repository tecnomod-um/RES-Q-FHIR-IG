# Age at Stroke Onset Observation Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Age at Stroke Onset Observation Profile (R5)**

## Resource Profile: Age at Stroke Onset Observation Profile (R5) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/age-at-onset-observation-profile | *Version*:0.1.0 |
| Draft as of 2026-02-19 | *Computable Name*:AgeAtOnsetObservationProfile |

 
Profile for recording the patient’s age at the time of stroke onset as a simple integer value in years. The Observation.code is fixed to the SNOMED CT observable entity “Age at onset of clinical finding,” ensuring a clear and interoperable semantic meaning. 
The age at onset may be derived from date of birth and an onset/reference timepoint (e.g., symptom onset, last known well, or discovery time depending on local policy). This profile records the resulting age value, not the derivation method; if the derivation is clinically important, implementers should capture the underlying reference timepoint(s) and provenance separately. 

 
Record age-at-onset in years as a simple, computable value used in etiologic assessment and risk stratification. 

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
  "date" : "2026-02-19T10:59:57+00:00",
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
  "description" : "Profile for recording the patient’s age at the time of stroke onset as a simple integer value in years. The Observation.code is fixed to the SNOMED CT observable entity “Age at onset of clinical finding,” ensuring a clear and interoperable semantic meaning.\n\nThe age at onset may be derived from date of birth and an onset/reference timepoint (e.g., symptom onset, last known well, or discovery time depending on local policy). This profile records the resulting age value, not the derivation method; if the derivation is clinically important, implementers should capture the underlying reference timepoint(s) and provenance separately.",
  "purpose" : "Record age-at-onset in years as a simple, computable value used in etiologic assessment and risk stratification.",
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
        "short" : "Age-at-onset concept.",
        "definition" : "Fixed to the SNOMED CT observable entity indicating the observation represents age at onset.",
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
        "short" : "Age in completed years.",
        "definition" : "Integer age in years at the chosen onset reference point (per local operational definition).",
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
