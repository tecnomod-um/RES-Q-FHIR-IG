// ------------------------- Aliases ----------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir 
Alias: UCUM = https://ucum.org/ucum

// FHIR R5 Resource Aliases
Alias: FHIR_Procedure = http://hl7.org/fhir/StructureDefinition/Procedure
Alias: FHIR_Extension = http://hl7.org/fhir/StructureDefinition/Extension
Alias: FHIR_Patient = http://hl7.org/fhir/StructureDefinition/Patient
Alias: FHIR_Encounter = http://hl7.org/fhir/StructureDefinition/Encounter
Alias: FHIR_CodeableConcept = http://hl7.org/fhir/StructureDefinition/CodeableConcept
Alias: FHIR_CodeableReference = http://hl7.org/fhir/StructureDefinition/CodeableReference // For R5 reason/used
Alias: FHIR_Location = http://hl7.org/fhir/StructureDefinition/Location
Alias: FHIR_Observation = http://hl7.org/fhir/StructureDefinition/Observation // For reason target
Alias: FHIR_DiagnosticReport = http://hl7.org/fhir/StructureDefinition/DiagnosticReport // For reason target
Alias: FHIR_Condition = http://hl7.org/fhir/StructureDefinition/Condition // For reason target

// URLs for Custom CodeSystems
Alias: StrokeProcNotDoneReasonCS_URL = http://tecnomod-um.org/CodeSystem/stroke-proc-not-done-reason-cs
Alias: SwallowScreenTimeCS_URL = http://tecnomod-um.org/CodeSystem/swallow-screen-time-cs
Alias: ProcedureTimingContextCS_URL = http://tecnomod-um.org/CodeSystem/procedure-timing-context-cs
Alias: BrainImagingTypeCS_URL = http://tecnomod-um.org/CodeSystem/brain-imaging-type-cs
Alias: SwallowProceduresCS_URL = http://tecnomod-um.org/CodeSystem/swallow-procedures-cs
Alias: ThrombectomyComplicationCS_URL = http://tecnomod-um.org/CodeSystem/thrombectomy-complication-cs
// URLs for ValueSets (used in bindings)
Alias: CarotidImagingModalityVS_URL = http://tecnomod-um.org/ValueSet/carotid-imaging-modality-vs
Alias: BrainImagingModalityVS_URL = http://tecnomod-um.org/ValueSet/brain-imaging-modality-vs
Alias: ThrombectomyComplicationVS_URL = http://tecnomod-um.org/ValueSet/thrombectomy-complication-vs
Alias: StrokeProcNotDoneReasonVS_URL = http://tecnomod-um.org/ValueSet/stroke-proc-not-done-reason-vs
Alias: SwallowingScreeningTimingCategoryVS_URL = http://tecnomod-um.org/ValueSet/swallowing-screening-timing-category-vs
Alias: PerforationProceduresVS_URL = http://tecnomod-um.org/ValueSet/perforation-procedures-vs
Alias: SwallowProceduresVS_URL = http://tecnomod-um.org/ValueSet/swallow-procedures-vs
Alias: ProcedureTimingContextVS_URL = http://tecnomod-um.org/ValueSet/procedure-timing-context-vs

// URLs for Custom Extensions
Alias: ProcPerfElsewhereExt_URL = http://tecnomod-um.org/StructureDefinition/procedure-performed-elsewhere-indicator-ext
Alias: SwallowScreenTimeExt_URL = http://tecnomod-um.org/StructureDefinition/swallowing-screening-timing-category-ext
Alias: ProcTimingContextExt_URL = http://tecnomod-um.org/StructureDefinition/procedure-timing-context-ext

// ------------------- CodeSystems and ValueSets (R5 Compatible) -------------

// --- ValueSet: Carotid Imaging Modalities ---
ValueSet: CarotidImagingModalityVS
Id: carotid-imaging-modality-vs
Title : "Carotid Arteries Imaging Modality ValueSet"
* ^status = #active
Description : """
This ValueSet enumerates standardized codes (primarily SNOMED CT procedures) representing **carotid imaging modalities** used in stroke workflows.

**Primary use-case**
- Bind to `Procedure.code` when recording a carotid imaging study performed during the stroke episode.

**Why it matters**
- Supports comparable reporting across facilities (e.g., Doppler vs angiography vs CTA/MRA usage).
- Reduces variability from local naming conventions and free-text.

**What it does not represent**
- Imaging results/findings (e.g., stenosis severity). Findings should be modeled separately (Observation/DiagnosticReport/ImagingStudy, depending on your architecture).
"""
* ^url = CarotidImagingModalityVS_URL
* ^version = "1.0.0"
* include SCT#58920005 "Angiography of carotid artery (procedure)"
* include SCT#9171000087102 "Doppler ultrasonography of carotid arteries (procedure)"
* include SCT#396205005 "Computed tomography of brain without radiopaque contrast (procedure)"
* include SCT#1366357009 "Magnetic resonance imaging angiography of intracranial artery (procedure)"

CodeSystem: BrainImagingTypeCS
Id: brain-imaging-type-cs
Title : "Brain Imaging Type CodeSystem"
Description : """ 
This local CodeSystem defines codes for **brain imaging protocol bundles** commonly used in acute stroke, such as CT+CTA+perfusion.

**When to use**
- The source system reports the study as a combined protocol (e.g., "CT/CTA/CTP") without individual modality breakdown.
- You need a stable code for quality indicators and cohort definitions (e.g., “patients who had CT+CTA+perfusion”).
""" 
* ^url = BrainImagingTypeCS_URL
* ^version = "1.0.0"
* ^title = "Brain Imaging Type Code System"
* ^description = "Codes specifying the type of brain imaging performed (e.g., CT, MRI)."
* ^status = #active
* #ct-cta "CT-CTA" "CT + CT Angiography. Use when recorded as a combined protocol and not decomposed into separate procedure entries."
* #ct-cta-perfusion "CT-CTA and Perfusion" "CT + CTA + CT Perfusion. Often used for penumbra/mismatch-based selection in acute stroke."
* #mr-dwi-flair "MR DWI-FLAIR" "MRI with DWI and/or FLAIR. Supports imaging-based estimates of lesion age and tissue characterization."
* #mr-dwi-flair-mra "MR DWI-FLAIR and MRA" "MRI (DWI/FLAIR) + MRA. Represents combined parenchymal and vascular assessment."
* #mr-dwi-flair-mra-perfusion "MR DWI-FLAIR, MRA, and Perfusion" "MRI (DWI/FLAIR) + MRA + perfusion. Represents advanced tissue and vessel evaluation."

// --- ValueSet: Brain Imaging Modalities ---
ValueSet: BrainImagingModalityVS
Id: brain-imaging-modality-vs
Title: "Brain Imaging Modality ValueSet"
Description: """This ValueSet defines the allowed codes for documenting **stroke-related brain imaging** as a Procedure.

It intentionally supports two levels of coding:
1) **Granular SNOMED CT procedures** (preferred when available).
2) **Local combined-protocol codes** from `BrainImagingTypeCS` (used when the source reports protocol bundles).

**Primary use-case**
- Required binding to `Procedure.code` for brain imaging within the stroke episode.

**Implementation guidance**
- Prefer SNOMED CT when the source provides discrete modality/procedure entries.
- Use local protocol codes when the source provides only bundled protocol information.
""" 
* ^url = BrainImagingModalityVS_URL
* ^version = "1.0.0"
* ^title = "Brain Imaging Modality ValueSet"
* ^description = "Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures."
* ^status = #active
* include SCT#419949007 "Computed tomography angiography of intracranial artery with contrast (procedure)"
* include codes from system BrainImagingTypeCS_URL

CodeSystem: ThrombectomyComplicationCS
Id: thrombectomy-complication-cs
Title: "Thrombectomy Complication CodeSystem"
Description: """Local CodeSystem for complications occurring during mechanical thrombectomy.

**When to use**
- If you need a controlled internal vocabulary for adverse events/complications, especially when upstream systems do not provide SNOMED-coded diagnoses.

**How it is used in FHIR R5**
- Usually referenced from `Procedure.complication` which is a `CodeableReference(Condition)` in R5.
- You may represent the complication as a `Condition` (preferred), and/or record a code directly depending on your implementation pattern.

**Why it exists**
- Supports minimum-set reporting across sites and enables consistent quality/safety analytics.
"""
* ^url = ThrombectomyComplicationCS_URL
* ^version = "1.0.0"
* ^status = #active
* #perforation "Vessel Perforation" "Vessel perforation occurred during the mechanical thrombectomy"


// --- ValueSet: Thrombectomy Complications ---
ValueSet: ThrombectomyComplicationVS
Id: thrombectomy-complication-vs
Title: "Thrombectomy Complications ValueSet"
Description: """ ValueSet of SNOMED CT concepts representing complications of thrombectomy as clinical conditions.

**Primary use-case**
- Bind `Procedure.complication` (or the referenced Condition.code) to a SNOMED-based set for interoperability.

""" 
* ^url = ThrombectomyComplicationVS_URL
* ^version = "1.0.0"
* ^status = #active
* include SCT#307312008 "Perforation of artery (disorder)"

CodeSystem: StrokeProcNotDoneReasonCS
Id: stroke-proc-not-done-reason-cs
Title: "Stroke Procedure Not Done Reasons CodeSystem"
Description: """ Local CodeSystem enumerating standardized reasons why a key stroke procedure (e.g., IV thrombolysis or mechanical thrombectomy) was **not performed**.

**Primary use-case**
- Populate `Procedure.statusReason` when `Procedure.status = not-done`.

**Why it matters**
- Captures the difference between:
  - clinical ineligibility (contraindication),
  - time-based ineligibility (outside window),
  - operational constraints (unavailable),
  - patient choice (refusal),
  - care pathway differences (performed elsewhere / transfer).
""" 
* ^url = StrokeProcNotDoneReasonCS_URL
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^caseSensitive = false 
* #time-window "Outside therapeutic window" "The patient presented/evaluated outside the time window defined by protocol/guidelines for benefit."
* #no-lvo "No Large Vessel Occlusion (LVO)" "No eligible large vessel occlusion for thrombectomy was identified."
* #contraindication "Contraindication present" "A medical contraindication existed (e.g., bleeding risk or other high-risk factor)."
* #patient-refusal "Patient/family refusal" "The patient or legal representative declined the intervention after discussion."
* #transfer "Transferred to another facility" "The patient was transferred to a different facility for the intervention."
* #unavailable "Procedure unavailable" "The facility could not provide the procedure (equipment, staffing, service availability)."
* #disability "Severe preexisting disability" "Baseline disability made benefit unlikely per clinical judgement/protocol."
* #mild-deficit "Mild deficit" "Neurological deficit severity was judged too mild to justify risk/benefit."
* #done-elsewhere "Performed elsewhere" "The procedure had already been performed at another facility prior to arrival/transfer."
* #cost "Cost / no insurance" "Financial or coverage constraints prevented the procedure (use only where applicable)."
* #unknown "Reason unknown" "Reason was not documented or is unknown."
* #consent "Consent not obtained" "Informed consent required for the procedure was not obtained."
* #only-mt "Only mechanical thrombectomy considered" "Only MT was considered; IV thrombolysis was not performed."
* #technically-not-possible "Technically not possible" "Technical/anatomical factors prevented completion."
* #no-angiography "Angiography not performed" "Required angiographic assessment was not performed."
* #other "Other reason" "Other reason not listed. Prefer adding explanatory text in statusReason.text where possible."

// --- ValueSet: Stroke Procedure Not Done Reasons ---
ValueSet: StrokeProcNotDoneReasonVS
Id: stroke-proc-not-done-reason-vs
Title: "Stroke Procedure Not Done Reason ValueSet"
Description: """ ValueSet containing the controlled vocabulary of reasons for `Procedure.statusReason` when a stroke procedure is `not-done`. """
* ^url = StrokeProcNotDoneReasonVS_URL
* ^version = "1.0.0"
* ^status = #active
* include codes from system StrokeProcNotDoneReasonCS_URL // Includes codes from the specific CS


// --- CodeSystem: Swallowing Screening Timing Category ---
CodeSystem: SwallowScreenTimeCS
Id: swallow-screen-time-cs
Title: "Swallowing Screening Timing Category CodeSystem"
Description: """ 
Local CodeSystem that categorizes when a swallowing screening occurred relative to stroke onset/admission.

**Primary use-case**
- Support process metrics such as “screening completed within 4 hours”.

**Why categories instead of timestamps**
- Some environments record a “time bucket” rather than an exact timestamp.
- Category data can still support KPI reporting even when precise times are unavailable.

**FHIR placement**
- Used as a CodeableConcept in a Procedure extension (`SwallowingScreeningTimingCategoryExt`).
"""
* ^url = SwallowScreenTimeCS_URL
* ^version = "1.0.0"
* ^title = "Swallowing Screening Timing Category Code System"
* ^description = "Temporal categories relative to stroke onset for swallowing screening."
* ^status = #active
* ^experimental = true
* ^caseSensitive = false 
* #T4H "Within 4 hours" "Screening performed within 4 hours of symptom onset."


// --- ValueSet: Swallowing Screening Timing Category ---
ValueSet: SwallowingScreeningTimingCategoryVS
Id: swallowing-screening-timing-category-vs
Title: "Swallowing Screening Timing Category ValueSet"
Description: """
ValueSet defining allowed categories for swallowing screening timing, combining:
- local categories (e.g., within 4 hours), and
- SNOMED CT qualifier concepts for post-admission timing.

**Use-case**
- Required binding for the swallowing timing extension to standardize KPI reporting across sites.
 """ 
* ^url = SwallowingScreeningTimingCategoryVS_URL
* ^version = "1.0.0"
* ^status = #active
* include codes from system SwallowScreenTimeCS_URL
* include SCT#281380002 "24 hours post admission (qualifier value)"
* include SCT#281381003 "More than 24 hours after admission (qualifier value)"

// --- CodeSystem: Procedure Timing Context ---
CodeSystem: ProcedureTimingContextCS
Id: procedure-timing-context-cs
Title: "Procedure Timing Context CodeSystem"
Description: """ 
Local CodeSystem for classifying a procedure into a **timing context** relative to encounter start.

**Primary use-case**
- Normalize reporting into acute (<24h) vs post-acute (>=24h) phases for stroke process measures.

**Why this is useful**
- It supports consistent reporting even when onset time is uncertain.
- It is designed for encounter-based operational KPIs rather than physiologic onset-based timelines.

**FHIR placement**
- Used in `ProcedureTimingContextExtension` attached to Procedure.
"""
* ^url = ProcedureTimingContextCS_URL
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^caseSensitive = false 
* #acute "Acute Phase (<24h)" "Procedure performed within 24 hours of encounter start time."
* #post-acute "Post-Acute Phase (>=24h)" "Procedure performed 24 hours or more after encounter start time."
* #unknown "Unknown/Not Applicable" "Timing relative to encounter start is unknown or not applicable."

// --- ValueSet: Procedure Timing Context ---
ValueSet: ProcedureTimingContextVS
Id: procedure-timing-context-vs
Title: "Procedure Timing Context ValueSet"
Description: """ 
ValueSet limiting allowed values for the Procedure timing context extension (acute/post-acute/unknown).

**Use-case**
- Required binding to ensure comparable phase classification across systems and sites.
 """ 
* ^url = ProcedureTimingContextVS_URL
* ^version = "1.0.0"
* ^status = #active
* include codes from system ProcedureTimingContextCS_URL


// --- CodeSystem: Swallow Screening Procedures ---
CodeSystem: SwallowProceduresCS
Id: swallow-procedures-cs
Title: "Swallow Procedures CodeSystem" 
Description: """Local CodeSystem representing swallowing screening/assessment tools often documented by acronym or local naming.

**Primary use-case**
- Provide stable, implementable codes when upstream systems cannot supply SNOMED CT equivalents.

**FHIR placement**
- Included in `SwallowProceduresVS` to be used in `Procedure.code` and (optionally) `Procedure.used.concept`.
"""
* ^url = SwallowProceduresCS_URL
* ^version = "1.0.0"
* ^status = #active
* #assist "ASSIST" "Assisted Swallowing Test (ASSIST)"
* #other "Other Swallow Procedure" "Other specified swallowing assessment procedure"
* #v-vst "V-VST" "Volume-Viscosity Swallow Test (V-VST)"

// --- ValueSet: Procedures (General) ---
ValueSet: SwallowProceduresVS
Id: swallow-procedures-vs
Title: "Swallow Procedures ValueSet"
Description: """ 
ValueSet enumerating swallowing screening/assessment procedures/tools used in stroke care.

**Primary use-case**
- Required binding for `StrokeSwallowProcedureProfile.code` to ensure the Procedure truly represents a swallow screening/assessment.

**Secondary use-case**
- Can also be used for `Procedure.used.concept` (R5) to explicitly document the tool used when:
  - `Procedure.code` is generic, or
  - you want a consistent field for “tool used” across multiple workflow variants.

**Implementation note**
- `SCT#261665006 'Unknown'´ is included only as a provisional development workaround; in production, prefer FHIR `dataAbsentReason` for missing data rather than “Unknown” as a procedure code.
"""
* ^url = SwallowProceduresVS_URL
* ^name = "SwallowProceduresValueset"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* include SCT#1290000005 "Assessment using Gugging Swallowing Screen (procedure)"
* include SCT#63913004 "Tonography with water provocation (procedure)"
* include SCT#261665006 "Unknown (qualifier value)" //Added for dev issues, provisional code
* include codes from system SwallowProceduresCS_URL


// --- ValueSet: Procedures (General) ---
ValueSet: PerforationProceduresVS_URL
Id: perforation-procedures-vs
Title: "Perforation Procedures ValueSet"
Description: """ 
ValueSet restricting Procedure codes to stroke **reperfusion interventions**:
- IV thrombolysis (IVT)
- Mechanical thrombectomy (MT)

**Primary use-case**
- Required binding for `StrokeThrombolysisProcedureProfile.code` (which covers reperfusion procedures in this IG).
""" 
* ^url = PerforationProceduresVS_URL
* ^name = "PerforationProceduresValueset"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"

* include SCT#472191000119101 "Thrombolysis of cerebral artery by intravenous infusion (procedure)"
* include SCT#397046001 "Thrombectomy of artery (procedure)"


// ------------------------- Extensions (R5 Compatible) ---------------------------
Extension: SwallowingScreeningTimingCategoryExt
Id: swallowing-screening-timing-category-ext
Title: "Swallowing Screening Timing Category Extension"
Description: """ Extension capturing the **timing category** of swallowing screening relative to stroke onset/admission.

**Primary use-case**
- KPI reporting: “swallowing screening performed within 4 hours”.

**When to use**
- When you cannot reliably store an exact timestamp (or want an additional categorical indicator even if a timestamp exists).

**How it complements base elements**
- `Procedure.occurrence[x]` stores the exact time when available.
- This extension stores a categorical bucket to support standardized reporting.
 """
* ^url = SwallowScreenTimeExt_URL
* ^version = "1.0.0"
* ^title = "Swallowing Screening Timing Category"
* ^description = "Temporal category relative to stroke onset in which the swallowing screening was performed."
* ^context[0].type = #element
* ^context[0].expression = "Procedure"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from SwallowingScreeningTimingCategoryVS_URL (required) // Use Alias

Extension: ProcedureTimingContextExtension
Id: procedure-timing-context-ext
Description: """Extension classifying the procedure into a **timing context** relative to encounter start (acute/post-acute).

**Primary use-case**
- Operational reporting where “phase of care” is needed for compliance measures.

**When to use**
- When you want a stable, comparable phase label across sites (even if absolute times differ or onset time is uncertain).

**Interpretation guidance**
- Use `acute` for procedures within 24 hours of encounter start.
- Use `post-acute` for procedures after 24 hours.
- Use `unknown` when encounter/timing data are insufficient.
"""
Title: "Procedure Timing Context Extension" 
* ^url = ProcTimingContextExt_URL
* ^version = "1.0.0"
* ^context[0].type = #element
* ^context[0].expression = "Procedure"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from ProcedureTimingContextVS_URL (required) // Use Alias

// ------------------ Profile: StrokeProcedureProfile (FHIR R5) ----------------

Profile: StrokeBrainImagingProcedureProfile
Id: stroke-brain-imaging-procedure-profile
Description: """ Profile for documenting **brain imaging performed during a stroke episode** as a FHIR R5 Procedure.

**Captures**
- `code`: imaging modality/protocol (required; standardized via BrainImagingModalityVS).
- `status`: procedure state (required).
- `statusReason`: why it was not done (when applicable).
- `occurrence[x]`: when imaging occurred (recommended/required by invariant when done locally).
- `extension[timingContext]`: acute/post-acute phase classification relative to encounter start.

**Typical scenarios**
1) Imaging completed on-site: `status=completed`, `occurrence[x]` present, `timingContext` optional.
2) Imaging not performed: `status=not-done`, `statusReason` required.
3) Imaging performed elsewhere: if your IG uses a “performed elsewhere” indicator extension, rules may allow missing on-site timestamps.

**Downstream use**
- Door-to-imaging metrics, protocol utilization, cross-site comparability.
"""
Title: "Stroke Brain Imaging Procedure Profile" 
Parent: FHIR_Procedure // R5 Procedure Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-brain-imaging-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeBrainImagingProcedureProfile"
* ^status = #active
* code from BrainImagingModalityVS_URL (required)
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
* occurrence[x] 0..1 MS
* extension contains ProcedureTimingContextExtension named timingContext 0..1 MS

Profile: StrokeCarotidImagingProcedureProfile
Id: stroke-carotid-imaging-procedure-profile
Parent: FHIR_Procedure // R5 Procedure Base
Title: "Stroke Carotid Imaging Procedure Profile"
Description: """ Profile for documenting **carotid angiography** within a stroke episode.

**Design intent**
- This profile fixes `Procedure.code` to a specific SNOMED code (angiography of carotid artery).
- If you want multiple carotid modalities, replace the fixed code with a required binding to CarotidImagingModalityVS.

**Use-cases**
- Determining whether carotid angiography was performed during the episode.
- Capturing structured “not done” reasons for audit and quality improvement.
"""
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-carotid-imaging-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeCarotidImagingProcedureProfile"
* ^status = #active
* code = SCT#58920005 "Angiography of carotid artery (procedure)"
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
* extension contains ProcedureTimingContextExtension named timingContext 0..1 MS


Profile: StrokeThrombolysisProcedureProfile
Id: stroke-mechanical-procedure-profile 
Title: "Stroke Thrombolysis Procedure Profile" 
Description: """Profile for documenting **stroke reperfusion procedures** as FHIR Procedure:
- IV thrombolysis (IVT)
- Mechanical thrombectomy (MT)

**Captures**
- `code`: restricted to reperfusion procedures (PerforationProceduresVS).
- `status`: completed/not-done/etc.
- `statusReason`: controlled reason set when not done.
- `occurrence[x]` (constrained to Period): start/end time of the intervention when available.
- `complication`: complications (as CodeableReference to Condition) — constrained by invariants.
- `extension[timingContext]`: acute/post-acute phase classification.

**Use-cases**
- Time-to-treatment metrics (door-to-needle, door-to-groin), service evaluation.
- Structured documentation of “why not treated” for QI programs.
- Safety monitoring for procedural complications. """ 

Parent: FHIR_Procedure // R5 Procedure Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-mechanical-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeThrombolysisProcedureProfile"
* ^status = #active
* code from PerforationProceduresVS_URL (required)
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
* occurrence[x] 0..1 MS
* occurrence[x] only Period
* occurrence[x].start 0..1 MS
* occurrence[x].end 0..1 MS
* complication 0..* MS
* complication only CodeableReference(FHIR_Condition)
* extension contains ProcedureTimingContextExtension named timingContext 0..1 MS

Profile: StrokeSwallowProcedureProfile
Id: stroke-swallow-procedure-profile
Parent: FHIR_Procedure // R5 Procedure Base
Title: "Stroke Swallow Procedure Profile"
Description: """ Profile for documenting **swallow screening / dysphagia assessment** during a stroke episode.

**Captures**
- `code`: the screening/assessment procedure or tool used (SwallowProceduresVS).
- `status`: whether completed or not done.
- `statusReason`: controlled reason set when not done.
- `extension[screeningTimingCategory]`: timing bucket (e.g., within 4h) for KPI reporting.
- `extension[timingContext]`: acute/post-acute phase relative to encounter start.
- `used.concept` (R5): explicitly documents the tool used, especially when:
  - `code` is generic, or
  - you want a consistent “tool used” field for analytics and comparison.

**Use-cases**
- Compliance monitoring: swallow screen performed early after stroke.
- Tool utilization analysis (GUSS vs V-VST vs others).
- Supporting aspiration pneumonia prevention workflows.
""" 
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-swallow-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeSwallowProcedureProfile"
* ^status = #active
* code from SwallowProceduresVS_URL (required)
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
// --- Applicable Extensions ---
* extension contains SwallowingScreeningTimingCategoryExt named screeningTimingCategory 0..1 MS and
    ProcedureTimingContextExtension named timingContext 0..1 MS

// --- Invariants (R5 Paths Updated) ---
Invariant: reason-required-if-not-done
Description: "If Procedure.status is 'not-done', Procedure.statusReason must be present to support auditability and quality improvement."
Severity: #error
Expression: "status = 'not-done' implies statusReason.exists()"


// Rule 2: brain imaging completed on-site must have occurrence[x].
// Use-case: enables time-to-imaging metrics (door-to-imaging). Allows exemption if performed elsewhere indicator is true.
Invariant: brain-imaging-timestamp-required
Description: "If brain imaging is completed and not performed elsewhere, occurrence[x] must be recorded for timing metrics and traceability."
Severity: #error
Expression: "code.memberOf('http://tecnomod-um.org/ValueSet/brain-imaging-modality-vs') and status = 'completed' and (extension('http://tecnomod-um.org/StructureDefinition/procedure-performed-elsewhere-indicator-ext').exists().not() or extension('http://tecnomod-um.org/StructureDefinition/procedure-performed-elsewhere-indicator-ext').valueBoolean = false) implies occurrence.exists()"


// Rule 3: MT not-done -> statusReason must come from the controlled ValueSet.
// Use-case: comparable reasons across sites for MT non-performance.
Invariant: mt-not-done-reason-binding
Description: "If the procedure is mechanical thrombectomy and status='not-done', statusReason must be from StrokeProcNotDoneReasonVS."
Severity: #error
Expression: "code.coding.where(system = 'http://snomed.info/sct' and code = '397046001').exists() and status = 'not-done' implies statusReason.memberOf('http://tecnomod-um.org/ValueSet/stroke-proc-not-done-reason-vs')"


// Rule 4: IVT not-done -> statusReason must come from the controlled ValueSet.
Invariant: ivt-not-done-reason-binding
Description: "If the procedure is IV thrombolysis and status='not-done', statusReason must be from StrokeProcNotDoneReasonVS."
Severity: #error
Expression: "code.coding.where(system = 'http://snomed.info/sct' and code = '472191000119101').exists() and status = 'not-done' implies statusReason.memberOf('http://tecnomod-um.org/ValueSet/stroke-proc-not-done-reason-vs')"


// Rule 5: complications only apply to completed thrombectomies.
// Use-case: prevents complications being recorded on non-completed or non-thrombectomy procedures.
Invariant: mt-complication-only-if-completed
Description: "If complication exists, the procedure must be a completed mechanical thrombectomy to maintain clinical and analytic consistency."
Severity: #error
Expression: "complication.exists() implies (code.coding.where(system = 'http://snomed.info/sct' and code = '397046001').exists() and status = 'completed')"


// Rule 6: swallow screening completed -> used.concept should be present and in SwallowProceduresVS.
// Use-case: ensures the screening tool is captured for tool-comparison analytics.
// NOTE: This uses SwallowProceduresVS_URL (an existing alias) instead of an undefined SwallowingScreeningToolVS.
Invariant: screening-tool-required
Description: "When a swallow screening/assessment is completed, used.concept should be specified and drawn from SwallowProceduresVS to support tool-level analytics."
Severity: #warning
Expression: "code.memberOf('http://tecnomod-um.org/ValueSet/swallow-procedures-vs') and status = 'completed' implies used.concept.exists() and used.concept.memberOf('http://tecnomod-um.org/ValueSet/swallow-procedures-vs')"


// Rule 7: swallow screening completed -> timing category extension must be present.
// Use-case: KPI reporting (e.g., within 4 hours) even when timestamps are uncertain.
Invariant: screening-timing-required
Description: "When a swallow screening/assessment is completed, the timing category extension must be present to support standardized KPI reporting."
Severity: #error
Expression: "code.memberOf('http://tecnomod-um.org/ValueSet/swallow-procedures-vs') and status = 'completed' implies extension('http://tecnomod-um.org/StructureDefinition/swallowing-screening-timing-category-ext').exists()"


// Instance: StrokeBrainImagingExample
Instance: StrokeBrainImagingExample
InstanceOf: StrokeBrainImagingProcedureProfile
* extension[timingContext].valueCodeableConcept = ProcedureTimingContextCS_URL#acute "Acute Phase (<24h)"
* status = #completed
* code = SCT#419949007 "Computed tomography angiography of intracranial artery with contrast (procedure)"
* occurrenceDateTime = 2025-03-01T10:00:00Z
* subject = Reference(PatientExample)

// Instance: StrokeCarotidImagingExample
Instance: StrokeCarotidImagingExample
InstanceOf: StrokeCarotidImagingProcedureProfile
* extension[timingContext].valueCodeableConcept = ProcedureTimingContextCS_URL#post-acute "Post-Acute Phase (>=24h)"
* status = #not-done
* statusReason = StrokeProcNotDoneReasonCS_URL#unknown "Reason Unknown"
* code = SCT#58920005 "Angiography of carotid artery (procedure)"
* occurrencePeriod.start = 2025-03-01T10:00:00Z
* occurrencePeriod.end = 2025-03-01T10:30:00Z
* subject = Reference(PatientExample)


// Instance: StrokeThrombolysisExample
Instance: StrokeThrombolysisExample
InstanceOf: StrokeThrombolysisProcedureProfile
* extension[timingContext].valueCodeableConcept = ProcedureTimingContextCS_URL#unknown "Unknown/Not Applicable" 
* status = #completed
* code = SCT#472191000119101 "Thrombolysis of cerebral artery by intravenous infusion (procedure)"
* occurrencePeriod.start = 2025-03-01T10:00:00Z
* occurrencePeriod.end = 2025-03-01T10:30:00Z
* subject = Reference(PatientExample)

// Instance: StrokeSwallowingExample
Instance: StrokeSwallowingExample
InstanceOf: StrokeSwallowProcedureProfile
* extension[screeningTimingCategory].valueCodeableConcept = SwallowScreenTimeCS_URL#T4H "Within 4 hours"
* extension[timingContext].valueCodeableConcept   = ProcedureTimingContextCS_URL#acute "Acute Phase (<24h)"
* status      = #completed
* code        = SCT#1290000005 "Assessment using Gugging Swallowing Screen (procedure)"
* used.concept = SCT#1290000005 "Assessment using Gugging Swallowing Screen (procedure)"
* occurrenceDateTime = 2025-03-01T10:00:00Z
* subject     = Reference(PatientExample)
