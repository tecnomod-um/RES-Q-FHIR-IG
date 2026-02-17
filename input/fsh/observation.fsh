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
* ^description = "ValueSet defining the allowed coded outcomes for documenting the status of an Atrial Fibrillation (AF) or Atrial Flutter assessment. It is intentionally restricted to SNOMED CT qualifier values to express: (1) known present, (2) known absent, or (3) unknown. The ValueSet supports harmonized recording across systems, improves comparability for clinical decision support and research, and enables consistent reporting in contexts where AF/flutter materially influences thromboembolic risk and subsequent management."
* ^status = #active
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
* ^description = "CodeSystem containing the codes to represent the MTICI score."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = false  
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* #0 "Grade 0: No perfusion"
* #1 "Grade 1: Antegrade reperfusion past the initial occlusion, but limited distal branch filling with little or slow distal reperfusion"
* #2a "Grade 2a: Antegrade reperfusion of less than half of the occluded target artery previously ischemic territory"
* #2b "Grade 2b: Antegrade reperfusion of more than half of the previously occluded target artery ischemic territory"
* #2c "Grade 2c: Near complete perfusion except for slow flow or distal emboli in a few distal cortical vessels"
* #3 "Grade 3: Complete antegrade reperfusion of the previously occluded target artery ischemic territory, with absence of visualized occlusion in all distal branches"

// --- ValueSet for mTICI Score ---
ValueSet: MTICIScoreValueSet // Name from JSON
Id: mtici-score-vs // Id from JSON
* ^url = MticiScoreVS_URL
* ^version = "1.0.0"
* ^title = "MTICI Score ValueSet"
* ^name = "MTICIScoreValueSet" // Added name from JSON
* ^description = "ValueSet containing the codes to represent the MTICI score used to assess the degree of reperfusion after a thrombectomy procedure."
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include codes from system MticiScoreCS_URL

// --- CodeSystem for modified Rankin Scale (mRS) Score ---
CodeSystem: MRsScoreCS
Id: mrs-score-cs
* ^url = MRsScoreCS_URL
* ^version = "1.0.0"
* ^title = "modified Rankin Scale (mRS) Score Code System"
* ^description = "Codes representing the modified Rankin Scale (mRS) score for functional outcome."
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
* ^description = "ValueSet containing the codes for the modified Rankin Scale (mRS) score."
* ^status = #active
* include codes from system MRsScoreCS_URL

// --- CodeSystem for Assessment Context (for mRS/NIHSS) ---
CodeSystem: AssessmentContextCS
Id: assessment-context-cs
* ^url = AssessmentContextCS_URL
* ^version = "1.0.0"
* ^title = "Assessment Context Code System"
* ^description = "Codes defining the context or timing of a clinical assessment, particularly functional scores."
* ^status = #active
* ^experimental = true 
* ^caseSensitive = false    
* #pre-stroke "Pre-stroke" "Assessment reflects patient state before the current stroke event."
* #admission "Admission" "Assessment performed upon or shortly after hospital admission for the stroke event."
* #discharge "Discharge" "Assessment performed at the time of hospital discharge."
* #3-month "3-Month Follow-up" "Assessment performed approximately 3 months post-discharge."

// --- ValueSet for Assessment Context ---
ValueSet: AssessmentContextVS
Id: assessment-context-vs
* ^url = AssessmentContextVS_URL
* ^version = "1.0.0"
* ^title = "Assessment Context ValueSet"
* ^description = "ValueSet for assessment context codes (e.g., timing of functional scores)."
* ^status = #active
* include codes from system AssessmentContextCS_URL

// --- ValueSets for Observation.code Groupings ---
ValueSet: VitalSignCodesVS
Id: vital-sign-codes-vs
* ^url = VitalSignCodesVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Vital Sign Codes ValueSet"
* ^description = "Codes for key vital signs relevant to stroke assessment (Systolic, Diastolic BP)."
* ^status = #active
* ^experimental = true
* include SCT#271649006 "Systolic blood pressure (observable entity)"
* include SCT#271650006 "Diastolic blood pressure (observable entity)"

ValueSet: FunctionalScoreCodesVS
Id: functional-score-codes-vs
* ^url = FunctionalScoreCodesVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Functional Score Codes ValueSet"
* ^description = "Codes for key functional scores used in stroke (mRS, NIHSS)."
* ^status = #active
* include SCT#1255866005 "Modified Rankin Scale score (observable entity)"
* include SCT#450743008 "National Institutes of Health stroke scale score (observable entity)"

CodeSystem: TimingMetricCodesCS
Id: timing-metric-codes-cs
* ^url = TimingMetricCodesCS_URL
* ^version = "1.0.0"
* ^title = "Stroke Timing Metric Codes ValueSet"
* ^description = "Codes for key process timing metrics in acute stroke care (D2N, D2G)."
* ^status = #active
* #D2G "Door to Groin" "Time (in minutes) from hospital arrival to the groin puncture for mechanical thrombectomy"
* #D2N "Door to Needle" "Time (in minutes) from the patient’s arrival at the hospital to the start of intravenous thrombolysis"

ValueSet: TimingMetricCodesVS
Id: timing-metric-codes-vs
* ^url = TimingMetricCodesVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Timing Metric Codes ValueSet"
* ^description = "ValueSet for key process timing metrics in acute stroke care (D2N, D2G)."
* ^status = #active
* include codes from system TimingMetricCodesCS_URL

CodeSystem: StrokeCircumstanceCodesCS
Id: stroke-circumstance-codes-cs
* ^url = StrokeCircumstanceCodesCS_URL
* ^version = "1.0.0"
* ^title = "Stroke Circumstance Codes CodeSystem"
* ^description = "Codes for findings related to the circumstances of stroke onset (In-hospital, Wake-up)."
* ^status = #active
* #in-hospital "In-hospital Stroke" "Indicates that the stroke occurred while the patient was already admitted to the hospital for another reason."
* #wake-up "Wake-up Stroke" "Indicates that the stroke symptoms were first noticed upon waking from sleep, with an unknown time of onset."

ValueSet: StrokeCircumstanceCodesVS
Id: stroke-circumstance-codes-vs
* ^url = StrokeCircumstanceCodesVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Circumstance Codes ValueSet"
* ^description = "Codes for findings related to the circumstances of stroke onset (In-hospital, Wake-up)."
* ^status = #active
* include codes from system StrokeCircumstanceCodesCS_URL

ValueSet: SpecificFindingCodesVS
Id: specific-finding-codes-vs
* ^url = SpecificFindingCodesVS_URL
* ^version = "1.0.0"
* ^title = "Specific Stroke Finding Codes ValueSet"
* ^description = "Codes for specific clinical findings relevant to stroke (Afib/Flutter status, MTICI score)."
* ^status = #active
* include SCT#49436004 "Atrial fibrillation (disorder)"
* include SCT#5370000 "Atrial flutter (disorder)"

CodeSystem: MTICICodeCS
Id: mtici-code-cs
* ^url = MticiCodeCS_URL
* ^version = "1.0.0"
* ^title = "mTICI Score Codes CodeSystem"
* ^description = "Codes representing the mTICI score used to assess the degree of reperfusion after a thrombectomy procedure."
* ^status = #active
* ^experimental = true
* ^caseSensitive = false
* #mTICI "mTICI" "Modified Thrombolysis in Cerebral Infarction" 

ValueSet: MTICICodeVS
Id: mtici-code-vs
* ^url = MticiCodeVS_URL
* ^version = "1.0.0"
* ^title = "mTICI Score Codes ValueSet"
* ^description = "ValueSet containing the codes to represent the mTICI score used to assess the degree of reperfusion after a thrombectomy procedure."
* ^status = #active
* include codes from system MticiCodeCS_URL

ValueSet: StrokeFindingCodesVS
Id: stroke-finding-codes-vs
* ^url = StrokeFindingCodesVS_URL
* ^version = "1.0.0"
* ^title = "Specific Stroke Finding Codes ValueSet"
* ^description = "ValueSet for specific coded findings like Afib/Flutter status or mTICI score."
* ^status = #active
* include codes from valueset SpecificFindingCodesVS_URL
* include codes from valueset MticiCodeVS_URL


// ------------------------- Extensions -------------------------------


Extension: ObservationTimingContextExtension
Id: observation-timing-context-ext
* ^url = ObsTimingContextExt_URL
* ^title = "Observation Timing Context Extension"
* ^description = "Specifies the timing context or phase (e.g., pre-stroke, admission, discharge, 3-month) in which an observation or assessment was made."
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
* ^description = "Constraints for observations recorded in the context of stroke care."
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
* ^description = "Profile for recording key vital signs (Systolic/Diastolic BP) in stroke patients."
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
* ^description = "Profile for recording functional scores (mRS, NIHSS), using an extension for timing context." // Updated description
* extension contains ObservationTimingContextExtension named timingContext 1..1 MS // *** ADDED EXTENSION (Mandatory) ***
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
* ^description = "Profile for recording key process timing metrics (D2N, D2G)."
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
* ^description = "Profile for recording findings about stroke onset circumstances (In-hospital, Wake-up)."
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
* ^description = "Profile for specific coded findings like Afib/Flutter status or mTICI score."
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
* ^description = "Profile specifically for recording the patient's age at stroke onset. The value is represented as an integer (age in years) with a fixed SNOMED CT code indicating that this observation represents age at onset."
* code = SCT#445518008 "Age at onset of clinical finding (observable entity)"
* code 1..1 MS
* value[x] 1..1 MS
* value[x] only integer


// ------------------------- Invariants ---------------------------------
// Invariant for FunctionalScoreObservationProfile slicing
Invariant: obs-mrs-code
Description: "If the observation code is for mRS, the value must be a CodeableConcept."
Severity: #error
Expression: "code.coding.where($this.system = 'http://snomed.info/sct' and $this.code = '1255866005').exists() implies value.ofType(CodeableConcept).exists()"

Invariant: obs-nihss-code
Description: "If the observation code is for NIHSS, the value must be an Integer."
Severity: #error
Expression: "code.coding.where($this.system = 'http://snomed.info/sct' and $this.code = '450743008').exists() implies value.ofType(integer).exists()"

// Invariants for SpecificFindingObservationProfile
Invariant: obs-afib-code
Description: "If the observation code is for Afib/Flutter Assessment, the value must be from the AfibFlutterStatusVS."
Severity: #error
Expression: "code.coding.where($this.system = 'http://snomed.info/sct' and $this.code = '1290101000000101').exists() implies value.coding.where($this.system = %AfibFlutterStatusCS_URL).exists()"

Invariant: obs-mtici-code
Description: "If the observation code is for mTICI Score Assessment, the value must be from the MticiScoreVS."
Severity: #error
Expression: "code.coding.where($this.system = 'http://snomed.info/sct' and $this.code = '1156911000').exists() implies value.coding.where($this.system = %MticiScoreCS_URL).exists()"


Instance: AgeAtOnsetObservationExample
InstanceOf: AgeAtOnsetObservationProfile
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
