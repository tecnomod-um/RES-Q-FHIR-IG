# Assessment Context ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Assessment Context ValueSet**

## ValueSet: Assessment Context ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/assessment-context-vs | *Version*:0.1.0 |
| Active as of 2026-02-18 | *Computable Name*:AssessmentContextVS |

 
This ValueSet includes all context/timepoint codes defined in AssessmentContextCS. It is intended for required binding to elements (e.g., extensions) that must indicate the clinical phase of an assessment, enabling consistent stratification and reporting of outcomes and severity over the stroke care pathway. 
The ValueSet is used to validate that only supported context categories are recorded, improving interoperability when exchanging stroke assessments between systems and across care settings. 

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
  "description" : "This ValueSet includes all context/timepoint codes defined in AssessmentContextCS. It is intended for required binding to elements (e.g., extensions) that must indicate the clinical phase of an assessment, enabling consistent stratification and reporting of outcomes and severity over the stroke care pathway.\n\nThe ValueSet is used to validate that only supported context categories are recorded, improving interoperability when exchanging stroke assessments between systems and across care settings.",
  "compose" : {
    "include" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/assessment-context-cs"
      }
    ]
  }
}

```
