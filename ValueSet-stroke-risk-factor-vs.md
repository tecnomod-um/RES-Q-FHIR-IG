# Stroke Risk Factor ValueSet - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Stroke Risk Factor ValueSet**

## ValueSet: Stroke Risk Factor ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ValueSet/stroke-risk-factor-vs | *Version*:0.1.0 |
| Active as of 2025-10-07 | *Computable Name*:StrokeRiskFactorValueSet |
| **Copyright/Legal**: This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International. | |

 
This ValueSet enumerates SNOMED CT disorder concepts representing **pre-existing or concurrent conditions** that increase stroke risk. 
**Primary use-case** 
* Required binding to `Condition.code` in `StrokeRiskFactorConditionProfile`, used to maintain a structured problem list supporting: 
* etiologic reasoning (e.g., cardioembolic risk),
* clinical decision support (e.g., anticoagulation considerations),
* quality reporting and research cohort definition.
 
 
**Modeling notes** 
* This ValueSet is for **previously documented conditions** (problems), not for “risk factor unknown”. If a risk factor assessment is unknown/not assessed, represent that as an Observation (status/result) or use `dataAbsentReason` patterns rather than a Condition with an “Unknown” code.
* The acute stroke event itself should be represented by `StrokeDiagnosisConditionProfile`, not by this risk factor profile.
 

 
To provide a standardized set of SNOMED CT concepts representing stroke-related risk factors for coding and validation. 

 **References** 

* [Stroke Risk Factor Condition Profile](StructureDefinition-stroke-risk-factor-condition-profile.md)

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
  "id" : "stroke-risk-factor-vs",
  "url" : "http://tecnomod-um.org/ValueSet/stroke-risk-factor-vs",
  "version" : "0.1.0",
  "name" : "StrokeRiskFactorValueSet",
  "title" : "Stroke Risk Factor ValueSet",
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
  "description" : "This ValueSet enumerates SNOMED CT disorder concepts representing **pre-existing or concurrent conditions** that increase stroke risk.\n\n**Primary use-case**\n- Required binding to `Condition.code` in `StrokeRiskFactorConditionProfile`, used to maintain a structured problem list supporting:\n  - etiologic reasoning (e.g., cardioembolic risk),\n  - clinical decision support (e.g., anticoagulation considerations),\n  - quality reporting and research cohort definition.\n\n**Modeling notes**\n- This ValueSet is for *previously documented conditions* (problems), not for “risk factor unknown”.\n  If a risk factor assessment is unknown/not assessed, represent that as an Observation (status/result) or use `dataAbsentReason` patterns rather than a Condition with an “Unknown” code.\n- The acute stroke event itself should be represented by `StrokeDiagnosisConditionProfile`, not by this risk factor profile.",
  "immutable" : false,
  "purpose" : "To provide a standardized set of SNOMED CT concepts representing stroke-related risk factors for coding and validation.",
  "copyright" : "This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International.",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "5370000",
        "display" : "Atrial flutter (disorder)"
      },
      {
        "code" : "49436004",
        "display" : "Atrial fibrillation (disorder)"
      },
      {
        "code" : "22298006",
        "display" : "Myocardial infarction (disorder)"
      },
      {
        "code" : "53741008",
        "display" : "Coronary arteriosclerosis (disorder)"
      },
      {
        "code" : "73211009",
        "display" : "Diabetes mellitus (disorder)"
      },
      {
        "code" : "55822004",
        "display" : "Hyperlipidemia (disorder)"
      },
      {
        "code" : "38341003",
        "display" : "Hypertensive disorder, systemic arterial (disorder)"
      },
      {
        "code" : "230706003",
        "display" : "Hemorrhagic cerebral infarction (disorder)"
      },
      {
        "code" : "266257000",
        "display" : "Transient ischemic attack (disorder)"
      },
      {
        "code" : "422504002",
        "display" : "Ischemic stroke (disorder)"
      },
      {
        "code" : "230690007",
        "display" : "Cerebrovascular accident (disorder)"
      }]
    }]
  }
}

```
