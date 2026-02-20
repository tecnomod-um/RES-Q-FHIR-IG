# Specific Stroke Finding Codes ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Specific Stroke Finding Codes ValueSet**

## ValueSet: Specific Stroke Finding Codes ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/specific-finding-codes-vs | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:SpecificFindingCodesVS |

 
This ValueSet provides SNOMED CT disorder concepts for specific findings referenced in the stroke workup. Currently includes: 
* Atrial fibrillation (disorder)
* Atrial flutter (disorder)
 
**Primary use-case** 
* Constrain `Observation.code` (as a **finding focus**) when using `SpecificFindingObservationProfile`.
 
**Important modeling note** 
* Using a disorder concept in `Observation.code` here does not necessarily assert a diagnosis; the diagnosis should be modeled as a Condition.
* The Observation can be interpreted as “assessment about this finding,” with the result in `Observation.valueCodeableConcept` (e.g., AF status).
 

 **References** 

* Included into [StrokeFindingCodesVS](ValueSet-stroke-finding-codes-vs.md)

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
  "id" : "specific-finding-codes-vs",
  "url" : "http://tecnomod-um.org/ValueSet/specific-finding-codes-vs",
  "version" : "0.1.0",
  "name" : "SpecificFindingCodesVS",
  "title" : "Specific Stroke Finding Codes ValueSet",
  "status" : "active",
  "date" : "2026-02-20T08:47:00+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This ValueSet provides SNOMED CT disorder concepts for specific findings referenced in the stroke workup.\nCurrently includes:\n- Atrial fibrillation (disorder)\n- Atrial flutter (disorder)\n\n**Primary use-case**\n- Constrain `Observation.code` (as a *finding focus*) when using `SpecificFindingObservationProfile`.\n\n**Important modeling note**\n- Using a disorder concept in `Observation.code` here does not necessarily assert a diagnosis; the diagnosis should be modeled as a Condition.\n- The Observation can be interpreted as “assessment about this finding,” with the result in `Observation.valueCodeableConcept` (e.g., AF status).",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "49436004",
        "display" : "Atrial fibrillation (disorder)"
      },
      {
        "code" : "5370000",
        "display" : "Atrial flutter (disorder)"
      }]
    }]
  }
}

```
