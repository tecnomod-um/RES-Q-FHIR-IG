# Stroke Thrombolysis Procedure Profile - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Thrombolysis Procedure Profile**

## Resource Profile: Stroke Thrombolysis Procedure Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/stroke-mechanical-procedure-profile | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeThrombolysisProcedureProfile |

 
Profile for documenting **stroke reperfusion procedures** as FHIR Procedure: 
* IV thrombolysis (IVT)
* Mechanical thrombectomy (MT)
 
**Captures** 
* `code`: restricted to reperfusion procedures (PerforationProceduresVS).
* `status`: completed/not-done/etc.
* `statusReason`: controlled reason set when not done.
* `occurrence[x]` (constrained to Period): start/end time of the intervention when available.
* `complication`: complications (as CodeableReference to Condition) — constrained by invariants.
* `extension[timingContext]`: acute/post-acute phase classification.
 
**Typical scenarios** 1) Reperfusion performed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional. 2) Reperfusion not performed: `status=not-done`, `statusReason` required. 3) Reperfusion performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional. 4) Reperfusion attempted but complicated by perforation: `status=completed`, `complication` = perforation code, `occurrence[x]` captures timing of the attempt. 

**Usages:**

* Examples for this Profile: [Procedure/StrokeThrombolysisExample](Procedure-StrokeThrombolysisExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/stroke-mechanical-procedure-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-stroke-mechanical-procedure-profile.csv), [Excel](StructureDefinition-stroke-mechanical-procedure-profile.xlsx), [Schematron](StructureDefinition-stroke-mechanical-procedure-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "stroke-mechanical-procedure-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/stroke-mechanical-procedure-profile",
  "version" : "1.0.0",
  "name" : "StrokeThrombolysisProcedureProfile",
  "title" : "Stroke Thrombolysis Procedure Profile",
  "status" : "active",
  "date" : "2026-02-20T10:17:22+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Profile for documenting **stroke reperfusion procedures** as FHIR Procedure:\n- IV thrombolysis (IVT)\n- Mechanical thrombectomy (MT)\n\n**Captures**\n- `code`: restricted to reperfusion procedures (PerforationProceduresVS).\n- `status`: completed/not-done/etc.\n- `statusReason`: controlled reason set when not done.\n- `occurrence[x]` (constrained to Period): start/end time of the intervention when available.\n- `complication`: complications (as CodeableReference to Condition) — constrained by invariants.\n- `extension[timingContext]`: acute/post-acute phase classification.\n\n**Typical scenarios**\n1) Reperfusion performed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Reperfusion not performed: `status=not-done`, `statusReason` required.\n3) Reperfusion performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional.\n4) Reperfusion attempted but complicated by perforation: `status=completed`, `complication` = perforation code, `occurrence[x]` captures timing of the attempt.\n",
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
        "valueSet" : "http://tecnomod-um.org/ValueSet/perforation-procedures-vs"
      }
    },
    {
      "id" : "Procedure.occurrence[x]",
      "path" : "Procedure.occurrence[x]",
      "type" : [{
        "code" : "Period"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Procedure.occurrence[x].start",
      "path" : "Procedure.occurrence[x].start",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.occurrence[x].end",
      "path" : "Procedure.occurrence[x].end",
      "mustSupport" : true
    },
    {
      "id" : "Procedure.complication",
      "path" : "Procedure.complication",
      "mustSupport" : true
    }]
  }
}

```
