# Stroke Vital Sign Observation Profile - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Vital Sign Observation Profile**

## Resource Profile: Stroke Vital Sign Observation Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/vital-sign-observation-profile | *Version*:0.1.0 |
| Draft as of 2026-02-20 | *Computable Name*:VitalSignObservationProfile |

 
Profile for recording blood pressure vital signs in stroke patients using a single Observation with components. The Observation is categorized as `vital-signs` and uses component entries for systolic and diastolic blood pressure. 
**Primary use-case** 
* Record repeated BP measurements across the episode (arrival, post-thrombolysis monitoring, ICU) by creating multiple Observations with different `effective[x]`.
 
**Representation** 
* `Observation.component.code` bound to VitalSignCodesVS.
* `Observation.component.valueQuantity` in UCUM mm[Hg].
 
**Typical scenarios** 1) One Observation with two components (systolic and diastolic) recorded at the same timepoint. 2) Multiple Observations over time, each with the same component structure, to track BP trends during acute management and monitoring. 

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
  "title" : "Stroke Vital Sign Observation Profile",
  "status" : "draft",
  "date" : "2026-02-20T09:39:34+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Profile for recording blood pressure vital signs in stroke patients using a single Observation with components.\nThe Observation is categorized as `vital-signs` and uses component entries for systolic and diastolic blood pressure.\n\n**Primary use-case**\n- Record repeated BP measurements across the episode (arrival, post-thrombolysis monitoring, ICU) by creating multiple Observations with different `effective[x]`.\n\n**Representation**\n- `Observation.component.code` bound to VitalSignCodesVS.\n- `Observation.component.valueQuantity` in UCUM mm[Hg].\n\n**Typical scenarios**\n1) One Observation with two components (systolic and diastolic) recorded at the same timepoint.\n2) Multiple Observations over time, each with the same component structure, to track BP trends during acute management and monitoring.",
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
      "id" : "Observation.category",
      "path" : "Observation.category",
      "min" : 1,
      "max" : "1",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "vital-signs"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "61746007",
          "display" : "Taking patient vital signs (procedure)"
        }]
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
      "type" : [{
        "code" : "Quantity"
      }],
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
    }]
  }
}

```
