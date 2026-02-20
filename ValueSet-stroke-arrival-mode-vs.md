# Stroke Arrival Mode ValueSet - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Arrival Mode ValueSet**

## ValueSet: Stroke Arrival Mode ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-arrival-mode-vs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeArrivalModeVS |

 
ValueSet restricting the allowed values for documenting the patient's arrival mode/origin. 
**Primary use-case** 
* Required binding to `Encounter.admission.admitSource` in `StrokeEncounterProfile`.
 

 **References** 

* [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md)

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
  "id" : "stroke-arrival-mode-vs",
  "url" : "http://tecnomod-um.org/ValueSet/stroke-arrival-mode-vs",
  "version" : "1.0.0",
  "name" : "StrokeArrivalModeVS",
  "title" : "Stroke Arrival Mode ValueSet",
  "status" : "active",
  "date" : "2026-02-20T10:17:22+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "ValueSet restricting the allowed values for documenting the patient's arrival mode/origin.\n\n**Primary use-case**\n- Required binding to `Encounter.admission.admitSource` in `StrokeEncounterProfile`.\n",
  "compose" : {
    "include" : [{
      "system" : "http://tecnomod-um.org/CodeSystem/stroke-arrival-mode-cs"
    }]
  }
}

```
