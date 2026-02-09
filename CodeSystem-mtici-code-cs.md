# mTICI Score Codes CodeSystem - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **mTICI Score Codes CodeSystem**

## CodeSystem: mTICI Score Codes CodeSystem (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/CodeSystem/mtici-code-cs | *Version*:0.1.0 |
| Active as of 2026-02-09 | *Computable Name*:MTICICodeCS |

 
Codes representing the mTICI score used to assess the degree of reperfusion after a thrombectomy procedure. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [MTICICodeVS](ValueSet-mtici-code-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "mtici-code-cs",
  "url" : "http://tecnomod-um.org/CodeSystem/mtici-code-cs",
  "version" : "0.1.0",
  "name" : "MTICICodeCS",
  "title" : "mTICI Score Codes CodeSystem",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-02-09T12:15:55+00:00",
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
  "description" : "Codes representing the mTICI score used to assess the degree of reperfusion after a thrombectomy procedure.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 1,
  "concept" : [
    {
      "code" : "mTICI",
      "display" : "mTICI",
      "definition" : "Modified Thrombolysis in Cerebral Infarction"
    }
  ]
}

```
