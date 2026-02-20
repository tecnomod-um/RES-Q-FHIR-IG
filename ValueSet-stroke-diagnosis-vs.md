# Stroke Diagnosis ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Diagnosis ValueSet**

## ValueSet: Stroke Diagnosis ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-diagnosis-vs | *Version*:0.1.0 |
| Active as of 2025-10-07 | *Computable Name*:StrokeDiagnosisVS |
| **Copyright/Legal**: This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International. | |

 
This ValueSet enumerates SNOMED CT concepts representing **final stroke-related diagnoses** for use in `Condition.code` within this Implementation Guide (IG). 
**Primary use-case** 
* Required binding to `Condition.code` in `StrokeDiagnosisConditionProfile`, representing the **definitive diagnosis** of the index stroke event for the linked encounter.
 
**Scope** 
* Ischemic stroke
* Intracerebral/cerebral hemorrhage
* Subarachnoid hemorrhage
* Cerebral venous thrombosis
* Transient ischemic attack (TIA)
* “Undetermined” qualifier (use cautiously; see notes)
 
**Modeling notes** 
* This ValueSet is intended for definitive diagnoses (e.g., at discharge or after diagnostic workup), not “rule-out”, screening, history-of, or procedural concepts.
* Terminology expansion should be performed against the appropriate SNOMED CT edition/version and preferred language(s). Localizations MAY add designations without changing meaning.
* If “undetermined” is used, consider adding supporting narrative in `Condition.note` and/or linking evidence in Observations/DiagnosticReports to preserve interpretability.
 

 
To provide a consistent set of SNOMED CT concepts for coding definitive stroke-related diagnoses in this IG. 

 **References** 

* [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md)

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
  "id" : "stroke-diagnosis-vs",
  "url" : "http://tecnomod-um.org/ValueSet/stroke-diagnosis-vs",
  "version" : "0.1.0",
  "name" : "StrokeDiagnosisVS",
  "title" : "Stroke Diagnosis ValueSet",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-10-07",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "description" : "This ValueSet enumerates SNOMED CT concepts representing **final stroke-related diagnoses** for use in `Condition.code` within this Implementation Guide (IG).\n\n**Primary use-case**\n- Required binding to `Condition.code` in `StrokeDiagnosisConditionProfile`, representing the *definitive diagnosis* of the index stroke event for the linked encounter.\n\n**Scope**\n- Ischemic stroke\n- Intracerebral/cerebral hemorrhage\n- Subarachnoid hemorrhage\n- Cerebral venous thrombosis\n- Transient ischemic attack (TIA)\n- “Undetermined” qualifier (use cautiously; see notes)\n\n**Modeling notes**\n- This ValueSet is intended for definitive diagnoses (e.g., at discharge or after diagnostic workup), not “rule-out”, screening, history-of, or procedural concepts.\n- Terminology expansion should be performed against the appropriate SNOMED CT edition/version and preferred language(s). Localizations MAY add designations without changing meaning.\n- If “undetermined” is used, consider adding supporting narrative in `Condition.note` and/or linking evidence in Observations/DiagnosticReports to preserve interpretability.",
  "immutable" : false,
  "purpose" : "To provide a consistent set of SNOMED CT concepts for coding definitive stroke-related diagnoses in this IG.",
  "copyright" : "This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International.",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "422504002",
        "display" : "Ischemic stroke (disorder)"
      },
      {
        "code" : "274100004",
        "display" : "Cerebral hemorrhage (disorder)"
      },
      {
        "code" : "266257000",
        "display" : "Transient ischemic attack (disorder)"
      },
      {
        "code" : "21454007",
        "display" : "Subarachnoid intracranial hemorrhage (disorder)"
      },
      {
        "code" : "95455008",
        "display" : "Thrombosis of cerebral veins (disorder)"
      },
      {
        "code" : "373068000",
        "display" : "Undetermined (qualifier value)"
      }]
    }]
  }
}

```
