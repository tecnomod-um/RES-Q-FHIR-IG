# Modified Thrombolysis in Cerebral Infarction Assessment ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Modified Thrombolysis in Cerebral Infarction Assessment ValueSet**

## ValueSet: Modified Thrombolysis in Cerebral Infarction Assessment ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/mtici-code-vs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:MTICICodeVS |

 
This ValueSet includes the mTICI assessment concept code(s) from MTICICodeCS for use as Observation.code when recording an mTICI reperfusion grade. It is intended to be paired with a binding of Observation.valueCodeableConcept to MticiScoreVS. 
Separating the “assessment concept” ValueSet (this ValueSet) from the “assessment result” ValueSet (MticiScoreVS) enables clearer validation rules, consistent UI behavior, and safer reuse of the mTICI scoring system across profiles. 

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
  "id" : "mtici-code-vs",
  "url" : "http://tecnomod-um.org/ValueSet/mtici-code-vs",
  "version" : "0.1.0",
  "name" : "MTICICodeVS",
  "title" : "Modified Thrombolysis in Cerebral Infarction Assessment ValueSet",
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
  "description" : "This ValueSet includes the mTICI assessment concept code(s) from MTICICodeCS for use as Observation.code when recording an mTICI reperfusion grade. It is intended to be paired with a binding of Observation.valueCodeableConcept to MticiScoreVS.\n\nSeparating the “assessment concept” ValueSet (this ValueSet) from the “assessment result” ValueSet (MticiScoreVS) enables clearer validation rules, consistent UI behavior, and safer reuse of the mTICI scoring system across profiles.",
  "compose" : {
    "include" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/mtici-code-cs"
      }
    ]
  }
}

```
