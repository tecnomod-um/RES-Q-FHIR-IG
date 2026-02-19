# Index - v0.1.0

* [**Table of Contents**](toc.md)
* **Index**

## Index

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ImplementationGuide/RES-Q-FHIR-IG | *Version*:0.1.0 |
| Draft as of 2026-02-19 | *Computable Name*:RESQIG |

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
  "date" : "2026-02-19T11:36:03+00:00",
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
        "description" : "Profile for recording the patient’s age at the time of stroke onset as a simple integer value in years. The Observation.code is fixed to the SNOMED CT observable entity “Age at onset of clinical finding,” ensuring a clear and interoperable semantic meaning.\n\nThe age at onset may be derived from date of birth and an onset/reference timepoint (e.g., symptom onset, last known well, or discovery time depending on local policy). This profile records the resulting age value, not the derivation method; if the derivation is clinically important, implementers should capture the underlying reference timepoint(s) and provenance separately.",
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
        "description" : "This CodeSystem defines normalized codes for the clinical context / relative timepoint at which a stroke-related assessment was performed. It is primarily used to contextualize functional and severity instruments (e.g., mRS and NIHSS) where interpretation depends on whether the score reflects baseline status, acute presentation, discharge status, or follow-up.\n\nThese codes represent *relative phases* (pre-stroke baseline, admission, discharge, ~3-month follow-up) rather than precise timestamps. The actual date/time of measurement should be recorded in Observation.effective[x] when known; the context code complements effective[x] by expressing the clinical phase, which is often necessary for reporting and comparability (e.g., “mRS pre-stroke” vs “mRS at discharge”).",
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
        "description" : "This ValueSet includes all context/timepoint codes defined in AssessmentContextCS. It is intended for required binding to elements (e.g., extensions) that must indicate the clinical phase of an assessment, enabling consistent stratification and reporting of outcomes and severity over the stroke care pathway.",
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
        "description" : "This ValueSet constrains the allowed coded outcomes for documenting the status of an atrial fibrillation (AF) / atrial flutter assessment within the stroke workflow. It is intentionally limited to SNOMED CT qualifier values that express the epistemic status of the finding: (1) known present, (2) known absent, or (3) unknown.\n\nThe ValueSet is designed to support harmonized recording across systems when AF/flutter materially influences ischemic stroke etiology workup, thromboembolic risk stratification, and downstream management decisions (e.g., anticoagulation). It is appropriate for use as Observation.valueCodeableConcept to represent the result of screening, monitoring, or review of prior documentation.\n\nScope and modeling notes:\n- The qualifier values do not encode the rhythm subtype, chronicity, burden, or method of detection (e.g., ECG vs telemetry); those aspects should be represented using additional elements (e.g., Observation.method, device data) or separate Observations/Conditions as appropriate.\n- The ValueSet represents “status of assessment” rather than the disorder concept itself; if the clinical intent is to assert a diagnosis of AF/flutter, use a Condition resource with an appropriate SNOMED CT disorder code instead of (or in addition to) this status.",
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
        "description" : "Common constraints for Observations captured in the context of stroke care across acute management and follow-up. This profile establishes a consistent minimum dataset and reference structure so that downstream profiles (vital signs, functional scores, timing metrics, onset circumstances, and specific findings) behave uniformly across systems.\n\nKey modeling intent:\n- Observation.status is fixed to final to indicate recorded results suitable for clinical reporting and analytics.\n- Observation.subject (Patient) and Observation.encounter (index stroke encounter) are mandatory to ensure every observation is attributable to a specific person and care episode.\n- Observation.partOf optionally links the observation to a Procedure (e.g., mechanical thrombectomy) when the observation represents a procedural outcome (e.g., mTICI grade) or a process metric.\n- Observation.effective[x] is optional to accommodate cases where only a phase label is known; when available, effective[x] should be populated to support accurate sequencing and time-based analysis.",
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
        "description" : "This ValueSet enumerates standardized codes (primarily SNOMED CT procedures) representing **carotid imaging modalities** used in stroke workflows.\n\n**Primary use-case**\n- Bind to `Procedure.code` when recording a carotid imaging study performed during the stroke episode.",
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
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/mrs-score-vs"
        },
        "name" : "Modified Rankin Scale (mRS) Score ValueSet",
        "description" : "This ValueSet includes all modified Rankin Scale (mRS) grades defined in the MRsScoreCS CodeSystem (0–6). It is intended to be bound to Observation.valueCodeableConcept when the Observation.code indicates that the observation represents an mRS score.",
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
        "name" : "Modified Rankin Scale Score Code System",
        "description" : "This CodeSystem defines codes for the modified Rankin Scale (mRS), an ordinal measure of global disability and functional outcome widely used in stroke care and research. mRS grades functional status from 0 (no symptoms) through 5 (severe disability), with 6 indicating death.\n\nWithin this implementation guide, mRS is intended to be captured as Observation.valueCodeableConcept (bound to the MRsScoreVS ValueSet), with the assessment timepoint represented explicitly (e.g., via effective[x]) and/or via an assessment context indicator (e.g., pre-stroke baseline, discharge, ~90-day follow-up). This supports standard reporting (e.g., “mRS at 90 days”), comparability across sites, and consistent downstream analytics.\n\nScope and modeling notes:\n- mRS is a coarse, global disability scale; it does not encode detailed domain-specific functional limitations (mobility, cognition, ADLs) which should be captured via additional instruments/Observations if required.\n- The CodeSystem defines only the *score*; method of ascertainment (in-person, telephone, structured interview) and assessor details should be captured separately when relevant.",
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
        "name" : "Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem",
        "description" : "This CodeSystem defines the assessment concept code(s) used to indicate that an Observation is reporting an mTICI reperfusion grade. It is intentionally separated from the MticiScoreCS CodeSystem, which contains the actual mTICI grade values (0–3 with 2a/2b/2c).\n\nIn practice:\n- Observation.code identifies the *kind of measurement/assessment* (“mTICI reperfusion grade”).\n- Observation.valueCodeableConcept carries the *result* (one of the mTICI grades from MticiScoreVS).\n\nThis separation improves semantic clarity and supports consistent validation and analytics across systems.",
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
        "name" : "Modified Thrombolysis in Cerebral Infarction Assessment ValueSet",
        "description" : "This ValueSet includes the mTICI assessment concept code(s) from MTICICodeCS for use as Observation.code when recording an mTICI reperfusion grade. It is intended to be paired with a binding of Observation.valueCodeableConcept to MticiScoreVS.\n\nSeparating the “assessment concept” ValueSet (this ValueSet) from the “assessment result” ValueSet (MticiScoreVS) enables clearer validation rules, consistent UI behavior, and safer reuse of the mTICI scoring system across profiles.",
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
        "description" : "This CodeSystem defines codes for the modified Treatment in Cerebral Ischemia / modified Thrombolysis in Cerebral Infarction (mTICI) reperfusion grade. mTICI is an ordinal angiographic scale used to quantify the extent of antegrade reperfusion of the downstream ischemic territory after endovascular therapy for acute ischemic stroke (e.g., mechanical thrombectomy).\n\nThe scale ranges from 0 (no perfusion) to 3 (complete reperfusion), with 2a/2b/2c subgrades to distinguish partial, substantial, and near-complete reperfusion. These codes are intended for consistent, interoperable capture in HL7® FHIR® resources—most commonly Observation.valueCodeableConcept—supporting procedural documentation, registry submission, audit/quality improvement, and research.\n\nScope and modeling notes:\n- This CodeSystem represents the *final* angiographic reperfusion grade for the target downstream territory, typically assigned from the final post-procedural angiographic run (commonly DSA).\n- It does not encode target vessel location, imaging modality details, timestamps, technique/device, number of passes, collateral status, or adjudication process; those elements should be recorded separately (e.g., Procedure, ImagingStudy, Observation.method, extensions).\n- Any local definition of “successful reperfusion” (often operationalized as mTICI ≥ 2b, depending on protocol) should be implemented via ValueSets, rules, or reporting logic without altering code meanings.",
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
        "description" : "This ValueSet enumerates all allowable mTICI reperfusion grades (0, 1, 2a, 2b, 2c, 3) from the MticiScoreCS CodeSystem. It is intended to be bound (typically as required) to Observation.valueCodeableConcept when recording the final angiographic reperfusion outcome after endovascular therapy for acute ischemic stroke.\n\nUsing a dedicated ValueSet ensures:\n- consistent coding across implementations and sites,\n- reliable downstream interpretation for analytics/registry submission, and\n- clear separation between the *assessment concept* (e.g., “mTICI reperfusion grade”) and the *assessment result* (the specific grade).\n\nThis ValueSet does not convey timing, vessel location, modality, or technique; those must be represented elsewhere in the clinical model.",
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
        "description" : "This extension captures the clinical timing context (relative phase) in which an observation or assessment was made (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up). It is particularly important for functional outcomes and severity scores whose interpretation depends on *when* they were assessed.\n\nThe extension complements Observation.effective[x]:\n- effective[x] records the actual date/time (when known),\n- this extension records the standardized phase label used for reporting and comparability across sites.\n\nThe value is a required CodeableConcept bound to AssessmentContextVS (required), ensuring only supported timing contexts are used in this implementation guide.",
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
        "description" : "ValueSet restricting Procedure codes to stroke **reperfusion interventions**:\n- IV thrombolysis (IVT)\n- Mechanical thrombectomy (MT)",
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
        "name" : "Procedure Timing Context CodeSystem",
        "description" : "Local CodeSystem for classifying a procedure into a **timing context** relative to encounter start.\n\n**Primary use-case**\n- Normalize reporting into acute (<24h) vs post-acute (>=24h) phases for stroke process measures.\n\n\n**FHIR placement**\n- Used in `ProcedureTimingContextExtension` attached to Procedure.",
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
        "description" : "Extension classifying the procedure into a **timing context** relative to encounter start (acute/post-acute).\n\n**Primary use-case**\n- Operational reporting where “phase of care” is needed for compliance measures.\n\n**When to use**\n- When you want a stable, comparable phase label across sites (even if absolute times differ or onset time is uncertain).\n\n**Interpretation guidance**\n- Use `acute` for procedures within 24 hours of encounter start.\n- Use `post-acute` for procedures after 24 hours.\n- Use `unknown` when encounter/timing data are insufficient.",
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
        "description" : "ValueSet limiting allowed values for the Procedure timing context extension (acute/post-acute/unknown).\n\n**Use-case**\n- Required binding to ensure comparable phase classification across systems and sites.",
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
        "description" : "This ValueSet provides SNOMED CT disorder concepts for specific clinically relevant findings often referenced in the stroke workup, currently limited to atrial fibrillation and atrial flutter disorders.\n\nThese codes are suitable when the intent is to reference the disorder concepts themselves (e.g., as a focus finding or a coded problem). When the intent is to capture the *status of an assessment* (present/absent/unknown) rather than assert a diagnosis, implementers should use an Observation with a dedicated assessment concept as Observation.code and bind Observation.valueCodeableConcept to an appropriate status ValueSet (e.g., AfibFlutterStatusVS).",
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
        "description" : "This ValueSet aggregates a small set of coded “finding/assessment concepts” used by the SpecificFindingObservationProfile for stroke-related documentation. It currently includes:\n- specific disorder concepts relevant to stroke workup (from SpecificFindingCodesVS), and\n- the mTICI assessment concept code (from MTICICodeVS).\n\nImplementer note: This ValueSet is used to constrain Observation.code. Where Observation.code is a disorder concept (e.g., AF disorder), the Observation instance should be interpreted as capturing an *assessment about that finding* (with the assessment result carried in Observation.valueCodeableConcept, per profile constraints). Where Observation.code is an assessment concept (e.g., mTICI), the Observation.valueCodeableConcept carries the corresponding score/result.",
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
        "description" : "Profile for recording discrete, coded stroke-related findings and assessment outcomes that do not fit naturally into the vital-sign, functional-score, or timing-metric profiles. Observation.code is constrained to StrokeFindingCodesVS, and Observation.valueCodeableConcept carries the corresponding assessment result or status.\n\nTypical use cases include:\n- documenting AF/flutter assessment status as present/absent/unknown (valueCodeableConcept bound to an AF/flutter status ValueSet), and\n- documenting procedural outcome grades such as mTICI (valueCodeableConcept bound to MticiScoreVS).\n\nThis profile deliberately encodes the result as a CodeableConcept to support categorical outcomes and interoperability. It does not replace Condition for asserting diagnoses; when a durable diagnosis is established (e.g., confirmed AF), represent it as a Condition and optionally link supporting Observations (screening results, monitoring runs) using hasMember, derivedFrom, or Provenance.",
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
        "name" : "Stroke Brain Imaging Procedure Profile",
        "description" : " Profile for documenting **brain imaging performed during a stroke episode** as a FHIR R5 Procedure.\n\n**Captures**\n- `code`: imaging modality/protocol (required; standardized via BrainImagingModalityVS).\n- `status`: procedure state (required).\n- `statusReason`: why it was not done (when applicable).\n- `occurrence[x]`: when imaging occurred (recommended/required by invariant when done locally).\n- `extension[timingContext]`: acute/post-acute phase classification relative to encounter start.\n\n**Typical scenarios**\n1) Imaging completed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Imaging not performed: `status=not-done`, `statusReason` required.\n3) Imaging performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional (may not have exact time).",
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
        "name" : "Stroke Carotid Imaging Procedure Profile",
        "description" : " Profile for documenting **carotid angiography** within a stroke episode.\n\n**Design intent**\n- This profile fixes `Procedure.code` to a specific SNOMED code (angiography of carotid artery).\n- If you want multiple carotid modalities, replace the fixed code with a required binding to CarotidImagingModalityVS.\n\n**Typical scenarios**\n1) Carotid angiography performed: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Carotid angiography not performed: `status=not-done`, `statusReason` required.\n3) Carotid angiography performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional.\n\n**Use-cases**\n- Determining whether carotid angiography was performed during the episode.\n- Capturing structured “not done” reasons for audit and quality improvement.",
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
        "description" : " This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant for eligibility decisions, diagnostic reasoning, and reporting—particularly when the exact onset time is unknown or atypical.\n\nThese codes are intended to be used as Observation.code in the StrokeCircumstanceObservationProfile to assert that a given onset circumstance applies to the index stroke event. They do not encode the precise onset timestamp, last-known-well time, or location of onset; those details should be represented separately (e.g., dedicated Observations, Encounter/Condition attributes, or extensions).",
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
        "description" : "This ValueSet includes all onset-circumstance codes defined in StrokeCircumstanceCodesCS for use in stroke documentation and analytics. It is intended to be bound to Observation.code in the StrokeCircumstanceObservationProfile, enabling consistent classification of onset scenarios such as in-hospital stroke and wake-up stroke.\n\nConsistent coding supports cohort definition (e.g., wake-up stroke protocols), audit/quality reporting, and research where onset uncertainty is a key stratification variable.",
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
        "description" : "Profile for documenting clinically relevant circumstances of stroke symptom onset (e.g., wake-up stroke, in-hospital onset). The circumstance is represented by Observation.code (bound to StrokeCircumstanceCodesVS); the presence of the Observation asserts that the circumstance applies to the index event within the associated Encounter.\n\nThe profile supports linking supporting evidence via hasMember (e.g., Observations capturing last-known-well time, symptom discovery time, or other onset-related details) without overloading the circumstance code itself. This profile intentionally does not encode onset timestamps in the code; temporal details should be modeled separately for precision and auditability.",
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
        "description" : "This ValueSet defines the allowable Observation.code concepts for stroke functional and severity scoring instruments represented in this guide: modified Rankin Scale (mRS) and NIH Stroke Scale (NIHSS), expressed as SNOMED CT observable entities.\n\nIt is intended to be bound to Observation.code in the FunctionalScoreObservationProfile. Downstream validation/invariants then enforce the appropriate datatype of Observation.value[x]:\n- mRS is captured as a coded ordinal category (valueCodeableConcept bound to MRsScoreVS).\n- NIHSS is captured as a numeric total score (valueInteger), representing the summed NIHSS total rather than item-level subscores.",
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
        "name" : "Stroke Functional Score Observation Profile",
        "description" : "Profile for recording stroke functional outcome and severity scores, currently mRS and NIHSS, in a way that is both interoperable and context-aware. The profile requires a timing context extension (ObservationTimingContextExtension) to explicitly state the clinical phase (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up), enabling unambiguous interpretation and standardized reporting.\n\nObservation.code is bound to FunctionalScoreCodesVS, and invariants constrain Observation.value[x] by instrument:\n- For mRS (SNOMED CT observable entity), the result is represented as a CodeableConcept bound to MRsScoreVS (ordinal categories 0–6).\n- For NIHSS (SNOMED CT observable entity), the result is represented as an integer total score (valueInteger), reflecting the overall NIHSS total rather than item-level subscores.\n\nThe profile does not model itemized NIHSS components, assessor training, or interview method; implementers may represent those details separately when needed (e.g., additional Observations, extensions, or provenance).",
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
            "valueString" : "ValueSet"
          }
        ],
        "reference" : {
          "reference" : "ValueSet/stroke-proc-not-done-reason-vs"
        },
        "name" : "Stroke Procedure Not Done Reason ValueSet",
        "description" : "ValueSet containing the controlled vocabulary of reasons for `Procedure.statusReason` when a stroke procedure is `not-done`.",
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
        "name" : "Stroke Procedure Not Done Reasons CodeSystem",
        "description" : " Local CodeSystem enumerating standardized reasons why a key stroke procedure (e.g., IV thrombolysis or mechanical thrombectomy) was **not performed**.\n\n**Primary use-case**\n- Populate `Procedure.statusReason` when `Procedure.status = not-done`.\n\n**Why it matters**\n- Captures the difference between:\n  - clinical ineligibility (contraindication),\n  - time-based ineligibility (outside window),\n  - operational constraints (unavailable),\n  - patient choice (refusal),\n  - care pathway differences (performed elsewhere / transfer).",
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
        "name" : "Stroke Swallow Procedure Profile",
        "description" : " Profile for documenting **swallow screening / dysphagia assessment** during a stroke episode.\n\n**Captures**\n- `code`: the screening/assessment procedure or tool used (SwallowProceduresVS).\n- `status`: whether completed or not done.\n- `statusReason`: controlled reason set when not done.\n- `extension[screeningTimingCategory]`: timing bucket (e.g., within 4h).\n- `extension[timingContext]`: acute/post-acute phase relative to encounter start.\n\n\n** Typical scenarios**\n1) Screening completed on-site: `status=completed`, `extension[screeningTimingCategory]` optional, `extension[timingContext]` optional.\n2) Screening not performed: `status=not-done`, `statusReason` required.\n3) Screening performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `extension[screeningTimingCategory]` optional.",
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
        "name" : "Stroke Thrombolysis Procedure Profile",
        "description" : "Profile for documenting **stroke reperfusion procedures** as FHIR Procedure:\n- IV thrombolysis (IVT)\n- Mechanical thrombectomy (MT)\n\n**Captures**\n- `code`: restricted to reperfusion procedures (PerforationProceduresVS).\n- `status`: completed/not-done/etc.\n- `statusReason`: controlled reason set when not done.\n- `occurrence[x]` (constrained to Period): start/end time of the intervention when available.\n- `complication`: complications (as CodeableReference to Condition) — constrained by invariants.\n- `extension[timingContext]`: acute/post-acute phase classification.\n\n**Typical scenarios**\n1) Reperfusion performed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Reperfusion not performed: `status=not-done`, `statusReason` required.\n3) Reperfusion performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional.\n4) Reperfusion attempted but complicated by perforation: `status=completed`, `complication` = perforation code, `occurrence[x]` captures timing of the attempt.",
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
        "name" : "Stroke Timing Metric Codes CodeSystem",
        "description" : "This CodeSystem defines codes for key time-interval process metrics in acute stroke care used for quality monitoring and pathway optimization. Each code represents a duration measured in minutes between two clinically meaningful events (e.g., hospital arrival to thrombolysis start).\n\nThese metrics are commonly used in performance dashboards, registry submissions, and quality improvement programs. The intent is to store the *measured interval* (a duration) in Observation.valueQuantity (UCUM minutes), while event timestamps (arrival time, needle time, groin puncture time) may be stored separately when available.",
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
        "description" : "This ValueSet includes all timing metric codes defined in TimingMetricCodesCS for use as Observation.code when recording acute stroke process intervals (e.g., D2N, D2G). It supports required binding in the TimingMetricObservationProfile, ensuring only approved timing metrics are recorded.\n\nThe ValueSet is intentionally constrained to promote consistent, comparable reporting across implementations and to reduce ambiguity in downstream analytics.",
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
        "description" : "Profile for recording acute stroke process timing metrics as measured durations (e.g., Door-to-Needle, Door-to-Groin). Observation.code is bound to TimingMetricCodesVS, and Observation.valueQuantity represents the elapsed time as a duration in UCUM minutes.\n\nThis representation is optimized for quality monitoring and analytics, where the interval value is the primary datum. The profile allows hasMember references to associate related sub-metrics or supporting Observations when a composite metric is derived from multiple recorded steps.\n\nScope note: This profile records the interval value; it does not require recording the underlying event timestamps. If timestamp provenance is needed, implementers should capture the source event times separately (e.g., additional Observations or extensions) to support auditing and cross-site comparability.",
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
        "description" : "This ValueSet defines SNOMED CT observable-entity codes for the blood pressure components captured as vital signs in the acute stroke setting (systolic and diastolic blood pressure). It is intended for use as Observation.component.code in a single vital-sign Observation that records both components using UCUM units (mm[Hg]).\n\nIncluding only the component codes (rather than full LOINC panels) keeps the representation lightweight while remaining semantically precise, and supports repeated measurements across time (e.g., triage, post-thrombolysis monitoring) by repeating the Observation with different effective[x] timestamps.",
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
        "name" : "Stroke Vital Sign Observation Profile",
        "description" : "Profile for recording key blood pressure vital signs in stroke patients using a single Observation with components. The Observation is categorized as vital-signs and uses component slices for systolic and diastolic blood pressure, each represented as a Quantity in UCUM mm[Hg].\n\nThis profile supports repeated measurements over time by recording separate Observations at different effective[x] timestamps (e.g., arrival, post-thrombolysis monitoring, ICU). It intentionally does not model measurement conditions such as body position, cuff site, or device; such details may be captured via Observation.method, device references, or additional extensions if required by local workflows.",
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
        "name" : "Swallow Procedures CodeSystem",
        "description" : "Local CodeSystem representing swallowing screening/assessment tools often documented by acronym or local naming.\n\n**FHIR placement**\n- Included in `SwallowProceduresVS` to be used in `Procedure.code`",
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
        "description" : "ValueSet enumerating swallowing screening/assessment procedures/tools used in stroke care.\n\n**Implementation note**\n- `SCT#261665006 'Unknown'´ is included only as a provisional development workaround; in production, prefer FHIR `dataAbsentReason` for missing data rather than “Unknown” as a procedure code.",
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
        "description" : "ValueSet defining allowed categories for swallowing screening timing, combining:\n- local categories (e.g., within 4 hours), and\n- SNOMED CT qualifier concepts for post-admission timing.\n\n**Use-case**\n- Required binding for the swallowing timing extension.",
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
        "name" : "Thrombectomy Complication CodeSystem",
        "description" : "Local CodeSystem for complications occurring during mechanical thrombectomy.\n\n**When to use**\n- If you need a controlled internal vocabulary for adverse events/complications, especially when upstream systems do not provide SNOMED-coded diagnoses.\n\n**How it is used in FHIR R5**\n- Usually referenced from `Procedure.complication` which is a `CodeableReference(Condition)` in R5.\n- You may represent the complication as a `Condition` (preferred), and/or record a code directly depending on your implementation pattern.\n\n**Why it exists**\n- Supports minimum-set reporting across sites and enables consistent quality/safety analytics.",
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
        "name" : "Thrombectomy Complications ValueSet",
        "description" : " ValueSet of SNOMED CT concepts representing complications of thrombectomy as clinical conditions.\n\n**Primary use-case**\n- Bind `Procedure.complication` (or the referenced Condition.code) to a SNOMED-based set for interoperability.",
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
