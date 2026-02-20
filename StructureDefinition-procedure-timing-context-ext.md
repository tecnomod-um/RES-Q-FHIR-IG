# Procedure Timing Context Extension - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Procedure Timing Context Extension**

## Extension: Procedure Timing Context Extension 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext | *Version*:0.1.0 |
| Draft as of 2026-02-20 | *Computable Name*:ProcedureTimingContextExtension |

Extension classifying the procedure into a **timing context** relative to encounter start (acute/post-acute).

**Primary use-case**

* Operational reporting where “phase of care” is needed for compliance measures.

**When to use**

* When you want a stable, comparable phase label across sites (even if absolute times differ or onset time is uncertain).

**Interpretation guidance**

* Use `acute` for procedures within 24 hours of encounter start.
* Use `post-acute` for procedures after 24 hours.
* Use `unknown` when encounter/timing data are insufficient.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Brain Imaging Procedure Profile](StructureDefinition-stroke-brain-imaging-procedure-profile.md), [Stroke Carotid Imaging Procedure Profile](StructureDefinition-stroke-carotid-imaging-procedure-profile.md), [Stroke Thrombolysis Procedure Profile](StructureDefinition-stroke-mechanical-procedure-profile.md) and [Stroke Swallow Procedure Profile](StructureDefinition-stroke-swallow-procedure-profile.md)
* Examples for this Extension: [Procedure/StrokeBrainImagingExample](Procedure-StrokeBrainImagingExample.md), [Procedure/StrokeCarotidImagingExample](Procedure-StrokeCarotidImagingExample.md), [Procedure/StrokeSwallowingExample](Procedure-StrokeSwallowingExample.md) and [Procedure/StrokeThrombolysisExample](Procedure-StrokeThrombolysisExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/procedure-timing-context-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-procedure-timing-context-ext.csv), [Excel](StructureDefinition-procedure-timing-context-ext.xlsx), [Schematron](StructureDefinition-procedure-timing-context-ext.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "procedure-timing-context-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext",
  "version" : "0.1.0",
  "name" : "ProcedureTimingContextExtension",
  "title" : "Procedure Timing Context Extension",
  "status" : "draft",
  "date" : "2026-02-20T08:36:31+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Extension classifying the procedure into a **timing context** relative to encounter start (acute/post-acute).\n\n**Primary use-case**\n- Operational reporting where “phase of care” is needed for compliance measures.\n\n**When to use**\n- When you want a stable, comparable phase label across sites (even if absolute times differ or onset time is uncertain).\n\n**Interpretation guidance**\n- Use `acute` for procedures within 24 hours of encounter start.\n- Use `post-acute` for procedures after 24 hours.\n- Use `unknown` when encounter/timing data are insufficient.",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Procedure"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Procedure Timing Context Extension",
      "definition" : "Extension classifying the procedure into a **timing context** relative to encounter start (acute/post-acute).\n\n**Primary use-case**\n- Operational reporting where “phase of care” is needed for compliance measures.\n\n**When to use**\n- When you want a stable, comparable phase label across sites (even if absolute times differ or onset time is uncertain).\n\n**Interpretation guidance**\n- Use `acute` for procedures within 24 hours of encounter start.\n- Use `post-acute` for procedures after 24 hours.\n- Use `unknown` when encounter/timing data are insufficient."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/procedure-timing-context-vs"
      }
    }]
  }
}

```
