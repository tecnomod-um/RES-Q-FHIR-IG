# Specific Stroke Finding Observation Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Specific Stroke Finding Observation Profile (R5)**

## Resource Profile: Specific Stroke Finding Observation Profile (R5) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile | *Version*:0.1.0 |
| Draft as of 2026-02-19 | *Computable Name*:SpecificFindingObservationProfile |

 
Profile for recording discrete, coded stroke-related findings and assessment outcomes that do not fit naturally into the vital-sign, functional-score, or timing-metric profiles. Observation.code is constrained to StrokeFindingCodesVS, and Observation.valueCodeableConcept carries the corresponding assessment result or status. 
Typical use cases include: 
* documenting AF/flutter assessment status as present/absent/unknown (valueCodeableConcept bound to an AF/flutter status ValueSet), and
* documenting procedural outcome grades such as mTICI (valueCodeableConcept bound to MticiScoreVS).
 
This profile deliberately encodes the result as a CodeableConcept to support categorical outcomes and interoperability. It does not replace Condition for asserting diagnoses; when a durable diagnosis is established (e.g., confirmed AF), represent it as a Condition and optionally link supporting Observations (screening results, monitoring runs) using hasMember, derivedFrom, or Provenance. 

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
  "description" : "Profile for recording discrete, coded stroke-related findings and assessment outcomes that do not fit naturally into the vital-sign, functional-score, or timing-metric profiles. Observation.code is constrained to StrokeFindingCodesVS, and Observation.valueCodeableConcept carries the corresponding assessment result or status.\n\nTypical use cases include:\n- documenting AF/flutter assessment status as present/absent/unknown (valueCodeableConcept bound to an AF/flutter status ValueSet), and\n- documenting procedural outcome grades such as mTICI (valueCodeableConcept bound to MticiScoreVS).\n\nThis profile deliberately encodes the result as a CodeableConcept to support categorical outcomes and interoperability. It does not replace Condition for asserting diagnoses; when a durable diagnosis is established (e.g., confirmed AF), represent it as a Condition and optionally link supporting Observations (screening results, monitoring runs) using hasMember, derivedFrom, or Provenance.",
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
