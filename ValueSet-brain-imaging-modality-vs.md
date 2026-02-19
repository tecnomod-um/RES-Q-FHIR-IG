# Brain Imaging Modality ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Brain Imaging Modality ValueSet**

## ValueSet: Brain Imaging Modality ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/brain-imaging-modality-vs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:BrainImagingModalityVS |

 
Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures. 

 **References** 

* [Stroke Brain Imaging Procedure Profile (R5)](StructureDefinition-stroke-brain-imaging-procedure-profile.md)

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
  "version" : "0.1.0",
  "name" : "BrainImagingModalityVS",
  "title" : "Brain Imaging Modality ValueSet",
  "status" : "active",
  "date" : "2026-02-19T09:19:55+00:00",
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
  "description" : "Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "419949007",
            "display" : "Computed tomography angiography of intracranial artery with contrast (procedure)"
          }
        ]
      },
      {
        "system" : "http://tecnomod-um.org/CodeSystem/brain-imaging-type-cs"
      }
    ]
  }
}

```
