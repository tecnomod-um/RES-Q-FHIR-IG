# First Hospital Indicator Extension - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **First Hospital Indicator Extension**

## Extension: First Hospital Indicator Extension 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/first-hospital-ext | *Version*:1.0.0 |
| Draft as of 2026-02-20 | *Computable Name*:FirstHospitalExtension |

Boolean extension indicating whether the reporting hospital was the **first medical facility** to admit the patient for this stroke episode.

**Primary use-cases**

* Registry fields distinguishing “direct to treating hospital” vs “secondary transfer”.
* Analytics for inter-facility transfer patterns and treatment delays (door-in-door-out style analyses).

**How to interpret**

* `true`: this hospital is the first admitting facility for the episode.
* `false`: patient was admitted/treated elsewhere first (transfer-in).

**FHIR placement**

* `Encounter.extension[isFirstHospital].valueBoolean`

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md)
* Examples for this Extension: [Encounter/StrokeEncounterExample](Encounter-StrokeEncounterExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/first-hospital-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-first-hospital-ext.csv), [Excel](StructureDefinition-first-hospital-ext.xlsx), [Schematron](StructureDefinition-first-hospital-ext.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "first-hospital-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/first-hospital-ext",
  "version" : "1.0.0",
  "name" : "FirstHospitalExtension",
  "title" : "First Hospital Indicator Extension",
  "status" : "draft",
  "date" : "2026-02-20T09:50:49+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Boolean extension indicating whether the reporting hospital was the **first medical facility** to admit the patient\nfor this stroke episode.\n\n**Primary use-cases**\n- Registry fields distinguishing “direct to treating hospital” vs “secondary transfer”.\n- Analytics for inter-facility transfer patterns and treatment delays (door-in-door-out style analyses).\n\n**How to interpret**\n- `true`: this hospital is the first admitting facility for the episode.\n- `false`: patient was admitted/treated elsewhere first (transfer-in).\n\n**FHIR placement**\n- `Encounter.extension[isFirstHospital].valueBoolean`",
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
      "short" : "First Hospital Indicator Extension",
      "definition" : "Boolean extension indicating whether the reporting hospital was the **first medical facility** to admit the patient\nfor this stroke episode.\n\n**Primary use-cases**\n- Registry fields distinguishing “direct to treating hospital” vs “secondary transfer”.\n- Analytics for inter-facility transfer patterns and treatment delays (door-in-door-out style analyses).\n\n**How to interpret**\n- `true`: this hospital is the first admitting facility for the episode.\n- `false`: patient was admitted/treated elsewhere first (transfer-in).\n\n**FHIR placement**\n- `Encounter.extension[isFirstHospital].valueBoolean`"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/first-hospital-ext"
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
