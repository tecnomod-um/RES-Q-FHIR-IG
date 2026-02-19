# Ischemic Stroke – Etiology - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Ischemic Stroke – Etiology**

## Extension: Ischemic Stroke – Etiology 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/ischemic-stroke-etiology-ext | *Version*:0.1.0 |
| Active as of 2025-10-07 | *Computable Name*:StrokeStrokeEtiologyExt |

Extension capturing the **determined ischemic stroke etiology classification**.

**Primary use-case**

* Attach to a definitive ischemic stroke Condition (`StrokeDiagnosisConditionProfile`) to support: 
* etiologic subgroup analytics (cardioembolic vs lacunar vs cryptogenic, etc.),
* pathway decision support (e.g., prolonged rhythm monitoring for cryptogenic stroke),
 

**When to use**

* Use after etiologic workup when a classification is assigned.
* Do not use for hemorrhagic stroke diagnoses.
* If the etiology remains unknown/undetermined, either omit the extension or use the “Undetermined” code included in StrokeEtiologyVS.

**FHIR placement**

* `Condition.extension[ischemicEtiology].valueCodeableConcept` (required binding to StrokeEtiologyVS).

To enable consistent categorization of ischemic stroke etiology for interoperability and analysis.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/ischemic-stroke-etiology-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ischemic-stroke-etiology-ext.csv), [Excel](StructureDefinition-ischemic-stroke-etiology-ext.xlsx), [Schematron](StructureDefinition-ischemic-stroke-etiology-ext.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ischemic-stroke-etiology-ext",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://tecnomod-um.org/StructureDefinition/ischemic-stroke-etiology-ext",
  "version" : "0.1.0",
  "name" : "StrokeStrokeEtiologyExt",
  "title" : "Ischemic Stroke – Etiology",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-07",
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
  "description" : "Extension capturing the **determined ischemic stroke etiology classification**.\n\n**Primary use-case**\n- Attach to a definitive ischemic stroke Condition (`StrokeDiagnosisConditionProfile`) to support:\n  - etiologic subgroup analytics (cardioembolic vs lacunar vs cryptogenic, etc.),\n  - pathway decision support (e.g., prolonged rhythm monitoring for cryptogenic stroke),\n\n**When to use**\n- Use after etiologic workup when a classification is assigned.\n- Do not use for hemorrhagic stroke diagnoses.\n- If the etiology remains unknown/undetermined, either omit the extension or use the “Undetermined” code included in StrokeEtiologyVS.\n\n**FHIR placement**\n- `Condition.extension[ischemicEtiology].valueCodeableConcept` (required binding to StrokeEtiologyVS).",
  "purpose" : "To enable consistent categorization of ischemic stroke etiology for interoperability and analysis.",
  "fhirVersion" : "5.0.0",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Condition"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Ischemic Stroke – Etiology",
        "definition" : "Extension capturing the **determined ischemic stroke etiology classification**.\n\n**Primary use-case**\n- Attach to a definitive ischemic stroke Condition (`StrokeDiagnosisConditionProfile`) to support:\n  - etiologic subgroup analytics (cardioembolic vs lacunar vs cryptogenic, etc.),\n  - pathway decision support (e.g., prolonged rhythm monitoring for cryptogenic stroke),\n\n**When to use**\n- Use after etiologic workup when a classification is assigned.\n- Do not use for hemorrhagic stroke diagnoses.\n- If the etiology remains unknown/undetermined, either omit the extension or use the “Undetermined” code included in StrokeEtiologyVS.\n\n**FHIR placement**\n- `Condition.extension[ischemicEtiology].valueCodeableConcept` (required binding to StrokeEtiologyVS)."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://tecnomod-um.org/StructureDefinition/ischemic-stroke-etiology-ext"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://tecnomod-um.org/ValueSet/stroke-etiology-vs"
        }
      }
    ]
  }
}

```
