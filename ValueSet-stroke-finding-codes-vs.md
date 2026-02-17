# Specific Stroke Finding Codes ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Specific Stroke Finding Codes ValueSet**

## ValueSet: Specific Stroke Finding Codes ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-finding-codes-vs | *Version*:0.1.0 |
| Active as of 2026-02-17 | *Computable Name*:StrokeFindingCodesVS |

 
ValueSet for specific coded findings like Afib/Flutter status or mTICI score. 

 **References** 

* [Specific Stroke Finding Observation Profile (R5)](StructureDefinition-specific-finding-observation-profile.md)

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
  "id" : "stroke-finding-codes-vs",
  "url" : "http://tecnomod-um.org/ValueSet/stroke-finding-codes-vs",
  "version" : "0.1.0",
  "name" : "StrokeFindingCodesVS",
  "title" : "Specific Stroke Finding Codes ValueSet",
  "status" : "active",
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
  "description" : "ValueSet for specific coded findings like Afib/Flutter status or mTICI score.",
  "compose" : {
    "include" : [
      {
        "valueSet" : ["http://tecnomod-um.org/ValueSet/specific-finding-codes-vs"]
      },
      {
        "valueSet" : ["http://tecnomod-um.org/ValueSet/mtici-code-vs"]
      }
    ]
  }
}

```
