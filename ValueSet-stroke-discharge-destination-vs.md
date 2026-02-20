# Stroke Discharge Destination ValueSet - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Discharge Destination ValueSet**

## ValueSet: Stroke Discharge Destination ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-discharge-destination-vs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeDischargeDestinationVS |

 
ValueSet defining allowable discharge dispositions for the stroke encounter. 
**Primary use-case** 
* Required binding to `Encounter.admission.dischargeDisposition` in `StrokeEncounterProfile`.
 
**Composition** 
* SNOMED CT “discharge/transfer” procedure concepts for common destinations.
* Local supplement (StrokeDischargeDestinationCS) for outcomes such as “deceased during stay”.
 

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
  "id" : "stroke-discharge-destination-vs",
  "url" : "http://tecnomod-um.org/ValueSet/stroke-discharge-destination-vs",
  "version" : "1.0.0",
  "name" : "StrokeDischargeDestinationVS",
  "title" : "Stroke Discharge Destination ValueSet",
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
  "description" : "ValueSet defining allowable discharge dispositions for the stroke encounter.\n\n**Primary use-case**\n- Required binding to `Encounter.admission.dischargeDisposition` in `StrokeEncounterProfile`.\n\n**Composition**\n- SNOMED CT “discharge/transfer” procedure concepts for common destinations.\n- Local supplement (StrokeDischargeDestinationCS) for outcomes such as “deceased during stay”.",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "306689006",
        "display" : "Discharge to home (procedure)"
      },
      {
        "code" : "37729005",
        "display" : "Patient transfer, in-hospital (procedure)"
      },
      {
        "code" : "19712007",
        "display" : "Patient transfer, to another health care facility (procedure)"
      },
      {
        "code" : "306694006",
        "display" : "Discharge to nursing home (procedure)"
      }]
    },
    {
      "system" : "http://tecnomod-um.org/CodeSystem/stroke-discharge-destination-cs"
    }]
  }
}

```
