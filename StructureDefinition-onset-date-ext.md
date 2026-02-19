# Stroke Symptom Onset Date Extension - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Symptom Onset Date Extension**

## Extension: Stroke Symptom Onset Date Extension 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/onset-date-ext | *Version*:0.1.0 |
| Active as of 2025-10-07 | *Computable Name*:OnsetDateExt |

Extension capturing the **calendar date** of symptom onset for the index stroke event.

**Primary use-cases**

* Compute onset-to-door and onset-to-treatment metrics when combined with encounter/treatment timestamps.
* Support time-sensitive eligibility pathways when onset is known at least to the day.

**When to use**

* Use when onset date is known with reasonable confidence.
* Use alongside `OnsetTimeExt` when time-of-day precision is available.
* Omit if onset is unknown, only broadly estimated, or not applicable (e.g., certain in-hospital events may use different timing constructs).

**FHIR placement**

* `Condition.extension[onsetDate].valueDate`

To record stroke onset date for clinical decision making and quality metrics.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/onset-date-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-onset-date-ext.csv), [Excel](StructureDefinition-onset-date-ext.xlsx), [Schematron](StructureDefinition-onset-date-ext.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "onset-date-ext",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://tecnomod-um.org/StructureDefinition/onset-date-ext",
  "version" : "0.1.0",
  "name" : "OnsetDateExt",
  "title" : "Stroke Symptom Onset Date Extension",
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
  "description" : "Extension capturing the **calendar date** of symptom onset for the index stroke event.\n\n**Primary use-cases**\n- Compute onset-to-door and onset-to-treatment metrics when combined with encounter/treatment timestamps.\n- Support time-sensitive eligibility pathways when onset is known at least to the day.\n\n**When to use**\n- Use when onset date is known with reasonable confidence.\n- Use alongside `OnsetTimeExt` when time-of-day precision is available.\n- Omit if onset is unknown, only broadly estimated, or not applicable (e.g., certain in-hospital events may use different timing constructs).\n\n**FHIR placement**\n- `Condition.extension[onsetDate].valueDate`",
  "purpose" : "To record stroke onset date for clinical decision making and quality metrics.",
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
        "short" : "Stroke Symptom Onset Date Extension",
        "definition" : "Extension capturing the **calendar date** of symptom onset for the index stroke event.\n\n**Primary use-cases**\n- Compute onset-to-door and onset-to-treatment metrics when combined with encounter/treatment timestamps.\n- Support time-sensitive eligibility pathways when onset is known at least to the day.\n\n**When to use**\n- Use when onset date is known with reasonable confidence.\n- Use alongside `OnsetTimeExt` when time-of-day precision is available.\n- Omit if onset is unknown, only broadly estimated, or not applicable (e.g., certain in-hospital events may use different timing constructs).\n\n**FHIR placement**\n- `Condition.extension[onsetDate].valueDate`"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://tecnomod-um.org/StructureDefinition/onset-date-ext"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "date"
          }
        ]
      }
    ]
  }
}

```
