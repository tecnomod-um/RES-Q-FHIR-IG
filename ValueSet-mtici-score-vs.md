# Modified Treatment in Cerebral Infarction Grade Score ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Modified Treatment in Cerebral Infarction Grade Score ValueSet**

## ValueSet: Modified Treatment in Cerebral Infarction Grade Score ValueSet (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/mtici-score-vs | *Version*:0.1.0 |
| Draft as of 2025-03-31 | *Computable Name*:MTICIScoreValueSet |

 
This ValueSet enumerates all allowable Modified Treatment in Cerebral Infarction reperfusion grade values (0, 1, 2a, 2b, 2c, 3) from MticiScoreCS. 
**Primary use-case** 
* Required binding to `Observation.valueCodeableConcept` when an Observation represents an mTICI grade outcome.
 
**Why a dedicated ValueSet** 
* Ensures consistent coding across implementations and sites.
* Enables reliable registry reporting, audit/quality measurement, and research analytics.
 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

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
  "id" : "mtici-score-vs",
  "url" : "http://tecnomod-um.org/ValueSet/mtici-score-vs",
  "version" : "0.1.0",
  "name" : "MTICIScoreValueSet",
  "title" : "Modified Treatment in Cerebral Infarction Grade Score ValueSet",
  "status" : "draft",
  "experimental" : true,
  "date" : "2025-03-31",
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
  "description" : "This ValueSet enumerates all allowable Modified Treatment in Cerebral Infarction reperfusion grade values (0, 1, 2a, 2b, 2c, 3) from MticiScoreCS.\n\n**Primary use-case**\n- Required binding to `Observation.valueCodeableConcept` when an Observation represents an mTICI grade outcome.\n\n**Why a dedicated ValueSet**\n- Ensures consistent coding across implementations and sites.\n- Enables reliable registry reporting, audit/quality measurement, and research analytics.",
  "compose" : {
    "include" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/mtici-score-cs"
      }
    ]
  }
}

```
