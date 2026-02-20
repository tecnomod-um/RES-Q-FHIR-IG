# Stroke Vital Sign Codes ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Vital Sign Codes ValueSet**

## ValueSet: Stroke Vital Sign Codes ValueSet (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/vital-sign-codes-vs | *Version*:0.1.0 |
| Active as of 2026-02-20 | *Computable Name*:VitalSignCodesVS |

 
This ValueSet defines SNOMED CT observable-entity codes for blood pressure components captured as vital signs: 
* Systolic blood pressure
* Diastolic blood pressure
 
**Primary use-case** 
* Bind to `Observation.component.code` in a single blood pressure Observation that records both components.
 
**Implementation guidance** 
* Use `Observation.component.valueQuantity` with UCUM `mm[Hg]`.
* Repeat the Observation across time with different `effective[x]` timestamps for monitoring.
 

 **References** 

* [Stroke Vital Sign Observation Profile](StructureDefinition-vital-sign-observation-profile.md)

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
  "id" : "vital-sign-codes-vs",
  "url" : "http://tecnomod-um.org/ValueSet/vital-sign-codes-vs",
  "version" : "0.1.0",
  "name" : "VitalSignCodesVS",
  "title" : "Stroke Vital Sign Codes ValueSet",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-20T08:36:31+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This ValueSet defines SNOMED CT observable-entity codes for blood pressure components captured as vital signs:\n- Systolic blood pressure\n- Diastolic blood pressure\n\n**Primary use-case**\n- Bind to `Observation.component.code` in a single blood pressure Observation that records both components.\n\n**Implementation guidance**\n- Use `Observation.component.valueQuantity` with UCUM `mm[Hg]`.\n- Repeat the Observation across time with different `effective[x]` timestamps for monitoring.",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "271649006",
        "display" : "Systolic blood pressure (observable entity)"
      },
      {
        "code" : "271650006",
        "display" : "Diastolic blood pressure (observable entity)"
      }]
    }]
  }
}

```
