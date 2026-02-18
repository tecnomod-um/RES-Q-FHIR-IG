# MTICI Score ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MTICI Score ValueSet**

## ValueSet: MTICI Score ValueSet (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/mtici-score-vs | *Version*:0.1.0 |
| Draft as of 2025-03-31 | *Computable Name*:MTICIScoreValueSet |

 
This ValueSet enumerates all allowable mTICI reperfusion grades (0, 1, 2a, 2b, 2c, 3) from the MticiScoreCS CodeSystem. It is intended to be bound (typically as required) to Observation.valueCodeableConcept when recording the final angiographic reperfusion outcome after endovascular therapy for acute ischemic stroke. 
Using a dedicated ValueSet ensures: 
* consistent coding across implementations and sites,
* reliable downstream interpretation for analytics/registry submission, and
* clear separation between the **assessment concept** (e.g., “mTICI reperfusion grade”) and the **assessment result** (the specific grade).
 
This ValueSet does not convey timing, vessel location, modality, or technique; those must be represented elsewhere in the clinical model. 

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
  "title" : "MTICI Score ValueSet",
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
  "description" : "This ValueSet enumerates all allowable mTICI reperfusion grades (0, 1, 2a, 2b, 2c, 3) from the MticiScoreCS CodeSystem. It is intended to be bound (typically as required) to Observation.valueCodeableConcept when recording the final angiographic reperfusion outcome after endovascular therapy for acute ischemic stroke.\n\nUsing a dedicated ValueSet ensures:\n- consistent coding across implementations and sites,\n- reliable downstream interpretation for analytics/registry submission, and\n- clear separation between the *assessment concept* (e.g., “mTICI reperfusion grade”) and the *assessment result* (the specific grade).\n\nThis ValueSet does not convey timing, vessel location, modality, or technique; those must be represented elsewhere in the clinical model.",
  "compose" : {
    "include" : [
      {
        "system" : "http://tecnomod-um.org/CodeSystem/mtici-score-cs"
      }
    ]
  }
}

```
