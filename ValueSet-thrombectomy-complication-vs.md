# Thrombectomy Complications ValueSet - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Thrombectomy Complications ValueSet**

## ValueSet: Thrombectomy Complications ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/thrombectomy-complication-vs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:ThrombectomyComplicationVS |

 
ValueSet of SNOMED CT concepts representing complications of thrombectomy as clinical conditions. 
**Primary use-case** 
* Bind `Procedure.complication` (or the referenced Condition.code) to a SNOMED-based set for interoperability.
 

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
  "id" : "thrombectomy-complication-vs",
  "url" : "http://tecnomod-um.org/ValueSet/thrombectomy-complication-vs",
  "version" : "1.0.0",
  "name" : "ThrombectomyComplicationVS",
  "title" : "Thrombectomy Complications ValueSet",
  "status" : "active",
  "date" : "2026-02-20T09:50:49+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : " ValueSet of SNOMED CT concepts representing complications of thrombectomy as clinical conditions.\n\n**Primary use-case**\n- Bind `Procedure.complication` (or the referenced Condition.code) to a SNOMED-based set for interoperability.\n",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "307312008",
        "display" : "Perforation of artery (disorder)"
      }]
    },
    {
      "system" : "http://tecnomod-um.org/CodeSystem/thrombectomy-complication-cs"
    }]
  }
}

```
