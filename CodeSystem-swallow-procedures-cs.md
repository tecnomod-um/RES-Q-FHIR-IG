# Swallow Procedures CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Swallow Procedures CodeSystem**

## CodeSystem: Swallow Procedures CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/swallow-procedures-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:SwallowProceduresCS |

 
Local CodeSystem representing swallowing screening/assessment tools often documented by acronym or local naming. 
**Primary use-case** 
* Provide stable, implementable codes when upstream systems cannot supply SNOMED CT equivalents.
 
**FHIR placement** 
* Included in `SwallowProceduresVS` to be used in `Procedure.code` and (optionally) `Procedure.used.concept`.
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SwallowProceduresValueset](ValueSet-swallow-procedures-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "swallow-procedures-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/swallow-procedures-cs",
  "version" : "0.1.0",
  "name" : "SwallowProceduresCS",
  "title" : "Swallow Procedures CodeSystem",
  "status" : "active",
  "date" : "2026-02-19T10:59:57+00:00",
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
  "description" : "Local CodeSystem representing swallowing screening/assessment tools often documented by acronym or local naming.\n\n**Primary use-case**\n- Provide stable, implementable codes when upstream systems cannot supply SNOMED CT equivalents.\n\n**FHIR placement**\n- Included in `SwallowProceduresVS` to be used in `Procedure.code` and (optionally) `Procedure.used.concept`.",
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "assist",
      "display" : "ASSIST",
      "definition" : "Assisted Swallowing Test (ASSIST)"
    },
    {
      "code" : "other",
      "display" : "Other Swallow Procedure",
      "definition" : "Other specified swallowing assessment procedure"
    },
    {
      "code" : "v-vst",
      "display" : "V-VST",
      "definition" : "Volume-Viscosity Swallow Test (V-VST)"
    }
  ]
}

```
