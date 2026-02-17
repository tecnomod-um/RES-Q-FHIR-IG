# Stroke Brain Imaging Procedure Profile (R5) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Brain Imaging Procedure Profile (R5)**

## Resource Profile: Stroke Brain Imaging Procedure Profile (R5) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/stroke-brain-imaging-procedure-profile | *Version*:0.1.0 |
| Active as of 2026-02-17 | *Computable Name*:StrokeBrainImagingProcedureProfile |

 
Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context. 

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
  "title" : "Stroke Brain Imaging Procedure Profile (R5)",
  "status" : "active",
  "date" : "2026-02-17T08:49:13+00:00",
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
  "description" : "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context.",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 V2 Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Procedure",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Procedure",
        "path" : "Procedure"
      },
      {
        "id" : "Procedure.extension",
        "path" : "Procedure.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
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
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext"
            ]
          }
        ],
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
      }
    ]
  }
}

```
