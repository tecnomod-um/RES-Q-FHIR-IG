# Required Post-Acute Care Extension - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Required Post-Acute Care Extension**

## Extension: Required Post-Acute Care Extension 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/required-post-acute-care-ext | *Version*:1.0.0 |
| Draft as of 2026-02-20 | *Computable Name*:RequiredPostAcuteCareExtension |

Boolean extension indicating whether the patient required **ongoing inpatient care beyond the acute phase**.

**Interpretation guidance**

* `true`: patient required hospitalization beyond the acute phase (operationalized here as >24 hours after the acute phase).
* `false`: no extended post-acute inpatient need was recorded for this encounter (per local workflow).

**FHIR placement**

* `Encounter.extension[requiredPostAcuteCare].valueBoolean`

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md)
* Examples for this Extension: [Encounter/StrokeEncounterExample](Encounter-StrokeEncounterExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/required-post-acute-care-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-required-post-acute-care-ext.csv), [Excel](StructureDefinition-required-post-acute-care-ext.xlsx), [Schematron](StructureDefinition-required-post-acute-care-ext.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "required-post-acute-care-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/required-post-acute-care-ext",
  "version" : "1.0.0",
  "name" : "RequiredPostAcuteCareExtension",
  "title" : "Required Post-Acute Care Extension",
  "status" : "draft",
  "date" : "2026-02-20T10:17:22+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Boolean extension indicating whether the patient required **ongoing inpatient care beyond the acute phase**.\n\n**Interpretation guidance**\n- `true`: patient required hospitalization beyond the acute phase (operationalized here as >24 hours after the acute phase).\n- `false`: no extended post-acute inpatient need was recorded for this encounter (per local workflow).\n\n**FHIR placement**\n- `Encounter.extension[requiredPostAcuteCare].valueBoolean`",
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
      "short" : "Required Post-Acute Care Extension",
      "definition" : "Boolean extension indicating whether the patient required **ongoing inpatient care beyond the acute phase**.\n\n**Interpretation guidance**\n- `true`: patient required hospitalization beyond the acute phase (operationalized here as >24 hours after the acute phase).\n- `false`: no extended post-acute inpatient need was recorded for this encounter (per local workflow).\n\n**FHIR placement**\n- `Encounter.extension[requiredPostAcuteCare].valueBoolean`"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/required-post-acute-care-ext"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
