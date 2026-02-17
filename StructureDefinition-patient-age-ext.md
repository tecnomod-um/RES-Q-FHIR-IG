# Patient Age (integer) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patient Age (integer)**

## Extension: Patient Age (integer) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/patient-age-ext | *Version*:0.1.0 |
| Draft as of 2026-02-17 | *Computable Name*:PatientAge |

Patient age in years represented as an integer.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Patient with SNOMED Gender and Age (extensions)](StructureDefinition-patient-age-gender-snomed-profile.md)
* Examples for this Extension: [Patient/PatientAgeGenderSnomedExample](Patient-PatientAgeGenderSnomedExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/patient-age-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-patient-age-ext.csv), [Excel](StructureDefinition-patient-age-ext.xlsx), [Schematron](StructureDefinition-patient-age-ext.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "patient-age-ext",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://tecnomod-um.org/StructureDefinition/patient-age-ext",
  "version" : "0.1.0",
  "name" : "PatientAge",
  "title" : "Patient Age (integer)",
  "status" : "draft",
  "date" : "2026-02-17T08:59:32+00:00",
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
  "description" : "Patient age in years represented as an integer.",
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
      "expression" : "Patient"
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
        "short" : "Patient Age (integer)",
        "definition" : "Patient age in years represented as an integer."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://tecnomod-um.org/StructureDefinition/patient-age-ext"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Age in years (integer)",
        "min" : 1,
        "type" : [
          {
            "code" : "integer"
          }
        ]
      }
    ]
  }
}

```
