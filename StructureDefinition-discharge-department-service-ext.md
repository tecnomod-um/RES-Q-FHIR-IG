# Discharge Department/Service Extension - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Discharge Department/Service Extension**

## Extension: Discharge Department/Service Extension 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/discharge-department-service-ext | *Version*:0.1.0 |
| Draft as of 2026-02-20 | *Computable Name*:DischargeDepartmentServiceExtension |

Extension capturing the **clinical department/service** responsible at discharge or the service the patient is transferred to.

**Primary use-cases**

* Service-level reporting and capacity planning.
* Distinguishing discharge under neurology vs rehab vs other services.
* Supporting downstream routing/coordination logic when a service category is required.

**FHIR placement**

* `Encounter.extension[dischargeDepartmentService].valueCodeableConcept` (required binding to DischargeDeptVS).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md)
* Examples for this Extension: [Encounter/StrokeEncounterExample](Encounter-StrokeEncounterExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/discharge-department-service-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-discharge-department-service-ext.csv), [Excel](StructureDefinition-discharge-department-service-ext.xlsx), [Schematron](StructureDefinition-discharge-department-service-ext.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "discharge-department-service-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/discharge-department-service-ext",
  "version" : "0.1.0",
  "name" : "DischargeDepartmentServiceExtension",
  "title" : "Discharge Department/Service Extension",
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
  "description" : "Extension capturing the **clinical department/service** responsible at discharge or the service the patient is transferred to.\n\n**Primary use-cases**\n- Service-level reporting and capacity planning.\n- Distinguishing discharge under neurology vs rehab vs other services.\n- Supporting downstream routing/coordination logic when a service category is required.\n\n**FHIR placement**\n- `Encounter.extension[dischargeDepartmentService].valueCodeableConcept` (required binding to DischargeDeptVS).",
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
      "short" : "Discharge Department/Service Extension",
      "definition" : "Extension capturing the **clinical department/service** responsible at discharge or the service the patient is transferred to.\n\n**Primary use-cases**\n- Service-level reporting and capacity planning.\n- Distinguishing discharge under neurology vs rehab vs other services.\n- Supporting downstream routing/coordination logic when a service category is required.\n\n**FHIR placement**\n- `Encounter.extension[dischargeDepartmentService].valueCodeableConcept` (required binding to DischargeDeptVS)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/discharge-department-service-ext"
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
        "valueSet" : "http://tecnomod-um.org/ValueSet/discharge-dept-vs"
      }
    }]
  }
}

```
