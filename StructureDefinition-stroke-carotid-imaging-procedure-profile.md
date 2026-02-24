# Stroke Carotid Imaging Procedure Profile - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Carotid Imaging Procedure Profile**

## Resource Profile: Stroke Carotid Imaging Procedure Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/stroke-carotid-imaging-procedure-profile | *Version*:1.0.0 |
| Active as of 2026-02-24 | *Computable Name*:StrokeCarotidImagingProcedureProfile |

 
Profile for documenting **carotid angiography** within a stroke episode. 
**Design intent** 
* This profile fixes `Procedure.code` to a specific SNOMED code (angiography of carotid artery).
* If you want multiple carotid modalities, replace the fixed code with a required binding to CarotidImagingModalityVS.
 
**Typical scenarios** 1) Carotid angiography performed: `status=completed`, `occurrence[x]` present, `timingContext` optional. 2) Carotid angiography not performed: `status=not-done`, `statusReason` required. 3) Carotid angiography performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional. 
**Use-cases** 
* Determining whether carotid angiography was performed during the episode.
* Capturing structured “not done” reasons for audit and quality improvement.
 

**Usages:**

* Examples for this Profile: [Procedure/StrokeCarotidImagingExample](Procedure-StrokeCarotidImagingExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/stroke-carotid-imaging-procedure-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-stroke-carotid-imaging-procedure-profile.csv), [Excel](StructureDefinition-stroke-carotid-imaging-procedure-profile.xlsx), [Schematron](StructureDefinition-stroke-carotid-imaging-procedure-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "stroke-carotid-imaging-procedure-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/stroke-carotid-imaging-procedure-profile",
  "version" : "1.0.0",
  "name" : "StrokeCarotidImagingProcedureProfile",
  "title" : "Stroke Carotid Imaging Procedure Profile",
  "status" : "active",
  "date" : "2026-02-24T10:24:43+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : " Profile for documenting **carotid angiography** within a stroke episode.\n\n**Design intent**\n- This profile fixes `Procedure.code` to a specific SNOMED code (angiography of carotid artery).\n- If you want multiple carotid modalities, replace the fixed code with a required binding to CarotidImagingModalityVS.\n\n**Typical scenarios**\n1) Carotid angiography performed: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Carotid angiography not performed: `status=not-done`, `statusReason` required.\n3) Carotid angiography performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional.\n\n**Use-cases**\n- Determining whether carotid angiography was performed during the episode.\n- Capturing structured “not done” reasons for audit and quality improvement.",
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 V2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Procedure",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure",
      "path" : "Procedure"
    },
    {
      "id" : "Procedure.extension",
      "path" : "Procedure.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Procedure.extension:timingContext",
      "path" : "Procedure.extension",
      "sliceName" : "timingContext",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Procedure.status",
      "path" : "Procedure.status",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/event-status"
      }
    },
    {
      "id" : "Procedure.statusReason",
      "path" : "Procedure.statusReason",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/stroke-proc-not-done-reason-vs"
      }
    },
    {
      "id" : "Procedure.code",
      "path" : "Procedure.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "58920005",
          "display" : "Angiography of carotid artery (procedure)"
        }]
      }
    }]
  }
}

```
