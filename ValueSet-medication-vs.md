# Medications ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medications ValueSet**

## ValueSet: Medications ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/medication-vs | *Version*:0.1.0 |
| Draft as of 2026-02-19 | *Computable Name*:MedicationVS |

 
SNOMED CT codes for drug products or substances. 

 **References** 

* [Discharge Medication Request Profile](StructureDefinition-discharge-medication-request-profile.md)
* [Prior Medication Statement Profile (R5)](StructureDefinition-prior-medication-statement-profile.md)

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
  "id" : "medication-vs",
  "url" : "http://tecnomod-um.org/ValueSet/medication-vs",
  "version" : "0.1.0",
  "name" : "MedicationVS",
  "title" : "Medications ValueSet",
  "status" : "draft",
  "date" : "2026-02-19T14:25:22+00:00",
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
  "description" : "SNOMED CT codes for drug products or substances.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "372756006",
            "display" : "Warfarin (substance)"
          },
          {
            "code" : "372586001",
            "display" : "Hypotensive agent (substance)"
          },
          {
            "code" : "372862008",
            "display" : "Anticoagulant (substance)"
          },
          {
            "code" : "312263009",
            "display" : "Sex hormone (substance)"
          },
          {
            "code" : "372912004",
            "display" : "Substance with 3-hydroxy-3-methylglutaryl-coenzyme A reductase inhibitor mechanism of action (substance)"
          },
          {
            "code" : "387458008",
            "display" : "Aspirin (substance)"
          },
          {
            "code" : "386952008",
            "display" : "Clopidogrel (substance)"
          },
          {
            "code" : "372877000",
            "display" : "Heparin (substance)"
          }
        ]
      },
      {
        "system" : "http://tecnomod-um.org/CodeSystem/medication-cs"
      }
    ]
  }
}

```
