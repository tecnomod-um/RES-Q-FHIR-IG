# Brain Imaging Type Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Brain Imaging Type Code System**

## CodeSystem: Brain Imaging Type Code System 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/brain-imaging-type-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:BrainImagingTypeCS |

 
Codes specifying the type of brain imaging performed (e.g., CT, MRI). 

 This Code system is referenced in the content logical definition of the following value sets: 

* [BrainImagingModalityVS](ValueSet-brain-imaging-modality-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "brain-imaging-type-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/brain-imaging-type-cs",
  "version" : "0.1.0",
  "name" : "BrainImagingTypeCS",
  "title" : "Brain Imaging Type Code System",
  "status" : "active",
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
  "description" : "Codes specifying the type of brain imaging performed (e.g., CT, MRI).",
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "ct-cta",
      "display" : "CT-CTA",
      "definition" : "CT + CT Angiography. Use when recorded as a combined protocol and not decomposed into separate procedure entries."
    },
    {
      "code" : "ct-cta-perfusion",
      "display" : "CT-CTA and Perfusion",
      "definition" : "CT + CTA + CT Perfusion. Often used for penumbra/mismatch-based selection in acute stroke."
    },
    {
      "code" : "mr-dwi-flair",
      "display" : "MR DWI-FLAIR",
      "definition" : "MRI with DWI and/or FLAIR. Supports imaging-based estimates of lesion age and tissue characterization."
    },
    {
      "code" : "mr-dwi-flair-mra",
      "display" : "MR DWI-FLAIR and MRA",
      "definition" : "MRI (DWI/FLAIR) + MRA. Represents combined parenchymal and vascular assessment."
    },
    {
      "code" : "mr-dwi-flair-mra-perfusion",
      "display" : "MR DWI-FLAIR, MRA, and Perfusion",
      "definition" : "MRI (DWI/FLAIR) + MRA + perfusion. Represents advanced tissue and vessel evaluation."
    }
  ]
}

```
