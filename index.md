# Index - v0.1.0

* [**Table of Contents**](toc.md)
* **Index**

## Index

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ImplementationGuide/RES-Q-FHIR-IG | *Version*:0.1.0 |
| Draft as of 2026-02-17 | *Computable Name*:RESQIG |

The [RES-Q Stroke Registry](https://stroke.qualityregistry.org/) mission is to empower hospitals and healthcare providers to monitor, evaluate, and enhance the quality of health care. Today, more than 2,000 hospitals across 89 countries actively contribute data to RES-Q, making it one of the largest international stroke quality registries. The RES-Q platform provides hospitals with interactive dashboards and customizable reports, enabling them to benchmark performance, identify gaps, and implement targeted improvements in clinical practice. Within RES-Q, stroke-related data is systematically collected using a dedicated [data collection form](https://stroke.qualityregistry.org/useful-information/data-collection-form) which ensures consistency in reporting across participating institutions. However, integrating data from external systems into RES-Q can be complex and often requires manual work or bespoke ETL pipelines. This implementation guide addresses that challenge by describing how to model your data using HL7 FHIR, following the RES-Q profiles and value sets. By adopting this standardized approach, registries and hospitals can align their data with RES-Q requirements, reduce integration effort, and benefit from a uniform interface for exchanging information. Ultimately, this not only simplifies participation in RES-Q but also strengthens interoperability with other health information systems.

-------

### Purpose

The goal of this Implementation Guide is to specify how to represent in HL7 FHIR the RES-Q Stroke registry.

### Project Backgound

This work has been made as part of the [RES-Q+ project](https://www.resqplus.eu)

### Authors and Contributors

| | | | |
| :--- | :--- | :--- | :--- |
| Primary Editor | Álvaro Riquelme Tornel | University of Murcia, Spain | alvaro.riquelmet@um.es |
| Primary Editor | Catalina Martínez Costa | University of Murcia, Spain | cmartinezcosta@um.es |

-------



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "RES-Q-FHIR-IG",
  "url" : "http://tecnomod-um.org/ImplementationGuide/RES-Q-FHIR-IG",
  "version" : "0.1.0",
  "name" : "RESQIG",
  "status" : "draft",
  "date" : "2026-02-17T08:59:32+00:00",
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
  "packageId" : "RES-Q-FHIR-IG",
  "license" : "CC0-1.0",
  "fhirVersion" : ["5.0.0"],
  "dependsOn" : [
    {
      "id" : "hl7tx",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
        }
      ],
      "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
      "packageId" : "hl7.terminology.r5",
      "version" : "7.0.1"
    },
    {
      "id" : "hl7ext",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
          "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
        }
      ],
      "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
      "packageId" : "hl7.fhir.uv.extensions.r5",
      "version" : "5.2.0"
    }
  ],
  "definition" : {
    "extension" : [
      {
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
        "valueCode" : "hl7.fhir.uv.tools.r5#0.9.0"
      }
    ],
    "resource" : [
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/admission-source-vs"
        },
        "name" : "Admission Sources ValueSet",
        "description" : "Defines the modes of transport or pathways by which the patient arrived.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/age-at-onset-observation-profile"
        },
        "name" : "Age at Stroke Onset Observation Profile (R5)",
        "description" : "Profile specifically for recording the patient's age at stroke onset.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/AgeAtOnsetObservationExample"
        },
        "name" : "AgeAtOnsetObservationExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/age-at-onset-observation-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/assessment-context-cs"
        },
        "name" : "Assessment Context Code System",
        "description" : "Codes defining the context or timing of a clinical assessment, particularly functional scores.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/assessment-context-vs"
        },
        "name" : "Assessment Context ValueSet",
        "description" : "ValueSet for assessment context codes (e.g., timing of functional scores).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/afib-flutter-status-vs"
        },
        "name" : "Atrial Fibrillation or Flutter Status ValueSet",
        "description" : "ValueSet for the status of Atrial Fibrillation or Flutter assessment.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/base-stroke-observation"
        },
        "name" : "Base Profile for Stroke-Related Observations",
        "description" : "Constraints for observations recorded in the context of stroke care.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/brain-imaging-modality-vs"
        },
        "name" : "Brain Imaging Modality ValueSet",
        "description" : "Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/brain-imaging-type-cs"
        },
        "name" : "Brain Imaging Type Code System",
        "description" : "Codes specifying the type of brain imaging performed (e.g., CT, MRI).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/carotid-imaging-modality-vs"
        },
        "name" : "Carotid Arteries Imaging Modality ValueSet",
        "description" : "Defines codes for different types of carotid artery imaging.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/discharge-dept-cs"
        },
        "name" : "Discharge Department/Service Code System",
        "description" : "Code system specifying the type of department or service the patient was discharged or transferred to.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/discharge-department-service-ext"
        },
        "name" : "Discharge Department/Service Extension",
        "description" : "Specifies the type of department or service the patient was discharged or transferred to.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/discharge-dept-vs"
        },
        "name" : "Discharge Department/Service ValueSet",
        "description" : "ValueSet specifying the type of department or service the patient was discharged or transferred to.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/discharge-destination-vs"
        },
        "name" : "Discharge Destination ValueSet",
        "description" : "Defines possible patient discharge destinations.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/discharge-medication-request-profile"
        },
        "name" : "Discharge Medication Request Profile",
        "description" : "Represents a medication prescription made as part of the patient's discharge plan, categorized as community administration.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "MedicationRequest"
          }
        ],
        "reference" : {
          "reference" : "MedicationRequest/discharge-medication-request-001"
        },
        "name" : "DischargeMedicationRequest",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/discharge-medication-request-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Organization"
          }
        ],
        "reference" : {
          "reference" : "Organization/ExampleStrokeOrganization"
        },
        "name" : "Example Stroke Registry Organization",
        "description" : "Matches build_organization: active=true, name from hospital_name, identifier from mapped_org_id.",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-registry-organization-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/first-hospital-ext"
        },
        "name" : "First Hospital Extension",
        "description" : "Indicates if the reporting hospital was the first medical facility to admit the patient for this stroke episode.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/FunctionalScoreObservationExample"
        },
        "name" : "FunctionalScoreObservationExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/functional-score-observation-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/gender-snomed-ext"
        },
        "name" : "Gender (SNOMED CT)",
        "description" : "Patient gender represented with SNOMED CT codes.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/vs-gender-snomed"
        },
        "name" : "Gender (SNOMED CT)",
        "description" : "Value set to represent patient gender using SNOMED CT codes, analogous to AdministrativeGender.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/hemorrhagic-stroke-bleeding-reason-cs"
        },
        "name" : "Hemorrhagic Stroke Bleeding Reason Code System",
        "description" : "Codes indicating the reason for bleeding in hemorrhagic stroke cases.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/hemorrhagic-stroke-bleeding-reason-vs"
        },
        "name" : "Hemorrhagic Stroke Bleeding Reason ValueSet",
        "description" : "Specifies the identified cause of a hemorrhagic stroke, typically used with an extension.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/hemorrhagic-stroke-bleeding-reason-ext"
        },
        "name" : "Hemorrhagic Stroke – Bleeding Reason",
        "description" : "Captures, as a CodeableConcept bound (required) to HemorrhagicStrokeBleedingReasonVS, the identified cause of intracranial bleeding in hemorrhagic stroke (e.g., aneurysm, vascular malformation, other). Use when coding a definitive hemorrhagic stroke Condition to support analytics and decision support; do not use for non-hemorrhagic etiologies or when the cause is unknown/undetermined.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/stroke-arrival-mode-cs"
        },
        "name" : "Initial Care Intensity Code System",
        "description" : "Codes indicating the level of care provided during the patient's initial day(s) in the hospital.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/initial-care-intensity-cs"
        },
        "name" : "Initial Care Intensity Code System",
        "description" : "Codes indicating the level of care provided during the patient's initial day(s) in the hospital.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/initial-care-intensity-ext"
        },
        "name" : "Initial Care Intensity Extension",
        "description" : "Specifies the level of care provided during the patient's initial day(s) in the hospital (e.g., standard bed, monitored, ICU/Stroke Unit).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/initial-care-intensity-vs"
        },
        "name" : "Initial Care Intensity ValueSet",
        "description" : "ValueSet indicating the level of care provided initially.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/ischemic-stroke-etiology-ext"
        },
        "name" : "Ischemic Stroke – Etiology",
        "description" : "Records the determined ischemic stroke etiology as a CodeableConcept bound (required) to StrokeEtiologyVS (e.g., cardioembolic, large artery atherosclerosis, lacunar, cryptogenic). Apply to definitive ischemic stroke Conditions after diagnostic workup; avoid use for hemorrhagic strokes or provisional hypotheses not yet established.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/medication-cs"
        },
        "name" : "Medications CodeSystem",
        "description" : "Codes for drug products or substances representing the Medications on the patient discharge.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/medication-vs"
        },
        "name" : "Medications ValueSet",
        "description" : "SNOMED CT codes for drug products or substances.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/mrs-score-cs"
        },
        "name" : "modified Rankin Scale (mRS) Score Code System",
        "description" : "Codes representing the modified Rankin Scale (mRS) score for functional outcome.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mrs-score-vs"
        },
        "name" : "modified Rankin Scale (mRS) Score ValueSet",
        "description" : "ValueSet containing the codes for the modified Rankin Scale (mRS) score.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/mtici-score-cs"
        },
        "name" : "MTICI Score Code System",
        "description" : "CodeSystem containing the codes to represent the MTICI score.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/mtici-code-cs"
        },
        "name" : "mTICI Score Codes CodeSystem",
        "description" : "Codes representing the mTICI score used to assess the degree of reperfusion after a thrombectomy procedure.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mtici-code-vs"
        },
        "name" : "mTICI Score Codes ValueSet",
        "description" : "ValueSet containing the codes to represent the mTICI score used to assess the degree of reperfusion after a thrombectomy procedure.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mtici-score-vs"
        },
        "name" : "MTICI Score ValueSet",
        "description" : "ValueSet containing the codes to represent the MTICI score used to assess the degree of reperfusion after a thrombectomy procedure.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/observation-timing-context-ext"
        },
        "name" : "Observation Timing Context Extension",
        "description" : "Specifies the timing context or phase (e.g., pre-stroke, admission, discharge, 3-month) in which an observation or assessment was made.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/patient-age-ext"
        },
        "name" : "Patient Age (integer)",
        "description" : "Patient age in years represented as an integer.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/patient-age-gender-snomed-profile"
        },
        "name" : "Patient with SNOMED Gender and Age (extensions)",
        "description" : "Profile that adds an integer age extension and a SNOMED-based gender extension.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/PatientAgeGenderSnomedExample"
        },
        "name" : "PatientAgeGenderSnomedExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/patient-age-gender-snomed-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Patient"
          }
        ],
        "reference" : {
          "reference" : "Patient/example-patient"
        },
        "name" : "PatientExample",
        "isExample" : true
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/perforation-procedures-vs"
        },
        "name" : "Perforation Procedures ValueSet",
        "description" : "ValueSet containing SNOMED CT codes representing a range of perforation procedures.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/prior-medication-statement-profile"
        },
        "name" : "Prior Medication Statement Profile (R5)",
        "description" : "Represents a statement about the patient's medication use *before* the index event.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "MedicationStatement"
          }
        ],
        "reference" : {
          "reference" : "MedicationStatement/PriorMedicationStatementExample"
        },
        "name" : "PriorMedicationStatementExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/prior-medication-statement-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/procedure-timing-context-cs"
        },
        "name" : "Procedure Timing Context Code System",
        "description" : "Codes defining the timing phase of a procedure relative to the encounter start (e.g., acute vs. post-acute).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/procedure-timing-context-ext"
        },
        "name" : "Procedure Timing Context Extension",
        "description" : "Specifies the timing phase (e.g., acute, post-acute) in which the procedure was performed relative to the start of the encounter.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/procedure-timing-context-vs"
        },
        "name" : "Procedure Timing Context ValueSet",
        "description" : "ValueSet for codes defining the timing phase of a procedure relative to the encounter start.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/required-post-acute-care-ext"
        },
        "name" : "Required Post-Acute Care Extension",
        "description" : "Indicates whether the patient required hospitalization beyond 24 hours after the designated acute phase of stroke care for this encounter.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/specific-finding-codes-vs"
        },
        "name" : "Specific Stroke Finding Codes ValueSet",
        "description" : "Codes for specific clinical findings relevant to stroke (Afib/Flutter status, MTICI score).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-finding-codes-vs"
        },
        "name" : "Specific Stroke Finding Codes ValueSet",
        "description" : "ValueSet for specific coded findings like Afib/Flutter status or mTICI score.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/specific-finding-observation-profile"
        },
        "name" : "Specific Stroke Finding Observation Profile (R5)",
        "description" : "Profile for specific coded findings like Afib/Flutter status or mTICI score.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/SpecificFindingObservationExample"
        },
        "name" : "SpecificFindingObservationExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/SpecificFindingObservationExampleMTICI"
        },
        "name" : "SpecificFindingObservationExampleMTICI",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-arrival-mode-vs"
        },
        "name" : "Stroke Arrival Mode ValueSet",
        "description" : "ValueSet specifying the mode and origin of the patient's arrival.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-brain-imaging-procedure-profile"
        },
        "name" : "Stroke Brain Imaging Procedure Profile (R5)",
        "description" : "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-carotid-imaging-procedure-profile"
        },
        "name" : "Stroke Carotid Imaging Procedure Profile (R5)",
        "description" : "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/stroke-circumstance-codes-cs"
        },
        "name" : "Stroke Circumstance Codes CodeSystem",
        "description" : "Codes for findings related to the circumstances of stroke onset (In-hospital, Wake-up).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-circumstance-codes-vs"
        },
        "name" : "Stroke Circumstance Codes ValueSet",
        "description" : "Codes for findings related to the circumstances of stroke onset (In-hospital, Wake-up).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-circumstance-observation-profile"
        },
        "name" : "Stroke Circumstance Observation Profile (R5)",
        "description" : "Profile for recording findings about stroke onset circumstances (In-hospital, Wake-up).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-diagnosis-condition-profile"
        },
        "name" : "Stroke Diagnosis Condition Profile",
        "description" : "Defines a Condition profile constrained to represent the definitive diagnosis of the current stroke event during the indexed encounter. The profile fixes category to encounter-diagnosis, binds code (required) to StrokeDiagnosisVS, and prohibits onset[x] to avoid ambiguity with symptom-onset capture via dedicated extensions. Use this profile for final/confirmed stroke diagnoses recorded at discharge or after diagnostic workup; do not use it for history-of conditions, screening findings, or provisional ‘rule-out’ statements. Optional extensions capture hemorrhagic bleeding reason, ischemic etiology, and structured onset date/time when clinically known.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-diagnosis-vs"
        },
        "name" : "Stroke Diagnosis ValueSet",
        "description" : "SNOMED CT concepts representing final stroke-related diagnoses intended for use in Condition.code (and similar elements) within this IG. The scope covers ischemic stroke, intracerebral hemorrhage, subarachnoid hemorrhage, cerebral venous thrombosis, and transient ischemic attack (TIA). This value set is designed to support consistent capture, validation, analytics, and decision support. Implementers should expand against a terminology server using the appropriate SNOMED CT edition/version and preferred language(s) for display. Localizations or national derivatives MAY provide additional designations without altering the canonical definition. This value set is not intended for history-of, screening, or procedural concepts.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/stroke-discharge-destination-cs"
        },
        "name" : "Stroke Discharge Destination Code System",
        "description" : "Codes indicating the possible destinations of the patient upon discharge from the encounter.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-discharge-destination-vs"
        },
        "name" : "Stroke Discharge Destination ValueSet",
        "description" : "Defines the possible destinations of the patient upon discharge from the encounter.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-encounter-profile"
        },
        "name" : "Stroke Encounter Profile",
        "description" : "Profile for an Encounter resource representing a patient's hospital admission and stay for a stroke event, including key administrative and workflow details.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/stroke-etiology-cs"
        },
        "name" : "Stroke Etiology Code System",
        "description" : "Codes indicating the etiology of strokes.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-etiology-vs"
        },
        "name" : "Stroke Etiology ValueSet",
        "description" : "Specifies the determined etiology of an stroke.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/functional-score-codes-vs"
        },
        "name" : "Stroke Functional Score Codes ValueSet",
        "description" : "Codes for key functional scores used in stroke (mRS, NIHSS).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/functional-score-observation-profile"
        },
        "name" : "Stroke Functional Score Observation Profile (R5, Timing Ext)",
        "description" : "Profile for recording functional scores (mRS, NIHSS), using an extension for timing context.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/onset-date-ext"
        },
        "name" : "Stroke Onset Date",
        "description" : "Captures the calendar date (value[x] = date) of symptom onset for the indexed stroke event when known, enabling calculation of onset-to-door metrics and adherence to time-sensitive pathways. Use alongside OnsetTimeExt when hour/minute precision is available; omit if onset is unknown or inapplicable.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/onset-time-ext"
        },
        "name" : "Stroke Onset Time",
        "description" : "Captures the clock time (value[x] = time) of symptom onset for the indexed stroke event when available, complementing OnsetDateExt to support precise onset-to-treatment intervals. Use local time of the clinical setting; omit if time is unknown or estimated beyond acceptable precision.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/stroke-proc-not-done-reason-cs"
        },
        "name" : "Stroke Procedure Not Done Reason Code System",
        "description" : "Codes specifying the reason principal for not performing a key stroke procedure (Thrombolysis, Thrombectomy).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-proc-not-done-reason-vs"
        },
        "name" : "Stroke Procedure Not Done Reason ValueSet",
        "description" : "ValueSet containing specific codes to indicate why thrombolysis or thrombectomy was not performed.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-registry-organization-profile"
        },
        "name" : "Stroke Registry Organization Profile",
        "description" : "Organization profile ensuring an active organization with a registry identifier (system=https://stroke.qualityregistry.org) and a required name, aligned with the build_organization() transformation.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-risk-factor-condition-profile"
        },
        "name" : "Stroke Risk Factor Condition Profile",
        "description" : "Defines a Condition profile for pre-existing or concurrent conditions that increase stroke risk (e.g., atrial fibrillation/flutter, diabetes, hypertension, coronary disease). The profile fixes category to problem-list-item, binds code (required) to StrokeRiskFactorVS, and supports onset[x] and recordedDate to document chronology and longitudinal tracking. Use this profile to maintain the problem list and to support risk assessment and CDS; do not use it to code the acute stroke event itself.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-risk-factor-vs"
        },
        "name" : "Stroke Risk Factor ValueSet",
        "description" : "Defines the SNOMED CT codes for conditions or risk factors relevant to stroke, including an option for unknown status.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-swallow-procedure-profile"
        },
        "name" : "Stroke Swallow Procedure Profile (R5)",
        "description" : "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/stroke-mechanical-procedure-profile"
        },
        "name" : "Stroke Thrombolysis Procedure Profile (R5)",
        "description" : "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/timing-metric-codes-vs"
        },
        "name" : "Stroke Timing Metric Codes ValueSet",
        "description" : "ValueSet for key process timing metrics in acute stroke care (D2N, D2G).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/timing-metric-codes-cs"
        },
        "name" : "Stroke Timing Metric Codes ValueSet",
        "description" : "Codes for key process timing metrics in acute stroke care (D2N, D2G).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/timing-metric-observation-profile"
        },
        "name" : "Stroke Timing Metric Observation Profile (R5)",
        "description" : "Profile for recording key process timing metrics (D2N, D2G).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/vital-sign-codes-vs"
        },
        "name" : "Stroke Vital Sign Codes ValueSet",
        "description" : "Codes for key vital signs relevant to stroke assessment (Systolic, Diastolic BP).",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:resource"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/vital-sign-observation-profile"
        },
        "name" : "Stroke Vital Sign Observation Profile (R5)",
        "description" : "Profile for recording key vital signs (Systolic/Diastolic BP) in stroke patients.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Procedure"
          }
        ],
        "reference" : {
          "reference" : "Procedure/StrokeBrainImagingExample"
        },
        "name" : "StrokeBrainImagingExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-brain-imaging-procedure-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Procedure"
          }
        ],
        "reference" : {
          "reference" : "Procedure/StrokeCarotidImagingExample"
        },
        "name" : "StrokeCarotidImagingExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-carotid-imaging-procedure-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/StrokeCircumstanceObservationExampleWakeUp"
        },
        "name" : "StrokeCircumstanceObservationExampleWakeUp",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-circumstance-observation-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/StrokeDiagnosisConditionAFib"
        },
        "name" : "StrokeDiagnosisConditionAFib",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/StrokeDiagnosisConditionAFlutter"
        },
        "name" : "StrokeDiagnosisConditionAFlutter",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/StrokeDiagnosisConditionExample"
        },
        "name" : "StrokeDiagnosisConditionExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-diagnosis-condition-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Encounter"
          }
        ],
        "reference" : {
          "reference" : "Encounter/StrokeEncounterExample"
        },
        "name" : "StrokeEncounterExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-encounter-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Condition"
          }
        ],
        "reference" : {
          "reference" : "Condition/StrokeRiskFactorConditionExample"
        },
        "name" : "StrokeRiskFactorConditionExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Procedure"
          }
        ],
        "reference" : {
          "reference" : "Procedure/StrokeSwallowingExample"
        },
        "name" : "StrokeSwallowingExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-swallow-procedure-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Procedure"
          }
        ],
        "reference" : {
          "reference" : "Procedure/StrokeThrombolysisExample"
        },
        "name" : "StrokeThrombolysisExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/stroke-mechanical-procedure-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/swallow-procedures-cs"
        },
        "name" : "Swallow Procedures Code System",
        "description" : "Codes representing various swallowing assessment procedures.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/swallow-procedures-vs"
        },
        "name" : "Swallow Procedures ValueSet",
        "description" : "ValueSet containing SNOMED CT codes representing a range of procedures used in the evaluation and management of stroke patients.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "StructureDefinition:extension"
          }
        ],
        "reference" : {
          "reference" : "StructureDefinition/swallowing-screening-timing-category-ext"
        },
        "name" : "Swallowing Screening Timing Category",
        "description" : "Temporal category relative to stroke onset in which the swallowing screening was performed.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/swallow-screen-time-cs"
        },
        "name" : "Swallowing Screening Timing Category Code System",
        "description" : "Temporal categories relative to stroke onset for swallowing screening.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/swallowing-screening-timing-category-vs"
        },
        "name" : "Swallowing Screening Timing Category ValueSet",
        "description" : "Temporal categories relative to stroke onset for swallowing screening.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "CodeSystem"
          }
        ],
        "reference" : {
          "reference" : "CodeSystem/thrombectomy-complication-cs"
        },
        "name" : "Thrombectomy Complication Code System",
        "description" : "Codes specifying the specific complications of thrombectomy to record.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/thrombectomy-complication-vs"
        },
        "name" : "Thrombectomy Complication ValueSet",
        "description" : "Defines the specific complications of thrombectomy to record.",
        "isExample" : false
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/TimingMetricObservationExample"
        },
        "name" : "TimingMetricObservationExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/timing-metric-observation-profile"
        ]
      },
      {
        "extension" : [
          {
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
            "valueString" : "Observation"
          }
        ],
        "reference" : {
          "reference" : "Observation/VitalSignObservationExample"
        },
        "name" : "VitalSignObservationExample",
        "isExample" : true,
        "profile" : [
          "http://tecnomod-um.org/StructureDefinition/vital-sign-observation-profile"
        ]
      }
    ],
    "page" : {
      "sourceUrl" : "toc.html",
      "name" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [
        {
          "sourceUrl" : "index.html",
          "name" : "index.html",
          "title" : "Index",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "conformance.html",
          "name" : "conformance.html",
          "title" : "Conformance",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "guidance.html",
          "name" : "guidance.html",
          "title" : "Guidance",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "downloads.html",
          "name" : "downloads.html",
          "title" : "Downloads",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "history.html",
          "name" : "history.html",
          "title" : "History",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "profiles.html",
          "name" : "profiles.html",
          "title" : "Profiles",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "codesystems.html",
          "name" : "codesystems.html",
          "title" : "Codesystems",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "valuesets.html",
          "name" : "valuesets.html",
          "title" : "Valuesets",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "examples.html",
          "name" : "examples.html",
          "title" : "Examples",
          "generation" : "markdown"
        },
        {
          "sourceUrl" : "extensions.html",
          "name" : "extensions.html",
          "title" : "Extensions",
          "generation" : "markdown"
        }
      ]
    },
    "parameter" : [
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "copyrightyear"
        },
        "value" : "2025+"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "releaselabel"
        },
        "value" : "5"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "autoload-resources"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/capabilities"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/examples"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/extensions"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/models"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/operations"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/profiles"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/resources"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/vocabulary"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/maps"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/testing"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "input/history"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-resource"
        },
        "value" : "fsh-generated/resources"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-pages"
        },
        "value" : "template/config"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-pages"
        },
        "value" : "input/images"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "path-liquid"
        },
        "value" : "template/liquid"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "path-liquid"
        },
        "value" : "input/liquid"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "path-qa"
        },
        "value" : "temp/qa"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "path-temp"
        },
        "value" : "temp/pages"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "path-output"
        },
        "value" : "output"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/guide-parameter-code",
          "code" : "path-tx-cache"
        },
        "value" : "input-cache/txcache"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "path-suppressed-warnings"
        },
        "value" : "input/ignoreWarnings.txt"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "path-history"
        },
        "value" : "http://tecnomod-um.org/history.html"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "template-html"
        },
        "value" : "template-page.html"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "template-md"
        },
        "value" : "template-page-md.html"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "apply-contact"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "apply-context"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "apply-copyright"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "apply-jurisdiction"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "apply-license"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "apply-publisher"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "apply-version"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "apply-wg"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "active-tables"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "fmm-definition"
        },
        "value" : "http://hl7.org/fhir/versions.html#maturity"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "propagate-status"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "excludelogbinaryformat"
        },
        "value" : "true"
      },
      {
        "code" : {
          "system" : "http://hl7.org/fhir/tools/CodeSystem/ig-parameters",
          "code" : "tabbed-snapshots"
        },
        "value" : "true"
      }
    ]
  }
}

```
