# Stroke Risk Factor ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Risk Factor ValueSet**

## ValueSet: Stroke Risk Factor ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-risk-factor-vs | *Version*:0.1.0 |
| Active as of 2025-10-07 | *Computable Name*:StrokeRiskFactorValueSet |
| **Copyright/Legal**: This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International. | |

 
Defines the SNOMED CT codes for conditions or risk factors relevant to stroke, including an option for unknown status. 

 
To provide a standardized set of SNOMED CT concepts representing stroke-related risk factors for coding and validation. 

 **References** 

* [Stroke Risk Factor Condition Profile](StructureDefinition-stroke-risk-factor-condition-profile.md)

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
  "id" : "stroke-risk-factor-vs",
  "url" : "http://tecnomod-um.org/ValueSet/stroke-risk-factor-vs",
  "version" : "0.1.0",
  "name" : "StrokeRiskFactorValueSet",
  "title" : "Stroke Risk Factor ValueSet",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-07",
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
  "description" : "Defines the SNOMED CT codes for conditions or risk factors relevant to stroke, including an option for unknown status.",
  "immutable" : false,
  "purpose" : "To provide a standardized set of SNOMED CT concepts representing stroke-related risk factors for coding and validation.",
  "copyright" : "This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "5370000",
            "display" : "Atrial flutter (disorder)"
          },
          {
            "code" : "49436004",
            "display" : "Atrial fibrillation (disorder)"
          },
          {
            "code" : "22298006",
            "display" : "Myocardial infarction (disorder)"
          },
          {
            "code" : "53741008",
            "display" : "Coronary arteriosclerosis (disorder)"
          },
          {
            "code" : "73211009",
            "display" : "Diabetes mellitus (disorder)"
          },
          {
            "code" : "55822004",
            "display" : "Hyperlipidemia (disorder)"
          },
          {
            "code" : "38341003",
            "display" : "Hypertensive disorder, systemic arterial (disorder)"
          },
          {
            "code" : "230706003",
            "display" : "Hemorrhagic cerebral infarction (disorder)"
          },
          {
            "code" : "266257000",
            "display" : "Transient ischemic attack (disorder)"
          },
          {
            "code" : "422504002",
            "display" : "Ischemic stroke (disorder)"
          },
          {
            "code" : "230690007",
            "display" : "Cerebrovascular accident (disorder)"
          }
        ]
      }
    ]
  }
}

```
