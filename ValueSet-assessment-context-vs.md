# Assessment Context ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Assessment Context ValueSet**

## ValueSet: Assessment Context ValueSet (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/assessment-context-vs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:AssessmentContextVS |

 
This ValueSet includes all phase/context codes from AssessmentContextCS. 
**Primary use-case** 
* Required binding for elements that must indicate the clinical phase of an assessment (e.g., timing context extensions).
 

 **References** 

* [Observation Timing Context Extension](StructureDefinition-observation-timing-context-ext.md)

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
  "id" : "assessment-context-vs",
  "url" : "http://tecnomod-um.org/ValueSet/assessment-context-vs",
  "version" : "0.1.0",
  "name" : "AssessmentContextVS",
  "title" : "Assessment Context ValueSet",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-19T14:52:32+00:00",
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
  "description" : "This ValueSet includes all phase/context codes from AssessmentContextCS.\n\n**Primary use-case**\n- Required binding for elements that must indicate the clinical phase of an assessment (e.g., timing context extensions).",
  "compose" : {
    "include" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/assessment-context-cs"
      }
    ]
  }
}

```
