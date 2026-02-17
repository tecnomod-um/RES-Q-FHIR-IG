# Patient with SNOMED Gender and Age (extensions) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patient with SNOMED Gender and Age (extensions)**

## Resource Profile: Patient with SNOMED Gender and Age (extensions) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/patient-age-gender-snomed-profile | *Version*:0.1.0 |
| Draft as of 2026-02-17 | *Computable Name*:PatientAgeGenderSNOMEDProfile |

 
Profile that adds an integer age extension and a SNOMED-based gender extension. 

**Usages:**

* Examples for this Profile: [Patient/PatientAgeGenderSnomedExample](Patient-PatientAgeGenderSnomedExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/patient-age-gender-snomed-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-patient-age-gender-snomed-profile.csv), [Excel](StructureDefinition-patient-age-gender-snomed-profile.xlsx), [Schematron](StructureDefinition-patient-age-gender-snomed-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "patient-age-gender-snomed-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/patient-age-gender-snomed-profile",
  "version" : "0.1.0",
  "name" : "PatientAgeGenderSNOMEDProfile",
  "title" : "Patient with SNOMED Gender and Age (extensions)",
  "status" : "draft",
  "date" : "2026-02-17T08:49:13+00:00",
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
  "description" : "Profile that adds an integer age extension and a SNOMED-based gender extension.",
  "fhirVersion" : "5.0.0",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "interface",
      "uri" : "http://hl7.org/fhir/interface",
      "name" : "Interface Pattern"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 V2 Mapping"
    },
    {
      "identity" : "loinc",
      "uri" : "http://loinc.org",
      "name" : "LOINC code for the element"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Patient",
        "path" : "Patient"
      },
      {
        "id" : "Patient.extension",
        "path" : "Patient.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Patient.extension:age",
        "path" : "Patient.extension",
        "sliceName" : "age",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://tecnomod-um.org/StructureDefinition/patient-age-ext"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.extension:gender-sct",
        "path" : "Patient.extension",
        "sliceName" : "gender-sct",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://tecnomod-um.org/StructureDefinition/gender-snomed-ext"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Patient.gender",
        "path" : "Patient.gender",
        "max" : "0"
      }
    ]
  }
}

```
