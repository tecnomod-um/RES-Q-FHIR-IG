# Modified Treatment in Cerebral Infarction Grade Score CodeSystem - v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Modified Treatment in Cerebral Infarction Grade Score CodeSystem**

## CodeSystem: Modified Treatment in Cerebral Infarction Grade Score CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/mtici-score-cs | *Version*:1.0.0 |
| Draft as of 2025-03-31 | *Computable Name*:MticiScoreCS |

 
This CodeSystem defines the **modified Thrombolysis in Cerebral Infarction (mTICI)** reperfusion grade values. mTICI is an ordinal angiographic scale used to quantify the extent of reperfusion after endovascular therapy for acute ischemic stroke. 
**Primary use-case** 
* Use as the coded result in `Observation.valueCodeableConcept` (bound via MticiScoreVS) when recording the **final angiographic reperfusion grade**.
 
**Modeling notes** 
* Represents the **final** reperfusion grade for the downstream ischemic territory (typically adjudicated from the final angiographic run).
* Does not encode target vessel, device/technique, number of passes, timestamps, or adjudication workflow; capture those via Procedure, ImagingStudy, Observation.method, or additional Observations/Provenance.
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [MTICIScoreValueSet](ValueSet-mtici-score-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mtici-score-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/mtici-score-cs",
  "version" : "1.0.0",
  "name" : "MticiScoreCS",
  "title" : "Modified Treatment in Cerebral Infarction Grade Score CodeSystem",
  "status" : "draft",
  "experimental" : true,
  "date" : "2025-03-31",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This CodeSystem defines the **modified Thrombolysis in Cerebral Infarction (mTICI)** reperfusion grade values.\nmTICI is an ordinal angiographic scale used to quantify the extent of reperfusion after endovascular therapy for acute ischemic stroke.\n\n**Primary use-case**\n- Use as the coded result in `Observation.valueCodeableConcept` (bound via MticiScoreVS) when recording the *final angiographic reperfusion grade*.\n\n**Modeling notes**\n- Represents the *final* reperfusion grade for the downstream ischemic territory (typically adjudicated from the final angiographic run).\n- Does not encode target vessel, device/technique, number of passes, timestamps, or adjudication workflow; capture those via Procedure, ImagingStudy, Observation.method, or additional Observations/Provenance.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
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
  }]
}

```
