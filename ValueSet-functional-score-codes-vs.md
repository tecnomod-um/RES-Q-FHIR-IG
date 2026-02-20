# Stroke Functional Score Codes ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Functional Score Codes ValueSet**

## ValueSet: Stroke Functional Score Codes ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/functional-score-codes-vs | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:FunctionalScoreCodesVS |

 
This ValueSet constrains `Observation.code` for functional outcome and severity instruments represented in this guide: 
* Modified Rankin Scale score (mRS)
* NIH Stroke Scale total score (NIHSS)
 
**Primary use-case** 
* Bind to `Observation.code` in `FunctionalScoreObservationProfile`.
 
**Datatype expectations enforced via invariants** 
* mRS: `Observation.valueCodeableConcept` bound to MRsScoreVS (ordinal categories 0–6).
* NIHSS: `Observation.valueInteger` as total NIHSS score.
 

 **References** 

* [Stroke Functional Score Observation Profile](StructureDefinition-functional-score-observation-profile.md)

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
  "id" : "functional-score-codes-vs",
  "url" : "http://tecnomod-um.org/ValueSet/functional-score-codes-vs",
  "version" : "0.1.0",
  "name" : "FunctionalScoreCodesVS",
  "title" : "Stroke Functional Score Codes ValueSet",
  "status" : "active",
  "date" : "2026-02-20T08:43:58+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This ValueSet constrains `Observation.code` for functional outcome and severity instruments represented in this guide:\n- Modified Rankin Scale score (mRS)\n- NIH Stroke Scale total score (NIHSS)\n\n**Primary use-case**\n- Bind to `Observation.code` in `FunctionalScoreObservationProfile`.\n\n**Datatype expectations enforced via invariants**\n- mRS: `Observation.valueCodeableConcept` bound to MRsScoreVS (ordinal categories 0–6).\n- NIHSS: `Observation.valueInteger` as total NIHSS score.",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "1255866005",
        "display" : "Modified Rankin Scale score (observable entity)"
      },
      {
        "code" : "450743008",
        "display" : "National Institutes of Health stroke scale score (observable entity)"
      }]
    }]
  }
}

```
