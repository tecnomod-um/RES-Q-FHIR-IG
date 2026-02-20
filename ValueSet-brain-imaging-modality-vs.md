# Brain Imaging Modality ValueSet - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Brain Imaging Modality ValueSet**

## ValueSet: Brain Imaging Modality ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/brain-imaging-modality-vs | *Version*:1.0.0 |
| Active as of 2026-02-20 | *Computable Name*:BrainImagingModalityVS |

 
This ValueSet defines the allowed codes for documenting **stroke-related brain imaging** as a Procedure. 
It intentionally supports two levels of coding: 1) **Granular SNOMED CT procedures** (preferred when available). 2) **Local combined-protocol codes** from `BrainImagingTypeCS` (used when the source reports protocol bundles). 
**Primary use-case** 
* Required binding to `Procedure.code` for brain imaging within the stroke episode.
 

 **References** 

* [Stroke Brain Imaging Procedure Profile](StructureDefinition-stroke-brain-imaging-procedure-profile.md)

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
  "id" : "brain-imaging-modality-vs",
  "url" : "http://tecnomod-um.org/ValueSet/brain-imaging-modality-vs",
  "version" : "1.0.0",
  "name" : "BrainImagingModalityVS",
  "title" : "Brain Imaging Modality ValueSet",
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
  "description" : "This ValueSet defines the allowed codes for documenting **stroke-related brain imaging** as a Procedure.\n\nIt intentionally supports two levels of coding:\n1) **Granular SNOMED CT procedures** (preferred when available).\n2) **Local combined-protocol codes** from `BrainImagingTypeCS` (used when the source reports protocol bundles).\n\n**Primary use-case**\n- Required binding to `Procedure.code` for brain imaging within the stroke episode.\n",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "419949007",
        "display" : "Computed tomography angiography of intracranial artery with contrast (procedure)"
      }]
    },
    {
      "system" : "http://tecnomod-um.org/CodeSystem/brain-imaging-type-cs"
    }]
  }
}

```
