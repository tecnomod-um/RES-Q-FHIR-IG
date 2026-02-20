# Swallowing Screening Timing Category - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Swallowing Screening Timing Category**

## Extension: Swallowing Screening Timing Category 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/swallowing-screening-timing-category-ext | *Version*:0.1.0 |
| Draft as of 2026-02-20 | *Computable Name*:SwallowingScreeningTimingCategoryExt |

Temporal category relative to stroke onset in which the swallowing screening was performed.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Swallow Procedure Profile](StructureDefinition-stroke-swallow-procedure-profile.md)
* Examples for this Extension: [Procedure/StrokeSwallowingExample](Procedure-StrokeSwallowingExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/swallowing-screening-timing-category-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-swallowing-screening-timing-category-ext.csv), [Excel](StructureDefinition-swallowing-screening-timing-category-ext.xlsx), [Schematron](StructureDefinition-swallowing-screening-timing-category-ext.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "swallowing-screening-timing-category-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/swallowing-screening-timing-category-ext",
  "version" : "0.1.0",
  "name" : "SwallowingScreeningTimingCategoryExt",
  "title" : "Swallowing Screening Timing Category",
  "status" : "draft",
  "date" : "2026-02-20T08:43:58+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Temporal category relative to stroke onset in which the swallowing screening was performed.",
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
      "short" : "Swallowing Screening Timing Category Extension",
      "definition" : " Extension capturing the **timing category** of swallowing screening relative to stroke onset/admission.\n\n**When to use**\n- When you cannot reliably store an exact timestamp (or want an additional categorical indicator even if a timestamp exists).\n\n**How it complements base elements**\n- `Procedure.occurrence[x]` stores the exact time when available.\n- This extension stores a categorical bucket to support standardized reporting."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/swallowing-screening-timing-category-ext"
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
        "valueSet" : "http://tecnomod-um.org/ValueSet/swallowing-screening-timing-category-vs"
      }
    }]
  }
}

```
