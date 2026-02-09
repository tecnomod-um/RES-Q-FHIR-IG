# Swallow Procedures ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Swallow Procedures ValueSet**

## ValueSet: Swallow Procedures ValueSet (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/swallow-procedures-vs | *Version*:0.1.0 |
| Draft as of 2025-03-31 | *Computable Name*:SwallowProceduresValueset |

 
ValueSet containing SNOMED CT codes representing a range of procedures used in the evaluation and management of stroke patients. 

 **References** 

* [Stroke Swallow Procedure Profile (R5)](StructureDefinition-stroke-swallow-procedure-profile.md)

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
  "id" : "swallow-procedures-vs",
  "url" : "http://tecnomod-um.org/ValueSet/swallow-procedures-vs",
  "version" : "0.1.0",
  "name" : "SwallowProceduresValueset",
  "title" : "Swallow Procedures ValueSet",
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
  "description" : "ValueSet containing SNOMED CT codes representing a range of procedures used in the evaluation and management of stroke patients.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "1290000005",
            "display" : "Assessment using Gugging Swallowing Screen (procedure)"
          },
          {
            "code" : "63913004",
            "display" : "Tonography with water provocation (procedure)"
          }
        ]
      },
      {
        "system" : "http://tecnomod-um.org/CodeSystem/swallow-procedures-cs"
      }
    ]
  }
}

```
