# Stroke Circumstance Codes ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Circumstance Codes ValueSet**

## ValueSet: Stroke Circumstance Codes ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-circumstance-codes-vs | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeCircumstanceCodesVS |

 
This ValueSet includes all onset-circumstance codes from StrokeCircumstanceCodesCS. 
**Primary use-case** 
* Required binding for `StrokeCircumstanceObservationProfile.code`.
 

 **References** 

* [Stroke Circumstance Observation Profile (R5)](StructureDefinition-stroke-circumstance-observation-profile.md)

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
  "id" : "stroke-circumstance-codes-vs",
  "url" : "http://tecnomod-um.org/ValueSet/stroke-circumstance-codes-vs",
  "version" : "0.1.0",
  "name" : "StrokeCircumstanceCodesVS",
  "title" : "Stroke Circumstance Codes ValueSet",
  "status" : "active",
  "date" : "2026-02-20T08:36:31+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This ValueSet includes all onset-circumstance codes from StrokeCircumstanceCodesCS.\n\n**Primary use-case**\n- Required binding for `StrokeCircumstanceObservationProfile.code`.",
  "compose" : {
    "include" : [{
      "system" : "http://tecnomod-um.org/CodeSystem/stroke-circumstance-codes-cs"
    }]
  }
}

```
