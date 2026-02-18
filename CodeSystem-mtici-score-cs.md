# MTICI Score Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MTICI Score Code System**

## CodeSystem: MTICI Score Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/mtici-score-cs | *Version*:0.1.0 |
| Draft as of 2025-03-31 | *Computable Name*:MticiScoreCS |

 
This CodeSystem defines codes for the modified Treatment in Cerebral Ischemia / modified Thrombolysis in Cerebral Infarction (mTICI) reperfusion grade. mTICI is an ordinal angiographic scale used to quantify the extent of antegrade reperfusion of the downstream ischemic territory after endovascular therapy for acute ischemic stroke (e.g., mechanical thrombectomy). 
The scale ranges from 0 (no perfusion) to 3 (complete reperfusion), with 2a/2b/2c subgrades to distinguish partial, substantial, and near-complete reperfusion. These codes are intended for consistent, interoperable capture in HL7® FHIR® resources—most commonly Observation.valueCodeableConcept—supporting procedural documentation, registry submission, audit/quality improvement, and research. 
Scope and modeling notes: 
* This CodeSystem represents the **final** angiographic reperfusion grade for the target downstream territory, typically assigned from the final post-procedural angiographic run (commonly DSA).
* It does not encode target vessel location, imaging modality details, timestamps, technique/device, number of passes, collateral status, or adjudication process; those elements should be recorded separately (e.g., Procedure, ImagingStudy, Observation.method, extensions).
* Any local definition of “successful reperfusion” (often operationalized as mTICI ≥ 2b, depending on protocol) should be implemented via ValueSets, rules, or reporting logic without altering code meanings.
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [MTICIScoreValueSet](ValueSet-mtici-score-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mtici-score-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/mtici-score-cs",
  "version" : "0.1.0",
  "name" : "MticiScoreCS",
  "title" : "MTICI Score Code System",
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
  "description" : "This CodeSystem defines codes for the modified Treatment in Cerebral Ischemia / modified Thrombolysis in Cerebral Infarction (mTICI) reperfusion grade. mTICI is an ordinal angiographic scale used to quantify the extent of antegrade reperfusion of the downstream ischemic territory after endovascular therapy for acute ischemic stroke (e.g., mechanical thrombectomy).\n\nThe scale ranges from 0 (no perfusion) to 3 (complete reperfusion), with 2a/2b/2c subgrades to distinguish partial, substantial, and near-complete reperfusion. These codes are intended for consistent, interoperable capture in HL7® FHIR® resources—most commonly Observation.valueCodeableConcept—supporting procedural documentation, registry submission, audit/quality improvement, and research.\n\nScope and modeling notes:\n- This CodeSystem represents the *final* angiographic reperfusion grade for the target downstream territory, typically assigned from the final post-procedural angiographic run (commonly DSA).\n- It does not encode target vessel location, imaging modality details, timestamps, technique/device, number of passes, collateral status, or adjudication process; those elements should be recorded separately (e.g., Procedure, ImagingStudy, Observation.method, extensions).\n- Any local definition of “successful reperfusion” (often operationalized as mTICI ≥ 2b, depending on protocol) should be implemented via ValueSets, rules, or reporting logic without altering code meanings.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 6,
  "concept" : [
    {
      "code" : "0",
      "display" : "Grade 0: No perfusion",
      "definition" : "No antegrade flow beyond the occlusion; no angiographic reperfusion of the downstream territory attributable to the treated vessel."
    },
    {
      "code" : "1",
      "display" : "Grade 1: Antegrade reperfusion past the initial occlusion, but limited distal branch filling with little or slow distal reperfusion",
      "definition" : "Minimal reperfusion: contrast passes the original occlusion with limited distal branch opacification and little or delayed tissue-level reperfusion."
    },
    {
      "code" : "2a",
      "display" : "Grade 2a: Antegrade reperfusion of less than half of the occluded target artery previously ischemic territory",
      "definition" : "Partial reperfusion of <50% of the downstream ischemic territory supplied by the previously occluded target artery."
    },
    {
      "code" : "2b",
      "display" : "Grade 2b: Antegrade reperfusion of more than half of the previously occluded target artery ischemic territory",
      "definition" : "Substantial reperfusion of ≥50% of the downstream ischemic territory supplied by the previously occluded target artery."
    },
    {
      "code" : "2c",
      "display" : "Grade 2c: Near complete perfusion except for slow flow or distal emboli in a few distal cortical vessels",
      "definition" : "Near-complete reperfusion with only minor residual deficits, typically due to slow flow and/or small distal emboli affecting a limited number of distal cortical vessels."
    },
    {
      "code" : "3",
      "display" : "Grade 3: Complete antegrade reperfusion of the previously occluded target artery ischemic territory, with absence of visualized occlusion in all distal branches",
      "definition" : "Complete reperfusion of the downstream ischemic territory with normal/near-normal antegrade flow and no visualized occlusion in distal branches of the treated vascular territory."
    }
  ]
}

```
