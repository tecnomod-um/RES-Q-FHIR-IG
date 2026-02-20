# Stroke Etiology ValueSet - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Etiology ValueSet**

## ValueSet: Stroke Etiology ValueSet (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-etiology-vs | *Version*:1.0.0 |
| Draft as of 2025-03-31 | *Computable Name*:StrokeEtiologyVS |
| **Copyright/Legal**: This value set includes locally governed concepts and SNOMED CT® content. SNOMED CT® is distributed by SNOMED International. | |

 
This ValueSet defines allowable values for recording the **determined ischemic stroke etiology**. 
**Primary use-case** 
* Required binding for `StrokeStrokeEtiologyExt.valueCodeableConcept` on definitive ischemic stroke Conditions.
 
**Composition** 
* Local etiology categories (StrokeEtiologyCS), plus selected SNOMED CT disorder concepts for commonly used etiology groupings.
 
**Implementation guidance** 
* Use after etiologic workup when a classification is assigned.
* If etiology remains unknown/undetermined, use the included `Undetermined (qualifier value)`
 

 
To support classification of stroke etiology using a mix of local codes and selected SNOMED CT concepts. 

 **References** 

* [Ischemic Stroke – Etiology](StructureDefinition-ischemic-stroke-etiology-ext.md)

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
  "id" : "stroke-etiology-vs",
  "url" : "http://tecnomod-um.org/ValueSet/stroke-etiology-vs",
  "version" : "1.0.0",
  "name" : "StrokeEtiologyVS",
  "title" : "Stroke Etiology ValueSet",
  "status" : "draft",
  "experimental" : true,
  "date" : "2025-03-31",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This ValueSet defines allowable values for recording the **determined ischemic stroke etiology**.\n\n**Primary use-case**\n- Required binding for `StrokeStrokeEtiologyExt.valueCodeableConcept` on definitive ischemic stroke Conditions.\n\n**Composition**\n- Local etiology categories (StrokeEtiologyCS), plus selected SNOMED CT disorder concepts for commonly used etiology groupings.\n\n**Implementation guidance**\n- Use after etiologic workup when a classification is assigned.\n- If etiology remains unknown/undetermined, use the included `Undetermined (qualifier value)`",
  "immutable" : false,
  "purpose" : "To support classification of stroke etiology using a mix of local codes and selected SNOMED CT concepts.",
  "copyright" : "This value set includes locally governed concepts and SNOMED CT® content. SNOMED CT® is distributed by SNOMED International.",
  "compose" : {
    "include" : [{
      "system" : "http://tecnomod-um.org/CodeSystem/stroke-etiology-cs"
    },
    {
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "16891111000119104",
        "display" : "Cryptogenic stroke (disorder)"
      },
      {
        "code" : "413758000",
        "display" : "Cardioembolic stroke (disorder)"
      },
      {
        "code" : "230698000",
        "display" : "Lacunar infarction (disorder)"
      }]
    }]
  }
}

```
