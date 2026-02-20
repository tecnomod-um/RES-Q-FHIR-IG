# Index - v1.0.0

* [**Table of Contents**](toc.md)
* **Index**

## Index

| | |
| :--- | :--- |
| *Official URL*:http://tecnomod-um.org/ImplementationGuide/RES-Q-FHIR-IG | *Version*:1.0.0 |
| Draft as of 2026-02-20 | *Computable Name*:RESQIG |

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
  "version" : "1.0.0",
  "name" : "RESQIG",
  "status" : "draft",
  "date" : "2026-02-20T10:17:22+00:00",
  "publisher" : "UMU",
  "contact" : [{
    "name" : "UMU",
    "telecom" : [{
      "system" : "url",
      "value" : "http://tecnomod-um.org"
    }]
  }],
  "packageId" : "RES-Q-FHIR-IG",
  "license" : "CC0-1.0",
  "fhirVersion" : ["5.0.0"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r5",
    "version" : "7.0.1"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r5",
    "version" : "5.2.0"
  }],
  "definition" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r5#0.9.0"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/admission-source-vs"
      },
      "name" : "Admission Sources ValueSet",
      "description" : "This ValueSet enumerates modes of transport or pathways by which a patient arrived for the index stroke encounter.\n\n**Primary use-cases**\n- Bind to admission source elements (commonly `Encounter.hospitalization.admitSource` or local equivalents) to support:\n  - operational reporting (ambulance vs own transport),\n  - pathway compliance (e.g., EMS prenotification pathways),\n  - inter-facility transfer analytics.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/age-at-onset-observation-profile"
      },
      "name" : "Age at Stroke Onset Observation Profile (R5)",
      "description" : "Profile for recording the patient’s age at the time of stroke onset as an integer value in years.\n\n**Primary use-case**\n- Provides a computable attribute commonly used in etiologic assessment, risk stratification, and registry datasets.\n\n**Modeling note**\n- The age may be derived from DOB and an onset reference (symptom onset, last-known-well, discovery time).\n  This profile records the resulting age value, not the derivation method; capture provenance separately if needed.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/AgeAtOnsetObservationExample"
      },
      "name" : "AgeAtOnsetObservationExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/age-at-onset-observation-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/assessment-context-cs"
      },
      "name" : "Assessment Context Code System",
      "description" : "This CodeSystem defines normalized codes for the **clinical context / relative timepoint** at which a stroke-related assessment is performed.\nIt is primarily used to contextualize instruments whose interpretation depends on phase (e.g., mRS/NIHSS at baseline vs discharge vs follow-up).\n\n**Primary use-case**\n- Use as the value in `ObservationTimingContextExtension.valueCodeableConcept` to label the phase of an assessment.\n\n**How it complements effective[x]**\n- `Observation.effective[x]` records the actual date/time (when known).\n- This CodeSystem records the standardized phase label used for reporting and comparability.\n\n**Why this is needed**\n- Many workflows report outcomes by phase even when the exact timestamp is unknown or operationally variable (“mRS at 90 days”).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/assessment-context-vs"
      },
      "name" : "Assessment Context ValueSet",
      "description" : "This ValueSet includes all phase/context codes from AssessmentContextCS.\n\n**Primary use-case**\n- Required binding for elements that must indicate the clinical phase of an assessment (e.g., timing context extensions).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/afib-flutter-status-vs"
      },
      "name" : "Atrial Fibrillation / Flutter Assessment Status ValueSet",
      "description" : "This ValueSet constrains the allowable coded outcomes for documenting the **status of an AF/flutter assessment** within the stroke workflow.\n\n**Primary use-case**\n- Bind to `Observation.valueCodeableConcept` in the `SpecificFindingObservationProfile` when `Observation.code` refers to AF/flutter as a finding focus.\n- Enables harmonized interpretation for analytics and decision support (e.g., anticoagulation pathway triggers) without forcing a Condition assertion.\n\n**Scope and modeling notes**\n- This ValueSet expresses *assessment outcome/status* (detected/known/absent/not screened/unknown).\n- It does not replace Condition for diagnoses. When AF/flutter is confirmed as a diagnosis, represent it as a `Condition` with the appropriate SNOMED CT disorder code.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/base-stroke-observation"
      },
      "name" : "Base Profile for Stroke-Related Observations",
      "description" : "Common constraints for Observations captured in the context of stroke care across acute management and follow-up.\nThis base profile establishes a consistent minimum dataset and reference structure so specialized observation profiles behave uniformly.\n\n**Key modeling intent**\n- `Observation.status` is fixed to `final` to represent finalized results suitable for reporting and analytics.\n- `Observation.subject` (Patient) and `Observation.encounter` (index stroke encounter) are mandatory for attribution.\n- `Observation.partOf` optionally links the Observation to a Procedure (e.g., thrombectomy) when the Observation represents a procedural outcome (e.g., mTICI).\n- `Observation.effective[x]` is optional to support cases where only a phase label is known; populate when available for sequencing and analysis.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/brain-imaging-modality-vs"
      },
      "name" : "Brain Imaging Modality ValueSet",
      "description" : "This ValueSet defines the allowed codes for documenting **stroke-related brain imaging** as a Procedure.\n\nIt intentionally supports two levels of coding:\n1) **Granular SNOMED CT procedures** (preferred when available).\n2) **Local combined-protocol codes** from `BrainImagingTypeCS` (used when the source reports protocol bundles).\n\n**Primary use-case**\n- Required binding to `Procedure.code` for brain imaging within the stroke episode.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/brain-imaging-type-cs"
      },
      "name" : "Brain Imaging Type CodeSystem",
      "description" : "This local CodeSystem defines codes for **brain imaging protocol bundles** commonly used in acute stroke, such as CT+CTA+perfusion.\n\n**When to use**\n- The source system reports the study as a combined protocol (e.g., \"CT/CTA/CTP\") without individual modality breakdown.\n- You need a stable code for quality indicators and cohort definitions (e.g., “patients who had CT+CTA+perfusion”).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/carotid-imaging-modality-vs"
      },
      "name" : "Carotid Arteries Imaging Modality ValueSet",
      "description" : "This ValueSet enumerates standardized codes (primarily SNOMED CT procedures) representing **carotid imaging modalities** used in stroke workflows.\n\n**Primary use-case**\n- Bind to `Procedure.code` when recording a carotid imaging study performed during the stroke episode.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/discharge-dept-cs"
      },
      "name" : "Discharge Department/Service CodeSystem",
      "description" : "Local CodeSystem representing the **clinical service/department** responsible for the patient at discharge/transfer\n(or the service the patient is transferred to).\n\n**Primary use-case**\n- Populate `DischargeDepartmentServiceExtension` on Encounter to support:\n  - bed management and service-level reporting,\n  - pathway characterization (e.g., discharge under neurology vs rehab),\n  - operational analytics and capacity planning.\n\n**Modeling notes**\n- This captures *service classification*, not the physical ward/room. Physical location should be modeled using `Encounter.location`\n  (and references to Location resources) if needed.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/discharge-department-service-ext"
      },
      "name" : "Discharge Department/Service Extension",
      "description" : "Extension capturing the **clinical department/service** responsible at discharge or the service the patient is transferred to.\n\n**Primary use-cases**\n- Service-level reporting and capacity planning.\n- Distinguishing discharge under neurology vs rehab vs other services.\n- Supporting downstream routing/coordination logic when a service category is required.\n\n**FHIR placement**\n- `Encounter.extension[dischargeDepartmentService].valueCodeableConcept` (required binding to DischargeDeptVS).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/discharge-dept-vs"
      },
      "name" : "Discharge Department/Service ValueSet",
      "description" : "ValueSet restricting the allowed department/service categories recorded at discharge.\n\n**Primary use-case**\n- Required binding for `DischargeDepartmentServiceExtension.valueCodeableConcept`.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/discharge-destination-vs"
      },
      "name" : "Discharge Destination ValueSet",
      "description" : "This ValueSet enumerates discharge destination concepts (primarily SNOMED CT procedure-like “discharge to …” concepts).\n\n**Primary use-cases**\n- Bind to discharge disposition elements in encounter/hospitalization modeling.\n  enabling consistent:\n  - care transition analytics,\n  - pathway reporting (home vs ward vs facility vs mortuary),\n  - downstream coordination workflows.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/medication-cs"
      },
      "name" : "Discharge Medication Category CodeSystem",
      "description" : "Local CodeSystem providing **coarse medication categories** used in discharge prescribing when the source system cannot\n(or does not) provide a specific coded drug product/substance.\n\n**Primary use-cases**\n- Minimum-data capture for discharge medication classes relevant to stroke secondary prevention (e.g., anticoagulant vs antiplatelet).\n- Registry reporting where only “medication class prescribed at discharge” is available.\n- Analytics and quality indicators (e.g., “antithrombotic at discharge”) when specific agent is unknown.\n\n**How it is used in FHIR**\n- Included in `MedicationVS` so it can be used in `MedicationRequest.medication` (CodeableConcept).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/discharge-medication-request-profile"
      },
      "name" : "Discharge MedicationRequest Profile",
      "description" : "Profile for representing a medication prescription issued as part of the patient’s **discharge plan** following a stroke encounter.\n\n**Primary use-case**\n- Capture secondary prevention and chronic therapy prescriptions intended to be taken **after discharge** (community setting),\n  enabling:\n  - discharge medication reconciliation,\n  - continuity of care between hospital and primary care,\n  - registry submission and quality improvement (e.g., antithrombotic/statin at discharge),\n  - episode-linked analytics (tie to the index stroke Encounter).\n\n**Key elements and how to use them**\n- `status` (fixed to active): indicates the prescription is currently intended/valid at the time of discharge documentation.\n  - Use `stopped` or `cancelled` in your broader implementation if a discharge prescription is later withdrawn (not constrained here).\n- `category` (fixed to community): indicates the medication is intended for administration in the community/outpatient context.\n  - This helps distinguish discharge prescriptions from inpatient medication orders.\n- `medication` (required; bound to MedicationVS): identifies the prescribed agent or, if unavailable, a coarse category.\n  - Prefer specific SNOMED CT substance concepts (e.g., aspirin) when available.\n  - Use `MedicationCS` category codes only when the specific agent cannot be coded.\n- `subject` (required): the patient who will take the medication.\n- `encounter` (required): links the prescription to the index stroke admission encounter.\n- `authoredOn` (optional but recommended): the date/time the discharge prescription was authored.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/medication-vs"
      },
      "name" : "Discharge Medications ValueSet",
      "description" : "ValueSet defining allowable coded medications (or medication categories) for discharge MedicationRequests.\n\n**Primary use-case**\n- Required binding to `MedicationRequest.medication` in `DischargeMedicationRequestProfile`.\n\n**What this ValueSet supports**\n1) **Specific SNOMED CT substance concepts** (e.g., aspirin, clopidogrel, warfarin) for agent-level capture.\n2) **Local category codes** (from `MedicationCS`) for minimum-data capture when only the class is known.\n\n**Scope and modeling notes**\n- This ValueSet does not encode dose, route, frequency, or duration; those are expressed in MedicationRequest elements.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/discharge-medication-request-001"
      },
      "name" : "DischargeMedicationRequest",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/discharge-medication-request-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/ExampleStrokeOrganization"
      },
      "name" : "Example Stroke Registry Organization",
      "description" : "Matches build_organization: active=true, name from hospital_name, identifier from mapped_org_id.",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-registry-organization-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/first-hospital-ext"
      },
      "name" : "First Hospital Indicator Extension",
      "description" : "Boolean extension indicating whether the reporting hospital was the **first medical facility** to admit the patient\nfor this stroke episode.\n\n**Primary use-cases**\n- Registry fields distinguishing “direct to treating hospital” vs “secondary transfer”.\n- Analytics for inter-facility transfer patterns and treatment delays (door-in-door-out style analyses).\n\n**How to interpret**\n- `true`: this hospital is the first admitting facility for the episode.\n- `false`: patient was admitted/treated elsewhere first (transfer-in).\n\n**FHIR placement**\n- `Encounter.extension[isFirstHospital].valueBoolean`",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/FunctionalScoreObservationExample"
      },
      "name" : "FunctionalScoreObservationExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/functional-score-observation-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/gender-snomed-ext"
      },
      "name" : "Gender (SNOMED CT)",
      "description" : "Patient gender represented with SNOMED CT codes.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/vs-gender-snomed"
      },
      "name" : "Gender (SNOMED CT)",
      "description" : "Value set to represent patient gender using SNOMED CT codes, analogous to AdministrativeGender.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/hemorrhagic-stroke-bleeding-reason-cs"
      },
      "name" : "Hemorrhagic Stroke Bleeding Reason CodeSystem",
      "description" : "Local CodeSystem representing **locally governed reasons/causes** for intracranial bleeding in hemorrhagic stroke.\n\n**Primary use-case**\n- Used via `HemorrhagicStrokeBleedingReasonVS` as the allowed vocabulary for `HemorrhagicStrokeBleedingReasonExt.valueCodeableConcept`\n  on a definitive hemorrhagic stroke Condition.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/hemorrhagic-stroke-bleeding-reason-vs"
      },
      "name" : "Hemorrhagic Stroke Bleeding Reason ValueSet",
      "description" : "This ValueSet defines allowable causes of bleeding for hemorrhagic stroke documentation.\n\n**Primary use-case**\n- Required binding for `HemorrhagicStrokeBleedingReasonExt.valueCodeableConcept` on a definitive hemorrhagic stroke Condition.\n\n**Implementation guidance**\n- Use when the cause is *identified* (e.g., aneurysm, vascular malformation).\n- If the cause is unknown/undetermined, prefer documenting that explicitly using narrative (`Condition.note`) and/or a dedicated assessment Observation;\n  if a coded placeholder is required, `Undetermined (qualifier value)` is included as an option.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/hemorrhagic-stroke-bleeding-reason-ext"
      },
      "name" : "Hemorrhagic Stroke – Bleeding Reason",
      "description" : "Extension capturing the **identified cause of intracranial bleeding** in a hemorrhagic stroke.\n\n**Primary use-case**\n- Attach to a definitive hemorrhagic stroke Condition (`StrokeDiagnosisConditionProfile`) to support:\n  - etiologic stratification (aneurysm vs vascular malformation vs other),\n  - analytics and registry reporting,\n  - targeted clinical decision support pathways.\n\n**FHIR placement**\n- `Condition.extension[bleedingReason].valueCodeableConcept` (required binding to HemorrhagicStrokeBleedingReasonVS).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/initial-care-intensity-cs"
      },
      "name" : "Initial Care Intensity CodeSystem",
      "description" : "Local CodeSystem representing the **initial intensity of care** during the first day(s) of the stroke encounter.\n\n**Primary use-case**\n- Populate `InitialCareIntensityExtension` on Encounter to support:\n  - case-mix characterization (ICU/stroke unit vs monitored vs standard bed),\n  - operational benchmarking and staffing analysis,\n  - research stratification where initial level-of-care is a confounder.\n\n**Interpretation guidance**\n- `standard`: no continuous monitoring beyond standard nursing observation.\n- `monitored`: telemetry or continuous monitoring outside ICU.\n- `icu-stroke`: ICU or dedicated stroke unit level care (per local definitions).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/initial-care-intensity-ext"
      },
      "name" : "Initial Care Intensity Extension",
      "description" : "Extension capturing the **initial level of care** provided during the first day(s) of hospitalization for the stroke encounter.\n\n**Primary use-cases**\n- Operational reporting (ICU/stroke unit utilization).\n- Case-mix adjustment for outcomes and length-of-stay analyses.\n- Benchmarking across sites.\n\n**Relationship to base Encounter**\n- This is not a location/ward tracker; for physical moves use `Encounter.location` with Location references.\n- This is a categorical “initial intensity” label used for reporting.\n\n**FHIR placement**\n- `Encounter.extension[initialCareIntensity].valueCodeableConcept` (required binding to InitialCareIntensityVS).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/initial-care-intensity-vs"
      },
      "name" : "Initial Care Intensity ValueSet",
      "description" : "ValueSet restricting allowed initial care intensity categories.\n\n**Primary use-case**\n- Required binding for `InitialCareIntensityExtension.valueCodeableConcept`.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/ischemic-stroke-etiology-ext"
      },
      "name" : "Ischemic Stroke – Etiology",
      "description" : "Extension capturing the **determined ischemic stroke etiology classification**.\n\n**Primary use-case**\n- Attach to a definitive ischemic stroke Condition (`StrokeDiagnosisConditionProfile`) to support:\n  - etiologic subgroup analytics (cardioembolic vs lacunar vs cryptogenic, etc.),\n  - pathway decision support (e.g., prolonged rhythm monitoring for cryptogenic stroke),\n\n**When to use**\n- Use after etiologic workup when a classification is assigned.\n- Do not use for hemorrhagic stroke diagnoses.\n- If the etiology remains unknown/undetermined, either omit the extension or use the “Undetermined” code included in StrokeEtiologyVS.\n\n**FHIR placement**\n- `Condition.extension[ischemicEtiology].valueCodeableConcept` (required binding to StrokeEtiologyVS).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/mrs-score-vs"
      },
      "name" : "Modified Rankin Scale (mRS) Score ValueSet",
      "description" : "This ValueSet includes all mRS grades (0–6) defined in MRsScoreCS.\n\n**Primary use-case**\n- Bind to `Observation.valueCodeableConcept` when `Observation.code` indicates the Observation represents an mRS score.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/mrs-score-cs"
      },
      "name" : "Modified Rankin Scale Score Code System",
      "description" : "This CodeSystem defines codes for the **modified Rankin Scale (mRS)**, an ordinal measure of global disability and functional outcome.\nScores range from 0 (no symptoms) to 5 (severe disability), with 6 indicating death.\n\n**Primary use-case**\n- Use as the coded result in `Observation.valueCodeableConcept` (bound via MRsScoreVS) when recording an mRS outcome.\n\n**Modeling notes**\n- mRS is a global disability scale and does not capture domain-specific limitations (mobility, ADLs, cognition).\n  Capture those via additional instruments/Observations when needed.\n- Method of ascertainment and assessor details should be recorded separately (e.g., Observation.method, performer, Provenance).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/mtici-code-cs"
      },
      "name" : "Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem",
      "description" : "This CodeSystem defines the *assessment concept code* used to indicate that an Observation is reporting an mTICI reperfusion grade.\n\n**Design pattern**\n- `Observation.code` identifies the kind of assessment (“mTICI reperfusion grade”).\n- `Observation.valueCodeableConcept` carries the result (one of the grades in MticiScoreVS).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/mtici-code-vs"
      },
      "name" : "Modified Thrombolysis in Cerebral Infarction Assessment ValueSet",
      "description" : "This ValueSet includes the mTICI assessment concept code(s) from MTICICodeCS.\n\n**Primary use-case**\n- Bind to `Observation.code` when recording an mTICI reperfusion grade Observation.\n- Pair with `Observation.valueCodeableConcept` bound to MticiScoreVS.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/mtici-score-cs"
      },
      "name" : "Modified Treatment in Cerebral Infarction Grade Score CodeSystem",
      "description" : "This CodeSystem defines the **modified Thrombolysis in Cerebral Infarction (mTICI)** reperfusion grade values.\nmTICI is an ordinal angiographic scale used to quantify the extent of reperfusion after endovascular therapy for acute ischemic stroke.\n\n**Primary use-case**\n- Use as the coded result in `Observation.valueCodeableConcept` (bound via MticiScoreVS) when recording the *final angiographic reperfusion grade*.\n\n**Modeling notes**\n- Represents the *final* reperfusion grade for the downstream ischemic territory (typically adjudicated from the final angiographic run).\n- Does not encode target vessel, device/technique, number of passes, timestamps, or adjudication workflow; capture those via Procedure, ImagingStudy, Observation.method, or additional Observations/Provenance.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/mtici-score-vs"
      },
      "name" : "Modified Treatment in Cerebral Infarction Grade Score ValueSet",
      "description" : "This ValueSet enumerates all allowable Modified Treatment in Cerebral Infarction reperfusion grade values (0, 1, 2a, 2b, 2c, 3) from MticiScoreCS.\n\n**Primary use-case**\n- Required binding to `Observation.valueCodeableConcept` when an Observation represents an mTICI grade outcome.\n\n**Why a dedicated ValueSet**\n- Ensures consistent coding across implementations and sites.\n- Enables reliable registry reporting, audit/quality measurement, and research analytics.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/observation-timing-context-ext"
      },
      "name" : "Observation Timing Context Extension",
      "description" : "This extension captures the **clinical timing context (phase)** in which an observation or assessment was made\n(e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up).\n\n**Primary use-case**\n- Required for functional outcomes and severity scores whose interpretation depends on *when* the score was assessed.\n\n**How it complements Observation.effective[x]**\n- `effective[x]` records the actual measurement date/time (when known),\n- This extension records the standardized phase label used for reporting and cross-site comparability.\n\n**Binding**\n- `valueCodeableConcept` is bound (required) to AssessmentContextVS.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/patient-age-ext"
      },
      "name" : "Patient Age (integer)",
      "description" : "Patient age in years represented as an integer.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/patient-age-gender-snomed-profile"
      },
      "name" : "Patient with SNOMED Gender and Age (extensions)",
      "description" : "Profile that adds an integer age extension and a SNOMED-based gender extension.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/PatientAgeGenderSnomedExample"
      },
      "name" : "PatientAgeGenderSnomedExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/patient-age-gender-snomed-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/example-patient"
      },
      "name" : "PatientExample",
      "isExample" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/perforation-procedures-vs"
      },
      "name" : "Perforation Procedures ValueSet",
      "description" : "ValueSet restricting Procedure codes to stroke **reperfusion interventions**:\n- IV thrombolysis (IVT)\n- Mechanical thrombectomy (MT)",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/prior-medication-statement-profile"
      },
      "name" : "Prior MedicationStatement Profile",
      "description" : "Profile for documenting a statement about the patient’s medication use **before** the index stroke encounter.\n\n**Primary use-cases**\n- Medication reconciliation on admission (home medications).\n- Capturing pre-event antithrombotic/anticoagulant exposure (key for hemorrhage risk, eligibility decisions, and etiology workup).\n- Registry variables and analytics (e.g., “on anticoagulation at presentation”, “adherent vs non-adherent”).\n- Clinical decision support and discharge planning (continuation, switching, contraindication checks).\n\n**How to interpret MedicationStatement here**\n- This resource asserts *medication usage status/history*, not a prescription/order.\n  - Use MedicationRequest for discharge prescriptions or new orders.\n  - Use MedicationStatement for what the patient was taking (or was supposed to be taking) prior to admission.\n\n**Key elements and how to use them**\n- `medication` (required; bound to MedicationVS or an IG-specific meds ValueSet): identifies the agent/class.\n  - Prefer specific coded substances/products when available.\n- `subject` (required): patient who used the medication.\n- `encounter` (required): anchors the statement to the index stroke encounter where it was collected/recorded.\n- `status` (required): the lifecycle status of the statement record (e.g., recorded/entered-in-error).\n- `adherence` (optional): captures whether the patient is/was taking the medication as intended.\n  - If present, `adherence.code` is required and bound to the R5 adherence ValueSet.\n- `reason` (optional, repeating): why the medication was taken (indication), represented as CodeableReference targets.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationStatement"
      }],
      "reference" : {
        "reference" : "MedicationStatement/PriorMedicationStatementExample"
      },
      "name" : "PriorMedicationStatementExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/prior-medication-statement-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/procedure-timing-context-cs"
      },
      "name" : "Procedure Timing Context CodeSystem",
      "description" : "Local CodeSystem for classifying a procedure into a **timing context** relative to encounter start.\n\n**Primary use-case**\n- Normalize reporting into acute (<24h) vs post-acute (>=24h) phases for stroke process measures.\n\n\n**FHIR placement**\n- Used in `ProcedureTimingContextExtension` attached to Procedure.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/procedure-timing-context-ext"
      },
      "name" : "Procedure Timing Context Extension",
      "description" : "Extension classifying the procedure into a **timing context** relative to encounter start (acute/post-acute).\n\n**Primary use-case**\n- Operational reporting where “phase of care” is needed for compliance measures.\n\n**When to use**\n- When you want a stable, comparable phase label across sites (even if absolute times differ or onset time is uncertain).\n\n**Interpretation guidance**\n- Use `acute` for procedures within 24 hours of encounter start.\n- Use `post-acute` for procedures after 24 hours.\n- Use `unknown` when encounter/timing data are insufficient.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/procedure-timing-context-vs"
      },
      "name" : "Procedure Timing Context ValueSet",
      "description" : "ValueSet limiting allowed values for the Procedure timing context extension (acute/post-acute/unknown).\n\n**Use-case**\n- Required binding to ensure comparable phase classification across systems and sites.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/required-post-acute-care-ext"
      },
      "name" : "Required Post-Acute Care Extension",
      "description" : "Boolean extension indicating whether the patient required **ongoing inpatient care beyond the acute phase**.\n\n**Interpretation guidance**\n- `true`: patient required hospitalization beyond the acute phase (operationalized here as >24 hours after the acute phase).\n- `false`: no extended post-acute inpatient need was recorded for this encounter (per local workflow).\n\n**FHIR placement**\n- `Encounter.extension[requiredPostAcuteCare].valueBoolean`",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/specific-finding-codes-vs"
      },
      "name" : "Specific Stroke Finding Codes ValueSet",
      "description" : "This ValueSet provides SNOMED CT disorder concepts for specific findings referenced in the stroke workup.\nCurrently includes:\n- Atrial fibrillation (disorder)\n- Atrial flutter (disorder)\n\n**Primary use-case**\n- Constrain `Observation.code` (as a *finding focus*) when using `SpecificFindingObservationProfile`.\n\n**Important modeling note**\n- Using a disorder concept in `Observation.code` here does not necessarily assert a diagnosis; the diagnosis should be modeled as a Condition.\n- The Observation can be interpreted as “assessment about this finding,” with the result in `Observation.valueCodeableConcept` (e.g., AF status).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/stroke-finding-codes-vs"
      },
      "name" : "Specific Stroke Finding Codes ValueSet",
      "description" : "This ValueSet aggregates coded Observation.code concepts used by `SpecificFindingObservationProfile`.\n\nIt currently includes:\n- Specific disorder concepts used as a finding focus (SpecificFindingCodesVS), and\n- The mTICI assessment concept (MTICICodeVS).\n\n**How to interpret usage**\n- If `Observation.code` is a disorder concept (e.g., AF), the Observation should be interpreted as an assessment about that finding,\n  with the result/status carried in `Observation.valueCodeableConcept` (e.g., AfibFlutterStatusVS).\n- If `Observation.code` is an assessment concept (e.g., mTICI), `Observation.valueCodeableConcept` carries the score (MticiScoreVS).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/specific-finding-observation-profile"
      },
      "name" : "Specific Stroke Finding Observation Profile (R5)",
      "description" : "Profile for recording discrete, coded stroke-related findings and assessment outcomes that do not fit naturally into vital-sign,\nfunctional-score, or timing-metric profiles.\n\n**Primary use-cases**\n1) AF/flutter assessment status:\n   - `Observation.code` uses a disorder concept as the finding focus (AF/flutter).\n   - `Observation.valueCodeableConcept` carries status (AfibFlutterStatusVS).\n2) Procedural outcome grade (mTICI):\n   - `Observation.code` uses the mTICI assessment concept (MTICICodeVS).\n   - `Observation.valueCodeableConcept` carries the score (MticiScoreVS).\n\n**Important modeling note**\n- This profile does not replace Condition for diagnoses.\n  Use Condition to assert durable diagnoses and link supporting Observations via `hasMember`, `derivedFrom`, or Provenance.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/SpecificFindingObservationExample"
      },
      "name" : "SpecificFindingObservationExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/SpecificFindingObservationExampleMTICI"
      },
      "name" : "SpecificFindingObservationExampleMTICI",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/stroke-arrival-mode-cs"
      },
      "name" : "Stroke Arrival Mode CodeSystem",
      "description" : "Local CodeSystem describing **how and from where** the patient arrived to the treating hospital for the index stroke encounter.\n\n**Primary use-case**\n- Populate `Encounter.admission.admitSource` (via StrokeArrivalModeVS) to support:\n  - workflow analysis (EMS vs private transport),\n  - pathway compliance reporting (direct-to-stroke-center vs inter-facility transfer),\n  - operational dashboards and registries.\n\n**Modeling notes**\n- These codes describe *arrival origin and transport pathway*, not clinical triage severity.\n- If you need transport timestamps, EMS unit identifiers, or handover details, model them separately",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/stroke-arrival-mode-vs"
      },
      "name" : "Stroke Arrival Mode ValueSet",
      "description" : "ValueSet restricting the allowed values for documenting the patient's arrival mode/origin.\n\n**Primary use-case**\n- Required binding to `Encounter.admission.admitSource` in `StrokeEncounterProfile`.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-brain-imaging-procedure-profile"
      },
      "name" : "Stroke Brain Imaging Procedure Profile",
      "description" : " Profile for documenting **brain imaging performed during a stroke episode** as a FHIR R5 Procedure.\n\n**Captures**\n- `code`: imaging modality/protocol (required; standardized via BrainImagingModalityVS).\n- `status`: procedure state (required).\n- `statusReason`: why it was not done (when applicable).\n- `occurrence[x]`: when imaging occurred (recommended/required by invariant when done locally).\n- `extension[timingContext]`: acute/post-acute phase classification relative to encounter start.\n\n**Typical scenarios**\n1) Imaging completed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Imaging not performed: `status=not-done`, `statusReason` required.\n3) Imaging performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional (may not have exact time).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-carotid-imaging-procedure-profile"
      },
      "name" : "Stroke Carotid Imaging Procedure Profile",
      "description" : " Profile for documenting **carotid angiography** within a stroke episode.\n\n**Design intent**\n- This profile fixes `Procedure.code` to a specific SNOMED code (angiography of carotid artery).\n- If you want multiple carotid modalities, replace the fixed code with a required binding to CarotidImagingModalityVS.\n\n**Typical scenarios**\n1) Carotid angiography performed: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Carotid angiography not performed: `status=not-done`, `statusReason` required.\n3) Carotid angiography performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional.\n\n**Use-cases**\n- Determining whether carotid angiography was performed during the episode.\n- Capturing structured “not done” reasons for audit and quality improvement.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/stroke-circumstance-codes-cs"
      },
      "name" : "Stroke Circumstance Codes CodeSystem",
      "description" : "This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant when onset time is unknown or atypical.\n\n**Primary use-case**\n- Use as `Observation.code` in `StrokeCircumstanceObservationProfile`.\n- Presence of the Observation asserts that the circumstance applies to the index stroke event.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/stroke-circumstance-codes-vs"
      },
      "name" : "Stroke Circumstance Codes ValueSet",
      "description" : "This ValueSet includes all onset-circumstance codes from StrokeCircumstanceCodesCS.\n\n**Primary use-case**\n- Required binding for `StrokeCircumstanceObservationProfile.code`.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-circumstance-observation-profile"
      },
      "name" : "Stroke Circumstance Observation Profile (R5)",
      "description" : "Profile for documenting clinically relevant circumstances of stroke symptom onset (e.g., wake-up stroke, in-hospital onset).\n\n**Primary use-case**\n- Capture onset circumstance classification for eligibility reasoning, protocol stratification, and reporting when onset time is uncertain.\n\n**Representation**\n- `Observation.code` bound to StrokeCircumstanceCodesVS.\n- Presence of the Observation asserts the circumstance applies to the index stroke event (within the linked Encounter).\n\n**Typical scenarios**\n1) A patient who wakes up with stroke symptoms would have an Observation with `code` = wake-up stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is a wake-up stroke.\n2) A patient who experiences stroke symptoms while already admitted for another reason would have an Observation with `code` = in-hospital stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is in-hospital onset.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-diagnosis-condition-profile"
      },
      "name" : "Stroke Diagnosis Condition Profile",
      "description" : "Profile representing the **definitive diagnosis of the current/index stroke event** during the linked encounter.\n\n**Primary use-case**\n- Use for final/confirmed stroke diagnoses recorded during the index hospitalization/encounter (e.g., at discharge or after diagnostic workup).\n\n**Key constraints**\n- `Condition.category` is fixed to `encounter-diagnosis` to indicate this is the encounter’s diagnosis, not a general problem list item.\n- `Condition.code` is required and bound (required) to StrokeDiagnosisVS.\n- `Condition.onset[x]` is prohibited to avoid ambiguity: symptom onset is captured using dedicated onset extensions (date/time).\n\n**Supported structured enrichments**\n- `extension[bleedingReason]`: for hemorrhagic stroke bleeding cause (aneurysm, malformation, other/undetermined).\n- `extension[ischemicEtiology]`: for ischemic stroke etiology classification.\n- `extension[onsetDate]` and `extension[onsetTime]`: structured symptom onset capture.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/stroke-diagnosis-vs"
      },
      "name" : "Stroke Diagnosis ValueSet",
      "description" : "This ValueSet enumerates SNOMED CT concepts representing **final stroke-related diagnoses** for use in `Condition.code` within this Implementation Guide (IG).\n\n**Primary use-case**\n- Required binding to `Condition.code` in `StrokeDiagnosisConditionProfile`, representing the *definitive diagnosis* of the index stroke event for the linked encounter.\n\n**Scope**\n- Ischemic stroke\n- Intracerebral/cerebral hemorrhage\n- Subarachnoid hemorrhage\n- Cerebral venous thrombosis\n- Transient ischemic attack (TIA)\n- “Undetermined” qualifier (use cautiously; see notes)\n\n**Modeling notes**\n- This ValueSet is intended for definitive diagnoses (e.g., at discharge or after diagnostic workup), not “rule-out”, screening, history-of, or procedural concepts.\n- Terminology expansion should be performed against the appropriate SNOMED CT edition/version and preferred language(s). Localizations MAY add designations without changing meaning.\n- If “undetermined” is used, consider adding supporting narrative in `Condition.note` and/or linking evidence in Observations/DiagnosticReports to preserve interpretability.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/stroke-discharge-destination-cs"
      },
      "name" : "Stroke Discharge Destination CodeSystem",
      "description" : "Local CodeSystem for discharge disposition values that are not sufficiently covered (or not consistently available)\nin the chosen standard terminology set.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/stroke-discharge-destination-vs"
      },
      "name" : "Stroke Discharge Destination ValueSet",
      "description" : "ValueSet defining allowable discharge dispositions for the stroke encounter.\n\n**Primary use-case**\n- Required binding to `Encounter.admission.dischargeDisposition` in `StrokeEncounterProfile`.\n\n**Composition**\n- SNOMED CT “discharge/transfer” procedure concepts for common destinations.\n- Local supplement (StrokeDischargeDestinationCS) for outcomes such as “deceased during stay”.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-encounter-profile"
      },
      "name" : "Stroke Encounter Profile",
      "description" : "Profile for an Encounter representing a patient's **inpatient admission and hospital stay** for an index stroke event.\n\n**Primary use-case**\n- Acts as the episode anchor that Conditions, Observations, and Procedures reference via `encounter`, enabling consistent episode-level analytics.\n\n**Captures**\n- `status`: lifecycle state of the encounter (required).\n- `class`: fixed to inpatient (IMP) to represent an admission.\n- `actualPeriod`: start/end of the admission (required; end is required for completed stays).\n- `admission.admitSource`: arrival mode/origin (required binding to StrokeArrivalModeVS when present).\n- `admission.dischargeDisposition`: discharge destination (required binding to StrokeDischargeDestinationVS).\n- Episode-level extensions for operational/registry attributes:\n  - first hospital indicator,\n  - initial care intensity,\n  - required post-acute care flag,\n  - discharge department/service.\n\n**Typical scenarios**\n1) Direct admission via EMS from home: admitSource=EMS-from-home, isFirstHospital=true.\n2) Transfer-in: admitSource=another-hospital or stroke-center, isFirstHospital=false.\n3) Discharge home vs rehab vs death: dischargeDisposition captures destination/outcome; dischargeDepartmentService can capture service.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/stroke-etiology-cs"
      },
      "name" : "Stroke Etiology CodeSystem",
      "description" : "Local CodeSystem defining categories for **ischemic stroke etiology** classification.\n\n**Primary use-case**\n- Used via `StrokeEtiologyVS` as the required vocabulary for `StrokeStrokeEtiologyExt.valueCodeableConcept`\n  on a definitive ischemic stroke Condition.\n\n**Why it exists**\n- Stroke etiology classification often mixes internationally standard categories (cardioembolic, lacunar, cryptogenic) with local operational buckets.\n\n**Modeling notes**\n- This CodeSystem is intended for “final etiology classification” after diagnostic workup, not for provisional hypotheses.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/stroke-etiology-vs"
      },
      "name" : "Stroke Etiology ValueSet",
      "description" : "This ValueSet defines allowable values for recording the **determined ischemic stroke etiology**.\n\n**Primary use-case**\n- Required binding for `StrokeStrokeEtiologyExt.valueCodeableConcept` on definitive ischemic stroke Conditions.\n\n**Composition**\n- Local etiology categories (StrokeEtiologyCS), plus selected SNOMED CT disorder concepts for commonly used etiology groupings.\n\n**Implementation guidance**\n- Use after etiologic workup when a classification is assigned.\n- If etiology remains unknown/undetermined, use the included `Undetermined (qualifier value)`",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/functional-score-codes-vs"
      },
      "name" : "Stroke Functional Score Codes ValueSet",
      "description" : "This ValueSet constrains `Observation.code` for functional outcome and severity instruments represented in this guide:\n- Modified Rankin Scale score (mRS)\n- NIH Stroke Scale total score (NIHSS)\n\n**Primary use-case**\n- Bind to `Observation.code` in `FunctionalScoreObservationProfile`.\n\n**Datatype expectations enforced via invariants**\n- mRS: `Observation.valueCodeableConcept` bound to MRsScoreVS (ordinal categories 0–6).\n- NIHSS: `Observation.valueInteger` as total NIHSS score.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/functional-score-observation-profile"
      },
      "name" : "Stroke Functional Score Observation Profile",
      "description" : "Profile for recording stroke functional outcome and severity scores (currently mRS and NIHSS) in an interoperable, context-aware way.\n\n**Primary use-case**\n- Capture outcomes by phase (baseline, admission, discharge, ~90-day follow-up) using a required timing context extension.\n\n**Key constraints**\n- `Observation.code` is bound to FunctionalScoreCodesVS (mRS or NIHSS).\n- `extension[timingContext]` is mandatory to label the clinical phase.\n- Datatype and binding rules are enforced via invariants:\n  - mRS → `valueCodeableConcept` bound to MRsScoreVS.\n  - NIHSS → `valueInteger` as total NIHSS score.\n\n**Typical scenarios**\n1) An mRS score assessed at discharge would have `Observation.code` = mRS code, `valueCodeableConcept` = mRS grade (0–6), and the timing context extension value = discharge.\n2) An NIHSS score assessed at admission would have `Observation.code` = NIHSS code, `valueInteger` = total NIHSS score, and the timing context extension value = admission.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/stroke-proc-not-done-reason-vs"
      },
      "name" : "Stroke Procedure Not Done Reason ValueSet",
      "description" : "ValueSet containing the controlled vocabulary of reasons for `Procedure.statusReason` when a stroke procedure is `not-done`.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/stroke-proc-not-done-reason-cs"
      },
      "name" : "Stroke Procedure Not Done Reasons CodeSystem",
      "description" : " Local CodeSystem enumerating standardized reasons why a key stroke procedure (e.g., IV thrombolysis or mechanical thrombectomy) was **not performed**.\n\n**Primary use-case**\n- Populate `Procedure.statusReason` when `Procedure.status = not-done`.\n\n**Why it matters**\n- Captures the difference between:\n  - clinical ineligibility (contraindication),\n  - time-based ineligibility (outside window),\n  - operational constraints (unavailable),\n  - patient choice (refusal),\n  - care pathway differences (performed elsewhere / transfer).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-registry-organization-profile"
      },
      "name" : "Stroke Registry Organization Profile",
      "description" : "Organization profile ensuring an active organization with a registry identifier (system=https://stroke.qualityregistry.org) and a required name, aligned with the build_organization() transformation.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-risk-factor-condition-profile"
      },
      "name" : "Stroke Risk Factor Condition Profile",
      "description" : "Profile for **pre-existing or concurrent conditions** that increase stroke risk (e.g., AF/flutter, diabetes, hypertension, coronary disease).\n\n**Key constraints**\n- `Condition.category` is fixed to `problem-list-item` to indicate a problem list entry.\n- `Condition.code` is required and bound (required) to StrokeRiskFactorVS.\n- `Condition.onset[x]` and `Condition.recordedDate` are marked Must Support to enable chronology and longitudinal tracking.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/stroke-risk-factor-vs"
      },
      "name" : "Stroke Risk Factor ValueSet",
      "description" : "This ValueSet enumerates SNOMED CT disorder concepts representing **pre-existing or concurrent conditions** that increase stroke risk.\n\n**Primary use-case**\n- Required binding to `Condition.code` in `StrokeRiskFactorConditionProfile`, used to maintain a structured problem list supporting:\n  - etiologic reasoning (e.g., cardioembolic risk),\n  - clinical decision support (e.g., anticoagulation considerations),\n  - quality reporting and research cohort definition.\n\n**Modeling notes**\n- This ValueSet is for *previously documented conditions* (problems), not for “risk factor unknown”.\n  If a risk factor assessment is unknown/not assessed, represent that as an Observation (status/result) or use `dataAbsentReason` patterns rather than a Condition with an “Unknown” code.\n- The acute stroke event itself should be represented by `StrokeDiagnosisConditionProfile`, not by this risk factor profile.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-swallow-procedure-profile"
      },
      "name" : "Stroke Swallow Procedure Profile",
      "description" : " Profile for documenting **swallow screening / dysphagia assessment** during a stroke episode.\n\n**Captures**\n- `code`: the screening/assessment procedure or tool used (SwallowProceduresVS).\n- `status`: whether completed or not done.\n- `statusReason`: controlled reason set when not done.\n- `extension[screeningTimingCategory]`: timing bucket (e.g., within 4h).\n- `extension[timingContext]`: acute/post-acute phase relative to encounter start.\n\n\n** Typical scenarios**\n1) Screening completed on-site: `status=completed`, `extension[screeningTimingCategory]` optional, `extension[timingContext]` optional.\n2) Screening not performed: `status=not-done`, `statusReason` required.\n3) Screening performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `extension[screeningTimingCategory]` optional.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onset-date-ext"
      },
      "name" : "Stroke Symptom Onset Date Extension",
      "description" : "Extension capturing the **calendar date** of symptom onset for the index stroke event.\n\n**Primary use-cases**\n- Compute onset-to-door and onset-to-treatment metrics when combined with encounter/treatment timestamps.\n- Support time-sensitive eligibility pathways when onset is known at least to the day.\n\n**When to use**\n- Use when onset date is known with reasonable confidence.\n- Use alongside `OnsetTimeExt` when time-of-day precision is available.\n- Omit if onset is unknown, only broadly estimated, or not applicable (e.g., certain in-hospital events may use different timing constructs).\n\n**FHIR placement**\n- `Condition.extension[onsetDate].valueDate`",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/onset-time-ext"
      },
      "name" : "Stroke Symptom Onset Time Extension",
      "description" : "Extension capturing the **clock time** of symptom onset for the index stroke event.\n\n**Primary use-cases**\n- Enable precise onset-to-treatment intervals (e.g., onset-to-needle, onset-to-groin puncture).\n- Improve accuracy of eligibility assessments in time-window–dependent interventions.\n\n**When to use**\n- Use when onset time is known with sufficient precision for clinical use.\n- Omit if time is unknown or too uncertain.\n\n**FHIR placement**\n- `Condition.extension[onsetTime].valueTime`\n\n**Implementation note**\n- If `OnsetTimeExt` is present, `OnsetDateExt` should generally also be present (enforced as a warning invariant below).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/stroke-mechanical-procedure-profile"
      },
      "name" : "Stroke Thrombolysis Procedure Profile",
      "description" : "Profile for documenting **stroke reperfusion procedures** as FHIR Procedure:\n- IV thrombolysis (IVT)\n- Mechanical thrombectomy (MT)\n\n**Captures**\n- `code`: restricted to reperfusion procedures (PerforationProceduresVS).\n- `status`: completed/not-done/etc.\n- `statusReason`: controlled reason set when not done.\n- `occurrence[x]` (constrained to Period): start/end time of the intervention when available.\n- `complication`: complications (as CodeableReference to Condition) — constrained by invariants.\n- `extension[timingContext]`: acute/post-acute phase classification.\n\n**Typical scenarios**\n1) Reperfusion performed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional.\n2) Reperfusion not performed: `status=not-done`, `statusReason` required.\n3) Reperfusion performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional.\n4) Reperfusion attempted but complicated by perforation: `status=completed`, `complication` = perforation code, `occurrence[x]` captures timing of the attempt.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/timing-metric-codes-cs"
      },
      "name" : "Stroke Timing Metric Codes CodeSystem",
      "description" : "This CodeSystem defines codes for key **time-interval process metrics** in acute stroke care.\nEach code represents a duration measured between two clinically meaningful events (e.g., arrival to thrombolysis start).\n\n**Primary use-case**\n- Use as `Observation.code` in `TimingMetricObservationProfile`.\n- Store the measured interval in `Observation.valueQuantity` with UCUM minutes (`min`).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/timing-metric-codes-vs"
      },
      "name" : "Stroke Timing Metric Codes ValueSet",
      "description" : "This ValueSet includes all timing metric codes from TimingMetricCodesCS.\n\n**Primary use-case**\n- Required binding for `TimingMetricObservationProfile.code` to ensure only approved metrics are captured.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/timing-metric-observation-profile"
      },
      "name" : "Stroke Timing Metric Observation Profile (R5)",
      "description" : "Profile for recording acute stroke process timing metrics as measured durations (e.g., Door-to-Needle, Door-to-Groin).\n\n**Primary use-case**\n- Quality monitoring and pathway optimization where the interval value is the primary datum.\n\n**Representation**\n- `Observation.code` bound to TimingMetricCodesVS.\n- `Observation.valueQuantity` as UCUM minutes (`min`).\n\n**Typical scenarios**\n1) A Door-to-Needle time of 45 minutes would be represented as an Observation with `code` = D2N code, `valueQuantity` = 45, `valueQuantity.unit` = \"minute\", and the appropriate UCUM system/code.\n2) A Door-to-Groin time of 90 minutes would be represented similarly with `code` = D2G code and `valueQuantity` = 90.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/vital-sign-codes-vs"
      },
      "name" : "Stroke Vital Sign Codes ValueSet",
      "description" : "This ValueSet defines SNOMED CT observable-entity codes for blood pressure components captured as vital signs:\n- Systolic blood pressure\n- Diastolic blood pressure\n\n**Primary use-case**\n- Bind to `Observation.component.code` in a single blood pressure Observation that records both components.\n\n**Implementation guidance**\n- Use `Observation.component.valueQuantity` with UCUM `mm[Hg]`.\n- Repeat the Observation across time with different `effective[x]` timestamps for monitoring.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/vital-sign-observation-profile"
      },
      "name" : "Stroke Vital Sign Observation Profile",
      "description" : "Profile for recording blood pressure vital signs in stroke patients using a single Observation with components.\nThe Observation is categorized as `vital-signs` and uses component entries for systolic and diastolic blood pressure.\n\n**Primary use-case**\n- Record repeated BP measurements across the episode (arrival, post-thrombolysis monitoring, ICU) by creating multiple Observations with different `effective[x]`.\n\n**Representation**\n- `Observation.component.code` bound to VitalSignCodesVS.\n- `Observation.component.valueQuantity` in UCUM mm[Hg].\n\n**Typical scenarios**\n1) One Observation with two components (systolic and diastolic) recorded at the same timepoint.\n2) Multiple Observations over time, each with the same component structure, to track BP trends during acute management and monitoring.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      }],
      "reference" : {
        "reference" : "Procedure/StrokeBrainImagingExample"
      },
      "name" : "StrokeBrainImagingExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-brain-imaging-procedure-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      }],
      "reference" : {
        "reference" : "Procedure/StrokeCarotidImagingExample"
      },
      "name" : "StrokeCarotidImagingExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-carotid-imaging-procedure-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/StrokeCircumstanceObservationExampleWakeUp"
      },
      "name" : "StrokeCircumstanceObservationExampleWakeUp",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-circumstance-observation-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/StrokeDiagnosisConditionAFib"
      },
      "name" : "StrokeDiagnosisConditionAFib",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/StrokeDiagnosisConditionAFlutter"
      },
      "name" : "StrokeDiagnosisConditionAFlutter",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/StrokeDiagnosisConditionExample"
      },
      "name" : "StrokeDiagnosisConditionExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-diagnosis-condition-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Encounter"
      }],
      "reference" : {
        "reference" : "Encounter/StrokeEncounterExample"
      },
      "name" : "StrokeEncounterExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-encounter-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/StrokeRiskFactorConditionExample"
      },
      "name" : "StrokeRiskFactorConditionExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      }],
      "reference" : {
        "reference" : "Procedure/StrokeSwallowingExample"
      },
      "name" : "StrokeSwallowingExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-swallow-procedure-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Procedure"
      }],
      "reference" : {
        "reference" : "Procedure/StrokeThrombolysisExample"
      },
      "name" : "StrokeThrombolysisExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/stroke-mechanical-procedure-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/swallow-procedures-cs"
      },
      "name" : "Swallow Procedures CodeSystem",
      "description" : "Local CodeSystem representing swallowing screening/assessment tools often documented by acronym or local naming.\n\n**FHIR placement**\n- Included in `SwallowProceduresVS` to be used in `Procedure.code`",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/swallow-procedures-vs"
      },
      "name" : "Swallow Procedures ValueSet",
      "description" : "ValueSet enumerating swallowing screening/assessment procedures/tools used in stroke care.\n\n**Implementation note**\n- `SCT#261665006 'Unknown'´ is included only as a provisional development workaround; in production, prefer FHIR `dataAbsentReason` for missing data rather than “Unknown” as a procedure code.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/swallow-screen-time-cs"
      },
      "name" : "Swallowing Screening Timing Category CodeSystem",
      "description" : "Local CodeSystem that categorizes when a swallowing screening occurred relative to stroke onset/admission.\n\n**Primary use-case**\n- Support process metrics such as “screening completed within 4 hours”.\n\n**FHIR placement**\n- Used as a CodeableConcept in a Procedure extension (`SwallowingScreeningTimingCategoryExt`).",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/swallowing-screening-timing-category-ext"
      },
      "name" : "Swallowing Screening Timing Category Extension",
      "description" : " Extension capturing the **timing category** of swallowing screening relative to stroke onset/admission.\n\n**When to use**\n- When you cannot reliably store an exact timestamp (or want an additional categorical indicator even if a timestamp exists).\n\n**How it complements base elements**\n- `Procedure.occurrence[x]` stores the exact time when available.\n- This extension stores a categorical bucket to support standardized reporting.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/swallowing-screening-timing-category-vs"
      },
      "name" : "Swallowing Screening Timing Category ValueSet",
      "description" : "ValueSet defining allowed categories for swallowing screening timing, combining:\n- local categories (e.g., within 4 hours), and\n- SNOMED CT qualifier concepts for post-admission timing.\n\n**Use-case**\n- Required binding for the swallowing timing extension.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/thrombectomy-complication-cs"
      },
      "name" : "Thrombectomy Complication CodeSystem",
      "description" : "Local CodeSystem for complications occurring during mechanical thrombectomy.\n\n**When to use**\n- If you need a controlled internal vocabulary for adverse events/complications, especially when upstream systems do not provide SNOMED-coded diagnoses.\n\n**How it is used in FHIR R5**\n- Usually referenced from `Procedure.complication` which is a `CodeableReference(Condition)` in R5.\n- You may represent the complication as a `Condition` (preferred), and/or record a code directly depending on your implementation pattern.\n\n**Why it exists**\n- Supports minimum-set reporting across sites and enables consistent quality/safety analytics.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/thrombectomy-complication-vs"
      },
      "name" : "Thrombectomy Complications ValueSet",
      "description" : " ValueSet of SNOMED CT concepts representing complications of thrombectomy as clinical conditions.\n\n**Primary use-case**\n- Bind `Procedure.complication` (or the referenced Condition.code) to a SNOMED-based set for interoperability.",
      "isExample" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/TimingMetricObservationExample"
      },
      "name" : "TimingMetricObservationExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/timing-metric-observation-profile"]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      }],
      "reference" : {
        "reference" : "Observation/VitalSignObservationExample"
      },
      "name" : "VitalSignObservationExample",
      "isExample" : true,
      "profile" : ["http://tecnomod-um.org/StructureDefinition/vital-sign-observation-profile"]
    }],
    "page" : {
      "sourceUrl" : "toc.html",
      "name" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "sourceUrl" : "index.html",
        "name" : "index.html",
        "title" : "Index",
        "generation" : "markdown"
      },
      {
        "sourceUrl" : "general-principles.html",
        "name" : "general-principles.html",
        "title" : "General Principles",
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
      }]
    },
    "parameter" : [{
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
    }]
  }
}

```
