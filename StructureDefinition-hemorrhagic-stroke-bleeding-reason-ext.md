# Hemorrhagic Stroke – Bleeding Reason - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Hemorrhagic Stroke – Bleeding Reason**

## Extension: Hemorrhagic Stroke – Bleeding Reason 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/hemorrhagic-stroke-bleeding-reason-ext | *Version*:1.0.0 |
| Active as of 2025-10-07 | *Computable Name*:HemorrhagicStrokeBleedingReasonExt |

Extension capturing the **identified cause of intracranial bleeding** in a hemorrhagic stroke.

**Primary use-case**

* Attach to a definitive hemorrhagic stroke Condition (`StrokeDiagnosisConditionProfile`) to support: 
* etiologic stratification (aneurysm vs vascular malformation vs other),
* analytics and registry reporting,
* targeted clinical decision support pathways.
 

**FHIR placement**

* `Condition.extension[bleedingReason].valueCodeableConcept` (required binding to HemorrhagicStrokeBleedingReasonVS).

To standardize capture of the bleeding cause in hemorrhagic stroke conditions for decision support and analytics.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/hemorrhagic-stroke-bleeding-reason-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-hemorrhagic-stroke-bleeding-reason-ext.csv), [Excel](StructureDefinition-hemorrhagic-stroke-bleeding-reason-ext.xlsx), [Schematron](StructureDefinition-hemorrhagic-stroke-bleeding-reason-ext.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "hemorrhagic-stroke-bleeding-reason-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/hemorrhagic-stroke-bleeding-reason-ext",
  "version" : "1.0.0",
  "name" : "HemorrhagicStrokeBleedingReasonExt",
  "title" : "Hemorrhagic Stroke – Bleeding Reason",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-07",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Extension capturing the **identified cause of intracranial bleeding** in a hemorrhagic stroke.\n\n**Primary use-case**\n- Attach to a definitive hemorrhagic stroke Condition (`StrokeDiagnosisConditionProfile`) to support:\n  - etiologic stratification (aneurysm vs vascular malformation vs other),\n  - analytics and registry reporting,\n  - targeted clinical decision support pathways.\n\n**FHIR placement**\n- `Condition.extension[bleedingReason].valueCodeableConcept` (required binding to HemorrhagicStrokeBleedingReasonVS).",
  "purpose" : "To standardize capture of the bleeding cause in hemorrhagic stroke conditions for decision support and analytics.",
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
    "expression" : "Condition"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Hemorrhagic Stroke – Bleeding Reason",
      "definition" : "Extension capturing the **identified cause of intracranial bleeding** in a hemorrhagic stroke.\n\n**Primary use-case**\n- Attach to a definitive hemorrhagic stroke Condition (`StrokeDiagnosisConditionProfile`) to support:\n  - etiologic stratification (aneurysm vs vascular malformation vs other),\n  - analytics and registry reporting,\n  - targeted clinical decision support pathways.\n\n**FHIR placement**\n- `Condition.extension[bleedingReason].valueCodeableConcept` (required binding to HemorrhagicStrokeBleedingReasonVS)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/hemorrhagic-stroke-bleeding-reason-ext"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://tecnomod-um.org/ValueSet/hemorrhagic-stroke-bleeding-reason-vs"
      }
    }]
  }
}

```
