# Artifacts Summary - v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Age at Stroke Onset Observation Profile (R5)](StructureDefinition-age-at-onset-observation-profile.md) | Profile specifically for recording the patient's age at stroke onset. The value is represented as an integer (age in years) with a fixed SNOMED CT code indicating that this observation represents age at onset. |
| [Base Profile for Stroke-Related Observations](StructureDefinition-base-stroke-observation.md) | Constraints for observations recorded in the context of stroke care. |
| [Discharge Medication Request Profile](StructureDefinition-discharge-medication-request-profile.md) | Represents a medication prescription made as part of the patient's discharge plan, categorized as community administration. |
| [Patient with SNOMED Gender and Age (extensions)](StructureDefinition-patient-age-gender-snomed-profile.md) | Profile that adds an integer age extension and a SNOMED-based gender extension. |
| [Prior Medication Statement Profile (R5)](StructureDefinition-prior-medication-statement-profile.md) | Represents a statement about the patient's medication use **before** the index event. |
| [Specific Stroke Finding Observation Profile (R5)](StructureDefinition-specific-finding-observation-profile.md) | Profile for specific coded findings like Afib/Flutter status or mTICI score. |
| [Stroke Brain Imaging Procedure Profile (R5)](StructureDefinition-stroke-brain-imaging-procedure-profile.md) | Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context. |
| [Stroke Carotid Imaging Procedure Profile (R5)](StructureDefinition-stroke-carotid-imaging-procedure-profile.md) | Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context. |
| [Stroke Circumstance Observation Profile (R5)](StructureDefinition-stroke-circumstance-observation-profile.md) | Profile for recording findings about stroke onset circumstances (In-hospital, Wake-up). |
| [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md) | Defines a Condition profile constrained to represent the definitive diagnosis of the current stroke event during the indexed encounter. The profile fixes category to encounter-diagnosis, binds code (required) to StrokeDiagnosisVS, and prohibits onset[x] to avoid ambiguity with symptom-onset capture via dedicated extensions. Use this profile for final/confirmed stroke diagnoses recorded at discharge or after diagnostic workup; do not use it for history-of conditions, screening findings, or provisional ‘rule-out’ statements. Optional extensions capture hemorrhagic bleeding reason, ischemic etiology, and structured onset date/time when clinically known. |
| [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md) | Profile for an Encounter resource representing a patient's hospital admission and stay for a stroke event, including key administrative and workflow details. |
| [Stroke Functional Score Observation Profile (R5, Timing Ext)](StructureDefinition-functional-score-observation-profile.md) | Profile for recording functional scores (mRS, NIHSS), using an extension for timing context. |
| [Stroke Registry Organization Profile](StructureDefinition-stroke-registry-organization-profile.md) | Organization profile ensuring an active organization with a registry identifier (system=https://stroke.qualityregistry.org) and a required name, aligned with the build_organization() transformation. |
| [Stroke Risk Factor Condition Profile](StructureDefinition-stroke-risk-factor-condition-profile.md) | Defines a Condition profile for pre-existing or concurrent conditions that increase stroke risk (e.g., atrial fibrillation/flutter, diabetes, hypertension, coronary disease). The profile fixes category to problem-list-item, binds code (required) to StrokeRiskFactorVS, and supports onset[x] and recordedDate to document chronology and longitudinal tracking. Use this profile to maintain the problem list and to support risk assessment and CDS; do not use it to code the acute stroke event itself. |
| [Stroke Swallow Procedure Profile (R5)](StructureDefinition-stroke-swallow-procedure-profile.md) | Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context. |
| [Stroke Thrombolysis Procedure Profile (R5)](StructureDefinition-stroke-mechanical-procedure-profile.md) | Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context. |
| [Stroke Timing Metric Observation Profile (R5)](StructureDefinition-timing-metric-observation-profile.md) | Profile for recording key process timing metrics (D2N, D2G). |
| [Stroke Vital Sign Observation Profile (R5)](StructureDefinition-vital-sign-observation-profile.md) | Profile for recording key vital signs (Systolic/Diastolic BP) in stroke patients. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Discharge Department/Service Extension](StructureDefinition-discharge-department-service-ext.md) | Specifies the type of department or service the patient was discharged or transferred to. |
| [First Hospital Extension](StructureDefinition-first-hospital-ext.md) | Indicates if the reporting hospital was the first medical facility to admit the patient for this stroke episode. |
| [Gender (SNOMED CT)](StructureDefinition-gender-snomed-ext.md) | Patient gender represented with SNOMED CT codes. |
| [Hemorrhagic Stroke – Bleeding Reason](StructureDefinition-hemorrhagic-stroke-bleeding-reason-ext.md) | Captures, as a CodeableConcept bound (required) to HemorrhagicStrokeBleedingReasonVS, the identified cause of intracranial bleeding in hemorrhagic stroke (e.g., aneurysm, vascular malformation, other). Use when coding a definitive hemorrhagic stroke Condition to support analytics and decision support; do not use for non-hemorrhagic etiologies or when the cause is unknown/undetermined. |
| [Initial Care Intensity Extension](StructureDefinition-initial-care-intensity-ext.md) | Specifies the level of care provided during the patient's initial day(s) in the hospital (e.g., standard bed, monitored, ICU/Stroke Unit). |
| [Ischemic Stroke – Etiology](StructureDefinition-ischemic-stroke-etiology-ext.md) | Records the determined ischemic stroke etiology as a CodeableConcept bound (required) to StrokeEtiologyVS (e.g., cardioembolic, large artery atherosclerosis, lacunar, cryptogenic). Apply to definitive ischemic stroke Conditions after diagnostic workup; avoid use for hemorrhagic strokes or provisional hypotheses not yet established. |
| [Observation Timing Context Extension](StructureDefinition-observation-timing-context-ext.md) | Specifies the timing context or phase (e.g., pre-stroke, admission, discharge, 3-month) in which an observation or assessment was made. |
| [Patient Age (integer)](StructureDefinition-patient-age-ext.md) | Patient age in years represented as an integer. |
| [Procedure Timing Context Extension](StructureDefinition-procedure-timing-context-ext.md) | Specifies the timing phase (e.g., acute, post-acute) in which the procedure was performed relative to the start of the encounter. |
| [Required Post-Acute Care Extension](StructureDefinition-required-post-acute-care-ext.md) | Indicates whether the patient required hospitalization beyond 24 hours after the designated acute phase of stroke care for this encounter. |
| [Stroke Onset Date](StructureDefinition-onset-date-ext.md) | Captures the calendar date (value[x] = date) of symptom onset for the indexed stroke event when known, enabling calculation of onset-to-door metrics and adherence to time-sensitive pathways. Use alongside OnsetTimeExt when hour/minute precision is available; omit if onset is unknown or inapplicable. |
| [Stroke Onset Time](StructureDefinition-onset-time-ext.md) | Captures the clock time (value[x] = time) of symptom onset for the indexed stroke event when available, complementing OnsetDateExt to support precise onset-to-treatment intervals. Use local time of the clinical setting; omit if time is unknown or estimated beyond acceptable precision. |
| [Swallowing Screening Timing Category](StructureDefinition-swallowing-screening-timing-category-ext.md) | Temporal category relative to stroke onset in which the swallowing screening was performed. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Admission Sources ValueSet](ValueSet-admission-source-vs.md) | Defines the modes of transport or pathways by which the patient arrived. |
| [Assessment Context ValueSet](ValueSet-assessment-context-vs.md) | ValueSet for assessment context codes (e.g., timing of functional scores). |
| [Atrial Fibrillation or Flutter Status ValueSet](ValueSet-afib-flutter-status-vs.md) | ValueSet defining the allowed coded outcomes for documenting the status of an Atrial Fibrillation (AF) or Atrial Flutter assessment. It is intentionally restricted to SNOMED CT qualifier values to express: (1) known present, (2) known absent, or (3) unknown. The ValueSet supports harmonized recording across systems, improves comparability for clinical decision support and research, and enables consistent reporting in contexts where AF/flutter materially influences thromboembolic risk and subsequent management. |
| [Brain Imaging Modality ValueSet](ValueSet-brain-imaging-modality-vs.md) | Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures. |
| [Carotid Arteries Imaging Modality ValueSet](ValueSet-carotid-imaging-modality-vs.md) | Defines codes for different types of carotid artery imaging. |
| [Discharge Department/Service ValueSet](ValueSet-discharge-dept-vs.md) | ValueSet specifying the type of department or service the patient was discharged or transferred to. |
| [Discharge Destination ValueSet](ValueSet-discharge-destination-vs.md) | Defines possible patient discharge destinations. |
| [Gender (SNOMED CT)](ValueSet-vs-gender-snomed.md) | Value set to represent patient gender using SNOMED CT codes, analogous to AdministrativeGender. |
| [Hemorrhagic Stroke Bleeding Reason ValueSet](ValueSet-hemorrhagic-stroke-bleeding-reason-vs.md) | Specifies the identified cause of a hemorrhagic stroke, typically used with an extension. |
| [Initial Care Intensity ValueSet](ValueSet-initial-care-intensity-vs.md) | ValueSet indicating the level of care provided initially. |
| [MTICI Score ValueSet](ValueSet-mtici-score-vs.md) | ValueSet containing the codes to represent the MTICI score used to assess the degree of reperfusion after a thrombectomy procedure. |
| [Medications ValueSet](ValueSet-medication-vs.md) | SNOMED CT codes for drug products or substances. |
| [Perforation Procedures ValueSet](ValueSet-perforation-procedures-vs.md) | ValueSet containing SNOMED CT codes representing a range of perforation procedures. |
| [Procedure Timing Context ValueSet](ValueSet-procedure-timing-context-vs.md) | ValueSet for codes defining the timing phase of a procedure relative to the encounter start. |
| [Specific Stroke Finding Codes ValueSet](ValueSet-specific-finding-codes-vs.md) | Codes for specific clinical findings relevant to stroke (Afib/Flutter status, MTICI score). |
| [Specific Stroke Finding Codes ValueSet](ValueSet-stroke-finding-codes-vs.md) | ValueSet for specific coded findings like Afib/Flutter status or mTICI score. |
| [Stroke Arrival Mode ValueSet](ValueSet-stroke-arrival-mode-vs.md) | ValueSet specifying the mode and origin of the patient's arrival. |
| [Stroke Circumstance Codes ValueSet](ValueSet-stroke-circumstance-codes-vs.md) | Codes for findings related to the circumstances of stroke onset (In-hospital, Wake-up). |
| [Stroke Diagnosis ValueSet](ValueSet-stroke-diagnosis-vs.md) | SNOMED CT concepts representing final stroke-related diagnoses intended for use in Condition.code (and similar elements) within this IG. The scope covers ischemic stroke, intracerebral hemorrhage, subarachnoid hemorrhage, cerebral venous thrombosis, and transient ischemic attack (TIA). This value set is designed to support consistent capture, validation, analytics, and decision support. Implementers should expand against a terminology server using the appropriate SNOMED CT edition/version and preferred language(s) for display. Localizations or national derivatives MAY provide additional designations without altering the canonical definition. This value set is not intended for history-of, screening, or procedural concepts. |
| [Stroke Discharge Destination ValueSet](ValueSet-stroke-discharge-destination-vs.md) | Defines the possible destinations of the patient upon discharge from the encounter. |
| [Stroke Etiology ValueSet](ValueSet-stroke-etiology-vs.md) | Specifies the determined etiology of an stroke. |
| [Stroke Functional Score Codes ValueSet](ValueSet-functional-score-codes-vs.md) | Codes for key functional scores used in stroke (mRS, NIHSS). |
| [Stroke Procedure Not Done Reason ValueSet](ValueSet-stroke-proc-not-done-reason-vs.md) | ValueSet containing specific codes to indicate why thrombolysis or thrombectomy was not performed. |
| [Stroke Risk Factor ValueSet](ValueSet-stroke-risk-factor-vs.md) | Defines the SNOMED CT codes for conditions or risk factors relevant to stroke, including an option for unknown status. |
| [Stroke Timing Metric Codes ValueSet](ValueSet-timing-metric-codes-vs.md) | ValueSet for key process timing metrics in acute stroke care (D2N, D2G). |
| [Stroke Vital Sign Codes ValueSet](ValueSet-vital-sign-codes-vs.md) | Codes for key vital signs relevant to stroke assessment (Systolic, Diastolic BP). |
| [Swallow Procedures ValueSet](ValueSet-swallow-procedures-vs.md) | ValueSet containing SNOMED CT codes representing a range of procedures used in the evaluation and management of stroke patients. |
| [Swallowing Screening Timing Category ValueSet](ValueSet-swallowing-screening-timing-category-vs.md) | Temporal categories relative to stroke onset for swallowing screening. |
| [Thrombectomy Complication ValueSet](ValueSet-thrombectomy-complication-vs.md) | Defines the specific complications of thrombectomy to record. |
| [mTICI Score Codes ValueSet](ValueSet-mtici-code-vs.md) | ValueSet containing the codes to represent the mTICI score used to assess the degree of reperfusion after a thrombectomy procedure. |
| [modified Rankin Scale (mRS) Score ValueSet](ValueSet-mrs-score-vs.md) | ValueSet containing the codes for the modified Rankin Scale (mRS) score. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Assessment Context Code System](CodeSystem-assessment-context-cs.md) | Codes defining the context or timing of a clinical assessment, particularly functional scores. |
| [Brain Imaging Type Code System](CodeSystem-brain-imaging-type-cs.md) | Codes specifying the type of brain imaging performed (e.g., CT, MRI). |
| [Discharge Department/Service Code System](CodeSystem-discharge-dept-cs.md) | Code system specifying the type of department or service the patient was discharged or transferred to. |
| [Hemorrhagic Stroke Bleeding Reason Code System](CodeSystem-hemorrhagic-stroke-bleeding-reason-cs.md) | Codes indicating the reason for bleeding in hemorrhagic stroke cases. |
| [Initial Care Intensity Code System](CodeSystem-initial-care-intensity-cs.md) | Codes indicating the level of care provided during the patient's initial day(s) in the hospital. |
| [Initial Care Intensity Code System](CodeSystem-stroke-arrival-mode-cs.md) | Codes indicating the level of care provided during the patient's initial day(s) in the hospital. |
| [MTICI Score Code System](CodeSystem-mtici-score-cs.md) | CodeSystem containing the codes to represent the MTICI score. |
| [Medications CodeSystem](CodeSystem-medication-cs.md) | Codes for drug products or substances representing the Medications on the patient discharge. |
| [Procedure Timing Context Code System](CodeSystem-procedure-timing-context-cs.md) | Codes defining the timing phase of a procedure relative to the encounter start (e.g., acute vs. post-acute). |
| [Stroke Circumstance Codes CodeSystem](CodeSystem-stroke-circumstance-codes-cs.md) | Codes for findings related to the circumstances of stroke onset (In-hospital, Wake-up). |
| [Stroke Discharge Destination Code System](CodeSystem-stroke-discharge-destination-cs.md) | Codes indicating the possible destinations of the patient upon discharge from the encounter. |
| [Stroke Etiology Code System](CodeSystem-stroke-etiology-cs.md) | Codes indicating the etiology of strokes. |
| [Stroke Procedure Not Done Reason Code System](CodeSystem-stroke-proc-not-done-reason-cs.md) | Codes specifying the reason principal for not performing a key stroke procedure (Thrombolysis, Thrombectomy). |
| [Stroke Timing Metric Codes ValueSet](CodeSystem-timing-metric-codes-cs.md) | Codes for key process timing metrics in acute stroke care (D2N, D2G). |
| [Swallow Procedures Code System](CodeSystem-swallow-procedures-cs.md) | Codes representing various swallowing assessment procedures. |
| [Swallowing Screening Timing Category Code System](CodeSystem-swallow-screen-time-cs.md) | Temporal categories relative to stroke onset for swallowing screening. |
| [Thrombectomy Complication Code System](CodeSystem-thrombectomy-complication-cs.md) | Codes specifying the specific complications of thrombectomy to record. |
| [mTICI Score Codes CodeSystem](CodeSystem-mtici-code-cs.md) | Codes representing the mTICI score used to assess the degree of reperfusion after a thrombectomy procedure. |
| [modified Rankin Scale (mRS) Score Code System](CodeSystem-mrs-score-cs.md) | Codes representing the modified Rankin Scale (mRS) score for functional outcome. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [AgeAtOnsetObservationExample](Observation-AgeAtOnsetObservationExample.md) |  |
| [DischargeMedicationRequest](MedicationRequest-discharge-medication-request-001.md) |  |
| [Example Stroke Registry Organization](Organization-ExampleStrokeOrganization.md) | Matches build_organization: active=true, name from hospital_name, identifier from mapped_org_id. |
| [FunctionalScoreObservationExample](Observation-FunctionalScoreObservationExample.md) |  |
| [PatientAgeGenderSnomedExample](Patient-PatientAgeGenderSnomedExample.md) |  |
| [PatientExample](Patient-example-patient.md) |  |
| [PriorMedicationStatementExample](MedicationStatement-PriorMedicationStatementExample.md) |  |
| [SpecificFindingObservationExample](Observation-SpecificFindingObservationExample.md) |  |
| [SpecificFindingObservationExampleMTICI](Observation-SpecificFindingObservationExampleMTICI.md) |  |
| [StrokeBrainImagingExample](Procedure-StrokeBrainImagingExample.md) |  |
| [StrokeCarotidImagingExample](Procedure-StrokeCarotidImagingExample.md) |  |
| [StrokeCircumstanceObservationExampleWakeUp](Observation-StrokeCircumstanceObservationExampleWakeUp.md) |  |
| [StrokeDiagnosisConditionAFib](Condition-StrokeDiagnosisConditionAFib.md) |  |
| [StrokeDiagnosisConditionAFlutter](Condition-StrokeDiagnosisConditionAFlutter.md) |  |
| [StrokeDiagnosisConditionExample](Condition-StrokeDiagnosisConditionExample.md) |  |
| [StrokeEncounterExample](Encounter-StrokeEncounterExample.md) |  |
| [StrokeRiskFactorConditionExample](Condition-StrokeRiskFactorConditionExample.md) |  |
| [StrokeSwallowingExample](Procedure-StrokeSwallowingExample.md) |  |
| [StrokeThrombolysisExample](Procedure-StrokeThrombolysisExample.md) |  |
| [TimingMetricObservationExample](Observation-TimingMetricObservationExample.md) |  |
| [VitalSignObservationExample](Observation-VitalSignObservationExample.md) |  |

