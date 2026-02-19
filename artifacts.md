# Artifacts Summary - v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Age at Stroke Onset Observation Profile (R5)](StructureDefinition-age-at-onset-observation-profile.md) | Profile for recording the patient’s age at the time of stroke onset as a simple integer value in years. The Observation.code is fixed to the SNOMED CT observable entity “Age at onset of clinical finding,” ensuring a clear and interoperable semantic meaning.The age at onset may be derived from date of birth and an onset/reference timepoint (e.g., symptom onset, last known well, or discovery time depending on local policy). This profile records the resulting age value, not the derivation method; if the derivation is clinically important, implementers should capture the underlying reference timepoint(s) and provenance separately. |
| [Base Profile for Stroke-Related Observations](StructureDefinition-base-stroke-observation.md) | Common constraints for Observations captured in the context of stroke care across acute management and follow-up. This profile establishes a consistent minimum dataset and reference structure so that downstream profiles (vital signs, functional scores, timing metrics, onset circumstances, and specific findings) behave uniformly across systems.Key modeling intent:* Observation.status is fixed to final to indicate recorded results suitable for clinical reporting and analytics.
* Observation.subject (Patient) and Observation.encounter (index stroke encounter) are mandatory to ensure every observation is attributable to a specific person and care episode.
* Observation.partOf optionally links the observation to a Procedure (e.g., mechanical thrombectomy) when the observation represents a procedural outcome (e.g., mTICI grade) or a process metric.
* Observation.effective[x] is optional to accommodate cases where only a phase label is known; when available, effective[x] should be populated to support accurate sequencing and time-based analysis.
 |
| [Discharge Medication Request Profile](StructureDefinition-discharge-medication-request-profile.md) | Represents a medication prescription made as part of the patient's discharge plan, categorized as community administration. |
| [Patient with SNOMED Gender and Age (extensions)](StructureDefinition-patient-age-gender-snomed-profile.md) | Profile that adds an integer age extension and a SNOMED-based gender extension. |
| [Prior Medication Statement Profile (R5)](StructureDefinition-prior-medication-statement-profile.md) | Represents a statement about the patient's medication use **before** the index event. |
| [Specific Stroke Finding Observation Profile (R5)](StructureDefinition-specific-finding-observation-profile.md) | Profile for recording discrete, coded stroke-related findings and assessment outcomes that do not fit naturally into the vital-sign, functional-score, or timing-metric profiles. Observation.code is constrained to StrokeFindingCodesVS, and Observation.valueCodeableConcept carries the corresponding assessment result or status.Typical use cases include:* documenting AF/flutter assessment status as present/absent/unknown (valueCodeableConcept bound to an AF/flutter status ValueSet), and
* documenting procedural outcome grades such as mTICI (valueCodeableConcept bound to MticiScoreVS).
This profile deliberately encodes the result as a CodeableConcept to support categorical outcomes and interoperability. It does not replace Condition for asserting diagnoses; when a durable diagnosis is established (e.g., confirmed AF), represent it as a Condition and optionally link supporting Observations (screening results, monitoring runs) using hasMember, derivedFrom, or Provenance. |
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
| [Stroke Circumstance Observation Profile (R5)](StructureDefinition-stroke-circumstance-observation-profile.md) | Profile for documenting clinically relevant circumstances of stroke symptom onset (e.g., wake-up stroke, in-hospital onset). The circumstance is represented by Observation.code (bound to StrokeCircumstanceCodesVS); the presence of the Observation asserts that the circumstance applies to the index event within the associated Encounter.The profile supports linking supporting evidence via hasMember (e.g., Observations capturing last-known-well time, symptom discovery time, or other onset-related details) without overloading the circumstance code itself. This profile intentionally does not encode onset timestamps in the code; temporal details should be modeled separately for precision and auditability. |
| [Stroke Diagnosis Condition Profile](StructureDefinition-stroke-diagnosis-condition-profile.md) | Defines a Condition profile constrained to represent the definitive diagnosis of the current stroke event during the indexed encounter. The profile fixes category to encounter-diagnosis, binds code (required) to StrokeDiagnosisVS, and prohibits onset[x] to avoid ambiguity with symptom-onset capture via dedicated extensions. Use this profile for final/confirmed stroke diagnoses recorded at discharge or after diagnostic workup; do not use it for history-of conditions, screening findings, or provisional ‘rule-out’ statements. Optional extensions capture hemorrhagic bleeding reason, ischemic etiology, and structured onset date/time when clinically known. |
| [Stroke Encounter Profile](StructureDefinition-stroke-encounter-profile.md) | Profile for an Encounter resource representing a patient's hospital admission and stay for a stroke event, including key administrative and workflow details. |
| [Stroke Functional Score Observation Profile](StructureDefinition-functional-score-observation-profile.md) | Profile for recording stroke functional outcome and severity scores, currently mRS and NIHSS, in a way that is both interoperable and context-aware. The profile requires a timing context extension (ObservationTimingContextExtension) to explicitly state the clinical phase (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up), enabling unambiguous interpretation and standardized reporting.Observation.code is bound to FunctionalScoreCodesVS, and invariants constrain Observation.value[x] by instrument:* For mRS (SNOMED CT observable entity), the result is represented as a CodeableConcept bound to MRsScoreVS (ordinal categories 0–6).
* For NIHSS (SNOMED CT observable entity), the result is represented as an integer total score (valueInteger), reflecting the overall NIHSS total rather than item-level subscores.
The profile does not model itemized NIHSS components, assessor training, or interview method; implementers may represent those details separately when needed (e.g., additional Observations, extensions, or provenance). |
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
| [Stroke Timing Metric Observation Profile (R5)](StructureDefinition-timing-metric-observation-profile.md) | Profile for recording acute stroke process timing metrics as measured durations (e.g., Door-to-Needle, Door-to-Groin). Observation.code is bound to TimingMetricCodesVS, and Observation.valueQuantity represents the elapsed time as a duration in UCUM minutes.This representation is optimized for quality monitoring and analytics, where the interval value is the primary datum. The profile allows hasMember references to associate related sub-metrics or supporting Observations when a composite metric is derived from multiple recorded steps.Scope note: This profile records the interval value; it does not require recording the underlying event timestamps. If timestamp provenance is needed, implementers should capture the source event times separately (e.g., additional Observations or extensions) to support auditing and cross-site comparability. |
| [Stroke Vital Sign Observation Profile](StructureDefinition-vital-sign-observation-profile.md) | Profile for recording key blood pressure vital signs in stroke patients using a single Observation with components. The Observation is categorized as vital-signs and uses component slices for systolic and diastolic blood pressure, each represented as a Quantity in UCUM mm[Hg].This profile supports repeated measurements over time by recording separate Observations at different effective[x] timestamps (e.g., arrival, post-thrombolysis monitoring, ICU). It intentionally does not model measurement conditions such as body position, cuff site, or device; such details may be captured via Observation.method, device references, or additional extensions if required by local workflows. |

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
| [Observation Timing Context Extension](StructureDefinition-observation-timing-context-ext.md) | This extension captures the clinical timing context (relative phase) in which an observation or assessment was made (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up). It is particularly important for functional outcomes and severity scores whose interpretation depends on **when** they were assessed.The extension complements Observation.effective[x]:* effective[x] records the actual date/time (when known),
* this extension records the standardized phase label used for reporting and comparability across sites.
The value is a required CodeableConcept bound to AssessmentContextVS (required), ensuring only supported timing contexts are used in this implementation guide. |
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
| [Assessment Context ValueSet](ValueSet-assessment-context-vs.md) | This ValueSet includes all context/timepoint codes defined in AssessmentContextCS. It is intended for required binding to elements (e.g., extensions) that must indicate the clinical phase of an assessment, enabling consistent stratification and reporting of outcomes and severity over the stroke care pathway. |
| [Atrial Fibrillation or Flutter Status ValueSet](ValueSet-afib-flutter-status-vs.md) | This ValueSet constrains the allowed coded outcomes for documenting the status of an atrial fibrillation (AF) / atrial flutter assessment within the stroke workflow. It is intentionally limited to SNOMED CT qualifier values that express the epistemic status of the finding: (1) known present, (2) known absent, or (3) unknown.The ValueSet is designed to support harmonized recording across systems when AF/flutter materially influences ischemic stroke etiology workup, thromboembolic risk stratification, and downstream management decisions (e.g., anticoagulation). It is appropriate for use as Observation.valueCodeableConcept to represent the result of screening, monitoring, or review of prior documentation.Scope and modeling notes:* The qualifier values do not encode the rhythm subtype, chronicity, burden, or method of detection (e.g., ECG vs telemetry); those aspects should be represented using additional elements (e.g., Observation.method, device data) or separate Observations/Conditions as appropriate.
* The ValueSet represents “status of assessment” rather than the disorder concept itself; if the clinical intent is to assert a diagnosis of AF/flutter, use a Condition resource with an appropriate SNOMED CT disorder code instead of (or in addition to) this status.
 |
| [Brain Imaging Modality ValueSet](ValueSet-brain-imaging-modality-vs.md) | Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures. |
| [Carotid Arteries Imaging Modality ValueSet](ValueSet-carotid-imaging-modality-vs.md) | This ValueSet enumerates standardized codes (primarily SNOMED CT procedures) representing **carotid imaging modalities** used in stroke workflows.**Primary use-case*** Bind to `Procedure.code` when recording a carotid imaging study performed during the stroke episode.
 |
| [Discharge Department/Service ValueSet](ValueSet-discharge-dept-vs.md) | ValueSet specifying the type of department or service the patient was discharged or transferred to. |
| [Discharge Destination ValueSet](ValueSet-discharge-destination-vs.md) | Defines possible patient discharge destinations. |
| [Gender (SNOMED CT)](ValueSet-vs-gender-snomed.md) | Value set to represent patient gender using SNOMED CT codes, analogous to AdministrativeGender. |
| [Hemorrhagic Stroke Bleeding Reason ValueSet](ValueSet-hemorrhagic-stroke-bleeding-reason-vs.md) | Specifies the identified cause of a hemorrhagic stroke, typically used with an extension. |
| [Initial Care Intensity ValueSet](ValueSet-initial-care-intensity-vs.md) | ValueSet indicating the level of care provided initially. |
| [MTICI Score ValueSet](ValueSet-mtici-score-vs.md) | This ValueSet enumerates all allowable mTICI reperfusion grades (0, 1, 2a, 2b, 2c, 3) from the MticiScoreCS CodeSystem. It is intended to be bound (typically as required) to Observation.valueCodeableConcept when recording the final angiographic reperfusion outcome after endovascular therapy for acute ischemic stroke.Using a dedicated ValueSet ensures:* consistent coding across implementations and sites,
* reliable downstream interpretation for analytics/registry submission, and
* clear separation between the **assessment concept** (e.g., “mTICI reperfusion grade”) and the **assessment result** (the specific grade).
This ValueSet does not convey timing, vessel location, modality, or technique; those must be represented elsewhere in the clinical model. |
| [Medications ValueSet](ValueSet-medication-vs.md) | SNOMED CT codes for drug products or substances. |
| [Modified Rankin Scale (mRS) Score ValueSet](ValueSet-mrs-score-vs.md) | This ValueSet includes all modified Rankin Scale (mRS) grades defined in the MRsScoreCS CodeSystem (0–6). It is intended to be bound to Observation.valueCodeableConcept when the Observation.code indicates that the observation represents an mRS score. |
| [Modified Thrombolysis in Cerebral Infarction Assessment ValueSet](ValueSet-mtici-code-vs.md) | This ValueSet includes the mTICI assessment concept code(s) from MTICICodeCS for use as Observation.code when recording an mTICI reperfusion grade. It is intended to be paired with a binding of Observation.valueCodeableConcept to MticiScoreVS.Separating the “assessment concept” ValueSet (this ValueSet) from the “assessment result” ValueSet (MticiScoreVS) enables clearer validation rules, consistent UI behavior, and safer reuse of the mTICI scoring system across profiles. |
| [Perforation Procedures ValueSet](ValueSet-perforation-procedures-vs.md) | ValueSet restricting Procedure codes to stroke **reperfusion interventions**:* IV thrombolysis (IVT)
* Mechanical thrombectomy (MT)
 |
| [Procedure Timing Context ValueSet](ValueSet-procedure-timing-context-vs.md) | ValueSet limiting allowed values for the Procedure timing context extension (acute/post-acute/unknown).**Use-case*** Required binding to ensure comparable phase classification across systems and sites.
 |
| [Specific Stroke Finding Codes ValueSet](ValueSet-specific-finding-codes-vs.md) | This ValueSet provides SNOMED CT disorder concepts for specific clinically relevant findings often referenced in the stroke workup, currently limited to atrial fibrillation and atrial flutter disorders.These codes are suitable when the intent is to reference the disorder concepts themselves (e.g., as a focus finding or a coded problem). When the intent is to capture the **status of an assessment** (present/absent/unknown) rather than assert a diagnosis, implementers should use an Observation with a dedicated assessment concept as Observation.code and bind Observation.valueCodeableConcept to an appropriate status ValueSet (e.g., AfibFlutterStatusVS). |
| [Specific Stroke Finding Codes ValueSet](ValueSet-stroke-finding-codes-vs.md) | This ValueSet aggregates a small set of coded “finding/assessment concepts” used by the SpecificFindingObservationProfile for stroke-related documentation. It currently includes:* specific disorder concepts relevant to stroke workup (from SpecificFindingCodesVS), and
* the mTICI assessment concept code (from MTICICodeVS).
Implementer note: This ValueSet is used to constrain Observation.code. Where Observation.code is a disorder concept (e.g., AF disorder), the Observation instance should be interpreted as capturing an **assessment about that finding** (with the assessment result carried in Observation.valueCodeableConcept, per profile constraints). Where Observation.code is an assessment concept (e.g., mTICI), the Observation.valueCodeableConcept carries the corresponding score/result. |
| [Stroke Arrival Mode ValueSet](ValueSet-stroke-arrival-mode-vs.md) | ValueSet specifying the mode and origin of the patient's arrival. |
| [Stroke Circumstance Codes ValueSet](ValueSet-stroke-circumstance-codes-vs.md) | This ValueSet includes all onset-circumstance codes defined in StrokeCircumstanceCodesCS for use in stroke documentation and analytics. It is intended to be bound to Observation.code in the StrokeCircumstanceObservationProfile, enabling consistent classification of onset scenarios such as in-hospital stroke and wake-up stroke.Consistent coding supports cohort definition (e.g., wake-up stroke protocols), audit/quality reporting, and research where onset uncertainty is a key stratification variable. |
| [Stroke Diagnosis ValueSet](ValueSet-stroke-diagnosis-vs.md) | SNOMED CT concepts representing final stroke-related diagnoses intended for use in Condition.code (and similar elements) within this IG. The scope covers ischemic stroke, intracerebral hemorrhage, subarachnoid hemorrhage, cerebral venous thrombosis, and transient ischemic attack (TIA). This value set is designed to support consistent capture, validation, analytics, and decision support. Implementers should expand against a terminology server using the appropriate SNOMED CT edition/version and preferred language(s) for display. Localizations or national derivatives MAY provide additional designations without altering the canonical definition. This value set is not intended for history-of, screening, or procedural concepts. |
| [Stroke Discharge Destination ValueSet](ValueSet-stroke-discharge-destination-vs.md) | Defines the possible destinations of the patient upon discharge from the encounter. |
| [Stroke Etiology ValueSet](ValueSet-stroke-etiology-vs.md) | Specifies the determined etiology of an stroke. |
| [Stroke Functional Score Codes ValueSet](ValueSet-functional-score-codes-vs.md) | This ValueSet defines the allowable Observation.code concepts for stroke functional and severity scoring instruments represented in this guide: modified Rankin Scale (mRS) and NIH Stroke Scale (NIHSS), expressed as SNOMED CT observable entities.It is intended to be bound to Observation.code in the FunctionalScoreObservationProfile. Downstream validation/invariants then enforce the appropriate datatype of Observation.value[x]:* mRS is captured as a coded ordinal category (valueCodeableConcept bound to MRsScoreVS).
* NIHSS is captured as a numeric total score (valueInteger), representing the summed NIHSS total rather than item-level subscores.
 |
| [Stroke Procedure Not Done Reason ValueSet](ValueSet-stroke-proc-not-done-reason-vs.md) | ValueSet containing the controlled vocabulary of reasons for `Procedure.statusReason` when a stroke procedure is `not-done`. |
| [Stroke Risk Factor ValueSet](ValueSet-stroke-risk-factor-vs.md) | Defines the SNOMED CT codes for conditions or risk factors relevant to stroke, including an option for unknown status. |
| [Stroke Timing Metric Codes ValueSet](ValueSet-timing-metric-codes-vs.md) | This ValueSet includes all timing metric codes defined in TimingMetricCodesCS for use as Observation.code when recording acute stroke process intervals (e.g., D2N, D2G). It supports required binding in the TimingMetricObservationProfile, ensuring only approved timing metrics are recorded.The ValueSet is intentionally constrained to promote consistent, comparable reporting across implementations and to reduce ambiguity in downstream analytics. |
| [Stroke Vital Sign Codes ValueSet](ValueSet-vital-sign-codes-vs.md) | This ValueSet defines SNOMED CT observable-entity codes for the blood pressure components captured as vital signs in the acute stroke setting (systolic and diastolic blood pressure). It is intended for use as Observation.component.code in a single vital-sign Observation that records both components using UCUM units (mm[Hg]).Including only the component codes (rather than full LOINC panels) keeps the representation lightweight while remaining semantically precise, and supports repeated measurements across time (e.g., triage, post-thrombolysis monitoring) by repeating the Observation with different effective[x] timestamps. |
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
| [Assessment Context Code System](CodeSystem-assessment-context-cs.md) | This CodeSystem defines normalized codes for the clinical context / relative timepoint at which a stroke-related assessment was performed. It is primarily used to contextualize functional and severity instruments (e.g., mRS and NIHSS) where interpretation depends on whether the score reflects baseline status, acute presentation, discharge status, or follow-up.These codes represent **relative phases** (pre-stroke baseline, admission, discharge, ~3-month follow-up) rather than precise timestamps. The actual date/time of measurement should be recorded in Observation.effective[x] when known; the context code complements effective[x] by expressing the clinical phase, which is often necessary for reporting and comparability (e.g., “mRS pre-stroke” vs “mRS at discharge”). |
| [Brain Imaging Type Code System](CodeSystem-brain-imaging-type-cs.md) | Codes specifying the type of brain imaging performed (e.g., CT, MRI). |
| [Discharge Department/Service Code System](CodeSystem-discharge-dept-cs.md) | Code system specifying the type of department or service the patient was discharged or transferred to. |
| [Hemorrhagic Stroke Bleeding Reason Code System](CodeSystem-hemorrhagic-stroke-bleeding-reason-cs.md) | Codes indicating the reason for bleeding in hemorrhagic stroke cases. |
| [Initial Care Intensity Code System](CodeSystem-initial-care-intensity-cs.md) | Codes indicating the level of care provided during the patient's initial day(s) in the hospital. |
| [Initial Care Intensity Code System](CodeSystem-stroke-arrival-mode-cs.md) | Codes indicating the level of care provided during the patient's initial day(s) in the hospital. |
| [MTICI Score Code System](CodeSystem-mtici-score-cs.md) | This CodeSystem defines codes for the modified Treatment in Cerebral Ischemia / modified Thrombolysis in Cerebral Infarction (mTICI) reperfusion grade. mTICI is an ordinal angiographic scale used to quantify the extent of antegrade reperfusion of the downstream ischemic territory after endovascular therapy for acute ischemic stroke (e.g., mechanical thrombectomy).The scale ranges from 0 (no perfusion) to 3 (complete reperfusion), with 2a/2b/2c subgrades to distinguish partial, substantial, and near-complete reperfusion. These codes are intended for consistent, interoperable capture in HL7® FHIR® resources—most commonly Observation.valueCodeableConcept—supporting procedural documentation, registry submission, audit/quality improvement, and research.Scope and modeling notes:* This CodeSystem represents the **final** angiographic reperfusion grade for the target downstream territory, typically assigned from the final post-procedural angiographic run (commonly DSA).
* It does not encode target vessel location, imaging modality details, timestamps, technique/device, number of passes, collateral status, or adjudication process; those elements should be recorded separately (e.g., Procedure, ImagingStudy, Observation.method, extensions).
* Any local definition of “successful reperfusion” (often operationalized as mTICI ≥ 2b, depending on protocol) should be implemented via ValueSets, rules, or reporting logic without altering code meanings.
 |
| [Medications CodeSystem](CodeSystem-medication-cs.md) | Codes for drug products or substances representing the Medications on the patient discharge. |
| [Modified Rankin Scale Score Code System](CodeSystem-mrs-score-cs.md) | This CodeSystem defines codes for the modified Rankin Scale (mRS), an ordinal measure of global disability and functional outcome widely used in stroke care and research. mRS grades functional status from 0 (no symptoms) through 5 (severe disability), with 6 indicating death.Within this implementation guide, mRS is intended to be captured as Observation.valueCodeableConcept (bound to the MRsScoreVS ValueSet), with the assessment timepoint represented explicitly (e.g., via effective[x]) and/or via an assessment context indicator (e.g., pre-stroke baseline, discharge, ~90-day follow-up). This supports standard reporting (e.g., “mRS at 90 days”), comparability across sites, and consistent downstream analytics.Scope and modeling notes:* mRS is a coarse, global disability scale; it does not encode detailed domain-specific functional limitations (mobility, cognition, ADLs) which should be captured via additional instruments/Observations if required.
* The CodeSystem defines only the **score**; method of ascertainment (in-person, telephone, structured interview) and assessor details should be captured separately when relevant.
 |
| [Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem](CodeSystem-mtici-code-cs.md) | This CodeSystem defines the assessment concept code(s) used to indicate that an Observation is reporting an mTICI reperfusion grade. It is intentionally separated from the MticiScoreCS CodeSystem, which contains the actual mTICI grade values (0–3 with 2a/2b/2c).In practice:* Observation.code identifies the **kind of measurement/assessment** (“mTICI reperfusion grade”).
* Observation.valueCodeableConcept carries the **result** (one of the mTICI grades from MticiScoreVS).
This separation improves semantic clarity and supports consistent validation and analytics across systems. |
| [Procedure Timing Context CodeSystem](CodeSystem-procedure-timing-context-cs.md) | Local CodeSystem for classifying a procedure into a **timing context** relative to encounter start.**Primary use-case*** Normalize reporting into acute (<24h) vs post-acute (>=24h) phases for stroke process measures.
**FHIR placement*** Used in `ProcedureTimingContextExtension` attached to Procedure.
 |
| [Stroke Circumstance Codes CodeSystem](CodeSystem-stroke-circumstance-codes-cs.md) | This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant for eligibility decisions, diagnostic reasoning, and reporting—particularly when the exact onset time is unknown or atypical.These codes are intended to be used as Observation.code in the StrokeCircumstanceObservationProfile to assert that a given onset circumstance applies to the index stroke event. They do not encode the precise onset timestamp, last-known-well time, or location of onset; those details should be represented separately (e.g., dedicated Observations, Encounter/Condition attributes, or extensions). |
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
| [Stroke Timing Metric Codes CodeSystem](CodeSystem-timing-metric-codes-cs.md) | This CodeSystem defines codes for key time-interval process metrics in acute stroke care used for quality monitoring and pathway optimization. Each code represents a duration measured in minutes between two clinically meaningful events (e.g., hospital arrival to thrombolysis start).These metrics are commonly used in performance dashboards, registry submissions, and quality improvement programs. The intent is to store the **measured interval** (a duration) in Observation.valueQuantity (UCUM minutes), while event timestamps (arrival time, needle time, groin puncture time) may be stored separately when available. |
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

