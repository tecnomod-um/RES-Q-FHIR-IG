# Stroke Timing Metric Observation Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Timing Metric Observation Profile (R5)**

## Resource Profile: Stroke Timing Metric Observation Profile (R5) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/timing-metric-observation-profile | *Version*:0.1.0 |
| Draft as of 2026-02-19 | *Computable Name*:TimingMetricObservationProfile |

 
Profile for recording acute stroke process timing metrics as measured durations (e.g., Door-to-Needle, Door-to-Groin). 
**Primary use-case** 
* Quality monitoring and pathway optimization where the interval value is the primary datum.
 
**Representation** 
* `Observation.code` bound to TimingMetricCodesVS.
* `Observation.valueQuantity` as UCUM minutes (`min`).
 
**Typical scenarios** 1) A Door-to-Needle time of 45 minutes would be represented as an Observation with `code` = D2N code, `valueQuantity` = 45, `valueQuantity.unit` = "minute", and the appropriate UCUM system/code. 2) A Door-to-Groin time of 90 minutes would be represented similarly with `code` = D2G code and `valueQuantity` = 90. 

**Usages:**

* Examples for this Profile: [Observation/TimingMetricObservationExample](Observation-TimingMetricObservationExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/timing-metric-observation-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-timing-metric-observation-profile.csv), [Excel](StructureDefinition-timing-metric-observation-profile.xlsx), [Schematron](StructureDefinition-timing-metric-observation-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "timing-metric-observation-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/timing-metric-observation-profile",
  "version" : "0.1.0",
  "name" : "TimingMetricObservationProfile",
  "title" : "Stroke Timing Metric Observation Profile (R5)",
  "status" : "draft",
  "date" : "2026-02-19T14:25:22+00:00",
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
  "description" : "Profile for recording acute stroke process timing metrics as measured durations (e.g., Door-to-Needle, Door-to-Groin).\n\n**Primary use-case**\n- Quality monitoring and pathway optimization where the interval value is the primary datum.\n\n**Representation**\n- `Observation.code` bound to TimingMetricCodesVS.\n- `Observation.valueQuantity` as UCUM minutes (`min`).\n\n**Typical scenarios**\n1) A Door-to-Needle time of 45 minutes would be represented as an Observation with `code` = D2N code, `valueQuantity` = 45, `valueQuantity.unit` = \"minute\", and the appropriate UCUM system/code.\n2) A Door-to-Groin time of 90 minutes would be represented similarly with `code` = D2G code and `valueQuantity` = 90.\n",
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
              "code" : "procedure"
            }
          ]
        },
        "mustSupport" : true
      },
      {
        "id" : "Observation.code",
        "path" : "Observation.code",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://tecnomod-um.org/ValueSet/timing-metric-codes-vs"
        }
      },
      {
        "id" : "Observation.value[x]",
        "path" : "Observation.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "Quantity"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.value[x].unit",
        "path" : "Observation.value[x].unit",
        "patternString" : "minute"
      },
      {
        "id" : "Observation.value[x].system",
        "path" : "Observation.value[x].system",
        "patternUri" : "https://ucum.org/ucum"
      },
      {
        "id" : "Observation.value[x].code",
        "path" : "Observation.value[x].code",
        "patternCode" : "min"
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
