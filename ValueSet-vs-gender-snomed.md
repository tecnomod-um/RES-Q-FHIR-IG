# Gender (SNOMED CT) - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Gender (SNOMED CT)**

## ValueSet: Gender (SNOMED CT) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/vs-gender-snomed | *Version*:0.1.0 |
| Active as of 2026-02-17 | *Computable Name*:GenderSNOMEDVS |

 
Value set to represent patient gender using SNOMED CT codes, analogous to AdministrativeGender. 

 **References** 

* [Gender (SNOMED CT)](StructureDefinition-gender-snomed-ext.md)

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
  "id" : "vs-gender-snomed",
  "url" : "http://tecnomod-um.org/ValueSet/vs-gender-snomed",
  "version" : "0.1.0",
  "name" : "GenderSNOMEDVS",
  "title" : "Gender (SNOMED CT)",
  "status" : "active",
  "experimental" : false,
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
  "description" : "Value set to represent patient gender using SNOMED CT codes, analogous to AdministrativeGender.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "248153007",
            "display" : "Male (finding)"
          },
          {
            "code" : "248152002",
            "display" : "Female (finding)"
          },
          {
            "code" : "32570681000036106",
            "display" : "Indeterminate sex (finding)"
          }
        ]
      }
    ]
  }
}

```
