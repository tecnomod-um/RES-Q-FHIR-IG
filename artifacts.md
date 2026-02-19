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
| [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md) | Profile representing the **definitive diagnosis of the current/index stroke event** during the linked encounter.**Primary use-case*** Use for final/confirmed stroke diagnoses recorded during the index hospitalization/encounter (e.g., at discharge or after diagnostic workup).
**Key constraints*** `Condition.category` is fixed to `encounter-diagnosis` to indicate this is the encounter’s diagnosis, not a general problem list item.
* `Condition.code` is required and bound (required) to StrokeDiagnosisVS.
* `Condition.onset[x]` is prohibited to avoid ambiguity: symptom onset is captured using dedicated onset extensions (date/time).
**Supported structured enrichments*** `extension[bleedingReason]`: for hemorrhagic stroke bleeding cause (aneurysm, malformation, other/undetermined).
* `extension[ischemicEtiology]`: for ischemic stroke etiology classification.
* `extension[onsetDate]` and `extension[onsetTime]`: structured symptom onset capture.
 |
| [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md) | Profile for an Encounter representing a patient's **inpatient admission and hospital stay** for an index stroke event.**Primary use-case*** Acts as the episode anchor that Conditions, Observations, and Procedures reference via `encounter`, enabling consistent episode-level analytics.
**Captures*** `status`: lifecycle state of the encounter (required).
* `class`: fixed to inpatient (IMP) to represent an admission.
* `actualPeriod`: start/end of the admission (required; end is required for completed stays).
* `admission.admitSource`: arrival mode/origin (required binding to StrokeArrivalModeVS when present).
* `admission.dischargeDisposition`: discharge destination (required binding to StrokeDischargeDestinationVS).
* Episode-level extensions for operational/registry attributes: 
* first hospital indicator,
* initial care intensity,
* required post-acute care flag,
* discharge department/service.
 
**Typical scenarios** 1) Direct admission via EMS from home: admitSource=EMS-from-home, isFirstHospital=true. 2) Transfer-in: admitSource=another-hospital or stroke-center, isFirstHospital=false. 3) Discharge home vs rehab vs death: dischargeDisposition captures destination/outcome; dischargeDepartmentService can capture service. |
| [Stroke Functional Score Observation Profile](StructureDefinition-functional-score-observation-profile.md) | Profile for recording stroke functional outcome and severity scores (currently mRS and NIHSS) in an interoperable, context-aware way.**Primary use-case*** Capture outcomes by phase (baseline, admission, discharge, ~90-day follow-up) using a required timing context extension.
**Key constraints*** `Observation.code` is bound to FunctionalScoreCodesVS (mRS or NIHSS).
* `extension[timingContext]` is mandatory to label the clinical phase.
* Datatype and binding rules are enforced via invariants: 
* mRS → `valueCodeableConcept` bound to MRsScoreVS.
* NIHSS → `valueInteger` as total NIHSS score.
 
**Typical scenarios** 1) An mRS score assessed at discharge would have `Observation.code` = mRS code, `valueCodeableConcept` = mRS grade (0–6), and the timing context extension value = discharge. 2) An NIHSS score assessed at admission would have `Observation.code` = NIHSS code, `valueInteger` = total NIHSS score, and the timing context extension value = admission. |
| [Stroke Registry Organization Profile](StructureDefinition-stroke-registry-organization-profile.md) | Organization profile ensuring an active organization with a registry identifier (system=https://stroke.qualityregistry.org) and a required name, aligned with the build_organization() transformation. |
| [Stroke Risk Factor Condition Profile](StructureDefinition-stroke-risk-factor-condition-profile.md) | Profile for **pre-existing or concurrent conditions** that increase stroke risk (e.g., AF/flutter, diabetes, hypertension, coronary disease).**Key constraints*** `Condition.category` is fixed to `problem-list-item` to indicate a problem list entry.
* `Condition.code` is required and bound (required) to StrokeRiskFactorVS.
* `Condition.onset[x]` and `Condition.recordedDate` are marked Must Support to enable chronology and longitudinal tracking.
 |
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
| [Discharge Department/Service Extension](StructureDefinition-discharge-department-service-ext.md) | Extension capturing the **clinical department/service** responsible at discharge or the service the patient is transferred to.**Primary use-cases*** Service-level reporting and capacity planning.
* Distinguishing discharge under neurology vs rehab vs other services.
* Supporting downstream routing/coordination logic when a service category is required.
**FHIR placement*** `Encounter.extension[dischargeDepartmentService].valueCodeableConcept` (required binding to DischargeDeptVS).
 |
| [First Hospital Indicator Extension](StructureDefinition-first-hospital-ext.md) | Boolean extension indicating whether the reporting hospital was the **first medical facility** to admit the patient for this stroke episode.**Primary use-cases*** Registry fields distinguishing “direct to treating hospital” vs “secondary transfer”.
* Analytics for inter-facility transfer patterns and treatment delays (door-in-door-out style analyses).
**How to interpret*** `true`: this hospital is the first admitting facility for the episode.
* `false`: patient was admitted/treated elsewhere first (transfer-in).
**FHIR placement*** `Encounter.extension[isFirstHospital].valueBoolean`
 |
| [Gender (SNOMED CT)](StructureDefinition-gender-snomed-ext.md) | Patient gender represented with SNOMED CT codes. |
| [Hemorrhagic Stroke – Bleeding Reason](StructureDefinition-hemorrhagic-stroke-bleeding-reason-ext.md) | Extension capturing the **identified cause of intracranial bleeding** in a hemorrhagic stroke.**Primary use-case*** Attach to a definitive hemorrhagic stroke Condition (`StrokeDiagnosisConditionProfile`) to support: 
* etiologic stratification (aneurysm vs vascular malformation vs other),
* analytics and registry reporting,
* targeted clinical decision support pathways.
 
**FHIR placement*** `Condition.extension[bleedingReason].valueCodeableConcept` (required binding to HemorrhagicStrokeBleedingReasonVS).
 |
| [Initial Care Intensity Extension](StructureDefinition-initial-care-intensity-ext.md) | Extension capturing the **initial level of care** provided during the first day(s) of hospitalization for the stroke encounter.**Primary use-cases*** Operational reporting (ICU/stroke unit utilization).
* Case-mix adjustment for outcomes and length-of-stay analyses.
* Benchmarking across sites.
**Relationship to base Encounter*** This is not a location/ward tracker; for physical moves use `Encounter.location` with Location references.
* This is a categorical “initial intensity” label used for reporting.
**FHIR placement*** `Encounter.extension[initialCareIntensity].valueCodeableConcept` (required binding to InitialCareIntensityVS).
 |
| [Ischemic Stroke – Etiology](StructureDefinition-ischemic-stroke-etiology-ext.md) | Extension capturing the **determined ischemic stroke etiology classification**.**Primary use-case*** Attach to a definitive ischemic stroke Condition (`StrokeDiagnosisConditionProfile`) to support: 
* etiologic subgroup analytics (cardioembolic vs lacunar vs cryptogenic, etc.),
* pathway decision support (e.g., prolonged rhythm monitoring for cryptogenic stroke),
 
**When to use*** Use after etiologic workup when a classification is assigned.
* Do not use for hemorrhagic stroke diagnoses.
* If the etiology remains unknown/undetermined, either omit the extension or use the “Undetermined” code included in StrokeEtiologyVS.
**FHIR placement*** `Condition.extension[ischemicEtiology].valueCodeableConcept` (required binding to StrokeEtiologyVS).
 |
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
| [Required Post-Acute Care Extension](StructureDefinition-required-post-acute-care-ext.md) | Boolean extension indicating whether the patient required **ongoing inpatient care beyond the acute phase**.**Interpretation guidance*** `true`: patient required hospitalization beyond the acute phase (operationalized here as >24 hours after the acute phase).
* `false`: no extended post-acute inpatient need was recorded for this encounter (per local workflow).
**FHIR placement*** `Encounter.extension[requiredPostAcuteCare].valueBoolean`
 |
| [Stroke Symptom Onset Date Extension](StructureDefinition-onset-date-ext.md) | Extension capturing the **calendar date** of symptom onset for the index stroke event.**Primary use-cases*** Compute onset-to-door and onset-to-treatment metrics when combined with encounter/treatment timestamps.
* Support time-sensitive eligibility pathways when onset is known at least to the day.
**When to use*** Use when onset date is known with reasonable confidence.
* Use alongside `OnsetTimeExt` when time-of-day precision is available.
* Omit if onset is unknown, only broadly estimated, or not applicable (e.g., certain in-hospital events may use different timing constructs).
**FHIR placement*** `Condition.extension[onsetDate].valueDate`
 |
| [Stroke Symptom Onset Time Extension](StructureDefinition-onset-time-ext.md) | Extension capturing the **clock time** of symptom onset for the index stroke event.**Primary use-cases*** Enable precise onset-to-treatment intervals (e.g., onset-to-needle, onset-to-groin puncture).
* Improve accuracy of eligibility assessments in time-window–dependent interventions.
**When to use*** Use when onset time is known with sufficient precision for clinical use.
* Omit if time is unknown or too uncertain.
**FHIR placement*** `Condition.extension[onsetTime].valueTime`
**Implementation note*** If `OnsetTimeExt` is present, `OnsetDateExt` should generally also be present (enforced as a warning invariant below).
 |
| [Swallowing Screening Timing Category](StructureDefinition-swallowing-screening-timing-category-ext.md) | Temporal category relative to stroke onset in which the swallowing screening was performed. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Admission Sources ValueSet](ValueSet-admission-source-vs.md) | This ValueSet enumerates modes of transport or pathways by which a patient arrived for the index stroke encounter.**Primary use-cases*** Bind to admission source elements (commonly `Encounter.hospitalization.admitSource` or local equivalents) to support: 
* operational reporting (ambulance vs own transport),
* pathway compliance (e.g., EMS prenotification pathways),
* inter-facility transfer analytics.
 
 |
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
| [Discharge Department/Service ValueSet](ValueSet-discharge-dept-vs.md) | ValueSet restricting the allowed department/service categories recorded at discharge.**Primary use-case*** Required binding for `DischargeDepartmentServiceExtension.valueCodeableConcept`.
 |
| [Discharge Destination ValueSet](ValueSet-discharge-destination-vs.md) | This ValueSet enumerates discharge destination concepts (primarily SNOMED CT procedure-like “discharge to …” concepts).**Primary use-cases*** Bind to discharge disposition elements in encounter/hospitalization modeling. enabling consistent: 
* care transition analytics,
* pathway reporting (home vs ward vs facility vs mortuary),
* downstream coordination workflows.
 
 |
| [Gender (SNOMED CT)](ValueSet-vs-gender-snomed.md) | Value set to represent patient gender using SNOMED CT codes, analogous to AdministrativeGender. |
| [Hemorrhagic Stroke Bleeding Reason ValueSet](ValueSet-hemorrhagic-stroke-bleeding-reason-vs.md) | This ValueSet defines allowable causes of bleeding for hemorrhagic stroke documentation.**Primary use-case*** Required binding for `HemorrhagicStrokeBleedingReasonExt.valueCodeableConcept` on a definitive hemorrhagic stroke Condition.
**Implementation guidance*** Use when the cause is **identified** (e.g., aneurysm, vascular malformation).
* If the cause is unknown/undetermined, prefer documenting that explicitly using narrative (`Condition.note`) and/or a dedicated assessment Observation; if a coded placeholder is required, `Undetermined (qualifier value)` is included as an option.
 |
| [Initial Care Intensity ValueSet](ValueSet-initial-care-intensity-vs.md) | ValueSet restricting allowed initial care intensity categories.**Primary use-case*** Required binding for `InitialCareIntensityExtension.valueCodeableConcept`.
 |
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
| [Stroke Arrival Mode ValueSet](ValueSet-stroke-arrival-mode-vs.md) | ValueSet restricting the allowed values for documenting the patient's arrival mode/origin.**Primary use-case*** Required binding to `Encounter.admission.admitSource` in `StrokeEncounterProfile`.
 |
| [Stroke Circumstance Codes ValueSet](ValueSet-stroke-circumstance-codes-vs.md) | This ValueSet includes all onset-circumstance codes from StrokeCircumstanceCodesCS.**Primary use-case*** Required binding for `StrokeCircumstanceObservationProfile.code`.
 |
| [Stroke Diagnosis ValueSet](ValueSet-stroke-diagnosis-vs.md) | This ValueSet enumerates SNOMED CT concepts representing **final stroke-related diagnoses** for use in `Condition.code` within this Implementation Guide (IG).**Primary use-case*** Required binding to `Condition.code` in `StrokeDiagnosisConditionProfile`, representing the **definitive diagnosis** of the index stroke event for the linked encounter.
**Scope*** Ischemic stroke
* Intracerebral/cerebral hemorrhage
* Subarachnoid hemorrhage
* Cerebral venous thrombosis
* Transient ischemic attack (TIA)
* “Undetermined” qualifier (use cautiously; see notes)
**Modeling notes*** This ValueSet is intended for definitive diagnoses (e.g., at discharge or after diagnostic workup), not “rule-out”, screening, history-of, or procedural concepts.
* Terminology expansion should be performed against the appropriate SNOMED CT edition/version and preferred language(s). Localizations MAY add designations without changing meaning.
* If “undetermined” is used, consider adding supporting narrative in `Condition.note` and/or linking evidence in Observations/DiagnosticReports to preserve interpretability.
 |
| [Stroke Discharge Destination ValueSet](ValueSet-stroke-discharge-destination-vs.md) | ValueSet defining allowable discharge dispositions for the stroke encounter.**Primary use-case*** Required binding to `Encounter.admission.dischargeDisposition` in `StrokeEncounterProfile`.
**Composition*** SNOMED CT “discharge/transfer” procedure concepts for common destinations.
* Local supplement (StrokeDischargeDestinationCS) for outcomes such as “deceased during stay”.
 |
| [Stroke Etiology ValueSet](ValueSet-stroke-etiology-vs.md) | This ValueSet defines allowable values for recording the **determined ischemic stroke etiology**.**Primary use-case*** Required binding for `StrokeStrokeEtiologyExt.valueCodeableConcept` on definitive ischemic stroke Conditions.
**Composition*** Local etiology categories (StrokeEtiologyCS), plus selected SNOMED CT disorder concepts for commonly used etiology groupings.
**Implementation guidance*** Use after etiologic workup when a classification is assigned.
* If etiology remains unknown/undetermined, use the included `Undetermined (qualifier value)`
 |
| [Stroke Functional Score Codes ValueSet](ValueSet-functional-score-codes-vs.md) | This ValueSet constrains `Observation.code` for functional outcome and severity instruments represented in this guide:* Modified Rankin Scale score (mRS)
* NIH Stroke Scale total score (NIHSS)
**Primary use-case*** Bind to `Observation.code` in `FunctionalScoreObservationProfile`.
**Datatype expectations enforced via invariants*** mRS: `Observation.valueCodeableConcept` bound to MRsScoreVS (ordinal categories 0–6).
* NIHSS: `Observation.valueInteger` as total NIHSS score.
 |
| [Stroke Procedure Not Done Reason ValueSet](ValueSet-stroke-proc-not-done-reason-vs.md) | ValueSet containing the controlled vocabulary of reasons for `Procedure.statusReason` when a stroke procedure is `not-done`. |
| [Stroke Risk Factor ValueSet](ValueSet-stroke-risk-factor-vs.md) | This ValueSet enumerates SNOMED CT disorder concepts representing **pre-existing or concurrent conditions** that increase stroke risk.**Primary use-case*** Required binding to `Condition.code` in `StrokeRiskFactorConditionProfile`, used to maintain a structured problem list supporting: 
* etiologic reasoning (e.g., cardioembolic risk),
* clinical decision support (e.g., anticoagulation considerations),
* quality reporting and research cohort definition.
 
**Modeling notes*** This ValueSet is for **previously documented conditions** (problems), not for “risk factor unknown”. If a risk factor assessment is unknown/not assessed, represent that as an Observation (status/result) or use `dataAbsentReason` patterns rather than a Condition with an “Unknown” code.
* The acute stroke event itself should be represented by `StrokeDiagnosisConditionProfile`, not by this risk factor profile.
 |
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
| [Discharge Department/Service CodeSystem](CodeSystem-discharge-dept-cs.md) | Local CodeSystem representing the **clinical service/department** responsible for the patient at discharge/transfer (or the service the patient is transferred to).**Primary use-case*** Populate `DischargeDepartmentServiceExtension` on Encounter to support: 
* bed management and service-level reporting,
* pathway characterization (e.g., discharge under neurology vs rehab),
* operational analytics and capacity planning.
 
**Modeling notes*** This captures **service classification**, not the physical ward/room. Physical location should be modeled using `Encounter.location` (and references to Location resources) if needed.
 |
| [Hemorrhagic Stroke Bleeding Reason CodeSystem](CodeSystem-hemorrhagic-stroke-bleeding-reason-cs.md) | Local CodeSystem representing **locally governed reasons/causes** for intracranial bleeding in hemorrhagic stroke.**Primary use-case*** Used via `HemorrhagicStrokeBleedingReasonVS` as the allowed vocabulary for `HemorrhagicStrokeBleedingReasonExt.valueCodeableConcept` on a definitive hemorrhagic stroke Condition.
 |
| [Initial Care Intensity CodeSystem](CodeSystem-initial-care-intensity-cs.md) | Local CodeSystem representing the **initial intensity of care** during the first day(s) of the stroke encounter.**Primary use-case*** Populate `InitialCareIntensityExtension` on Encounter to support: 
* case-mix characterization (ICU/stroke unit vs monitored vs standard bed),
* operational benchmarking and staffing analysis,
* research stratification where initial level-of-care is a confounder.
 
**Interpretation guidance*** `standard`: no continuous monitoring beyond standard nursing observation.
* `monitored`: telemetry or continuous monitoring outside ICU.
* `icu-stroke`: ICU or dedicated stroke unit level care (per local definitions).
 |
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
| [Stroke Arrival Mode CodeSystem](CodeSystem-stroke-arrival-mode-cs.md) | Local CodeSystem describing **how and from where** the patient arrived to the treating hospital for the index stroke encounter.**Primary use-case*** Populate `Encounter.admission.admitSource` (via StrokeArrivalModeVS) to support: 
* workflow analysis (EMS vs private transport),
* pathway compliance reporting (direct-to-stroke-center vs inter-facility transfer),
* operational dashboards and registries.
 
**Modeling notes*** These codes describe **arrival origin and transport pathway**, not clinical triage severity.
* If you need transport timestamps, EMS unit identifiers, or handover details, model them separately
 |
| [Stroke Circumstance Codes CodeSystem](CodeSystem-stroke-circumstance-codes-cs.md) | This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant when onset time is unknown or atypical.**Primary use-case*** Use as `Observation.code` in `StrokeCircumstanceObservationProfile`.
* Presence of the Observation asserts that the circumstance applies to the index stroke event.
 |
| [Stroke Discharge Destination CodeSystem](CodeSystem-stroke-discharge-destination-cs.md) | Local CodeSystem for discharge disposition values that are not sufficiently covered (or not consistently available) in the chosen standard terminology set. |
| [Stroke Etiology CodeSystem](CodeSystem-stroke-etiology-cs.md) | Local CodeSystem defining categories for **ischemic stroke etiology** classification.**Primary use-case*** Used via `StrokeEtiologyVS` as the required vocabulary for `StrokeStrokeEtiologyExt.valueCodeableConcept` on a definitive ischemic stroke Condition.
**Why it exists*** Stroke etiology classification often mixes internationally standard categories (cardioembolic, lacunar, cryptogenic) with local operational buckets.
**Modeling notes*** This CodeSystem is intended for “final etiology classification” after diagnostic workup, not for provisional hypotheses.
 |
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

