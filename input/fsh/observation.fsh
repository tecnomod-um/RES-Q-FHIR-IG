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
* ^url = AfibFlutterStatusVS_URL
* ^version = "1.0.0"
* ^title = "Atrial Fibrillation or Flutter Status ValueSet"
* ^description = """
This ValueSet constrains the allowed coded outcomes for documenting the status of an atrial fibrillation (AF) / atrial flutter assessment within the stroke workflow. It is intentionally limited to SNOMED CT qualifier values that express the epistemic status of the finding: (1) known present, (2) known absent, or (3) unknown.

The ValueSet is designed to support harmonized recording across systems when AF/flutter materially influences ischemic stroke etiology workup, thromboembolic risk stratification, and downstream management decisions (e.g., anticoagulation). It is appropriate for use as Observation.valueCodeableConcept to represent the result of screening, monitoring, or review of prior documentation.

Scope and modeling notes:
- The qualifier values do not encode the rhythm subtype, chronicity, burden, or method of detection (e.g., ECG vs telemetry); those aspects should be represented using additional elements (e.g., Observation.method, device data) or separate Observations/Conditions as appropriate.
- The ValueSet represents “status of assessment” rather than the disorder concept itself; if the clinical intent is to assert a diagnosis of AF/flutter, use a Condition resource with an appropriate SNOMED CT disorder code instead of (or in addition to) this status.
"""
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
* ^url = MticiScoreCS_URL
* ^version = "1.0.0"
* ^title = "MTICI Score Code System"
* ^description = """
This CodeSystem defines codes for the modified Treatment in Cerebral Ischemia / modified Thrombolysis in Cerebral Infarction (mTICI) reperfusion grade. mTICI is an ordinal angiographic scale used to quantify the extent of antegrade reperfusion of the downstream ischemic territory after endovascular therapy for acute ischemic stroke (e.g., mechanical thrombectomy).

The scale ranges from 0 (no perfusion) to 3 (complete reperfusion), with 2a/2b/2c subgrades to distinguish partial, substantial, and near-complete reperfusion. These codes are intended for consistent, interoperable capture in HL7® FHIR® resources—most commonly Observation.valueCodeableConcept—supporting procedural documentation, registry submission, audit/quality improvement, and research.

Scope and modeling notes:
- This CodeSystem represents the *final* angiographic reperfusion grade for the target downstream territory, typically assigned from the final post-procedural angiographic run (commonly DSA).
- It does not encode target vessel location, imaging modality details, timestamps, technique/device, number of passes, collateral status, or adjudication process; those elements should be recorded separately (e.g., Procedure, ImagingStudy, Observation.method, extensions).
- Any local definition of “successful reperfusion” (often operationalized as mTICI ≥ 2b, depending on protocol) should be implemented via ValueSets, rules, or reporting logic without altering code meanings.
"""
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
ValueSet: MTICIScoreValueSet // Name from JSON
Id: mtici-score-vs // Id from JSON
* ^url = MticiScoreVS_URL
* ^version = "1.0.0"
* ^title = "MTICI Score ValueSet"
* ^name = "MTICIScoreValueSet" // Added name from JSON
* ^description = """
This ValueSet enumerates all allowable mTICI reperfusion grades (0, 1, 2a, 2b, 2c, 3) from the MticiScoreCS CodeSystem. It is intended to be bound (typically as required) to Observation.valueCodeableConcept when recording the final angiographic reperfusion outcome after endovascular therapy for acute ischemic stroke.

Using a dedicated ValueSet ensures:
- consistent coding across implementations and sites,
- reliable downstream interpretation for analytics/registry submission, and
- clear separation between the *assessment concept* (e.g., “mTICI reperfusion grade”) and the *assessment result* (the specific grade).

This ValueSet does not convey timing, vessel location, modality, or technique; those must be represented elsewhere in the clinical model.
"""
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
Id: mrs-score-cs
* ^url = MRsScoreCS_URL
* ^version = "1.0.0"
* ^title = "modified Rankin Scale (mRS) Score Code System"
* ^description = """
This CodeSystem defines codes for the modified Rankin Scale (mRS), an ordinal measure of global disability and functional outcome widely used in stroke care and research. mRS grades functional status from 0 (no symptoms) through 5 (severe disability), with 6 indicating death.

Within this implementation guide, mRS is intended to be captured as Observation.valueCodeableConcept (bound to the MRsScoreVS ValueSet), with the assessment timepoint represented explicitly (e.g., via effective[x]) and/or via an assessment context indicator (e.g., pre-stroke baseline, discharge, ~90-day follow-up). This supports standard reporting (e.g., “mRS at 90 days”), comparability across sites, and consistent downstream analytics.

Scope and modeling notes:
- mRS is a coarse, global disability scale; it does not encode detailed domain-specific functional limitations (mobility, cognition, ADLs) which should be captured via additional instruments/Observations if required.
- The CodeSystem defines only the *score*; method of ascertainment (in-person, telephone, structured interview) and assessor details should be captured separately when relevant.
"""
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
* ^url = MRsScoreVS_URL
* ^version = "1.0.0"
* ^title = "modified Rankin Scale (mRS) Score ValueSet"
* ^description = """
This ValueSet includes all modified Rankin Scale (mRS) grades defined in the MRsScoreCS CodeSystem (0–6). It is intended to be bound to Observation.valueCodeableConcept when the Observation.code indicates that the observation represents an mRS score.

Binding mRS to a dedicated ValueSet supports strict validation (only valid mRS grades can be recorded), improves semantic consistency across implementations, and simplifies downstream cohorting and outcome reporting (e.g., dichotomized mRS 0–2 vs 3–6), without changing the meaning of individual grades.
"""
* ^status = #active
* include codes from system MRsScoreCS_URL

// --- CodeSystem for Assessment Context (for mRS/NIHSS) ---
CodeSystem: AssessmentContextCS
Id: assessment-context-cs
* ^url = AssessmentContextCS_URL
* ^version = "1.0.0"
* ^title = "Assessment Context Code System"
* ^description = """
This CodeSystem defines normalized codes for the clinical context / relative timepoint at which a stroke-related assessment was performed. It is primarily used to contextualize functional and severity instruments (e.g., mRS and NIHSS) where interpretation depends on whether the score reflects baseline status, acute presentation, discharge status, or follow-up.

These codes represent *relative phases* (pre-stroke baseline, admission, discharge, ~3-month follow-up) rather than precise timestamps. The actual date/time of measurement should be recorded in Observation.effective[x] when known; the context code complements effective[x] by expressing the clinical phase, which is often necessary for reporting and comparability (e.g., “mRS pre-stroke” vs “mRS at discharge”).

Scope note: This CodeSystem is intentionally small and focused on common stroke pathway milestones; implementers may extend it (with additional codes and governance) if other standardized follow-up timepoints are required (e.g., 6 months, 1 year).
"""
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
* ^url = AssessmentContextVS_URL
* ^version = "1.0.0"
* ^title = "Assessment Context ValueSet"
* ^description = """
This ValueSet includes all context/timepoint codes defined in AssessmentContextCS. It is intended for required binding to elements (e.g., extensions) that must indicate the clinical phase of an assessment, enabling consistent stratification and reporting of outcomes and severity over the stroke care pathway.

The ValueSet is used to validate that only supported context categories are recorded, improving interoperability when exchanging stroke assessments between systems and across care settings.
"""
* ^status = #active
* include codes from system AssessmentContextCS_URL

// --- ValueSets for Observation.code Groupings ---
ValueSet: VitalSignCodesVS
Id: vital-sign-codes-vs
* ^url = VitalSignCodesVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Vital Sign Codes ValueSet"
* ^description = """
This ValueSet defines SNOMED CT observable-entity codes for the blood pressure components captured as vital signs in the acute stroke setting (systolic and diastolic blood pressure). It is intended for use as Observation.component.code in a single vital-sign Observation that records both components using UCUM units (mm[Hg]).

Including only the component codes (rather than full LOINC panels) keeps the representation lightweight while remaining semantically precise, and supports repeated measurements across time (e.g., triage, post-thrombolysis monitoring) by repeating the Observation with different effective[x] timestamps.
"""
* ^status = #active
* ^experimental = true
* include SCT#271649006 "Systolic blood pressure (observable entity)"
* include SCT#271650006 "Diastolic blood pressure (observable entity)"

ValueSet: FunctionalScoreCodesVS
Id: functional-score-codes-vs
* ^url = FunctionalScoreCodesVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Functional Score Codes ValueSet"
* ^description = """
This ValueSet defines the allowable Observation.code concepts for stroke functional and severity scoring instruments represented in this guide: modified Rankin Scale (mRS) and NIH Stroke Scale (NIHSS), expressed as SNOMED CT observable entities.

It is intended to be bound to Observation.code in the FunctionalScoreObservationProfile. Downstream validation/invariants then enforce the appropriate datatype of Observation.value[x]:
- mRS is captured as a coded ordinal category (valueCodeableConcept bound to MRsScoreVS).
- NIHSS is captured as a numeric total score (valueInteger), representing the summed NIHSS total rather than item-level subscores.
"""
* ^status = #active
* include SCT#1255866005 "Modified Rankin Scale score (observable entity)"
* include SCT#450743008 "National Institutes of Health stroke scale score (observable entity)"

CodeSystem: TimingMetricCodesCS
Id: timing-metric-codes-cs
* ^url = TimingMetricCodesCS_URL
* ^version = "1.0.0"
* ^title = "Stroke Timing Metric Codes ValueSet"
* ^description = """
This CodeSystem defines codes for key time-interval process metrics in acute stroke care used for quality monitoring and pathway optimization. Each code represents a duration measured in minutes between two clinically meaningful events (e.g., hospital arrival to thrombolysis start).

These metrics are commonly used in performance dashboards, registry submissions, and quality improvement programs. The intent is to store the *measured interval* (a duration) in Observation.valueQuantity (UCUM minutes), while event timestamps (arrival time, needle time, groin puncture time) may be stored separately when available.

Implementation note: Exact operational definitions can vary by institution (e.g., “needle time” as alteplase bolus vs infusion start; “door time” as ED arrival vs triage time). Implementers should align local measurement definitions and document them (e.g., in metadata, profiles, or implementation guidance) to ensure comparability across sites.
"""
* ^status = #active
* #D2G "Door to Groin"
    "Elapsed time (minutes) from documented hospital arrival (‘door’) to arterial groin puncture for mechanical thrombectomy (first puncture attempt)."
* #D2N "Door to Needle"
    "Elapsed time (minutes) from documented hospital arrival (‘door’) to initiation of intravenous thrombolysis (commonly alteplase/tenecteplase administration start, per local definition)."

ValueSet: TimingMetricCodesVS
Id: timing-metric-codes-vs
* ^url = TimingMetricCodesVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Timing Metric Codes ValueSet"
* ^description = """
This ValueSet includes all timing metric codes defined in TimingMetricCodesCS for use as Observation.code when recording acute stroke process intervals (e.g., D2N, D2G). It supports required binding in the TimingMetricObservationProfile, ensuring only approved timing metrics are recorded.

The ValueSet is intentionally constrained to promote consistent, comparable reporting across implementations and to reduce ambiguity in downstream analytics.
"""
* ^status = #active
* include codes from system TimingMetricCodesCS_URL

CodeSystem: StrokeCircumstanceCodesCS
Id: stroke-circumstance-codes-cs
* ^url = StrokeCircumstanceCodesCS_URL
* ^version = "1.0.0"
* ^title = "Stroke Circumstance Codes CodeSystem"
* ^description = """
This CodeSystem defines coded circumstances related to stroke symptom onset that are clinically relevant for eligibility decisions, diagnostic reasoning, and reporting—particularly when the exact onset time is unknown or atypical.

These codes are intended to be used as Observation.code in the StrokeCircumstanceObservationProfile to assert that a given onset circumstance applies to the index stroke event. They do not encode the precise onset timestamp, last-known-well time, or location of onset; those details should be represented separately (e.g., dedicated Observations, Encounter/Condition attributes, or extensions).
"""
* ^status = #active
* #in-hospital "In-hospital Stroke"
    "Indicates that stroke onset occurred while the patient was already admitted to the hospital for another reason (inpatient onset)."
* #wake-up "Wake-up Stroke"
    "Indicates that stroke symptoms were first recognized on awakening from sleep, implying an unknown onset time within the sleep interval (time last known well precedes symptom recognition)."

ValueSet: StrokeCircumstanceCodesVS
Id: stroke-circumstance-codes-vs
* ^url = StrokeCircumstanceCodesVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Circumstance Codes ValueSet"
* ^description = """
This ValueSet includes all onset-circumstance codes defined in StrokeCircumstanceCodesCS for use in stroke documentation and analytics. It is intended to be bound to Observation.code in the StrokeCircumstanceObservationProfile, enabling consistent classification of onset scenarios such as in-hospital stroke and wake-up stroke.

Consistent coding supports cohort definition (e.g., wake-up stroke protocols), audit/quality reporting, and research where onset uncertainty is a key stratification variable.
"""
* ^status = #active
* include codes from system StrokeCircumstanceCodesCS_URL

ValueSet: SpecificFindingCodesVS
Id: specific-finding-codes-vs
* ^url = SpecificFindingCodesVS_URL
* ^version = "1.0.0"
* ^title = "Specific Stroke Finding Codes ValueSet"
* ^description = """
This ValueSet provides SNOMED CT disorder concepts for specific clinically relevant findings often referenced in the stroke workup, currently limited to atrial fibrillation and atrial flutter disorders.

These codes are suitable when the intent is to reference the disorder concepts themselves (e.g., as a focus finding or a coded problem). When the intent is to capture the *status of an assessment* (present/absent/unknown) rather than assert a diagnosis, implementers should use an Observation with a dedicated assessment concept as Observation.code and bind Observation.valueCodeableConcept to an appropriate status ValueSet (e.g., AfibFlutterStatusVS).
"""
* ^status = #active
* include SCT#49436004 "Atrial fibrillation (disorder)"
* include SCT#5370000 "Atrial flutter (disorder)"

CodeSystem: MTICICodeCS
Id: mtici-code-cs
* ^url = MticiCodeCS_URL
* ^version = "1.0.0"
* ^title = "mTICI Score Codes CodeSystem"
* ^description = """
This CodeSystem defines the assessment concept code(s) used to indicate that an Observation is reporting an mTICI reperfusion grade. It is intentionally separated from the MticiScoreCS CodeSystem, which contains the actual mTICI grade values (0–3 with 2a/2b/2c).

In practice:
- Observation.code identifies the *kind of measurement/assessment* (“mTICI reperfusion grade”).
- Observation.valueCodeableConcept carries the *result* (one of the mTICI grades from MticiScoreVS).

This separation improves semantic clarity and supports consistent validation and analytics across systems.
"""
* ^status = #active
* ^experimental = true
* ^caseSensitive = false
* #mTICI "mTICI" "Assessment concept representing the modified Thrombolysis in Cerebral Infarction reperfusion grade to be reported as an Observation value."

ValueSet: MTICICodeVS
Id: mtici-code-vs
* ^url = MticiCodeVS_URL
* ^version = "1.0.0"
* ^title = "mTICI Score Codes ValueSet"
* ^description = """
This ValueSet includes the mTICI assessment concept code(s) from MTICICodeCS for use as Observation.code when recording an mTICI reperfusion grade. It is intended to be paired with a binding of Observation.valueCodeableConcept to MticiScoreVS.

Separating the “assessment concept” ValueSet (this ValueSet) from the “assessment result” ValueSet (MticiScoreVS) enables clearer validation rules, consistent UI behavior, and safer reuse of the mTICI scoring system across profiles.
"""
* ^status = #active
* include codes from system MticiCodeCS_URL

ValueSet: StrokeFindingCodesVS
Id: stroke-finding-codes-vs
* ^url = StrokeFindingCodesVS_URL
* ^version = "1.0.0"
* ^title = "Specific Stroke Finding Codes ValueSet"
* ^description = """
This ValueSet aggregates a small set of coded “finding/assessment concepts” used by the SpecificFindingObservationProfile for stroke-related documentation. It currently includes:
- specific disorder concepts relevant to stroke workup (from SpecificFindingCodesVS), and
- the mTICI assessment concept code (from MTICICodeVS).

Implementer note: This ValueSet is used to constrain Observation.code. Where Observation.code is a disorder concept (e.g., AF disorder), the Observation instance should be interpreted as capturing an *assessment about that finding* (with the assessment result carried in Observation.valueCodeableConcept, per profile constraints). Where Observation.code is an assessment concept (e.g., mTICI), the Observation.valueCodeableConcept carries the corresponding score/result.
"""
* ^status = #active
* include codes from valueset SpecificFindingCodesVS_URL
* include codes from valueset MticiCodeVS_URL


// ------------------------- Extensions -------------------------------


Extension: ObservationTimingContextExtension
Id: observation-timing-context-ext
* ^url = ObsTimingContextExt_URL
* ^title = "Observation Timing Context Extension"
* ^description = """
This extension captures the clinical timing context (relative phase) in which an observation or assessment was made (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up). It is particularly important for functional outcomes and severity scores whose interpretation depends on *when* they were assessed.

The extension complements Observation.effective[x]:
- effective[x] records the actual date/time (when known),
- this extension records the standardized phase label used for reporting and comparability across sites.

The value is a required CodeableConcept bound to AssessmentContextVS (required), ensuring only supported timing contexts are used in this implementation guide.
"""
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
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/base-stroke-observation"
* ^version = "1.0.0"
* ^title = "Base Profile for Stroke-Related Observations"
* ^description = """
Common constraints for Observations captured in the context of stroke care across acute management and follow-up. This profile establishes a consistent minimum dataset and reference structure so that downstream profiles (vital signs, functional scores, timing metrics, onset circumstances, and specific findings) behave uniformly across systems.

Key modeling intent:
- Observation.status is fixed to final to indicate recorded results suitable for clinical reporting and analytics.
- Observation.subject (Patient) and Observation.encounter (index stroke encounter) are mandatory to ensure every observation is attributable to a specific person and care episode.
- Observation.partOf optionally links the observation to a Procedure (e.g., mechanical thrombectomy) when the observation represents a procedural outcome (e.g., mTICI grade) or a process metric.
- Observation.effective[x] is optional to accommodate cases where only a phase label is known; when available, effective[x] should be populated to support accurate sequencing and time-based analysis.
"""
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
* ^url = "http://tecnomod-um.org/StructureDefinition/vital-sign-observation-profile"
* ^version = "1.0.0"
* ^name = "VitalSignObservationProfile"
* ^title = "Stroke Vital Sign Observation Profile (R5)"
* ^description = """
Profile for recording key blood pressure vital signs in stroke patients using a single Observation with components. The Observation is categorized as vital-signs and uses component slices for systolic and diastolic blood pressure, each represented as a Quantity in UCUM mm[Hg].

This profile supports repeated measurements over time by recording separate Observations at different effective[x] timestamps (e.g., arrival, post-thrombolysis monitoring, ICU). It intentionally does not model measurement conditions such as body position, cuff site, or device; such details may be captured via Observation.method, device references, or additional extensions if required by local workflows.
"""
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
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/functional-score-observation-profile"
* ^version = "1.1.0" // Incremented version due to change
* ^name = "FunctionalScoreObservationProfile"
* ^title = "Stroke Functional Score Observation Profile (R5, Timing Ext)" // Updated title
* ^description = """
Profile for recording stroke functional outcome and severity scores, currently mRS and NIHSS, in a way that is both interoperable and context-aware. The profile requires a timing context extension (ObservationTimingContextExtension) to explicitly state the clinical phase (e.g., pre-stroke baseline, admission, discharge, ~3-month follow-up), enabling unambiguous interpretation and standardized reporting.

Observation.code is bound to FunctionalScoreCodesVS, and invariants constrain Observation.value[x] by instrument:
- For mRS (SNOMED CT observable entity), the result is represented as a CodeableConcept bound to MRsScoreVS (ordinal categories 0–6).
- For NIHSS (SNOMED CT observable entity), the result is represented as an integer total score (valueInteger), reflecting the overall NIHSS total rather than item-level subscores.

The profile does not model itemized NIHSS components, assessor training, or interview method; implementers may represent those details separately when needed (e.g., additional Observations, extensions, or provenance).
"""
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


// --- Timing Metric Observation Profile --- (No changes needed here regarding method/extension)
Profile: TimingMetricObservationProfile
Id: timing-metric-observation-profile
Parent: BaseStrokeObservation
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/timing-metric-observation-profile"
* ^version = "1.0.0"
* ^name = "TimingMetricObservationProfile"
* ^title = "Stroke Timing Metric Observation Profile (R5)"
* ^description = """
Profile for recording acute stroke process timing metrics as measured durations (e.g., Door-to-Needle, Door-to-Groin). Observation.code is bound to TimingMetricCodesVS, and Observation.valueQuantity represents the elapsed time as a duration in UCUM minutes.

This representation is optimized for quality monitoring and analytics, where the interval value is the primary datum. The profile allows hasMember references to associate related sub-metrics or supporting Observations when a composite metric is derived from multiple recorded steps.

Scope note: This profile records the interval value; it does not require recording the underlying event timestamps. If timestamp provenance is needed, implementers should capture the source event times separately (e.g., additional Observations or extensions) to support auditing and cross-site comparability.
"""
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
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-circumstance-observation-profile"
* ^version = "1.0.0"
* ^name = "StrokeCircumstanceObservationProfile"
* ^title = "Stroke Circumstance Observation Profile (R5)"
* ^description = """
Profile for documenting clinically relevant circumstances of stroke symptom onset (e.g., wake-up stroke, in-hospital onset). The circumstance is represented by Observation.code (bound to StrokeCircumstanceCodesVS); the presence of the Observation asserts that the circumstance applies to the index event within the associated Encounter.

The profile supports linking supporting evidence via hasMember (e.g., Observations capturing last-known-well time, symptom discovery time, or other onset-related details) without overloading the circumstance code itself. This profile intentionally does not encode onset timestamps in the code; temporal details should be modeled separately for precision and auditability.
"""
* code 1..1 MS
* code from StrokeCircumstanceCodesVS_URL (required)
* hasMember 0..* MS
* hasMember only Reference(FHIR_Observation)

// --- Specific Finding Observation Profile --- (No changes needed here)
Profile: SpecificFindingObservationProfile
Id: specific-finding-observation-profile
Parent: BaseStrokeObservation
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/specific-finding-observation-profile"
* ^version = "1.0.0"
* ^name = "SpecificFindingObservationProfile"
* ^title = "Specific Stroke Finding Observation Profile (R5)"
* ^description = """
Profile for recording discrete, coded stroke-related findings and assessment outcomes that do not fit naturally into the vital-sign, functional-score, or timing-metric profiles. Observation.code is constrained to StrokeFindingCodesVS, and Observation.valueCodeableConcept carries the corresponding assessment result or status.

Typical use cases include:
- documenting AF/flutter assessment status as present/absent/unknown (valueCodeableConcept bound to an AF/flutter status ValueSet), and
- documenting procedural outcome grades such as mTICI (valueCodeableConcept bound to MticiScoreVS).

This profile deliberately encodes the result as a CodeableConcept to support categorical outcomes and interoperability. It does not replace Condition for asserting diagnoses; when a durable diagnosis is established (e.g., confirmed AF), represent it as a Condition and optionally link supporting Observations (screening results, monitoring runs) using hasMember, derivedFrom, or Provenance.
"""
* code 1..1 MS
* code from StrokeFindingCodesVS_URL (required)
* value[x] 1..1 MS
* value[x] only CodeableConcept
// Invariants 'obs-afib-code' and 'obs-mtici-code' handle the value binding validation

// --- Age at Onset Observation Profile --- (No changes needed here)
Profile: AgeAtOnsetObservationProfile
Id: age-at-onset-observation-profile
Parent: BaseStrokeObservation
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/age-at-onset-observation-profile"
* ^version = "1.0.0"
* ^name = "AgeAtOnsetObservationProfile"
* ^title = "Age at Stroke Onset Observation Profile (R5)"
* ^description = """
Profile for recording the patient’s age at the time of stroke onset as a simple integer value in years. The Observation.code is fixed to the SNOMED CT observable entity “Age at onset of clinical finding,” ensuring a clear and interoperable semantic meaning.

The age at onset may be derived from date of birth and an onset/reference timepoint (e.g., symptom onset, last known well, or discovery time depending on local policy). This profile records the resulting age value, not the derivation method; if the derivation is clinically important, implementers should capture the underlying reference timepoint(s) and provenance separately.
"""
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
* text.status = #generated
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><p><b>Example:</b> Age at stroke onset recorded as 65 years, linked to the stroke encounter.</p></div>"
* valueInteger = 65
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
