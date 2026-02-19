# Base Profile for Stroke-Related Observations - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Base Profile for Stroke-Related Observations**

## Resource Profile: Base Profile for Stroke-Related Observations 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/base-stroke-observation | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:BaseStrokeObservation |

 
Common constraints for Observations captured in the context of stroke care across acute management and follow-up. This profile establishes a consistent minimum dataset and reference structure so that downstream profiles (vital signs, functional scores, timing metrics, onset circumstances, and specific findings) behave uniformly across systems. 
Key modeling intent: 
* Observation.status is fixed to final to indicate recorded results suitable for clinical reporting and analytics.
* Observation.subject (Patient) and Observation.encounter (index stroke encounter) are mandatory to ensure every observation is attributable to a specific person and care episode.
* Observation.partOf optionally links the observation to a Procedure (e.g., mechanical thrombectomy) when the observation represents a procedural outcome (e.g., mTICI grade) or a process metric.
* Observation.effective[x] is optional to accommodate cases where only a phase label is known; when available, effective[x] should be populated to support accurate sequencing and time-based analysis.
 

**Usages:**

* Derived from this Profile: [Age at Stroke Onset Observation Profile (R5)](StructureDefinition-age-at-onset-observation-profile.md), [Stroke Functional Score Observation Profile](StructureDefinition-functional-score-observation-profile.md), [Specific Stroke Finding Observation Profile (R5)](StructureDefinition-specific-finding-observation-profile.md), [Stroke Circumstance Observation Profile (R5)](StructureDefinition-stroke-circumstance-observation-profile.md)... Show 2 more, [Stroke Timing Metric Observation Profile (R5)](StructureDefinition-timing-metric-observation-profile.md) and [Stroke Vital Sign Observation Profile](StructureDefinition-vital-sign-observation-profile.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/base-stroke-observation)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-base-stroke-observation.csv), [Excel](StructureDefinition-base-stroke-observation.xlsx), [Schematron](StructureDefinition-base-stroke-observation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "base-stroke-observation",
  "url" : "http://tecnomod-um.org/StructureDefinition/base-stroke-observation",
  "version" : "0.1.0",
  "name" : "BaseStrokeObservation",
  "title" : "Base Profile for Stroke-Related Observations",
  "status" : "active",
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
  "description" : "Common constraints for Observations captured in the context of stroke care across acute management and follow-up. This profile establishes a consistent minimum dataset and reference structure so that downstream profiles (vital signs, functional scores, timing metrics, onset circumstances, and specific findings) behave uniformly across systems.\n\nKey modeling intent:\n- Observation.status is fixed to final to indicate recorded results suitable for clinical reporting and analytics.\n- Observation.subject (Patient) and Observation.encounter (index stroke encounter) are mandatory to ensure every observation is attributable to a specific person and care episode.\n- Observation.partOf optionally links the observation to a Procedure (e.g., mechanical thrombectomy) when the observation represents a procedural outcome (e.g., mTICI grade) or a process metric.\n- Observation.effective[x] is optional to accommodate cases where only a phase label is known; when available, effective[x] should be populated to support accurate sequencing and time-based analysis.",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Observation",
        "path" : "Observation"
      },
      {
        "id" : "Observation.partOf",
        "path" : "Observation.partOf",
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Procedure"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.status",
        "path" : "Observation.status",
        "patternCode" : "final",
        "mustSupport" : true
      },
      {
        "id" : "Observation.subject",
        "path" : "Observation.subject",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Observation.encounter",
        "path" : "Observation.encounter",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Observation.effective[x]",
        "path" : "Observation.effective[x]",
        "mustSupport" : true
      }
    ]
  }
}

```
