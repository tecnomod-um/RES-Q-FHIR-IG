# Modified Rankin Scale Score Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Modified Rankin Scale Score Code System**

## CodeSystem: Modified Rankin Scale Score Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/mrs-score-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:MRsScoreCS |

 
This CodeSystem defines codes for the **modified Rankin Scale (mRS)**, an ordinal measure of global disability and functional outcome. Scores range from 0 (no symptoms) to 5 (severe disability), with 6 indicating death. 
**Primary use-case** 
* Use as the coded result in `Observation.valueCodeableConcept` (bound via MRsScoreVS) when recording an mRS outcome.
 
**Modeling notes** 
* mRS is a global disability scale and does not capture domain-specific limitations (mobility, ADLs, cognition). Capture those via additional instruments/Observations when needed.
* Method of ascertainment and assessor details should be recorded separately (e.g., Observation.method, performer, Provenance).
 

 This Code system is referenced in the content logical definition of the following value sets: 

* [MRsScoreVS](ValueSet-mrs-score-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mrs-score-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/mrs-score-cs",
  "version" : "0.1.0",
  "name" : "MRsScoreCS",
  "title" : "Modified Rankin Scale Score Code System",
  "status" : "active",
  "experimental" : true,
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
  "description" : "This CodeSystem defines codes for the **modified Rankin Scale (mRS)**, an ordinal measure of global disability and functional outcome.\nScores range from 0 (no symptoms) to 5 (severe disability), with 6 indicating death.\n\n**Primary use-case**\n- Use as the coded result in `Observation.valueCodeableConcept` (bound via MRsScoreVS) when recording an mRS outcome.\n\n**Modeling notes**\n- mRS is a global disability scale and does not capture domain-specific limitations (mobility, ADLs, cognition).\n  Capture those via additional instruments/Observations when needed.\n- Method of ascertainment and assessor details should be recorded separately (e.g., Observation.method, performer, Provenance).",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 7,
  "concept" : [
    {
      "code" : "0",
      "display" : "No symptoms",
      "definition" : "No symptoms at all."
    },
    {
      "code" : "1",
      "display" : "No significant disability",
      "definition" : "Despite symptoms; able to carry out all usual duties and activities."
    },
    {
      "code" : "2",
      "display" : "Slight disability",
      "definition" : "Unable to carry out all previous activities, but able to look after own affairs without assistance."
    },
    {
      "code" : "3",
      "display" : "Moderate disability",
      "definition" : "Requiring some help, but able to walk without assistance."
    },
    {
      "code" : "4",
      "display" : "Moderately severe disability",
      "definition" : "Unable to walk without assistance and unable to attend to own bodily needs without assistance."
    },
    {
      "code" : "5",
      "display" : "Severe disability",
      "definition" : "Bedridden, incontinent and requiring constant nursing care and attention."
    },
    {
      "code" : "6",
      "display" : "Dead",
      "definition" : "Patient deceased."
    }
  ]
}

```
