# Specific Stroke Finding Observation Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Specific Stroke Finding Observation Profile (R5)**

## Resource Profile: Specific Stroke Finding Observation Profile (R5) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile | *Version*:0.1.0 |
| Draft as of 2026-02-18 | *Computable Name*:SpecificFindingObservationProfile |

 
Profile for specific coded findings like Afib/Flutter status or mTICI score. 

**Usages:**

* Examples for this Profile: [Observation/SpecificFindingObservationExample](Observation-SpecificFindingObservationExample.md) and [Observation/SpecificFindingObservationExampleMTICI](Observation-SpecificFindingObservationExampleMTICI.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/specific-finding-observation-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-specific-finding-observation-profile.csv), [Excel](StructureDefinition-specific-finding-observation-profile.xlsx), [Schematron](StructureDefinition-specific-finding-observation-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "specific-finding-observation-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile",
  "version" : "0.1.0",
  "name" : "SpecificFindingObservationProfile",
  "title" : "Specific Stroke Finding Observation Profile (R5)",
  "status" : "draft",
  "date" : "2026-02-18T13:09:07+00:00",
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
  "description" : "Profile for specific coded findings like Afib/Flutter status or mTICI score.",
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
          "valueSet" : "http://tecnomod-um.org/ValueSet/stroke-finding-codes-vs"
        }
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "mustSupport" : true
      }
    ]
  }
}

```
