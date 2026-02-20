# Specific Stroke Finding Codes ValueSet - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Specific Stroke Finding Codes ValueSet**

## ValueSet: Specific Stroke Finding Codes ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-finding-codes-vs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:StrokeFindingCodesVS |

 
This ValueSet aggregates coded Observation.code concepts used by `SpecificFindingObservationProfile`. 
It currently includes: 
* Specific disorder concepts used as a finding focus (SpecificFindingCodesVS), and
* The mTICI assessment concept (MTICICodeVS).
 
**How to interpret usage** 
* If `Observation.code` is a disorder concept (e.g., AF), the Observation should be interpreted as an assessment about that finding, with the result/status carried in `Observation.valueCodeableConcept` (e.g., AfibFlutterStatusVS).
* If `Observation.code` is an assessment concept (e.g., mTICI), `Observation.valueCodeableConcept` carries the score (MticiScoreVS).
 

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
  "version" : "1.0.0",
  "name" : "StrokeFindingCodesVS",
  "title" : "Specific Stroke Finding Codes ValueSet",
  "status" : "active",
  "date" : "2026-02-20T10:05:07+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This ValueSet aggregates coded Observation.code concepts used by `SpecificFindingObservationProfile`.\n\nIt currently includes:\n- Specific disorder concepts used as a finding focus (SpecificFindingCodesVS), and\n- The mTICI assessment concept (MTICICodeVS).\n\n**How to interpret usage**\n- If `Observation.code` is a disorder concept (e.g., AF), the Observation should be interpreted as an assessment about that finding,\n  with the result/status carried in `Observation.valueCodeableConcept` (e.g., AfibFlutterStatusVS).\n- If `Observation.code` is an assessment concept (e.g., mTICI), `Observation.valueCodeableConcept` carries the score (MticiScoreVS).",
  "compose" : {
    "include" : [{
      "valueSet" : ["http://tecnomod-um.org/ValueSet/specific-finding-codes-vs"]
    },
    {
      "valueSet" : ["http://tecnomod-um.org/ValueSet/mtici-code-vs"]
    }]
  }
}

```
