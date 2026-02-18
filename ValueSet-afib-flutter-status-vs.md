# Atrial Fibrillation or Flutter Status ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Atrial Fibrillation or Flutter Status ValueSet**

## ValueSet: Atrial Fibrillation or Flutter Status ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/afib-flutter-status-vs | *Version*:0.1.0 |
| Active as of 2025-03-31 | *Computable Name*:AfibFlutterStatusVS |

 
ValueSet defining the allowed coded outcomes for documenting the status of an Atrial Fibrillation (AF) or Atrial Flutter assessment. It is intentionally restricted to SNOMED CT qualifier values to express: (1) known present, (2) known absent, or (3) unknown. The ValueSet supports harmonized recording across systems, improves comparability for clinical decision support and research, and enables consistent reporting in contexts where AF/flutter materially influences thromboembolic risk and subsequent management. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R5/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "afib-flutter-status-vs",
  "url" : "http://tecnomod-um.org/ValueSet/afib-flutter-status-vs",
  "version" : "0.1.0",
  "name" : "AfibFlutterStatusVS",
  "title" : "Atrial Fibrillation or Flutter Status ValueSet",
  "status" : "active",
  "date" : "2025-03-31",
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
  "description" : "ValueSet defining the allowed coded outcomes for documenting the status of an Atrial Fibrillation (AF) or Atrial Flutter assessment. It is intentionally restricted to SNOMED CT qualifier values to express: (1) known present, (2) known absent, or (3) unknown. The ValueSet supports harmonized recording across systems, improves comparability for clinical decision support and research, and enables consistent reporting in contexts where AF/flutter materially influences thromboembolic risk and subsequent management.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "410515003",
            "display" : "Known present (qualifier value)"
          },
          {
            "code" : "410516002",
            "display" : "Known absent (qualifier value)"
          },
          {
            "code" : "261665006",
            "display" : "Unknown (qualifier value)"
          }
        ]
      }
    ]
  }
}

```
