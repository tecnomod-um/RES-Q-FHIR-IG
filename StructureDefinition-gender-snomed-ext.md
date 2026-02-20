# Gender (SNOMED CT) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Gender (SNOMED CT)**

## Extension: Gender (SNOMED CT) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/gender-snomed-ext | *Version*:0.1.0 |
| Draft as of 2026-02-20 | *Computable Name*:GenderSNOMED |

Patient gender represented with SNOMED CT codes.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Patient with SNOMED Gender and Age (extensions)](StructureDefinition-patient-age-gender-snomed-profile.md)
* Examples for this Extension: [Patient/PatientAgeGenderSnomedExample](Patient-PatientAgeGenderSnomedExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/gender-snomed-ext)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-gender-snomed-ext.csv), [Excel](StructureDefinition-gender-snomed-ext.xlsx), [Schematron](StructureDefinition-gender-snomed-ext.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "gender-snomed-ext",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://tecnomod-um.org/StructureDefinition/gender-snomed-ext",
  "version" : "0.1.0",
  "name" : "GenderSNOMED",
  "title" : "Gender (SNOMED CT)",
  "status" : "draft",
  "date" : "2026-02-20T08:47:00+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Patient gender represented with SNOMED CT codes.",
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
    "expression" : "Patient"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Gender (SNOMED CT)",
      "definition" : "Patient gender represented with SNOMED CT codes."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://tecnomod-um.org/StructureDefinition/gender-snomed-ext"
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
        "valueSet" : "http://tecnomod-um.org/ValueSet/vs-gender-snomed"
      }
    }]
  }
}

```
