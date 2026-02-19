# Artifacts Summary - v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Age at Stroke Onset Observation Profile (R5)](StructureDefinition-age-at-onset-observation-profile.md) | Profile for recording the patient’s age at the time of stroke onset as an integer value in years.**Primary use-case*** Provides a computable attribute commonly used in etiologic assessment, risk stratification, and registry datasets.
**Modeling note*** The age may be derived from DOB and an onset reference (symptom onset, last-known-well, discovery time). This profile records the resulting age value, not the derivation method; capture provenance separately if needed.
 |
| [Base Profile for Stroke-Related Observations](StructureDefinition-base-stroke-observation.md) | Common constraints for Observations captured in the context of stroke care across acute management and follow-up. This base profile establishes a consistent minimum dataset and reference structure so specialized observation profiles behave uniformly.**Key modeling intent*** `Observation.status` is fixed to `final` to represent finalized results suitable for reporting and analytics.
* `Observation.subject` (Patient) and `Observation.encounter` (index stroke encounter) are mandatory for attribution.
* `Observation.partOf` optionally links the Observation to a Procedure (e.g., thrombectomy) when the Observation represents a procedural outcome (e.g., mTICI).
* `Observation.effective[x]` is optional to support cases where only a phase label is known; populate when available for sequencing and analysis.
 |
| [Discharge Medication Request Profile](StructureDefinition-discharge-medication-request-profile.md) | Represents a medication prescription made as part of the patient's discharge plan, categorized as community administration. |
| [Patient with SNOMED Gender and Age (extensions)](StructureDefinition-patient-age-gender-snomed-profile.md) | Profile that adds an integer age extension and a SNOMED-based gender extension. |
| [Prior Medication Statement Profile (R5)](StructureDefinition-prior-medication-statement-profile.md) | Represents a statement about the patient's medication use **before** the index event. |
| [Specific Stroke Finding Observation Profile (R5)](StructureDefinition-specific-finding-observation-profile.md) | Profile for recording discrete, coded stroke-related findings and assessment outcomes that do not fit naturally into vital-sign, functional-score, or timing-metric profiles.**Primary use-cases** 1) AF/flutter assessment status:* `Observation.code` uses a disorder concept as the finding focus (AF/flutter).
* `Observation.valueCodeableConcept` carries status (AfibFlutterStatusVS). 2) Procedural outcome grade (mTICI):
* `Observation.code` uses the mTICI assessment concept (MTICICodeVS).
* `Observation.valueCodeableConcept` carries the score (MticiScoreVS).
**Important modeling note*** This profile does not replace Condition for diagnoses. Use Condition to assert durable diagnoses and link supporting Observations via `hasMember`, `derivedFrom`, or Provenance.
 |
| [Stroke Brain Imaging Procedure Profile](StructureDefinition-stroke-brain-imaging-procedure-profile.md) | Profile for documenting **brain imaging performed during a stroke episode** as a FHIR R5 Procedure.**Captures*** `code`: imaging modality/protocol (required; standardized via BrainImagingModalityVS).
* `status`: procedure state (required).
* `statusReason`: why it was not done (when applicable).
* `occurrence[x]`: when imaging occurred (recommended/required by invariant when done locally).
* `extension[timingContext]`: acute/post-acute phase classification relative to encounter start.
**Typical scenarios** 1) Imaging completed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional. 2) Imaging not performed: `status=not-done`, `statusReason` required. 3) Imaging performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional (may not have exact time). |
| [Stroke Carotid Imaging Procedure Profile](StructureDefinition-stroke-carotid-imaging-procedure-profile.md) | Profile for documenting **carotid angiography** within a stroke episode.**Design intent*** This profile fixes `Procedure.code` to a specific SNOMED code (angiography of carotid artery).
* If you want multiple carotid modalities, replace the fixed code with a required binding to CarotidImagingModalityVS.
**Typical scenarios** 1) Carotid angiography performed: `status=completed`, `occurrence[x]` present, `timingContext` optional. 2) Carotid angiography not performed: `status=not-done`, `statusReason` required. 3) Carotid angiography performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional.**Use-cases*** Determining whether carotid angiography was performed during the episode.
* Capturing structured “not done” reasons for audit and quality improvement.
 |
| [Stroke Circumstance Observation Profile (R5)](StructureDefinition-stroke-circumstance-observation-profile.md) | Profile for documenting clinically relevant circumstances of stroke symptom onset (e.g., wake-up stroke, in-hospital onset).**Primary use-case*** Capture onset circumstance classification for eligibility reasoning, protocol stratification, and reporting when onset time is uncertain.
**Representation*** `Observation.code` bound to StrokeCircumstanceCodesVS.
* Presence of the Observation asserts the circumstance applies to the index stroke event (within the linked Encounter).
**Typical scenarios** 1) A patient who wakes up with stroke symptoms would have an Observation with `code` = wake-up stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is a wake-up stroke. 2) A patient who experiences stroke symptoms while already admitted for another reason would have an Observation with `code` = in-hospital stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is in-hospital onset. |
| [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md) | Defines a Condition profile constrained to represent the definitive diagnosis of the current stroke event during the indexed encounter. The profile fixes category to encounter-diagnosis, binds code (required) to StrokeDiagnosisVS, and prohibits onset[x] to avoid ambiguity with symptom-onset capture via dedicated extensions. Use this profile for final/confirmed stroke diagnoses recorded at discharge or after diagnostic workup; do not use it for history-of conditions, screening findings, or provisional ‘rule-out’ statements. Optional extensions capture hemorrhagic bleeding reason, ischemic etiology, and structured onset date/time when clinically known. |
| [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md) | Profile for an Encounter resource representing a patient's hospital admission and stay for a stroke event, including key administrative and workflow details. |
| [Stroke Functional Score Observation Profile](StructureDefinition-functional-score-observation-profile.md) | Profile for recording stroke functional outcome and severity scores (currently mRS and NIHSS) in an interoperable, context-aware way.**Primary use-case*** Capture outcomes by phase (baseline, admission, discharge, ~90-day follow-up) using a required timing context extension.
**Key constraints*** `Observation.code` is bound to FunctionalScoreCodesVS (mRS or NIHSS).
* `extension[timingContext]` is mandatory to label the clinical phase.
* Datatype and binding rules are enforced via invariants: 
* mRS → `valueCodeableConcept` bound to MRsScoreVS.
* NIHSS → `valueInteger` as total NIHSS score.
 
**Typical scenarios** 1) An mRS score assessed at discharge would have `Observation.code` = mRS code, `valueCodeableConcept` = mRS grade (0–6), and the timing context extension value = discharge. 2) An NIHSS score assessed at admission would have `Observation.code` = NIHSS code, `valueInteger` = total NIHSS score, and the timing context extension value = admission. |
| [Stroke Registry Organization Profile](StructureDefinition-stroke-registry-organization-profile.md) | Organization profile ensuring an active organization with a registry identifier (system=https://stroke.qualityregistry.org) and a required name, aligned with the build_organization() transformation. |
| [Stroke Risk Factor Condition Profile](StructureDefinition-stroke-risk-factor-condition-profile.md) | Defines a Condition profile for pre-existing or concurrent conditions that increase stroke risk (e.g., atrial fibrillation/flutter, diabetes, hypertension, coronary disease). The profile fixes category to problem-list-item, binds code (required) to StrokeRiskFactorVS, and supports onset[x] and recordedDate to document chronology and longitudinal tracking. Use this profile to maintain the problem list and to support risk assessment and CDS; do not use it to code the acute stroke event itself. |
| [Stroke Swallow Procedure Profile](StructureDefinition-stroke-swallow-procedure-profile.md) | Profile for documenting **swallow screening / dysphagia assessment** during a stroke episode.**Captures*** `code`: the screening/assessment procedure or tool used (SwallowProceduresVS).
* `status`: whether completed or not done.
* `statusReason`: controlled reason set when not done.
* `extension[screeningTimingCategory]`: timing bucket (e.g., within 4h).
* `extension[timingContext]`: acute/post-acute phase relative to encounter start.
** Typical scenarios** 1) Screening completed on-site: `status=completed`, `extension[screeningTimingCategory]` optional, `extension[timingContext]` optional. 2) Screening not performed: `status=not-done`, `statusReason` required. 3) Screening performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `extension[screeningTimingCategory]` optional. |
| [Stroke Thrombolysis Procedure Profile](StructureDefinition-stroke-mechanical-procedure-profile.md) | Profile for documenting **stroke reperfusion procedures** as FHIR Procedure:* IV thrombolysis (IVT)
* Mechanical thrombectomy (MT)
**Captures*** `code`: restricted to reperfusion procedures (PerforationProceduresVS).
* `status`: completed/not-done/etc.
* `statusReason`: controlled reason set when not done.
* `occurrence[x]` (constrained to Period): start/end time of the intervention when available.
* `complication`: complications (as CodeableReference to Condition) — constrained by invariants.
* `extension[timingContext]`: acute/post-acute phase classification.
**Typical scenarios** 1) Reperfusion performed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional. 2) Reperfusion not performed: `status=not-done`, `statusReason` required. 3) Reperfusion performed elsewhere: `status=not-done`, `statusReason` = performedElsewhere, `occurrence[x]` optional. 4) Reperfusion attempted but complicated by perforation: `status=completed`, `complication` = perforation code, `occurrence[x]` captures timing of the attempt. |
| [Stroke Timing Metric Observation Profile (R5)](StructureDefinition-timing-metric-observation-profile.md) | Profile for recording acute stroke process timing metrics as measured durations (e.g., Door-to-Needle, Door-to-Groin).**Primary use-case*** Quality monitoring and pathway optimization where the interval value is the primary datum.
**Representation*** `Observation.code` bound to TimingMetricCodesVS.
* `Observation.valueQuantity` as UCUM minutes (`min`).
**Typical scenarios** 1) A Door-to-Needle time of 45 minutes would be represented as an Observation with `code` = D2N code, `valueQuantity` = 45, `valueQuantity.unit` = "minute", and the appropriate UCUM system/code. 2) A Door-to-Groin time of 90 minutes would be represented similarly with `code` = D2G code and `valueQuantity` = 90. |
| [Stroke Vital Sign Observation Profile](StructureDefinition-vital-sign-observation-profile.md) | Profile for recording blood pressure vital signs in stroke patients using a single Observation with components. The Observation is categorized as `vital-signs` and uses component entries for systolic and diastolic blood pressure.**Primary use-case*** Record repeated BP measurements across the episode (arrival, post-thrombolysis monitoring, ICU) by creating multiple Observations with different `effective[x]`.
**Representation*** `Observation.component.code` bound to VitalSignCodesVS.
* `Observation.component.valueQuantity` in UCUM mm[Hg].
**Typical scenarios** 1) One Observation with two components (systolic and diastolic) recorded at the same timepoint. 2) Multiple Observations over time, each with the same component structure, to track BP trends during acute management and monitoring. |

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
| [Observation Timing Context Extension](StructureDefinition-observation-timing-context-ext.md) | This extension captures the **clinical timing context (phase)** in which an observation or assessment was made (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up).**Primary use-case*** Required for functional outcomes and severity scores whose interpretation depends on **when** the score was assessed.
**How it complements Observation.effective[x]*** `effective[x]` records the actual measurement date/time (when known),
* This extension records the standardized phase label used for reporting and cross-site comparability.
**Binding*** `valueCodeableConcept` is bound (required) to AssessmentContextVS.
 |
| [Patient Age (integer)](StructureDefinition-patient-age-ext.md) | Patient age in years represented as an integer. |
| [Procedure Timing Context Extension](StructureDefinition-procedure-timing-context-ext.md) | Extension classifying the procedure into a **timing context** relative to encounter start (acute/post-acute).**Primary use-case*** Operational reporting where “phase of care” is needed for compliance measures.
**When to use*** When you want a stable, comparable phase label across sites (even if absolute times differ or onset time is uncertain).
**Interpretation guidance*** Use `acute` for procedures within 24 hours of encounter start.
* Use `post-acute` for procedures after 24 hours.
* Use `unknown` when encounter/timing data are insufficient.
 |
| [Required Post-Acute Care Extension](StructureDefinition-required-post-acute-care-ext.md) | Indicates whether the patient required hospitalization beyond 24 hours after the designated acute phase of stroke care for this encounter. |
| [Stroke Onset Date](StructureDefinition-onset-date-ext.md) | Captures the calendar date (value[x] = date) of symptom onset for the indexed stroke event when known, enabling calculation of onset-to-door metrics and adherence to time-sensitive pathways. Use alongside OnsetTimeExt when hour/minute precision is available; omit if onset is unknown or inapplicable. |
| [Stroke Onset Time](StructureDefinition-onset-time-ext.md) | Captures the clock time (value[x] = time) of symptom onset for the indexed stroke event when available, complementing OnsetDateExt to support precise onset-to-treatment intervals. Use local time of the clinical setting; omit if time is unknown or estimated beyond acceptable precision. |
| [Swallowing Screening Timing Category](StructureDefinition-swallowing-screening-timing-category-ext.md) | Temporal category relative to stroke onset in which the swallowing screening was performed. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Admission Sources ValueSet](ValueSet-admission-source-vs.md) | Defines the modes of transport or pathways by which the patient arrived. |
| [Assessment Context ValueSet](ValueSet-assessment-context-vs.md) | This ValueSet includes all phase/context codes from AssessmentContextCS.**Primary use-case*** Required binding for elements that must indicate the clinical phase of an assessment (e.g., timing context extensions).
 |
| [Atrial Fibrillation / Flutter Assessment Status ValueSet](ValueSet-afib-flutter-status-vs.md) | This ValueSet constrains the allowable coded outcomes for documenting the **status of an AF/flutter assessment** within the stroke workflow.**Primary use-case*** Bind to `Observation.valueCodeableConcept` in the `SpecificFindingObservationProfile` when `Observation.code` refers to AF/flutter as a finding focus.
* Enables harmonized interpretation for analytics and decision support (e.g., anticoagulation pathway triggers) without forcing a Condition assertion.
**Scope and modeling notes*** This ValueSet expresses **assessment outcome/status** (detected/known/absent/not screened/unknown).
* It does not replace Condition for diagnoses. When AF/flutter is confirmed as a diagnosis, represent it as a `Condition` with the appropriate SNOMED CT disorder code.
 |
| [Brain Imaging Modality ValueSet](ValueSet-brain-imaging-modality-vs.md) | Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures. |
| [Carotid Arteries Imaging Modality ValueSet](ValueSet-carotid-imaging-modality-vs.md) | This ValueSet enumerates standardized codes (primarily SNOMED CT procedures) representing **carotid imaging modalities** used in stroke workflows.**Primary use-case*** Bind to `Procedure.code` when recording a carotid imaging study performed during the stroke episode.
 |
| [Discharge Department/Service ValueSet](ValueSet-discharge-dept-vs.md) | ValueSet specifying the type of department or service the patient was discharged or transferred to. |
| [Discharge Destination ValueSet](ValueSet-discharge-destination-vs.md) | Defines possible patient discharge destinations. |
| [Gender (SNOMED CT)](ValueSet-vs-gender-snomed.md) | Value set to represent patient gender using SNOMED CT codes, analogous to AdministrativeGender. |
| [Hemorrhagic Stroke Bleeding Reason ValueSet](ValueSet-hemorrhagic-stroke-bleeding-reason-vs.md) | Specifies the identified cause of a hemorrhagic stroke, typically used with an extension. |
| [Initial Care Intensity ValueSet](ValueSet-initial-care-intensity-vs.md) | ValueSet indicating the level of care provided initially. |
| [Medications ValueSet](ValueSet-medication-vs.md) | SNOMED CT codes for drug products or substances. |
| [Modified Rankin Scale (mRS) Score ValueSet](ValueSet-mrs-score-vs.md) | This ValueSet includes all mRS grades (0–6) defined in MRsScoreCS.**Primary use-case*** Bind to `Observation.valueCodeableConcept` when `Observation.code` indicates the Observation represents an mRS score.
 |
| [Modified Thrombolysis in Cerebral Infarction Assessment ValueSet](ValueSet-mtici-code-vs.md) | This ValueSet includes the mTICI assessment concept code(s) from MTICICodeCS.**Primary use-case*** Bind to `Observation.code` when recording an mTICI reperfusion grade Observation.
* Pair with `Observation.valueCodeableConcept` bound to MticiScoreVS.
 |
| [Modified Treatment in Cerebral Infarction Grade Score ValueSet](ValueSet-mtici-score-vs.md) | This ValueSet enumerates all allowable Modified Treatment in Cerebral Infarction reperfusion grade values (0, 1, 2a, 2b, 2c, 3) from MticiScoreCS.**Primary use-case*** Required binding to `Observation.valueCodeableConcept` when an Observation represents an mTICI grade outcome.
**Why a dedicated ValueSet*** Ensures consistent coding across implementations and sites.
* Enables reliable registry reporting, audit/quality measurement, and research analytics.
 |
| [Perforation Procedures ValueSet](ValueSet-perforation-procedures-vs.md) | ValueSet restricting Procedure codes to stroke **reperfusion interventions**:* IV thrombolysis (IVT)
* Mechanical thrombectomy (MT)
 |
| [Procedure Timing Context ValueSet](ValueSet-procedure-timing-context-vs.md) | ValueSet limiting allowed values for the Procedure timing context extension (acute/post-acute/unknown).**Use-case*** Required binding to ensure comparable phase classification across systems and sites.
 |
| [Specific Stroke Finding Codes ValueSet](ValueSet-specific-finding-codes-vs.md) | This ValueSet provides SNOMED CT disorder concepts for specific findings referenced in the stroke workup. Currently includes:* Atrial fibrillation (disorder)
* Atrial flutter (disorder)
**Primary use-case*** Constrain `Observation.code` (as a **finding focus**) when using `SpecificFindingObservationProfile`.
**Important modeling note*** Using a disorder concept in `Observation.code` here does not necessarily assert a diagnosis; the diagnosis should be modeled as a Condition.
* The Observation can be interpreted as “assessment about this finding,” with the result in `Observation.valueCodeableConcept` (e.g., AF status).
 |
| [Specific Stroke Finding Codes ValueSet](ValueSet-stroke-finding-codes-vs.md) | This ValueSet aggregates coded Observation.code concepts used by `SpecificFindingObservationProfile`.It currently includes:* Specific disorder concepts used as a finding focus (SpecificFindingCodesVS), and
* The mTICI assessment concept (MTICICodeVS).
**How to interpret usage*** If `Observation.code` is a disorder concept (e.g., AF), the Observation should be interpreted as an assessment about that finding, with the result/status carried in `Observation.valueCodeableConcept` (e.g., AfibFlutterStatusVS).
* If `Observation.code` is an assessment concept (e.g., mTICI), `Observation.valueCodeableConcept` carries the score (MticiScoreVS).
 |
| [Stroke Arrival Mode ValueSet](ValueSet-stroke-arrival-mode-vs.md) | ValueSet specifying the mode and origin of the patient's arrival. |
| [Stroke Circumstance Codes ValueSet](ValueSet-stroke-circumstance-codes-vs.md) | This ValueSet includes all onset-circumstance codes from StrokeCircumstanceCodesCS.**Primary use-case*** Required binding for `StrokeCircumstanceObservationProfile.code`.
 |
| [Stroke Diagnosis ValueSet](ValueSet-stroke-diagnosis-vs.md) | SNOMED CT concepts representing final stroke-related diagnoses intended for use in Condition.code (and similar elements) within this IG. The scope covers ischemic stroke, intracerebral hemorrhage, subarachnoid hemorrhage, cerebral venous thrombosis, and transient ischemic attack (TIA). This value set is designed to support consistent capture, validation, analytics, and decision support. Implementers should expand against a terminology server using the appropriate SNOMED CT edition/version and preferred language(s) for display. Localizations or national derivatives MAY provide additional designations without altering the canonical definition. This value set is not intended for history-of, screening, or procedural concepts. |
| [Stroke Discharge Destination ValueSet](ValueSet-stroke-discharge-destination-vs.md) | Defines the possible destinations of the patient upon discharge from the encounter. |
| [Stroke Etiology ValueSet](ValueSet-stroke-etiology-vs.md) | Specifies the determined etiology of an stroke. |
| [Stroke Functional Score Codes ValueSet](ValueSet-functional-score-codes-vs.md) | This ValueSet constrains `Observation.code` for functional outcome and severity instruments represented in this guide:* Modified Rankin Scale score (mRS)
* NIH Stroke Scale total score (NIHSS)
**Primary use-case*** Bind to `Observation.code` in `FunctionalScoreObservationProfile`.
**Datatype expectations enforced via invariants*** mRS: `Observation.valueCodeableConcept` bound to MRsScoreVS (ordinal categories 0–6).
* NIHSS: `Observation.valueInteger` as total NIHSS score.
 |
| [Stroke Procedure Not Done Reason ValueSet](ValueSet-stroke-proc-not-done-reason-vs.md) | ValueSet containing the controlled vocabulary of reasons for `Procedure.statusReason` when a stroke procedure is `not-done`. |
| [Stroke Risk Factor ValueSet](ValueSet-stroke-risk-factor-vs.md) | Defines the SNOMED CT codes for conditions or risk factors relevant to stroke, including an option for unknown status. |
| [Stroke Timing Metric Codes ValueSet](ValueSet-timing-metric-codes-vs.md) | This ValueSet includes all timing metric codes from TimingMetricCodesCS.**Primary use-case*** Required binding for `TimingMetricObservationProfile.code` to ensure only approved metrics are captured.
 |
| [Stroke Vital Sign Codes ValueSet](ValueSet-vital-sign-codes-vs.md) | This ValueSet defines SNOMED CT observable-entity codes for blood pressure components captured as vital signs:* Systolic blood pressure
* Diastolic blood pressure
**Primary use-case*** Bind to `Observation.component.code` in a single blood pressure Observation that records both components.
**Implementation guidance*** Use `Observation.component.valueQuantity` with UCUM `mm[Hg]`.
* Repeat the Observation across time with different `effective[x]` timestamps for monitoring.
 |
| [Swallow Procedures ValueSet](ValueSet-swallow-procedures-vs.md) | ValueSet enumerating swallowing screening/assessment procedures/tools used in stroke care.**Implementation note*** `SCT#261665006 'Unknown'´ is included only as a provisional development workaround; in production, prefer FHIR `dataAbsentReason` for missing data rather than “Unknown” as a procedure code.
 |
| [Swallowing Screening Timing Category ValueSet](ValueSet-swallowing-screening-timing-category-vs.md) | ValueSet defining allowed categories for swallowing screening timing, combining:* local categories (e.g., within 4 hours), and
* SNOMED CT qualifier concepts for post-admission timing.
**Use-case*** Required binding for the swallowing timing extension.
 |
| [Thrombectomy Complications ValueSet](ValueSet-thrombectomy-complication-vs.md) | ValueSet of SNOMED CT concepts representing complications of thrombectomy as clinical conditions.**Primary use-case*** Bind `Procedure.complication` (or the referenced Condition.code) to a SNOMED-based set for interoperability.
 |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Assessment Context Code System](CodeSystem-assessment-context-cs.md) | This CodeSystem defines normalized codes for the **clinical context / relative timepoint** at which a stroke-related assessment is performed. It is primarily used to contextualize instruments whose interpretation depends on phase (e.g., mRS/NIHSS at baseline vs discharge vs follow-up).**Primary use-case*** Use as the value in `ObservationTimingContextExtension.valueCodeableConcept` to label the phase of an assessment.
**How it complements effective[x]*** `Observation.effective[x]` records the actual date/time (when known).
* This CodeSystem records the standardized phase label used for reporting and comparability.
**Why this is needed*** Many workflows report outcomes by phase even when the exact timestamp is unknown or operationally variable (“mRS at 90 days”).
 |
| [Brain Imaging Type Code System](CodeSystem-brain-imaging-type-cs.md) | Codes specifying the type of brain imaging performed (e.g., CT, MRI). |
| [Discharge Department/Service Code System](CodeSystem-discharge-dept-cs.md) | Code system specifying the type of department or service the patient was discharged or transferred to. |
| [Hemorrhagic Stroke Bleeding Reason Code System](CodeSystem-hemorrhagic-stroke-bleeding-reason-cs.md) | Codes indicating the reason for bleeding in hemorrhagic stroke cases. |
| [Initial Care Intensity Code System](CodeSystem-initial-care-intensity-cs.md) | Codes indicating the level of care provided during the patient's initial day(s) in the hospital. |
| [Initial Care Intensity Code System](CodeSystem-stroke-arrival-mode-cs.md) | Codes indicating the level of care provided during the patient's initial day(s) in the hospital. |
| [Medications CodeSystem](CodeSystem-medication-cs.md) | Codes for drug products or substances representing the Medications on the patient discharge. |
| [Modified Rankin Scale Score Code System](CodeSystem-mrs-score-cs.md) | This CodeSystem defines codes for the **modified Rankin Scale (mRS)**, an ordinal measure of global disability and functional outcome. Scores range from 0 (no symptoms) to 5 (severe disability), with 6 indicating death.**Primary use-case*** Use as the coded result in `Observation.valueCodeableConcept` (bound via MRsScoreVS) when recording an mRS outcome.
**Modeling notes*** mRS is a global disability scale and does not capture domain-specific limitations (mobility, ADLs, cognition). Capture those via additional instruments/Observations when needed.
* Method of ascertainment and assessor details should be recorded separately (e.g., Observation.method, performer, Provenance).
 |
| [Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem](CodeSystem-mtici-code-cs.md) | This CodeSystem defines the **assessment concept code** used to indicate that an Observation is reporting an mTICI reperfusion grade.**Design pattern*** `Observation.code` identifies the kind of assessment (“mTICI reperfusion grade”).
* `Observation.valueCodeableConcept` carries the result (one of the grades in MticiScoreVS).
 |
| [Modified Treatment in Cerebral Infarction Grade Score CodeSystem](CodeSystem-mtici-score-cs.md) | This CodeSystem defines the **modified Thrombolysis in Cerebral Infarction (mTICI)** reperfusion grade values. mTICI is an ordinal angiographic scale used to quantify the extent of reperfusion after endovascular therapy for acute ischemic stroke.**Primary use-case*** Use as the coded result in `Observation.valueCodeableConcept` (bound via MticiScoreVS) when recording the **final angiographic reperfusion grade**.
**Modeling notes*** Represents the **final** reperfusion grade for the downstream ischemic territory (typically adjudicated from the final angiographic run).
* Does not encode target vessel, device/technique, number of passes, timestamps, or adjudication workflow; capture those via Procedure, ImagingStudy, Observation.method, or additional Observations/Provenance.
 |
| [Procedure Timing Context CodeSystem](CodeSystem-procedure-timing-context-cs.md) | Local CodeSystem for classifying a procedure into a **timing context** relative to encounter start.**Primary use-case*** Normalize reporting into acute (<24h) vs post-acute (>=24h) phases for stroke process measures.
**FHIR placement*** Used in `ProcedureTimingContextExtension` attached to Procedure.
 |
| [Stroke Circumstance Codes CodeSystem](CodeSystem-stroke-circumstance-codes-cs.md) | This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant when onset time is unknown or atypical.**Primary use-case*** Use as `Observation.code` in `StrokeCircumstanceObservationProfile`.
* Presence of the Observation asserts that the circumstance applies to the index stroke event.
 |
| [Stroke Discharge Destination Code System](CodeSystem-stroke-discharge-destination-cs.md) | Codes indicating the possible destinations of the patient upon discharge from the encounter. |
| [Stroke Etiology Code System](CodeSystem-stroke-etiology-cs.md) | Codes indicating the etiology of strokes. |
| [Stroke Procedure Not Done Reasons CodeSystem](CodeSystem-stroke-proc-not-done-reason-cs.md) | Local CodeSystem enumerating standardized reasons why a key stroke procedure (e.g., IV thrombolysis or mechanical thrombectomy) was **not performed**.**Primary use-case*** Populate `Procedure.statusReason` when `Procedure.status = not-done`.
**Why it matters*** Captures the difference between: 
* clinical ineligibility (contraindication),
* time-based ineligibility (outside window),
* operational constraints (unavailable),
* patient choice (refusal),
* care pathway differences (performed elsewhere / transfer).
 
 |
| [Stroke Timing Metric Codes CodeSystem](CodeSystem-timing-metric-codes-cs.md) | This CodeSystem defines codes for key **time-interval process metrics** in acute stroke care. Each code represents a duration measured between two clinically meaningful events (e.g., arrival to thrombolysis start).**Primary use-case*** Use as `Observation.code` in `TimingMetricObservationProfile`.
* Store the measured interval in `Observation.valueQuantity` with UCUM minutes (`min`).
 |
| [Swallow Procedures CodeSystem](CodeSystem-swallow-procedures-cs.md) | Local CodeSystem representing swallowing screening/assessment tools often documented by acronym or local naming.**FHIR placement*** Included in `SwallowProceduresVS` to be used in `Procedure.code`
 |
| [Swallowing Screening Timing Category Code System](CodeSystem-swallow-screen-time-cs.md) | Temporal categories relative to stroke onset for swallowing screening. |
| [Thrombectomy Complication CodeSystem](CodeSystem-thrombectomy-complication-cs.md) | Local CodeSystem for complications occurring during mechanical thrombectomy.**When to use*** If you need a controlled internal vocabulary for adverse events/complications, especially when upstream systems do not provide SNOMED-coded diagnoses.
**How it is used in FHIR R5*** Usually referenced from `Procedure.complication` which is a `CodeableReference(Condition)` in R5.
* You may represent the complication as a `Condition` (preferred), and/or record a code directly depending on your implementation pattern.
**Why it exists*** Supports minimum-set reporting across sites and enables consistent quality/safety analytics.
 |

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

