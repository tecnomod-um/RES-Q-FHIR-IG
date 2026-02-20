# Initial Care Intensity Extension - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Initial Care Intensity Extension**

## Extension: Initial Care Intensity Extension 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/initial-care-intensity-ext | *Version*:0.1.0 |
| Draft as of 2026-02-20 | *Computable Name*:InitialCareIntensityExtension |

Extension capturing the **initial level of care** provided during the first day(s) of hospitalization for the stroke encounter.

**Primary use-cases**

* Operational reporting (ICU/stroke unit utilization).
* Case-mix adjustment for outcomes and length-of-stay analyses.
* Benchmarking across sites.

**Relationship to base Encounter**

* This is not a location/ward tracker; for physical moves use `Encounter.location` with Location references.
* This is a categorical “initial intensity” label used for reporting.

**FHIR placement**

* `Encounter.extension[initialCareIntensity].valueCodeableConcept` (required binding to InitialCareIntensityVS).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md)
* Examples for this Extension: [Encounter/StrokeEncounterExample](Encounter-StrokeEncounterExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/initial-care-intensity-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-initial-care-intensity-ext.csv), [Excel](StructureDefinition-initial-care-intensity-ext.xlsx), [Schematron](StructureDefinition-initial-care-intensity-ext.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "initial-care-intensity-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/initial-care-intensity-ext",
  "version" : "0.1.0",
  "name" : "InitialCareIntensityExtension",
  "title" : "Initial Care Intensity Extension",
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
  "description" : "Extension capturing the **initial level of care** provided during the first day(s) of hospitalization for the stroke encounter.\n\n**Primary use-cases**\n- Operational reporting (ICU/stroke unit utilization).\n- Case-mix adjustment for outcomes and length-of-stay analyses.\n- Benchmarking across sites.\n\n**Relationship to base Encounter**\n- This is not a location/ward tracker; for physical moves use `Encounter.location` with Location references.\n- This is a categorical “initial intensity” label used for reporting.\n\n**FHIR placement**\n- `Encounter.extension[initialCareIntensity].valueCodeableConcept` (required binding to InitialCareIntensityVS).",
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
    "expression" : "Encounter"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Initial Care Intensity Extension",
      "definition" : "Extension capturing the **initial level of care** provided during the first day(s) of hospitalization for the stroke encounter.\n\n**Primary use-cases**\n- Operational reporting (ICU/stroke unit utilization).\n- Case-mix adjustment for outcomes and length-of-stay analyses.\n- Benchmarking across sites.\n\n**Relationship to base Encounter**\n- This is not a location/ward tracker; for physical moves use `Encounter.location` with Location references.\n- This is a categorical “initial intensity” label used for reporting.\n\n**FHIR placement**\n- `Encounter.extension[initialCareIntensity].valueCodeableConcept` (required binding to InitialCareIntensityVS)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/initial-care-intensity-ext"
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
        "valueSet" : "http://tecnomod-um.org/ValueSet/initial-care-intensity-vs"
      }
    }]
  }
}

```
