# Specific Stroke Finding Codes ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Specific Stroke Finding Codes ValueSet**

## ValueSet: Specific Stroke Finding Codes ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/specific-finding-codes-vs | *Version*:0.1.0 |
| Active as of 2026-02-18 | *Computable Name*:SpecificFindingCodesVS |

 
This ValueSet provides SNOMED CT disorder concepts for specific clinically relevant findings often referenced in the stroke workup, currently limited to atrial fibrillation and atrial flutter disorders. 
These codes are suitable when the intent is to reference the disorder concepts themselves (e.g., as a focus finding or a coded problem). When the intent is to capture the **status of an assessment** (present/absent/unknown) rather than assert a diagnosis, implementers should use an Observation with a dedicated assessment concept as Observation.code and bind Observation.valueCodeableConcept to an appropriate status ValueSet (e.g., AfibFlutterStatusVS). 

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
  "date" : "2026-02-18T14:43:59+00:00",
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
  "description" : "This ValueSet provides SNOMED CT disorder concepts for specific clinically relevant findings often referenced in the stroke workup, currently limited to atrial fibrillation and atrial flutter disorders.\n\nThese codes are suitable when the intent is to reference the disorder concepts themselves (e.g., as a focus finding or a coded problem). When the intent is to capture the *status of an assessment* (present/absent/unknown) rather than assert a diagnosis, implementers should use an Observation with a dedicated assessment concept as Observation.code and bind Observation.valueCodeableConcept to an appropriate status ValueSet (e.g., AfibFlutterStatusVS).",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "49436004",
            "display" : "Atrial fibrillation (disorder)"
          },
          {
            "code" : "5370000",
            "display" : "Atrial flutter (disorder)"
          }
        ]
      }
    ]
  }
}

```
