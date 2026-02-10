# Hemorrhagic Stroke Bleeding Reason ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Hemorrhagic Stroke Bleeding Reason ValueSet**

## ValueSet: Hemorrhagic Stroke Bleeding Reason ValueSet (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/hemorrhagic-stroke-bleeding-reason-vs | *Version*:0.1.0 |
| Draft as of 2025-09-08 | *Computable Name*:HemorrhagicStrokeBleedingReasonVS |
| **Copyright/Legal**: © Tecnomod. This value set includes locally defined codes. | |

 
Specifies the identified cause of a hemorrhagic stroke, typically used with an extension. 

 
To enable consistent capture of the underlying cause of bleeding in hemorrhagic stroke. 

 **References** 

* [Hemorrhagic Stroke – Bleeding Reason](StructureDefinition-hemorrhagic-stroke-bleeding-reason-ext.md)

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
  "id" : "hemorrhagic-stroke-bleeding-reason-vs",
  "url" : "http://tecnomod-um.org/ValueSet/hemorrhagic-stroke-bleeding-reason-vs",
  "version" : "0.1.0",
  "name" : "HemorrhagicStrokeBleedingReasonVS",
  "title" : "Hemorrhagic Stroke Bleeding Reason ValueSet",
  "status" : "draft",
  "experimental" : true,
  "date" : "2025-09-08",
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
  "description" : "Specifies the identified cause of a hemorrhagic stroke, typically used with an extension.",
  "immutable" : false,
  "purpose" : "To enable consistent capture of the underlying cause of bleeding in hemorrhagic stroke.",
  "copyright" : "© Tecnomod. This value set includes locally defined codes.",
  "compose" : {
    "include" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/hemorrhagic-stroke-bleeding-reason-cs"
      },
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "128609009",
            "display" : "Intracranial aneurysm (disorder)"
          },
          {
            "code" : "703221003",
            "display" : "Congenital intracranial vascular malformation (disorder)"
          }
        ]
      }
    ]
  }
}

```
