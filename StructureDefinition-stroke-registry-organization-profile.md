# Stroke Registry Organization Profile - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Registry Organization Profile**

## Resource Profile: Stroke Registry Organization Profile 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/StructureDefinition/stroke-registry-organization-profile | *Version*:0.1.0 |
| Active as of 2025-10-09 | *Computable Name*:StrokeRegistryOrganizationProfile |

 
Organization profile ensuring an active organization with a registry identifier (system=https://stroke.qualityregistry.org) and a required name, aligned with the build_organization() transformation. 

 
To ensure a canonical form for Organizations used by the stroke quality registry, matching the ETL mapping (active=true, required name, and registry identifier). 

**Usages:**

* Examples for this Profile: [University Hospital of Boston](Organization-ExampleStrokeOrganization.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/RES-Q-FHIR-IG|current/StructureDefinition/stroke-registry-organization-profile)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-stroke-registry-organization-profile.csv), [Excel](StructureDefinition-stroke-registry-organization-profile.xlsx), [Schematron](StructureDefinition-stroke-registry-organization-profile.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "stroke-registry-organization-profile",
  "url" : "http://tecnomod-um.org/StructureDefinition/stroke-registry-organization-profile",
  "version" : "0.1.0",
  "name" : "StrokeRegistryOrganizationProfile",
  "title" : "Stroke Registry Organization Profile",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-09",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "Organization profile ensuring an active organization with a registry identifier (system=https://stroke.qualityregistry.org) and a required name, aligned with the build_organization() transformation.",
  "purpose" : "To ensure a canonical form for Organizations used by the stroke quality registry, matching the ETL mapping (active=true, required name, and registry identifier).",
  "fhirVersion" : "5.0.0",
  "mapping" : [{
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 V2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "interface",
    "uri" : "http://hl7.org/fhir/interface",
    "name" : "Interface Pattern"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization",
      "path" : "Organization"
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:registry",
      "path" : "Organization.identifier",
      "sliceName" : "registry",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:registry.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "fixedUri" : "https://stroke.qualityregistry.org"
    },
    {
      "id" : "Organization.identifier:registry.value",
      "path" : "Organization.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.active",
      "path" : "Organization.active",
      "min" : 1,
      "patternBoolean" : true,
      "mustSupport" : true
    },
    {
      "id" : "Organization.name",
      "path" : "Organization.name",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
