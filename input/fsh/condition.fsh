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
Description: """
This ValueSet enumerates SNOMED CT concepts representing **final stroke-related diagnoses** for use in `Condition.code` within this Implementation Guide (IG).

**Primary use-case**
- Required binding to `Condition.code` in `StrokeDiagnosisConditionProfile`, representing the *definitive diagnosis* of the index stroke event for the linked encounter.

**Scope**
- Ischemic stroke
- Intracerebral/cerebral hemorrhage
- Subarachnoid hemorrhage
- Cerebral venous thrombosis
- Transient ischemic attack (TIA)
- “Undetermined” qualifier (use cautiously; see notes)

**Modeling notes**
- This ValueSet is intended for definitive diagnoses (e.g., at discharge or after diagnostic workup), not “rule-out”, screening, history-of, or procedural concepts.
- Terminology expansion should be performed against the appropriate SNOMED CT edition/version and preferred language(s). Localizations MAY add designations without changing meaning.
- If “undetermined” is used, consider adding supporting narrative in `Condition.note` and/or linking evidence in Observations/DiagnosticReports to preserve interpretability.
"""
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
Description: """
This ValueSet enumerates SNOMED CT disorder concepts representing **pre-existing or concurrent conditions** that increase stroke risk.

**Primary use-case**
- Required binding to `Condition.code` in `StrokeRiskFactorConditionProfile`, used to maintain a structured problem list supporting:
  - etiologic reasoning (e.g., cardioembolic risk),
  - clinical decision support (e.g., anticoagulation considerations),
  - quality reporting and research cohort definition.

**Modeling notes**
- This ValueSet is for *previously documented conditions* (problems), not for “risk factor unknown”.
  If a risk factor assessment is unknown/not assessed, represent that as an Observation (status/result) or use `dataAbsentReason` patterns rather than a Condition with an “Unknown” code.
- The acute stroke event itself should be represented by `StrokeDiagnosisConditionProfile`, not by this risk factor profile.
"""
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
Description: """
This ValueSet enumerates discharge destination concepts (primarily SNOMED CT procedure-like “discharge to …” concepts).

**Primary use-cases**
- Bind to discharge disposition elements in encounter/hospitalization modeling.
  enabling consistent:
  - care transition analytics,
  - pathway reporting (home vs ward vs facility vs mortuary),
  - downstream coordination workflows.
"""
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
Description: """
This ValueSet enumerates modes of transport or pathways by which a patient arrived for the index stroke encounter.

**Primary use-cases**
- Bind to admission source elements (commonly `Encounter.hospitalization.admitSource` or local equivalents) to support:
  - operational reporting (ambulance vs own transport),
  - pathway compliance (e.g., EMS prenotification pathways),
  - inter-facility transfer analytics.
"""
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
Title: "Hemorrhagic Stroke Bleeding Reason CodeSystem"
Description: """
Local CodeSystem representing **locally governed reasons/causes** for intracranial bleeding in hemorrhagic stroke.

**Primary use-case**
- Used via `HemorrhagicStrokeBleedingReasonVS` as the allowed vocabulary for `HemorrhagicStrokeBleedingReasonExt.valueCodeableConcept`
  on a definitive hemorrhagic stroke Condition.
"""
* ^url = HemorrhagicStrokeBleedingReasonCS_URL
* ^name = "HemorrhagicStrokeBleedingReasonCS"
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
Description: """
This ValueSet defines allowable causes of bleeding for hemorrhagic stroke documentation.

**Primary use-case**
- Required binding for `HemorrhagicStrokeBleedingReasonExt.valueCodeableConcept` on a definitive hemorrhagic stroke Condition.

**Implementation guidance**
- Use when the cause is *identified* (e.g., aneurysm, vascular malformation).
- If the cause is unknown/undetermined, prefer documenting that explicitly using narrative (`Condition.note`) and/or a dedicated assessment Observation;
  if a coded placeholder is required, `Undetermined (qualifier value)` is included as an option.
"""
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
Title: "Stroke Etiology CodeSystem"
Description: """
Local CodeSystem defining categories for **ischemic stroke etiology** classification.

**Primary use-case**
- Used via `StrokeEtiologyVS` as the required vocabulary for `StrokeStrokeEtiologyExt.valueCodeableConcept`
  on a definitive ischemic stroke Condition.

**Why it exists**
- Stroke etiology classification often mixes internationally standard categories (cardioembolic, lacunar, cryptogenic) with local operational buckets.

**Modeling notes**
- This CodeSystem is intended for “final etiology classification” after diagnostic workup, not for provisional hypotheses.
"""
* ^url = StrokeEtiologyCS_URL
* ^name = "StrokeEtiologyCS"
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
Description: """
This ValueSet defines allowable values for recording the **determined ischemic stroke etiology**.

**Primary use-case**
- Required binding for `StrokeStrokeEtiologyExt.valueCodeableConcept` on definitive ischemic stroke Conditions.

**Composition**
- Local etiology categories (StrokeEtiologyCS), plus selected SNOMED CT disorder concepts for commonly used etiology groupings.

**Implementation guidance**
- Use after etiologic workup when a classification is assigned.
- If etiology remains unknown/undetermined, use the included `Undetermined (qualifier value)`
"""
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
Description: """
Extension capturing the **identified cause of intracranial bleeding** in a hemorrhagic stroke.

**Primary use-case**
- Attach to a definitive hemorrhagic stroke Condition (`StrokeDiagnosisConditionProfile`) to support:
  - etiologic stratification (aneurysm vs vascular malformation vs other),
  - analytics and registry reporting,
  - targeted clinical decision support pathways.

**FHIR placement**
- `Condition.extension[bleedingReason].valueCodeableConcept` (required binding to HemorrhagicStrokeBleedingReasonVS).
"""
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
Description: """
Extension capturing the **determined ischemic stroke etiology classification**.

**Primary use-case**
- Attach to a definitive ischemic stroke Condition (`StrokeDiagnosisConditionProfile`) to support:
  - etiologic subgroup analytics (cardioembolic vs lacunar vs cryptogenic, etc.),
  - pathway decision support (e.g., prolonged rhythm monitoring for cryptogenic stroke),

**When to use**
- Use after etiologic workup when a classification is assigned.
- Do not use for hemorrhagic stroke diagnoses.
- If the etiology remains unknown/undetermined, either omit the extension or use the “Undetermined” code included in StrokeEtiologyVS.

**FHIR placement**
- `Condition.extension[ischemicEtiology].valueCodeableConcept` (required binding to StrokeEtiologyVS).
"""
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
Title: "Stroke Symptom Onset Date Extension"
Description: """
Extension capturing the **calendar date** of symptom onset for the index stroke event.

**Primary use-cases**
- Compute onset-to-door and onset-to-treatment metrics when combined with encounter/treatment timestamps.
- Support time-sensitive eligibility pathways when onset is known at least to the day.

**When to use**
- Use when onset date is known with reasonable confidence.
- Use alongside `OnsetTimeExt` when time-of-day precision is available.
- Omit if onset is unknown, only broadly estimated, or not applicable (e.g., certain in-hospital events may use different timing constructs).

**FHIR placement**
- `Condition.extension[onsetDate].valueDate`
"""
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
Title: "Stroke Symptom Onset Time Extension"
Description: """
Extension capturing the **clock time** of symptom onset for the index stroke event.

**Primary use-cases**
- Enable precise onset-to-treatment intervals (e.g., onset-to-needle, onset-to-groin puncture).
- Improve accuracy of eligibility assessments in time-window–dependent interventions.

**When to use**
- Use when onset time is known with sufficient precision for clinical use.
- Omit if time is unknown or too uncertain.

**FHIR placement**
- `Condition.extension[onsetTime].valueTime`

**Implementation note**
- If `OnsetTimeExt` is present, `OnsetDateExt` should generally also be present (enforced as a warning invariant below).
"""
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
Description: """
Profile representing the **definitive diagnosis of the current/index stroke event** during the linked encounter.

**Primary use-case**
- Use for final/confirmed stroke diagnoses recorded during the index hospitalization/encounter (e.g., at discharge or after diagnostic workup).

**Key constraints**
- `Condition.category` is fixed to `encounter-diagnosis` to indicate this is the encounter’s diagnosis, not a general problem list item.
- `Condition.code` is required and bound (required) to StrokeDiagnosisVS.
- `Condition.onset[x]` is prohibited to avoid ambiguity: symptom onset is captured using dedicated onset extensions (date/time).

**Supported structured enrichments**
- `extension[bleedingReason]`: for hemorrhagic stroke bleeding cause (aneurysm, malformation, other/undetermined).
- `extension[ischemicEtiology]`: for ischemic stroke etiology classification.
- `extension[onsetDate]` and `extension[onsetTime]`: structured symptom onset capture.

"""
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
Description: """
Profile for **pre-existing or concurrent conditions** that increase stroke risk (e.g., AF/flutter, diabetes, hypertension, coronary disease).

**Key constraints**
- `Condition.category` is fixed to `problem-list-item` to indicate a problem list entry.
- `Condition.code` is required and bound (required) to StrokeRiskFactorVS.
- `Condition.onset[x]` and `Condition.recordedDate` are marked Must Support to enable chronology and longitudinal tracking.
"""
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
