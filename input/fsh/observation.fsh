// ------------------------- Aliases ----------------------------------
Alias: SCT = http://snomed.info/sct
Alias: LOINC = http://loinc.org
Alias: UCUM = https://ucum.org/ucum
Alias: ObsCatCS = http://terminology.hl7.org/CodeSystem/observation-category
Alias: ObsInterpCS = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation

// FHIR R5 Resource Aliases
Alias: FHIR_Observation = http://hl7.org/fhir/StructureDefinition/Observation
Alias: FHIR_Patient = http://hl7.org/fhir/StructureDefinition/Patient
Alias: FHIR_Encounter = http://hl7.org/fhir/StructureDefinition/Encounter
Alias: FHIR_Procedure = http://hl7.org/fhir/StructureDefinition/Procedure
Alias: FHIR_Extension = http://hl7.org/fhir/StructureDefinition/Extension // Alias for Extension base
Alias: FHIR_CodeableConcept = http://hl7.org/fhir/StructureDefinition/CodeableConcept

// URLs for Custom CodeSystems
Alias: AssessmentContextCS_URL = http://tecnomod-um.org/CodeSystem/assessment-context-cs
Alias: MticiScoreCS_URL = http://tecnomod-um.org/CodeSystem/mtici-score-cs
Alias: MticiCodeCS_URL = http://tecnomod-um.org/CodeSystem/mtici-code-cs
Alias: TimingMetricCodesCS_URL = http://tecnomod-um.org/CodeSystem/timing-metric-codes-cs
Alias: StrokeCircumstanceCodesCS_URL = http://tecnomod-um.org/CodeSystem/stroke-circumstance-codes-cs
Alias: AfibFlutterStatusCS_URL = http://tecnomod-um.org/CodeSystem/afib-flutter-status-cs
Alias: MRsScoreCS_URL = http://tecnomod-um.org/CodeSystem/mrs-score-cs

// URLs for ValueSets
Alias: AfibFlutterStatusVS_URL = http://tecnomod-um.org/ValueSet/afib-flutter-status-vs
Alias: MticiScoreVS_URL = http://tecnomod-um.org/ValueSet/mtici-score-vs
Alias: AssessmentContextVS_URL = http://tecnomod-um.org/ValueSet/assessment-context-vs
Alias: MRsScoreVS_URL = http://tecnomod-um.org/ValueSet/mrs-score-vs
Alias: VitalSignCodesVS_URL = http://tecnomod-um.org/ValueSet/vital-sign-codes-vs
Alias: FunctionalScoreCodesVS_URL = http://tecnomod-um.org/ValueSet/functional-score-codes-vs
Alias: TimingMetricCodesVS_URL = http://tecnomod-um.org/ValueSet/timing-metric-codes-vs
Alias: StrokeCircumstanceCodesVS_URL = http://tecnomod-um.org/ValueSet/stroke-circumstance-codes-vs
Alias: SpecificFindingCodesVS_URL = http://tecnomod-um.org/ValueSet/specific-finding-codes-vs
Alias: StrokeFindingCodesVS_URL = http://tecnomod-um.org/ValueSet/stroke-finding-codes-vs
Alias: MticiCodeVS_URL = http://tecnomod-um.org/ValueSet/mtici-code-vs
//Extension
Alias: ObsTimingContextExt_URL = http://tecnomod-um.org/StructureDefinition/observation-timing-context-ext


// ------------------------- Custom CodeSystems & ValueSets (English) -------------


// // --- CodeSystem for Atrial Fibrillation/Flutter Status ---
// CodeSystem: AfibFlutterStatusCS
// Id: afib-flutter-status-cs
// * ^url = AfibFlutterStatusCS_URL
// * ^version = "1.0.0"
// * ^title = "Atrial Fibrillation or Flutter Status Codes"
// * ^description = "Codes representing the status of Atrial Fibrillation or Flutter assessment."
// * ^status = #active
// * ^experimental = true 
// * ^caseSensitive = false     
// * #detected "Detected" "Indicates that atrial fibrillation or flutter has been identified during screening or recent evaluation."
// * #known-af "Known AF" "Signifies that the patient has a pre-existing, documented diagnosis of atrial fibrillation."
// * #no-af "No AF" "Denotes that the patient does not exhibit atrial fibrillation or atrial flutter."
// * #not-screened "Not Screened" "Means that no screening for atrial fibrillation or flutter has been performed."

// --- ValueSet for Atrial Fibrillation/Flutter Status ---
ValueSet: AfibFlutterStatusVS
Id: afib-flutter-status-vs
Title: "Atrial Fibrillation / Flutter Assessment Status ValueSet"
Description: """
This ValueSet constrains the allowable coded outcomes for documenting the **status of an AF/flutter assessment** within the stroke workflow.

**Primary use-case**
- Bind to `Observation.valueCodeableConcept` in the `SpecificFindingObservationProfile` when `Observation.code` refers to AF/flutter as a finding focus.
- Enables harmonized interpretation for analytics and decision support (e.g., anticoagulation pathway triggers) without forcing a Condition assertion.

**Scope and modeling notes**
- This ValueSet expresses *assessment outcome/status* (detected/known/absent/not screened/unknown).
- It does not replace Condition for diagnoses. When AF/flutter is confirmed as a diagnosis, represent it as a `Condition` with the appropriate SNOMED CT disorder code.
"""
* ^url = AfibFlutterStatusVS_URL
* ^version = "1.0.0"
* ^status = #active
* ^date = "2025-03-31"
* ^publisher = "Tecnomod"
* ^contact[0].name = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^contact[0].telecom[1].value = "cmartinezcosta@um.es"
* SCT#410515003 "Known present (qualifier value)"
* SCT#410516002 "Known absent (qualifier value)"
* SCT#261665006 "Unknown (qualifier value)"

// --- CodeSystem for mTICI Score ---
CodeSystem: MticiScoreCS
Id: mtici-score-cs
Title: "Modified Treatment in Cerebral Infarction Grade Score CodeSystem"
Description: """
This CodeSystem defines the **modified Thrombolysis in Cerebral Infarction (mTICI)** reperfusion grade values.
mTICI is an ordinal angiographic scale used to quantify the extent of reperfusion after endovascular therapy for acute ischemic stroke.

**Primary use-case**
- Use as the coded result in `Observation.valueCodeableConcept` (bound via MticiScoreVS) when recording the *final angiographic reperfusion grade*.

**Modeling notes**
- Represents the *final* reperfusion grade for the downstream ischemic territory (typically adjudicated from the final angiographic run).
- Does not encode target vessel, device/technique, number of passes, timestamps, or adjudication workflow; capture those via Procedure, ImagingStudy, Observation.method, or additional Observations/Provenance.
"""
* ^url = MticiScoreCS_URL
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = false  
* ^date = "2025-03-31"
* ^publisher = "Tecnomod"
* ^contact[0].name = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^contact[0].telecom[1].value = "cmartinezcosta@um.es"
* #0  "Grade 0: No perfusion"
      "No antegrade flow beyond the occlusion; no angiographic reperfusion of the downstream territory attributable to the treated vessel."
* #1  "Grade 1: Antegrade reperfusion past the initial occlusion, but limited distal branch filling with little or slow distal reperfusion"
      "Minimal reperfusion: contrast passes the original occlusion with limited distal branch opacification and little or delayed tissue-level reperfusion."
* #2a "Grade 2a: Antegrade reperfusion of less than half of the occluded target artery previously ischemic territory"
      "Partial reperfusion of <50% of the downstream ischemic territory supplied by the previously occluded target artery."
* #2b "Grade 2b: Antegrade reperfusion of more than half of the previously occluded target artery ischemic territory"
      "Substantial reperfusion of ≥50% of the downstream ischemic territory supplied by the previously occluded target artery."
* #2c "Grade 2c: Near complete perfusion except for slow flow or distal emboli in a few distal cortical vessels"
      "Near-complete reperfusion with only minor residual deficits, typically due to slow flow and/or small distal emboli affecting a limited number of distal cortical vessels."
* #3  "Grade 3: Complete antegrade reperfusion of the previously occluded target artery ischemic territory, with absence of visualized occlusion in all distal branches"
      "Complete reperfusion of the downstream ischemic territory with normal/near-normal antegrade flow and no visualized occlusion in distal branches of the treated vascular territory."


// --- ValueSet for mTICI Score ---
ValueSet: MTICIScoreValueSet
Id: mtici-score-vs 
Title: "Modified Treatment in Cerebral Infarction Grade Score ValueSet"
Description: """
This ValueSet enumerates all allowable Modified Treatment in Cerebral Infarction reperfusion grade values (0, 1, 2a, 2b, 2c, 3) from MticiScoreCS.

**Primary use-case**
- Required binding to `Observation.valueCodeableConcept` when an Observation represents an mTICI grade outcome.

**Why a dedicated ValueSet**
- Ensures consistent coding across implementations and sites.
- Enables reliable registry reporting, audit/quality measurement, and research analytics.
"""
* ^url = MticiScoreVS_URL
* ^version = "1.0.0"
* ^name = "MTICIScoreValueSet" // Added name from JSON
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Tecnomod"
* ^contact[0].name = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^contact[0].telecom[1].value = "cmartinezcosta@um.es"
* include codes from system MticiScoreCS_URL

// --- CodeSystem for modified Rankin Scale (mRS) Score ---
CodeSystem: MRsScoreCS
Title: "Modified Rankin Scale Score Code System"
Description: """
This CodeSystem defines codes for the **modified Rankin Scale (mRS)**, an ordinal measure of global disability and functional outcome.
Scores range from 0 (no symptoms) to 5 (severe disability), with 6 indicating death.

**Primary use-case**
- Use as the coded result in `Observation.valueCodeableConcept` (bound via MRsScoreVS) when recording an mRS outcome.

**Modeling notes**
- mRS is a global disability scale and does not capture domain-specific limitations (mobility, ADLs, cognition).
  Capture those via additional instruments/Observations when needed.
- Method of ascertainment and assessor details should be recorded separately (e.g., Observation.method, performer, Provenance).
"""
Id: mrs-score-cs
* ^url = MRsScoreCS_URL
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true  
* ^caseSensitive = false
* #0 "No symptoms" "No symptoms at all."
* #1 "No significant disability" "Despite symptoms; able to carry out all usual duties and activities."
* #2 "Slight disability" "Unable to carry out all previous activities, but able to look after own affairs without assistance."
* #3 "Moderate disability" "Requiring some help, but able to walk without assistance."
* #4 "Moderately severe disability" "Unable to walk without assistance and unable to attend to own bodily needs without assistance."
* #5 "Severe disability" "Bedridden, incontinent and requiring constant nursing care and attention."
* #6 "Dead" "Patient deceased."

// --- ValueSet for mRS Score ---
ValueSet: MRsScoreVS
Id: mrs-score-vs
Description: """
This ValueSet includes all mRS grades (0–6) defined in MRsScoreCS.

**Primary use-case**
- Bind to `Observation.valueCodeableConcept` when `Observation.code` indicates the Observation represents an mRS score.
"""
Title: "Modified Rankin Scale Score Valueset"
* ^url = MRsScoreVS_URL
* ^version = "1.0.0"
* ^title = "Modified Rankin Scale (mRS) Score ValueSet"
* ^status = #active
* ^experimental = true
* include codes from system MRsScoreCS_URL

// --- CodeSystem for Assessment Context (for mRS/NIHSS) ---
CodeSystem: AssessmentContextCS
Id: assessment-context-cs
Description: """
This CodeSystem defines normalized codes for the **clinical context / relative timepoint** at which a stroke-related assessment is performed.
It is primarily used to contextualize instruments whose interpretation depends on phase (e.g., mRS/NIHSS at baseline vs discharge vs follow-up).

**Primary use-case**
- Use as the value in `ObservationTimingContextExtension.valueCodeableConcept` to label the phase of an assessment.

**How it complements effective[x]**
- `Observation.effective[x]` records the actual date/time (when known).
- This CodeSystem records the standardized phase label used for reporting and comparability.

**Why this is needed**
- Many workflows report outcomes by phase even when the exact timestamp is unknown or operationally variable (“mRS at 90 days”).
"""
Title: "Assessment Context CodeSystem"
* ^url = AssessmentContextCS_URL
* ^version = "1.0.0"
* ^title = "Assessment Context Code System"
* ^status = #active
* ^experimental = true 
* ^caseSensitive = false    
* #pre-stroke "Pre-stroke"
    "Assessment reflects the patient’s baseline state prior to the index stroke event (pre-morbid status), typically derived from history or collateral information."
* #admission "Admission"
    "Assessment performed at, or shortly after, presentation/admission for the index stroke event (acute phase baseline for in-hospital care)."
* #discharge "Discharge"
    "Assessment performed at the time of discharge from the acute admission (or the end of the index hospitalization episode)."
* #3-month "3-Month Follow-up"
    "Assessment performed at approximately 3 months (≈90 days) after discharge/index event, acknowledging operational windows used in routine follow-up and research."

// --- ValueSet for Assessment Context ---
ValueSet: AssessmentContextVS
Id: assessment-context-vs
Description: """
This ValueSet includes all phase/context codes from AssessmentContextCS.

**Primary use-case**
- Required binding for elements that must indicate the clinical phase of an assessment (e.g., timing context extensions).
"""
Title: "Assessment Context ValueSet"
* ^url = AssessmentContextVS_URL
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true 
* include codes from system AssessmentContextCS_URL

// --- ValueSets for Observation.code Groupings ---
ValueSet: VitalSignCodesVS
Id: vital-sign-codes-vs
Description: """
This ValueSet defines SNOMED CT observable-entity codes for blood pressure components captured as vital signs:
- Systolic blood pressure
- Diastolic blood pressure

**Primary use-case**
- Bind to `Observation.component.code` in a single blood pressure Observation that records both components.

**Implementation guidance**
- Use `Observation.component.valueQuantity` with UCUM `mm[Hg]`.
- Repeat the Observation across time with different `effective[x]` timestamps for monitoring.
"""
Title: "Stroke Vital Sign Codes ValueSet"
* ^url = VitalSignCodesVS_URL
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* include SCT#271649006 "Systolic blood pressure (observable entity)"
* include SCT#271650006 "Diastolic blood pressure (observable entity)"

ValueSet: FunctionalScoreCodesVS
Id: functional-score-codes-vs
Description: """
This ValueSet constrains `Observation.code` for functional outcome and severity instruments represented in this guide:
- Modified Rankin Scale score (mRS)
- NIH Stroke Scale total score (NIHSS)

**Primary use-case**
- Bind to `Observation.code` in `FunctionalScoreObservationProfile`.

**Datatype expectations enforced via invariants**
- mRS: `Observation.valueCodeableConcept` bound to MRsScoreVS (ordinal categories 0–6).
- NIHSS: `Observation.valueInteger` as total NIHSS score.
"""
Title : "Stroke Functional Score Codes ValueSet"
* ^url = FunctionalScoreCodesVS_URL
* ^version = "1.0.0"
* ^status = #active
* include SCT#1255866005 "Modified Rankin Scale score (observable entity)"
* include SCT#450743008 "National Institutes of Health stroke scale score (observable entity)"

CodeSystem: TimingMetricCodesCS
Id: timing-metric-codes-cs
Description: """
This CodeSystem defines codes for key **time-interval process metrics** in acute stroke care.
Each code represents a duration measured between two clinically meaningful events (e.g., arrival to thrombolysis start).

**Primary use-case**
- Use as `Observation.code` in `TimingMetricObservationProfile`.
- Store the measured interval in `Observation.valueQuantity` with UCUM minutes (`min`).
"""
Title : "Stroke Timing Metric Codes CodeSystem"
* ^url = TimingMetricCodesCS_URL
* ^version = "1.0.0"
* ^status = #active
* #D2G "Door to Groin"
    "Elapsed time (minutes) from documented hospital arrival (‘door’) to arterial groin puncture for mechanical thrombectomy (first puncture attempt)."
* #D2N "Door to Needle"
    "Elapsed time (minutes) from documented hospital arrival (‘door’) to initiation of intravenous thrombolysis (commonly alteplase/tenecteplase administration start, per local definition)."

ValueSet: TimingMetricCodesVS
Id: timing-metric-codes-vs
Description: """
This ValueSet includes all timing metric codes from TimingMetricCodesCS.

**Primary use-case**
- Required binding for `TimingMetricObservationProfile.code` to ensure only approved metrics are captured.
"""
Title : "Stroke Timing Metric Codes ValueSet"
* ^url = TimingMetricCodesVS_URL
* ^version = "1.0.0"
* ^status = #active
* include codes from system TimingMetricCodesCS_URL

CodeSystem: StrokeCircumstanceCodesCS
Id: stroke-circumstance-codes-cs
Title : "Stroke Circumstance Codes CodeSystem"
Description: """
This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant when onset time is unknown or atypical.

**Primary use-case**
- Use as `Observation.code` in `StrokeCircumstanceObservationProfile`.
- Presence of the Observation asserts that the circumstance applies to the index stroke event.
"""
* ^url = StrokeCircumstanceCodesCS_URL
* ^version = "1.0.0"
* ^status = #active
* #in-hospital "In-hospital Stroke"
    "Indicates that stroke onset occurred while the patient was already admitted to the hospital for another reason (inpatient onset)."
* #wake-up "Wake-up Stroke"
    "Indicates that stroke symptoms were first recognized on awakening from sleep, implying an unknown onset time within the sleep interval (time last known well precedes symptom recognition)."

ValueSet: StrokeCircumstanceCodesVS
Id: stroke-circumstance-codes-vs
Title: "Stroke Circumstance Codes ValueSet"
Description: """
This ValueSet includes all onset-circumstance codes from StrokeCircumstanceCodesCS.

**Primary use-case**
- Required binding for `StrokeCircumstanceObservationProfile.code`.
"""
* ^url = StrokeCircumstanceCodesVS_URL
* ^version = "1.0.0"
* ^status = #active
* include codes from system StrokeCircumstanceCodesCS_URL

ValueSet: SpecificFindingCodesVS
Id: specific-finding-codes-vs
Description: """
This ValueSet provides SNOMED CT disorder concepts for specific findings referenced in the stroke workup.
Currently includes:
- Atrial fibrillation (disorder)
- Atrial flutter (disorder)

**Primary use-case**
- Constrain `Observation.code` (as a *finding focus*) when using `SpecificFindingObservationProfile`.

**Important modeling note**
- Using a disorder concept in `Observation.code` here does not necessarily assert a diagnosis; the diagnosis should be modeled as a Condition.
- The Observation can be interpreted as “assessment about this finding,” with the result in `Observation.valueCodeableConcept` (e.g., AF status).
"""
Title: "Specific Stroke Finding Codes ValueSet"
* ^url = SpecificFindingCodesVS_URL
* ^version = "1.0.0"
* ^status = #active
* include SCT#49436004 "Atrial fibrillation (disorder)"
* include SCT#5370000 "Atrial flutter (disorder)"

CodeSystem: MTICICodeCS
Id: mtici-code-cs
Description: """
This CodeSystem defines the *assessment concept code* used to indicate that an Observation is reporting an mTICI reperfusion grade.

**Design pattern**
- `Observation.code` identifies the kind of assessment (“mTICI reperfusion grade”).
- `Observation.valueCodeableConcept` carries the result (one of the grades in MticiScoreVS).
"""
Title: "Modified Thrombolysis in Cerebral Infarction Assessment CodeSystem"
* ^url = MticiCodeCS_URL
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^caseSensitive = false
* #mTICI "mTICI" "Assessment concept representing the modified Thrombolysis in Cerebral Infarction reperfusion grade to be reported as an Observation value."

ValueSet: MTICICodeVS
Id: mtici-code-vs
Description: """
This ValueSet includes the mTICI assessment concept code(s) from MTICICodeCS.

**Primary use-case**
- Bind to `Observation.code` when recording an mTICI reperfusion grade Observation.
- Pair with `Observation.valueCodeableConcept` bound to MticiScoreVS.
"""
Title: "Modified Thrombolysis in Cerebral Infarction Assessment ValueSet"
* ^url = MticiCodeVS_URL
* ^version = "1.0.0"
* ^status = #active
* include codes from system MticiCodeCS_URL

ValueSet: StrokeFindingCodesVS
Id: stroke-finding-codes-vs
Title : "Specific Stroke Finding Codes ValueSet"
Description: """
This ValueSet aggregates coded Observation.code concepts used by `SpecificFindingObservationProfile`.

It currently includes:
- Specific disorder concepts used as a finding focus (SpecificFindingCodesVS), and
- The mTICI assessment concept (MTICICodeVS).

**How to interpret usage**
- If `Observation.code` is a disorder concept (e.g., AF), the Observation should be interpreted as an assessment about that finding,
  with the result/status carried in `Observation.valueCodeableConcept` (e.g., AfibFlutterStatusVS).
- If `Observation.code` is an assessment concept (e.g., mTICI), `Observation.valueCodeableConcept` carries the score (MticiScoreVS).
"""
* ^url = StrokeFindingCodesVS_URL
* ^version = "1.0.0"
* ^status = #active
* include codes from valueset SpecificFindingCodesVS_URL
* include codes from valueset MticiCodeVS_URL


// ------------------------- Extensions -------------------------------

Extension: ObservationTimingContextExtension
Id: observation-timing-context-ext
Title : "Observation Timing Context Extension"
Description: """
This extension captures the **clinical timing context (phase)** in which an observation or assessment was made
(e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up).

**Primary use-case**
- Required for functional outcomes and severity scores whose interpretation depends on *when* the score was assessed.

**How it complements Observation.effective[x]**
- `effective[x]` records the actual measurement date/time (when known),
- This extension records the standardized phase label used for reporting and cross-site comparability.

**Binding**
- `valueCodeableConcept` is bound (required) to AssessmentContextVS.
"""
* ^url = ObsTimingContextExt_URL
* ^context[0].type = #element
* ^context[0].expression = "Observation" // Applied to Observation resource
* value[x] only CodeableConcept
* value[x] 1..1 // Value must be present if extension is used
* value[x] from AssessmentContextVS_URL (required) // Bind to the AssessmentContextVS

// ------------------------- Observation Profiles (FHIR R5) ----------------------

// --- Base Profile (Common Constraints) ---
Profile: BaseStrokeObservation
Id: base-stroke-observation
Parent: FHIR_Observation 
Title: "Base Profile for Observation"
Description: """
Common constraints for Observations captured in the context of stroke care across acute management and follow-up.
This base profile establishes a consistent minimum dataset and reference structure so specialized observation profiles behave uniformly.

**Key modeling intent**
- `Observation.status` is fixed to `final` to represent finalized results suitable for reporting and analytics.
- `Observation.subject` (Patient) and `Observation.encounter` (index stroke encounter) are mandatory for attribution.
- `Observation.partOf` optionally links the Observation to a Procedure (e.g., thrombectomy) when the Observation represents a procedural outcome (e.g., mTICI).
- `Observation.effective[x]` is optional to support cases where only a phase label is known; populate when available for sequencing and analysis.

"""

* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/base-stroke-observation"
* ^version = "1.0.0"
* ^title = "Base Profile for Stroke-Related Observations"
* ^status = #active
* status = #final 
* status MS
* subject 1..1 MS
* subject only Reference(FHIR_Patient)
* encounter 1..1 MS
* encounter only Reference(FHIR_Encounter)
* effective[x] 0..1 MS
* partOf 0..1 MS
* partOf only Reference(FHIR_Procedure)

// --- Vital Sign Observation Profile ---
Profile: VitalSignObservationProfile
Id: vital-sign-observation-profile
Parent: BaseStrokeObservation
Title: "Stroke Vital Sign Observation Profile"
Description: """
Profile for recording blood pressure vital signs in stroke patients using a single Observation with components.
The Observation is categorized as `vital-signs` and uses component entries for systolic and diastolic blood pressure.

**Primary use-case**
- Record repeated BP measurements across the episode (arrival, post-thrombolysis monitoring, ICU) by creating multiple Observations with different `effective[x]`.

**Representation**
- `Observation.component.code` bound to VitalSignCodesVS.
- `Observation.component.valueQuantity` in UCUM mm[Hg].

**Typical scenarios**
1) One Observation with two components (systolic and diastolic) recorded at the same timepoint.
2) Multiple Observations over time, each with the same component structure, to track BP trends during acute management and monitoring.
"""
* ^url = "http://tecnomod-um.org/StructureDefinition/vital-sign-observation-profile"
* ^version = "1.0.0"
* ^name = "VitalSignObservationProfile"
* category = ObsCatCS#vital-signs
* category 1..1 MS
* code 1..1 MS
* code = SCT#61746007 "Taking patient vital signs (procedure)"
* component 0..* MS
* component.code 1..1 MS
* component.code from VitalSignCodesVS_URL (required)
* component.value[x] 1..1 MS
* component.value[x] only Quantity
* component.value[x].unit = "millimeter Mercury column"
* component.value[x].system = UCUM
* component.value[x].code = #"mm[Hg]"



// --- Functional Score Observation Profile --- *** UPDATED: Uses Extension ***
Profile: FunctionalScoreObservationProfile
Id: functional-score-observation-profile
Parent: BaseStrokeObservation
Title: "Stroke Functional Score Observation Profile"
Description: """
Profile for recording stroke functional outcome and severity scores (currently mRS and NIHSS) in an interoperable, context-aware way.

**Primary use-case**
- Capture outcomes by phase (baseline, admission, discharge, ~90-day follow-up) using a required timing context extension.

**Key constraints**
- `Observation.code` is bound to FunctionalScoreCodesVS (mRS or NIHSS).
- `extension[timingContext]` is mandatory to label the clinical phase.
- Datatype and binding rules are enforced via invariants:
  - mRS → `valueCodeableConcept` bound to MRsScoreVS.
  - NIHSS → `valueInteger` as total NIHSS score.

**Typical scenarios**
1) An mRS score assessed at discharge would have `Observation.code` = mRS code, `valueCodeableConcept` = mRS grade (0–6), and the timing context extension value = discharge.
2) An NIHSS score assessed at admission would have `Observation.code` = NIHSS code, `valueInteger` = total NIHSS score, and the timing context extension value = admission.
"""
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/functional-score-observation-profile"
* ^version = "1.1.0"
* ^name = "FunctionalScoreObservationProfile"
* extension contains ObservationTimingContextExtension named timingContext 1..1 MS 
* category = ObsCatCS#exam
* category 1..1 MS
* code 1..1 MS
* code from FunctionalScoreCodesVS_URL (required)
* value[x] 1..1 MS
* valueInteger 0..1 MS
* valueCodeableConcept 0..1 MS

* valueCodeableConcept from MRsScoreVS_URL
* valueCodeableConcept 0..1 MS
* valueCodeableConcept ^condition = "obs-mrs-code"

* valueQuantity ^condition = "obs-nihss-code"



Profile: TimingMetricObservationProfile
Id: timing-metric-observation-profile
Parent: BaseStrokeObservation
Title : "Stroke Timing Metric Observation Profile (R5)"
Description: """
Profile for recording acute stroke process timing metrics as measured durations (e.g., Door-to-Needle, Door-to-Groin).

**Primary use-case**
- Quality monitoring and pathway optimization where the interval value is the primary datum.

**Representation**
- `Observation.code` bound to TimingMetricCodesVS.
- `Observation.valueQuantity` as UCUM minutes (`min`).

**Typical scenarios**
1) A Door-to-Needle time of 45 minutes would be represented as an Observation with `code` = D2N code, `valueQuantity` = 45, `valueQuantity.unit` = "minute", and the appropriate UCUM system/code.
2) A Door-to-Groin time of 90 minutes would be represented similarly with `code` = D2G code and `valueQuantity` = 90.

"""
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/timing-metric-observation-profile"
* ^version = "1.0.0"
* ^name = "TimingMetricObservationProfile"
* category = ObsCatCS#procedure
* category 1..1 
* category MS
* code 1..1
* code MS
* code from TimingMetricCodesVS_URL (required)
* value[x] 1..1 MS
* value[x] only Quantity
* value[x].unit = "minute"
* value[x].system = UCUM
* value[x].code = #min
* hasMember 0..* MS
* hasMember only Reference(FHIR_Observation)

// --- Stroke Circumstance Observation Profile --- (No changes needed here)
Profile: StrokeCircumstanceObservationProfile
Id: stroke-circumstance-observation-profile
Parent: BaseStrokeObservation
Title : "Stroke Circumstance Observation Profile (R5)"
Description: """
Profile for documenting clinically relevant circumstances of stroke symptom onset (e.g., wake-up stroke, in-hospital onset).

**Primary use-case**
- Capture onset circumstance classification for eligibility reasoning, protocol stratification, and reporting when onset time is uncertain.

**Representation**
- `Observation.code` bound to StrokeCircumstanceCodesVS.
- Presence of the Observation asserts the circumstance applies to the index stroke event (within the linked Encounter).

**Typical scenarios**
1) A patient who wakes up with stroke symptoms would have an Observation with `code` = wake-up stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is a wake-up stroke.
2) A patient who experiences stroke symptoms while already admitted for another reason would have an Observation with `code` = in-hospital stroke code, linked to the index stroke Encounter, indicating that the stroke onset circumstance is in-hospital onset.

"""
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-circumstance-observation-profile"
* ^version = "1.0.0"
* ^name = "StrokeCircumstanceObservationProfile"

* code 1..1 MS
* code from StrokeCircumstanceCodesVS_URL (required)
* hasMember 0..* MS
* hasMember only Reference(FHIR_Observation)

// --- Specific Finding Observation Profile --- (No changes needed here)
Profile: SpecificFindingObservationProfile
Id: specific-finding-observation-profile
Parent: BaseStrokeObservation
Title : "Specific Stroke Finding Observation Profile (R5)"
Description: """
Profile for recording discrete, coded stroke-related findings and assessment outcomes that do not fit naturally into vital-sign,
functional-score, or timing-metric profiles.

**Primary use-cases**
1) AF/flutter assessment status:
   - `Observation.code` uses a disorder concept as the finding focus (AF/flutter).
   - `Observation.valueCodeableConcept` carries status (AfibFlutterStatusVS).
2) Procedural outcome grade (mTICI):
   - `Observation.code` uses the mTICI assessment concept (MTICICodeVS).
   - `Observation.valueCodeableConcept` carries the score (MticiScoreVS).

**Important modeling note**
- This profile does not replace Condition for diagnoses.
  Use Condition to assert durable diagnoses and link supporting Observations via `hasMember`, `derivedFrom`, or Provenance.
"""
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile"
* ^version = "1.0.0"
* ^name = "SpecificFindingObservationProfile"

* code 1..1 MS
* code from StrokeFindingCodesVS_URL (required)
* value[x] 1..1 MS
* value[x] only CodeableConcept
// Invariants 'obs-afib-code' and 'obs-mtici-code' handle the value binding validation

// --- Age at Onset Observation Profile --- (No changes needed here)
Profile: AgeAtOnsetObservationProfile
Id: age-at-onset-observation-profile
Parent: BaseStrokeObservation
Title : "Age at Stroke Onset Observation Profile (R5)"
Description: """
Profile for recording the patient’s age at the time of stroke onset as an integer value in years.

**Primary use-case**
- Provides a computable attribute commonly used in etiologic assessment, risk stratification, and registry datasets.

**Modeling note**
- The age may be derived from DOB and an onset reference (symptom onset, last-known-well, discovery time).
  This profile records the resulting age value, not the derivation method; capture provenance separately if needed.
"""
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/age-at-onset-observation-profile"
* ^version = "1.0.0"
* ^name = "AgeAtOnsetObservationProfile"
* ^purpose = """
Record age-at-onset in years as a simple, computable value used in etiologic assessment and risk stratification.
"""
* code = SCT#445518008 "Age at onset of clinical finding (observable entity)"
* code 1..1 MS
* code ^short = "Age-at-onset concept."
* code ^definition = "Fixed to the SNOMED CT observable entity indicating the observation represents age at onset."
* value[x] 1..1 MS
* value[x] only integer
* valueInteger ^short = "Age in completed years."
* valueInteger ^definition = "Integer age in years at the chosen onset reference point (per local operational definition)."


// ------------------------- Invariants ---------------------------------
// Invariant for FunctionalScoreObservationProfile slicing
Invariant: obs-mrs-code
Description: "Enforces consistent datatype for mRS (ordinal category) to support ValueSet binding and avoid ambiguous numeric representations."
Severity: #error
Expression: "code.coding.where($this.system = 'http://snomed.info/sct' and $this.code = '1255866005').exists() implies value.ofType(CodeableConcept).exists()"

Invariant: obs-nihss-code
Description: "Enforces NIHSS total score as integer for consistent analytics and reporting of severity."
Severity: #error
Expression: "code.coding.where($this.system = 'http://snomed.info/sct' and $this.code = '450743008').exists() implies value.ofType(integer).exists()"

// Invariants for SpecificFindingObservationProfile
Invariant: obs-afib-code
Description: "Ensures AF/flutter assessment observations use controlled status values to avoid free-text and improve interoperability."
Severity: #error
Expression: "code.coding.where($this.system = 'http://snomed.info/sct' and $this.code = '1290101000000101').exists() implies value.coding.where($this.system = %AfibFlutterStatusCS_URL).exists()"

Invariant: obs-mtici-code 
Description: "Ensures mTICI observations carry a valid mTICI grade code to support registry reporting and outcome analytics."
Severity: #error
Expression: "code.coding.where($this.system = 'http://snomed.info/sct' and $this.code = '1156911000').exists() implies value.coding.where($this.system = %MticiScoreCS_URL).exists()"

Instance: AgeAtOnsetObservationExample
InstanceOf: AgeAtOnsetObservationProfile
* valueInteger = 65
* code = SCT#445518008 "Age at onset of clinical finding (observable entity)"
* subject = Reference(PatientExample)
* encounter = Reference(StrokeEncounterExample)

Instance: SpecificFindingObservationExample
InstanceOf: SpecificFindingObservationProfile
* code = SCT#49436004 "Atrial fibrillation (disorder)"
* valueCodeableConcept = AfibFlutterStatusCS_URL#detected "Detected"
* subject = Reference(PatientExample)
* encounter = Reference(StrokeEncounterExample)

Instance: VitalSignObservationExample
InstanceOf: VitalSignObservationProfile
* component[+].code = SCT#271649006 "Systolic blood pressure (observable entity)"
* component[=].valueQuantity.value = 120
* component[=].valueQuantity.unit = "millimeter Mercury column"
* component[=].valueQuantity.system = UCUM
* component[=].valueQuantity.code = #"mm[Hg]"
* component[+].code = SCT#271650006 "Diastolic blood pressure (observable entity)"
* component[=].valueQuantity.value = 80
* component[=].valueQuantity.unit = "millimeter Mercury column"
* component[=].valueQuantity.system = UCUM
* component[=].valueQuantity.code = #"mm[Hg]"
* subject = Reference(PatientExample)
* encounter = Reference(StrokeEncounterExample)

Instance: FunctionalScoreObservationExample
InstanceOf: FunctionalScoreObservationProfile
* code = SCT#1255866005 "Modified Rankin Scale score (observable entity)"
* valueCodeableConcept = MRsScoreCS_URL#0 "No symptoms"
* extension[timingContext].valueCodeableConcept = AssessmentContextCS_URL#pre-stroke "Pre-stroke"
* subject = Reference(PatientExample)
* encounter = Reference(StrokeEncounterExample)

Instance: TimingMetricObservationExample
InstanceOf: TimingMetricObservationProfile
* code = TimingMetricCodesCS_URL#D2N "Door to Needle"
* valueQuantity.value = 30
* valueQuantity.unit = "minute"
* valueQuantity.system = UCUM
* valueQuantity.code = #min
* subject = Reference(PatientExample)
* encounter = Reference(StrokeEncounterExample)

Instance: SpecificFindingObservationExampleMTICI
InstanceOf: SpecificFindingObservationProfile
* code = MTICICodeCS#mTICI "mTICI"
* valueCodeableConcept = MticiScoreCS_URL#3 "Grade 3: Complete antegrade reperfusion of the previously occluded target artery ischemic territory, with absence of visualized occlusion in all distal branches"
* subject = Reference(PatientExample)
* encounter = Reference(StrokeEncounterExample)

Instance: StrokeCircumstanceObservationExampleWakeUp
InstanceOf: StrokeCircumstanceObservationProfile
* code = StrokeCircumstanceCodesCS_URL#wake-up "Wake-up Stroke"
* focus = Reference(ConditionExample)
* subject = Reference(PatientExample)
* encounter = Reference(StrokeEncounterExample)
