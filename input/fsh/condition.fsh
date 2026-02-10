// ------------------ Aliases ------------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir
Alias: CondCat = http://terminology.hl7.org/CodeSystem/condition-category
Alias: CondVerStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: ClinicalStatusCondCS = http://terminology.hl7.org/CodeSystem/condition-clinical


Alias: HemorrhagicStrokeBleedingReasonCS_URL = http://tecnomod-um.org/CodeSystem/hemorrhagic-stroke-bleeding-reason-cs
Alias: StrokeEtiologyCS_URL = http://tecnomod-um.org/CodeSystem/stroke-etiology-cs
Alias: StrokeDiagnosisVS_URL = http://tecnomod-um.org/ValueSet/stroke-diagnosis-vs
Alias: StrokeRiskFactorVS_URL = http://tecnomod-um.org/ValueSet/stroke-risk-factor-vs
Alias: DischargeDestinationVS_URL = http://tecnomod-um.org/ValueSet/discharge-destination-vs
Alias: AdmissionSourceVS_URL = http://tecnomod-um.org/ValueSet/admission-source-vs
Alias: HemorrhagicStrokeBleedingReasonVS_URL = http://tecnomod-um.org/ValueSet/hemorrhagic-stroke-bleeding-reason-vs
Alias: StrokeEtiologyVS_URL = http://tecnomod-um.org/ValueSet/stroke-etiology-vs

Alias: HemorrhagicStrokeBleedingReasonEXT_URL = http://tecnomod-um.org/StructureDefinition/hemorrhagic-stroke-bleeding-reason-ext
Alias: StrokeStrokeEtiologyEXT_URL = http://tecnomod-um.org/StructureDefinition/ischemic-stroke-etiology-ext
Alias: OnsetDateEXT_URL = http://tecnomod-um.org/StructureDefinition/onset-date-ext
Alias: OnsetTimeEXT_URL = http://tecnomod-um.org/StructureDefinition/onset-time-ext


// ValueSet for Stroke Diagnosis (with Displays)
ValueSet: StrokeDiagnosisVS
Id: stroke-diagnosis-vs
Title: "Stroke Diagnosis ValueSet"
Description: "SNOMED CT concepts representing final stroke-related diagnoses intended for use in Condition.code (and similar elements) within this IG. The scope covers ischemic stroke, intracerebral hemorrhage, subarachnoid hemorrhage, cerebral venous thrombosis, and transient ischemic attack (TIA). This value set is designed to support consistent capture, validation, analytics, and decision support. Implementers should expand against a terminology server using the appropriate SNOMED CT edition/version and preferred language(s) for display. Localizations or national derivatives MAY provide additional designations without altering the canonical definition. This value set is not intended for history-of, screening, or procedural concepts."
* ^url = StrokeDiagnosisVS_URL
* ^name = "StrokeDiagnosisVS"
* ^status = #active
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^experimental = false
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To provide a consistent set of SNOMED CT concepts for coding definitive stroke-related diagnoses in this IG."
* ^copyright = "This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International."
* ^immutable = false
* include SCT#422504002 "Ischemic stroke (disorder)"
* include SCT#274100004 "Cerebral hemorrhage (disorder)"
* include SCT#266257000 "Transient ischemic attack (disorder)"
* include SCT#21454007 "Subarachnoid intracranial hemorrhage (disorder)"
* include SCT#95455008 "Thrombosis of cerebral veins (disorder)"
* include SCT#373068000 "Undetermined (qualifier value)"

// ValueSet for Stroke Risk Factors (with Displays)
ValueSet: StrokeRiskFactorVS
Id: stroke-risk-factor-vs
Title: "Stroke Risk Factor ValueSet"
Description: "Defines the SNOMED CT codes for conditions or risk factors relevant to stroke, including an option for unknown status."
* ^url = StrokeRiskFactorVS_URL
* ^name = "StrokeRiskFactorValueSet"
* ^status = #active
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^experimental = false
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To provide a standardized set of SNOMED CT concepts representing stroke-related risk factors for coding and validation."
* ^copyright = "This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International."
* ^immutable = false
* SCT#5370000 "Atrial flutter (disorder)"
* SCT#49436004 "Atrial fibrillation (disorder)"
* SCT#22298006 "Myocardial infarction (disorder)"
* SCT#53741008 "Coronary arteriosclerosis (disorder)"
* SCT#73211009 "Diabetes mellitus (disorder)"
* SCT#55822004 "Hyperlipidemia (disorder)"
* SCT#38341003 "Hypertensive disorder, systemic arterial (disorder)"
* SCT#230706003 "Hemorrhagic cerebral infarction (disorder)"
* SCT#266257000 "Transient ischemic attack (disorder)"
* SCT#422504002 "Ischemic stroke (disorder)"
* SCT#230690007 "Cerebrovascular accident (disorder)"


ValueSet: DischargeDestinationVS
Id: discharge-destination-vs
Title: "Discharge Destination ValueSet"
Description: "Defines possible patient discharge destinations."
* ^url = DischargeDestinationVS_URL
* ^name = "DischargeDestinationValueSet"
* ^status = #draft
* ^version = "1.0.0"
* ^date = "2025-03-31"
* ^experimental = true
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To support consistent recording of discharge destinations for analytics, reporting, and care coordination."
* ^copyright = "This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International."
* ^immutable = false
* include SCT#306689006 "Discharge to home (procedure)"
* include SCT#306706006 "Discharge to ward (procedure)"
* include SCT#19712007 "Patient transfer, to another health care facility (procedure)"
* include SCT#306691003 "Discharge to residential home (procedure)"
* include SCT#305398007 "Admission to the mortuary (procedure)"

// ValueSet for Admission Source
ValueSet: AdmissionSourceVS
Id: admission-source-vs
Title: "Admission Sources ValueSet"
Description: "Defines the modes of transport or pathways by which the patient arrived."
* ^url = AdmissionSourceVS_URL
* ^name = "AdmissionSourceValueSet"
* ^status = #draft
* ^version = "1.0.0"
* ^date = "2025-03-31"
* ^experimental = true
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To standardize the capture of patient admission sources for workflow, reporting, and interoperability."
* ^copyright = "This value set includes SNOMED CT® content. SNOMED CT® is distributed by SNOMED International."
* ^immutable = false
* include SCT#715537001 "Transportation by ambulance (procedure)"
* include SCT#715957006 "Transportation by own transport (procedure)"
* include SCT#384762007 "Transportation procedure (procedure)"


CodeSystem: HemorrhagicStrokeBleedingReasonCS
Id: hemorrhagic-stroke-bleeding-reason-cs
* ^url = HemorrhagicStrokeBleedingReasonCS_URL
* ^name = "HemorrhagicStrokeBleedingReasonCS"
* ^title = "Hemorrhagic Stroke Bleeding Reason Code System"
* ^description = "Codes indicating the reason for bleeding in hemorrhagic stroke cases."
* ^status = #active
* ^experimental = false
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To provide locally governed codes for the identified cause of bleeding in hemorrhagic stroke."
* ^copyright = "© Tecnomod. This CodeSystem is provided for use within this Implementation Guide."
* ^caseSensitive = false
* ^content = #complete
* #other "Bleeding Reason Other" "Another, less common or unspecified cause of intracranial hemorrhage was identified"



ValueSet: HemorrhagicStrokeBleedingReasonVS
Id: hemorrhagic-stroke-bleeding-reason-vs
Title: "Hemorrhagic Stroke Bleeding Reason ValueSet"
* ^description = "Specifies the identified cause of a hemorrhagic stroke, typically used with an extension."
* ^url = HemorrhagicStrokeBleedingReasonVS_URL
* ^name = "HemorrhagicStrokeBleedingReasonVS"
* ^status = #draft
* ^version = "1.0.0"
* ^date = "2025-09-08"
* ^experimental = true
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To enable consistent capture of the underlying cause of bleeding in hemorrhagic stroke."
* ^copyright = "© Tecnomod. This value set includes locally defined codes."
* ^immutable = false
* include codes from system HemorrhagicStrokeBleedingReasonCS_URL
* include SCT#128609009 "Intracranial aneurysm (disorder)"
* include SCT#703221003 "Congenital intracranial vascular malformation (disorder)"


CodeSystem: StrokeEtiologyCS
Id: stroke-etiology-cs
* ^url = StrokeEtiologyCS_URL
* ^name = "StrokeEtiologyCS"
* ^title = "Stroke Etiology Code System"
* ^description = "Codes indicating the etiology of strokes."
* ^status = #active
* ^experimental = false
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To provide locally governed codes for classifying ischemic stroke etiology."
* ^copyright = "© Tecnomod. This CodeSystem is provided for use within this Implementation Guide."
* ^caseSensitive = false
* ^content = #complete
* #atherosclerosis "Stroke Etiology Atherosclerosis" "Specifies that large artery atherosclerosis (for example, significant stenosis in the carotid or basilar arteries) was identified as the cause of the stroke."
* #other "Stroke Etiology Other" "Specifies that the stroke etiology falls into a rarer category not covered by the main classifications, such as vasculitis or hypercoagulable states."

ValueSet: StrokeEtiologyVS
Id: stroke-etiology-vs
Title: "Stroke Etiology ValueSet"
Description: "Specifies the determined etiology of an stroke."
* ^url = StrokeEtiologyVS_URL
* ^name = "StrokeEtiologyVS"
* ^status = #draft
* ^version = "1.0.0"
* ^date = "2025-03-31"
* ^experimental = true
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To support classification of stroke etiology using a mix of local codes and selected SNOMED CT concepts."
* ^copyright = "This value set includes locally governed concepts and SNOMED CT® content. SNOMED CT® is distributed by SNOMED International."
* ^immutable = false
* include codes from system StrokeEtiologyCS_URL
* include SCT#16891111000119104 "Cryptogenic stroke (disorder)"
* include SCT#413758000 "Cardioembolic stroke (disorder)"
* include SCT#230698000 "Lacunar infarction (disorder)"


// ------------------ Extensions ---------------------------------
Extension: HemorrhagicStrokeBleedingReasonExt
Id: hemorrhagic-stroke-bleeding-reason-ext
Title: "Hemorrhagic Stroke – Bleeding Reason"
Description: "Captures, as a CodeableConcept bound (required) to HemorrhagicStrokeBleedingReasonVS, the identified cause of intracranial bleeding in hemorrhagic stroke (e.g., aneurysm, vascular malformation, other). Use when coding a definitive hemorrhagic stroke Condition to support analytics and decision support; do not use for non-hemorrhagic etiologies or when the cause is unknown/undetermined."
* ^url = HemorrhagicStrokeBleedingReasonEXT_URL
* ^name = "HemorrhagicStrokeBleedingReasonExt"
* ^status = #active
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^experimental = false
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To standardize capture of the bleeding cause in hemorrhagic stroke conditions for decision support and analytics."
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only CodeableConcept
* valueCodeableConcept from HemorrhagicStrokeBleedingReasonVS (required)

Extension: StrokeStrokeEtiologyExt
Id: ischemic-stroke-etiology-ext
Title: "Ischemic Stroke – Etiology"
Description: "Records the determined ischemic stroke etiology as a CodeableConcept bound (required) to StrokeEtiologyVS (e.g., cardioembolic, large artery atherosclerosis, lacunar, cryptogenic). Apply to definitive ischemic stroke Conditions after diagnostic workup; avoid use for hemorrhagic strokes or provisional hypotheses not yet established."
* ^url = StrokeStrokeEtiologyEXT_URL
* ^name = "StrokeStrokeEtiologyExt"
* ^status = #active
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^experimental = false
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To enable consistent categorization of ischemic stroke etiology for interoperability and analysis."
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only CodeableConcept
* valueCodeableConcept from StrokeEtiologyVS (required)


Extension: OnsetDateExt
Id: onset-date-ext
Title: "Stroke Onset Date"
Description: "Captures the calendar date (value[x] = date) of symptom onset for the indexed stroke event when known, enabling calculation of onset-to-door metrics and adherence to time-sensitive pathways. Use alongside OnsetTimeExt when hour/minute precision is available; omit if onset is unknown or inapplicable."
* ^url = OnsetDateEXT_URL
* ^name = "OnsetDateExt"
* ^status = #active
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^experimental = false
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To record stroke onset date for clinical decision making and quality metrics."
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only date



Extension: OnsetTimeExt
Id: onset-time-ext
Title: "Stroke Onset Time"
Description: "Captures the clock time (value[x] = time) of symptom onset for the indexed stroke event when available, complementing OnsetDateExt to support precise onset-to-treatment intervals. Use local time of the clinical setting; omit if time is unknown or estimated beyond acceptable precision."
* ^url = OnsetTimeEXT_URL
* ^name = "OnsetTimeExt"
* ^status = #active
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^experimental = false
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To record stroke onset time for adherence to time-sensitive treatment pathways."
* ^context.type = #element
* ^context.expression = "Condition"
* value[x] only time


// ------------------ Condition Profiles -------------------------

// --- 1. Profile for Primary Stroke Diagnosis ---
Profile: StrokeDiagnosisConditionProfile
Id: stroke-diagnosis-condition-profile
Parent: Condition
Title: "Stroke Diagnosis Condition Profile"
Description: "Defines a Condition profile constrained to represent the definitive diagnosis of the current stroke event during the indexed encounter. The profile fixes category to encounter-diagnosis, binds code (required) to StrokeDiagnosisVS, and prohibits onset[x] to avoid ambiguity with symptom-onset capture via dedicated extensions. Use this profile for final/confirmed stroke diagnoses recorded at discharge or after diagnostic workup; do not use it for history-of conditions, screening findings, or provisional ‘rule-out’ statements. Optional extensions capture hemorrhagic bleeding reason, ischemic etiology, and structured onset date/time when clinically known."
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-diagnosis-condition-profile"
* ^name = "StrokeDiagnosisConditionProfile"
* ^status = #active
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^experimental = false
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To standardize the representation of definitive stroke diagnoses to support interoperability, validation, and analytics."
* ^copyright = "© Tecnomod. This profile is provided for use within this Implementation Guide."
* ^type = "Condition"
* ^derivation = #constraint

* clinicalStatus MS
* verificationStatus MS

* category MS
* category = CondCat#encounter-diagnosis "Encounter Diagnosis"

* code 1..1 MS
* code from StrokeDiagnosisVS (required)

* subject 1..1 MS
* subject only Reference(Patient)

* encounter 1..1
* encounter only Reference(Encounter)
* encounter MS

* onset[x] 0..0


* extension contains HemorrhagicStrokeBleedingReasonExt named bleedingReason 0..1 MS
* extension contains StrokeStrokeEtiologyExt named ischemicEtiology 0..1 MS
* extension contains OnsetDateExt named onsetDate 0..1 MS
* extension contains OnsetTimeExt named onsetTime 0..1 MS


// --- 2. Profile for Stroke Risk Factor Conditions ---
Profile: StrokeRiskFactorConditionProfile
Id: stroke-risk-factor-condition-profile
Parent: Condition
Title: "Stroke Risk Factor Condition Profile"
Description: "Defines a Condition profile for pre-existing or concurrent conditions that increase stroke risk (e.g., atrial fibrillation/flutter, diabetes, hypertension, coronary disease). The profile fixes category to problem-list-item, binds code (required) to StrokeRiskFactorVS, and supports onset[x] and recordedDate to document chronology and longitudinal tracking. Use this profile to maintain the problem list and to support risk assessment and CDS; do not use it to code the acute stroke event itself."
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-risk-factor-condition-profile"
* ^name = "StrokeRiskFactorConditionProfile"
* ^status = #active
* ^version = "1.0.0"
* ^date = "2025-10-07"
* ^experimental = false
* ^publisher = "Tecnomod"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "alvaro.riquelmet@um.es"
* ^jurisdiction = urn:iso:std:iso:3166#ES "Spain"
* ^purpose = "To standardize capture of stroke-related risk factor conditions for longitudinal tracking, CDS, and reporting."
* ^copyright = "© Tecnomod. This profile is provided for use within this Implementation Guide."
* ^type = "Condition"
* ^derivation = #constraint

* clinicalStatus MS
* verificationStatus MS


* category MS
* category = CondCat#problem-list-item "Problem List Item"

* subject 1..1 MS
* subject only Reference(Patient)

* code 1..1 MS
* code from StrokeRiskFactorVS_URL (required)

* onset[x] MS
* recordedDate MS

* encounter only Reference(Encounter)
* encounter MS



Instance: StrokeDiagnosisConditionExample
InstanceOf: StrokeDiagnosisConditionProfile
* category = CondCat#encounter-diagnosis "Encounter Diagnosis"
* code = SCT#266257000 "Transient ischemic attack (disorder)"
* encounter = Reference(StrokeEncounterExample)
* clinicalStatus = ClinicalStatusCondCS#active 
* encounter = Reference(StrokeEncounterExample)
* subject = Reference(PatientExample)

Instance: StrokeDiagnosisConditionAFlutter
InstanceOf: StrokeRiskFactorConditionProfile
* category = CondCat#problem-list-item "Problem List Item"
* code = SCT#5370000 "Atrial flutter (disorder)"
* encounter = Reference(StrokeEncounterExample)
* clinicalStatus = ClinicalStatusCondCS#active
* verificationStatus = CondVerStatus#differential
* encounter = Reference(StrokeEncounterExample)
* subject = Reference(PatientExample)

Instance: StrokeDiagnosisConditionAFib
InstanceOf: StrokeRiskFactorConditionProfile
* category = CondCat#problem-list-item "Problem List Item"
* code = SCT#49436004 "Atrial fibrillation (disorder)"
* encounter = Reference(StrokeEncounterExample)
* clinicalStatus = ClinicalStatusCondCS#active
* verificationStatus = CondVerStatus#differential
* encounter = Reference(StrokeEncounterExample)
* subject = Reference(PatientExample)

Instance: StrokeRiskFactorConditionExample
InstanceOf: StrokeRiskFactorConditionProfile
* category = CondCat#problem-list-item "Problem List Item"
* code = SCT#422504002 "Ischemic stroke (disorder)"
* clinicalStatus = ClinicalStatusCondCS#remission
* onsetDateTime = 2025-03-31T12:00:00Z
* recordedDate = 2025-03-31T12:00:00Z
* encounter = Reference(StrokeEncounterExample)
* subject = Reference(PatientExample)
