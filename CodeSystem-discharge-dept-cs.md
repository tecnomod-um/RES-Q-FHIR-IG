# Discharge Department/Service Code System - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Discharge Department/Service Code System**

## CodeSystem: Discharge Department/Service Code System 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/discharge-dept-cs | *Version*:0.1.0 |
| Active as of 2026-02-19 | *Computable Name*:DischargeDeptCS |

 
Code system specifying the type of department or service the patient was discharged or transferred to. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [DischargeDeptVS](ValueSet-discharge-dept-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "discharge-dept-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/discharge-dept-cs",
  "version" : "0.1.0",
  "name" : "DischargeDeptCS",
  "title" : "Discharge Department/Service Code System",
  "status" : "active",
  "date" : "2026-02-19T12:37:09+00:00",
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
  "description" : "Code system specifying the type of department or service the patient was discharged or transferred to.",
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "acute",
      "display" : "Acute Rehabilitation",
      "definition" : "Patient discharged to an acute rehabilitation setting."
    },
    {
      "code" : "post-care",
      "display" : "Post Care Bed",
      "definition" : "Patient discharged to a post care bed."
    },
    {
      "code" : "neurology",
      "display" : "Neurology",
      "definition" : "Patient discharged to a neurology department or service."
    },
    {
      "code" : "another-department",
      "display" : "Another Department",
      "definition" : "Patient discharged to a different department within the same hospital."
    }
  ]
}

```
