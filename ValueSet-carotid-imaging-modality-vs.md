# Carotid Arteries Imaging Modality ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Carotid Arteries Imaging Modality ValueSet**

## ValueSet: Carotid Arteries Imaging Modality ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/carotid-imaging-modality-vs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:CarotidImagingModalityVS |

 
Defines codes for different types of carotid artery imaging. 

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
  "id" : "carotid-imaging-modality-vs",
  "url" : "http://tecnomod-um.org/ValueSet/carotid-imaging-modality-vs",
  "version" : "0.1.0",
  "name" : "CarotidImagingModalityVS",
  "title" : "Carotid Arteries Imaging Modality ValueSet",
  "status" : "active",
  "date" : "2026-02-19T09:59:51+00:00",
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
  "description" : "Defines codes for different types of carotid artery imaging.",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "58920005",
            "display" : "Angiography of carotid artery (procedure)"
          },
          {
            "code" : "9171000087102",
            "display" : "Doppler ultrasonography of carotid arteries (procedure)"
          },
          {
            "code" : "396205005",
            "display" : "Computed tomography of brain without radiopaque contrast (procedure)"
          },
          {
            "code" : "1366357009",
            "display" : "Magnetic resonance imaging angiography of intracranial artery (procedure)"
          }
        ]
      }
    ]
  }
}

```
