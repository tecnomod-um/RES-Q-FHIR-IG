# Stroke Brain Imaging Procedure Profile - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Brain Imaging Procedure Profile**

## Resource Profile: Stroke Brain Imaging Procedure Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/stroke-brain-imaging-procedure-profile | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeBrainImagingProcedureProfile |

 
Profile for documenting **brain imaging performed during a stroke episode** as a FHIR R5 Procedure. 
**Captures** 
* `code`: imaging modality/protocol (required; standardized via BrainImagingModalityVS).
* `status`: procedure state (required).
* `statusReason`: why it was not done (when applicable).
* `occurrence[x]`: when imaging occurred (recommended/required by invariant when done locally).
* `extension[timingContext]`: acute/post-acute phase classification relative to encounter start.
 
**Typical scenarios** 1) Imaging completed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional. 2) Imaging not performed: `status=not-done`, `statusReason` required. 3) Imaging performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional (may not have exact time). 

**Usages:**

* Examples for this Profile: [Procedure/StrokeBrainImagingExample](Procedure-StrokeBrainImagingExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/stroke-brain-imaging-procedure-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-stroke-brain-imaging-procedure-profile.csv), [Excel](StructureDefinition-stroke-brain-imaging-procedure-profile.xlsx), [Schematron](StructureDefinition-stroke-brain-imaging-procedure-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "stroke-brain-imaging-procedure-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/stroke-brain-imaging-procedure-profile",
  "version" : "0.1.0",
  "name" : "StrokeBrainImagingProcedureProfile",
  "title" : "Stroke Brain Imaging Procedure Profile",
  "status" : "active",
  "date" : "2026-02-20T09:39:34+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : " Profile for documenting **brain imaging performed during a stroke episode** as a FHIR R5 Procedure.\n\n**Captures**\n- `code`: imaging modality/protocol (required; standardized via BrainImagingModalityVS).\n- `status`: procedure state (required).\n- `statusReason`: why it was not done (when applicable).\n- `occurrence[x]`: when imaging occurred (recommended/required by invariant when done locally).\n- `extension[timingContext]`: acute/post-acute phase classification relative to encounter start.\n\n**Typical scenarios**\n1) Imaging completed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Imaging not performed: `status=not-done`, `statusReason` required.\n3) Imaging performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional (may not have exact time).\n",
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
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/brain-imaging-modality-vs"
      }
    },
    {
      "id" : "Procedure.occurrence[x]",
      "path" : "Procedure.occurrence[x]",
      "mustSupport" : true
    }]
  }
}

```
