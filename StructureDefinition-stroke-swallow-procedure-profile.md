# Stroke Swallow Procedure Profile - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Swallow Procedure Profile**

## Resource Profile: Stroke Swallow Procedure Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/stroke-swallow-procedure-profile | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeSwallowProcedureProfile |

 
Profile for documenting **swallow screening / dysphagia assessment** during a stroke episode. 
**Captures** 
* `code`: the screening/assessment procedure or tool used (SwallowProceduresVS).
* `status`: whether completed or not done.
* `statusReason`: controlled reason set when not done.
* `extension[screeningTimingCategory]`: timing bucket (e.g., within 4h).
* `extension[timingContext]`: acute/post-acute phase relative to encounter start.
 
** Typical scenarios** 1) Screening completed on-site: `status=completed`, `extension[screeningTimingCategory]` optional, `extension[timingContext]` optional. 2) Screening not performed: `status=not-done`, `statusReason` required. 3) Screening performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `extension[screeningTimingCategory]` optional. 

**Usages:**

* Examples for this Profile: [Procedure/StrokeSwallowingExample](Procedure-StrokeSwallowingExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/stroke-swallow-procedure-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-stroke-swallow-procedure-profile.csv), [Excel](StructureDefinition-stroke-swallow-procedure-profile.xlsx), [Schematron](StructureDefinition-stroke-swallow-procedure-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "stroke-swallow-procedure-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/stroke-swallow-procedure-profile",
  "version" : "0.1.0",
  "name" : "StrokeSwallowProcedureProfile",
  "title" : "Stroke Swallow Procedure Profile",
  "status" : "active",
  "date" : "2026-02-20T08:47:00+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : " Profile for documenting **swallow screening / dysphagia assessment** during a stroke episode.\n\n**Captures**\n- `code`: the screening/assessment procedure or tool used (SwallowProceduresVS).\n- `status`: whether completed or not done.\n- `statusReason`: controlled reason set when not done.\n- `extension[screeningTimingCategory]`: timing bucket (e.g., within 4h).\n- `extension[timingContext]`: acute/post-acute phase relative to encounter start.\n\n\n** Typical scenarios**\n1) Screening completed on-site: `status=completed`, `extension[screeningTimingCategory]` optional, `extension[timingContext]` optional.\n2) Screening not performed: `status=not-done`, `statusReason` required.\n3) Screening performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `extension[screeningTimingCategory]` optional.\n",
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
      "id" : "Procedure.extension:screeningTimingCategory",
      "path" : "Procedure.extension",
      "sliceName" : "screeningTimingCategory",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://tecnomod-um.org/StructureDefinition/swallowing-screening-timing-category-ext"]
      }],
      "mustSupport" : true
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
        "valueSet" : "http://tecnomod-um.org/ValueSet/swallow-procedures-vs"
      }
    }]
  }
}

```
