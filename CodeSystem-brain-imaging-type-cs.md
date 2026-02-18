# Brain Imaging Type Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Brain Imaging Type Code System**

## CodeSystem: Brain Imaging Type Code System 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/brain-imaging-type-cs | *Version*:0.1.0 |
| Active as of 2026-02-18 | *Computable Name*:BrainImagingTypeCS |

 
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
  "date" : "2026-02-18T14:43:59+00:00",
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
      "definition" : "Computed Tomography (CT) and CT Angiography (CTA)"
    },
    {
      "code" : "ct-cta-perfusion",
      "display" : "CT-CTA and Perfusion",
      "definition" : "Computed Tomography (CT), CT Angiography (CTA), and CT Perfusion"
    },
    {
      "code" : "mr-dwi-flair",
      "display" : "MR DWI-FLAIR",
      "definition" : "Magnetic Resonance Imaging (MRI) with Diffusion-Weighted Imaging (DWI) or Fluid-Attenuated Inversion Recovery (FLAIR)"
    },
    {
      "code" : "mr-dwi-flair-mra",
      "display" : "MR DWI-FLAIR and MRA",
      "definition" : "Magnetic Resonance Imaging (MRI) with Diffusion-Weighted Imaging (DWI) or Fluid-Attenuated Inversion Recovery (FLAIR), and Magnetic Resonance Angiography (MRA)"
    },
    {
      "code" : "mr-dwi-flair-mra-perfusion",
      "display" : "MR DWI-FLAIR, MRA, and Perfusion",
      "definition" : "Magnetic Resonance Imaging (MRI) with Diffusion-Weighted Imaging (DWI) and Fluid-Attenuated Inversion Recovery (FLAIR), Magnetic Resonance Angiography (MRA), and MR Perfusion"
    }
  ]
}

```
