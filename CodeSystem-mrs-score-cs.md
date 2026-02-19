# Modified Rankin Scale Score Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Modified Rankin Scale Score Code System**

## CodeSystem: Modified Rankin Scale Score Code System (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/mrs-score-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:MRsScoreCS |

 
This CodeSystem defines codes for the modified Rankin Scale (mRS), an ordinal measure of global disability and functional outcome widely used in stroke care and research. mRS grades functional status from 0 (no symptoms) through 5 (severe disability), with 6 indicating death. 
Within this implementation guide, mRS is intended to be captured as Observation.valueCodeableConcept (bound to the MRsScoreVS ValueSet), with the assessment timepoint represented explicitly (e.g., via effective[x]) and/or via an assessment context indicator (e.g., pre-stroke baseline, discharge, ~90-day follow-up). This supports standard reporting (e.g., “mRS at 90 days”), comparability across sites, and consistent downstream analytics. 
Scope and modeling notes: 
* mRS is a coarse, global disability scale; it does not encode detailed domain-specific functional limitations (mobility, cognition, ADLs) which should be captured via additional instruments/Observations if required.
* The CodeSystem defines only the **score**; method of ascertainment (in-person, telephone, structured interview) and assessor details should be captured separately when relevant.
 

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
  "description" : "This CodeSystem defines codes for the modified Rankin Scale (mRS), an ordinal measure of global disability and functional outcome widely used in stroke care and research. mRS grades functional status from 0 (no symptoms) through 5 (severe disability), with 6 indicating death.\n\nWithin this implementation guide, mRS is intended to be captured as Observation.valueCodeableConcept (bound to the MRsScoreVS ValueSet), with the assessment timepoint represented explicitly (e.g., via effective[x]) and/or via an assessment context indicator (e.g., pre-stroke baseline, discharge, ~90-day follow-up). This supports standard reporting (e.g., “mRS at 90 days”), comparability across sites, and consistent downstream analytics.\n\nScope and modeling notes:\n- mRS is a coarse, global disability scale; it does not encode detailed domain-specific functional limitations (mobility, cognition, ADLs) which should be captured via additional instruments/Observations if required.\n- The CodeSystem defines only the *score*; method of ascertainment (in-person, telephone, structured interview) and assessor details should be captured separately when relevant.",
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
