# Swallowing Screening Timing Category ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Swallowing Screening Timing Category ValueSet**

## ValueSet: Swallowing Screening Timing Category ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/swallowing-screening-timing-category-vs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:SwallowingScreeningTimingCategoryVS |

 
Temporal categories relative to stroke onset for swallowing screening. 

 **References** 

* [Swallowing Screening Timing Category](StructureDefinition-swallowing-screening-timing-category-ext.md)

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
  "id" : "swallowing-screening-timing-category-vs",
  "url" : "http://tecnomod-um.org/ValueSet/swallowing-screening-timing-category-vs",
  "version" : "0.1.0",
  "name" : "SwallowingScreeningTimingCategoryVS",
  "title" : "Swallowing Screening Timing Category ValueSet",
  "status" : "active",
  "date" : "2026-02-19T10:15:59+00:00",
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
  "description" : "Temporal categories relative to stroke onset for swallowing screening.",
  "compose" : {
    "include" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/swallow-screen-time-cs"
      },
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "281380002",
            "display" : "24 hours post admission (qualifier value)"
          },
          {
            "code" : "281381003",
            "display" : "More than 24 hours after admission (qualifier value)"
          }
        ]
      }
    ]
  }
}

```
