# Stroke Symptom Onset Time Extension - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Symptom Onset Time Extension**

## Extension: Stroke Symptom Onset Time Extension 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/onset-time-ext | *Version*:1.0.0 |
| Active as of 2025-10-07 | *Computable Name*:OnsetTimeExt |

Extension capturing the **clock time** of symptom onset for the index stroke event.

**Primary use-cases**

* Enable precise onset-to-treatment intervals (e.g., onset-to-needle, onset-to-groin puncture).
* Improve accuracy of eligibility assessments in time-window–dependent interventions.

**When to use**

* Use when onset time is known with sufficient precision for clinical use.
* Omit if time is unknown or too uncertain.

**FHIR placement**

* `Condition.extension[onsetTime].valueTime`

**Implementation note**

* If `OnsetTimeExt` is present, `OnsetDateExt` should generally also be present (enforced as a warning invariant below).

To record stroke onset time for adherence to time-sensitive treatment pathways.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/onset-time-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-onset-time-ext.csv), [Excel](StructureDefinition-onset-time-ext.xlsx), [Schematron](StructureDefinition-onset-time-ext.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onset-time-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/onset-time-ext",
  "version" : "1.0.0",
  "name" : "OnsetTimeExt",
  "title" : "Stroke Symptom Onset Time Extension",
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
  "description" : "Extension capturing the **clock time** of symptom onset for the index stroke event.\n\n**Primary use-cases**\n- Enable precise onset-to-treatment intervals (e.g., onset-to-needle, onset-to-groin puncture).\n- Improve accuracy of eligibility assessments in time-window–dependent interventions.\n\n**When to use**\n- Use when onset time is known with sufficient precision for clinical use.\n- Omit if time is unknown or too uncertain.\n\n**FHIR placement**\n- `Condition.extension[onsetTime].valueTime`\n\n**Implementation note**\n- If `OnsetTimeExt` is present, `OnsetDateExt` should generally also be present (enforced as a warning invariant below).",
  "purpose" : "To record stroke onset time for adherence to time-sensitive treatment pathways.",
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
      "short" : "Stroke Symptom Onset Time Extension",
      "definition" : "Extension capturing the **clock time** of symptom onset for the index stroke event.\n\n**Primary use-cases**\n- Enable precise onset-to-treatment intervals (e.g., onset-to-needle, onset-to-groin puncture).\n- Improve accuracy of eligibility assessments in time-window–dependent interventions.\n\n**When to use**\n- Use when onset time is known with sufficient precision for clinical use.\n- Omit if time is unknown or too uncertain.\n\n**FHIR placement**\n- `Condition.extension[onsetTime].valueTime`\n\n**Implementation note**\n- If `OnsetTimeExt` is present, `OnsetDateExt` should generally also be present (enforced as a warning invariant below)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/onset-time-ext"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "time"
      }]
    }]
  }
}

```
