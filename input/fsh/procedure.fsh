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
* ^url = CarotidImagingModalityVS_URL
* ^version = "1.0.0"
* ^title = "Carotid Arteries Imaging Modality ValueSet"
* ^description = "Defines codes for different types of carotid artery imaging."
* ^status = #active
* include SCT#58920005 "Angiography of carotid artery (procedure)"
* include SCT#9171000087102 "Doppler ultrasonography of carotid arteries (procedure)"
* include SCT#396205005 "Computed tomography of brain without radiopaque contrast (procedure)"
* include SCT#1366357009 "Magnetic resonance imaging angiography of intracranial artery (procedure)"




CodeSystem: BrainImagingTypeCS
Id: brain-imaging-type-cs
* ^url = BrainImagingTypeCS_URL
* ^version = "1.0.0"
* ^title = "Brain Imaging Type Code System"
* ^description = "Codes specifying the type of brain imaging performed (e.g., CT, MRI)."
* ^status = #active
* #ct-cta "CT-CTA" "Computed Tomography (CT) and CT Angiography (CTA)"
* #ct-cta-perfusion "CT-CTA and Perfusion" "Computed Tomography (CT), CT Angiography (CTA), and CT Perfusion"
* #mr-dwi-flair "MR DWI-FLAIR" "Magnetic Resonance Imaging (MRI) with Diffusion-Weighted Imaging (DWI) or Fluid-Attenuated Inversion Recovery (FLAIR)"
* #mr-dwi-flair-mra "MR DWI-FLAIR and MRA" "Magnetic Resonance Imaging (MRI) with Diffusion-Weighted Imaging (DWI) or Fluid-Attenuated Inversion Recovery (FLAIR), and Magnetic Resonance Angiography (MRA)"
* #mr-dwi-flair-mra-perfusion "MR DWI-FLAIR, MRA, and Perfusion" "Magnetic Resonance Imaging (MRI) with Diffusion-Weighted Imaging (DWI) and Fluid-Attenuated Inversion Recovery (FLAIR), Magnetic Resonance Angiography (MRA), and MR Perfusion"

// --- ValueSet: Brain Imaging Modalities ---
ValueSet: BrainImagingModalityVS
Id: brain-imaging-modality-vs
* ^url = BrainImagingModalityVS_URL
* ^version = "1.0.0"
* ^title = "Brain Imaging Modality ValueSet"
* ^description = "Defines the SNOMED CT codes for individual brain imaging modalities performed as procedures."
* ^status = #active
* include SCT#419949007 "Computed tomography angiography of intracranial artery with contrast (procedure)"
* include codes from system BrainImagingTypeCS_URL

CodeSystem: ThrombectomyComplicationCS
Id: thrombectomy-complication-cs
* ^url = ThrombectomyComplicationCS_URL
* ^version = "1.0.0"
* ^title = "Thrombectomy Complication Code System"
* ^description = "Codes specifying the specific complications of thrombectomy to record."
* ^status = #active
* #perforation "Vessel Perforation" "Vessel perforation occurred during the mechanical thrombectomy"


// --- ValueSet: Thrombectomy Complications ---
ValueSet: ThrombectomyComplicationVS
Id: thrombectomy-complication-vs
* ^url = ThrombectomyComplicationVS_URL
* ^version = "1.0.0"
* ^title = "Thrombectomy Complication ValueSet"
* ^description = "Defines the specific complications of thrombectomy to record."
* ^status = #active
* include SCT#307312008 "Perforation of artery (disorder)"

CodeSystem: StrokeProcNotDoneReasonCS
Id: stroke-proc-not-done-reason-cs
* ^url = StrokeProcNotDoneReasonCS_URL
* ^version = "1.0.0"
* ^title = "Stroke Procedure Not Done Reason Code System"
* ^description = "Codes specifying the reason principal for not performing a key stroke procedure (Thrombolysis, Thrombectomy)."
* ^status = #active
* ^experimental = true
* ^caseSensitive = false 
* #time-window "Outside Therapeutic Window" "Patient presented or evaluated outside the established time limit for the procedure."
* #no-lvo "No Large Vessel Occlusion (LVO)" "An eligible large vessel occlusion for thrombectomy was not identified."
* #contraindication "Contraindication Present" "A medical contraindication to the procedure existed (e.g., bleeding risk)."
* #patient-refusal "Patient/Family Refusal" "The patient or their legal representative refused the procedure."
* #transfer "Transferred to Another Facility" "The patient was transferred to another hospital for the procedure."
* #unavailable "Procedure Unavailable" "The procedure was not available at the facility (e.g., lack of equipment, staff)."
* #disability "Severe Preexisting Disability" "Patient's baseline disability made benefit from the procedure unlikely."
* #mild-deficit "Mild Deficit" "Patient's neurological deficit was too mild to warrant the procedure."
* #done-elsewhere "Performed Elsewhere" "The procedure had already been performed at another facility prior to arrival/transfer."
* #cost "Cost / No Insurance" "Financial or coverage reasons prevented the procedure."
* #unknown "Reason Unknown" "The reason was not documented or is unknown."
* #consent "Consent Not Obtained" "Informed consent for the procedure was not obtained."
* #only-mt "Only Mechanical Thrombectomy Considered" "Only mechanical thrombectomy was considered, and thrombolysis was not performed."
* #other "Other Reason" "A reason not specifically defined."
* #technically-not-possible "Technically Not Possible" "The procedure could not be performed due to technical or anatomical challenges."
* #no-angiography "Angiography Not Performed" "Angiography to assess the situation was not performed."
// --- ValueSet: Stroke Procedure Not Done Reasons ---
ValueSet: StrokeProcNotDoneReasonVS
Id: stroke-proc-not-done-reason-vs
* ^url = StrokeProcNotDoneReasonVS_URL
* ^version = "1.0.0"
* ^title = "Stroke Procedure Not Done Reason ValueSet"
* ^description = "ValueSet containing specific codes to indicate why thrombolysis or thrombectomy was not performed."
* ^status = #active
* include codes from system StrokeProcNotDoneReasonCS_URL // Includes codes from the specific CS


// --- CodeSystem: Swallowing Screening Timing Category ---
CodeSystem: SwallowScreenTimeCS
Id: swallow-screen-time-cs
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
* ^url = SwallowingScreeningTimingCategoryVS_URL
* ^version = "1.0.0"
* ^title = "Swallowing Screening Timing Category ValueSet"
* ^description = "Temporal categories relative to stroke onset for swallowing screening."
* ^status = #active
* include codes from system SwallowScreenTimeCS_URL
* include SCT#281380002 "24 hours post admission (qualifier value)"
* include SCT#281381003 "More than 24 hours after admission (qualifier value)"

// --- CodeSystem: Procedure Timing Context ---
CodeSystem: ProcedureTimingContextCS
Id: procedure-timing-context-cs
* ^url = ProcedureTimingContextCS_URL
* ^version = "1.0.0"
* ^title = "Procedure Timing Context Code System"
* ^description = "Codes defining the timing phase of a procedure relative to the encounter start (e.g., acute vs. post-acute)."
* ^status = #active
* ^experimental = true
* ^caseSensitive = false 
* #acute "Acute Phase (<24h)" "Procedure performed within 24 hours of encounter start time."
* #post-acute "Post-Acute Phase (>=24h)" "Procedure performed 24 hours or more after encounter start time."
* #unknown "Unknown/Not Applicable" "Timing relative to encounter start is unknown or not applicable."

// --- ValueSet: Procedure Timing Context ---
ValueSet: ProcedureTimingContextVS
Id: procedure-timing-context-vs
* ^url = ProcedureTimingContextVS_URL
* ^version = "1.0.0"
* ^title = "Procedure Timing Context ValueSet"
* ^description = "ValueSet for codes defining the timing phase of a procedure relative to the encounter start."
* ^status = #active
* include codes from system ProcedureTimingContextCS_URL


// --- CodeSystem: Swallow Screening Procedures ---
CodeSystem: SwallowProceduresCS
Id: swallow-procedures-cs
* ^url = SwallowProceduresCS_URL
* ^version = "1.0.0"
* ^title = "Swallow Procedures Code System"
* ^description = "Codes representing various swallowing assessment procedures."
* ^status = #active
* #assist "ASSIST" "Assisted Swallowing Test (ASSIST)"
* #other "Other Swallow Procedure" "Other specified swallowing assessment procedure"
* #v-vst "V-VST" "Volume-Viscosity Swallow Test (V-VST)"

// --- ValueSet: Procedures (General) ---
ValueSet: SwallowProceduresVS
Id: swallow-procedures-vs
* ^url = SwallowProceduresVS_URL
* ^name = "SwallowProceduresValueset"
* ^version = "1.0.0"
* ^title = "Swallow Procedures ValueSet"
* ^description = "ValueSet containing SNOMED CT codes representing a range of procedures used in the evaluation and management of stroke patients."
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include SCT#1290000005 "Assessment using Gugging Swallowing Screen (procedure)"
* include SCT#63913004 "Tonography with water provocation (procedure)"
* include codes from system SwallowProceduresCS_URL


// --- ValueSet: Procedures (General) ---
ValueSet: PerforationProceduresVS_URL
Id: perforation-procedures-vs
* ^url = PerforationProceduresVS_URL
* ^name = "PerforationProceduresValueset"
* ^version = "1.0.0"
* ^title = "Perforation Procedures ValueSet"
* ^description = "ValueSet containing SNOMED CT codes representing a range of perforation procedures."
* ^status = #draft
* ^experimental = true
* ^date = "2025-03-31"
* ^publisher = "Example Organization"
* ^contact[0].name = "Example Organization"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "info@example.org"
* include SCT#472191000119101 "Thrombolysis of cerebral artery by intravenous infusion (procedure)"
* include SCT#397046001 "Thrombectomy of artery (procedure)"


// ------------------------- Extensions (R5 Compatible) ---------------------------
Extension: SwallowingScreeningTimingCategoryExt
Id: swallowing-screening-timing-category-ext
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
* ^url = ProcTimingContextExt_URL
* ^version = "1.0.0"
* ^title = "Procedure Timing Context Extension"
* ^description = "Specifies the timing phase (e.g., acute, post-acute) in which the procedure was performed relative to the start of the encounter."
* ^context[0].type = #element
* ^context[0].expression = "Procedure"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from ProcedureTimingContextVS_URL (required) // Use Alias

// ------------------ Profile: StrokeProcedureProfile (FHIR R5) ----------------

Profile: StrokeBrainImagingProcedureProfile
Id: stroke-brain-imaging-procedure-profile
Parent: FHIR_Procedure // R5 Procedure Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-brain-imaging-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeBrainImagingProcedureProfile"
* ^title = "Stroke Brain Imaging Procedure Profile (R5)" // Indicate R5
* ^description = "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context." // Indicate R5
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
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-carotid-imaging-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeCarotidImagingProcedureProfile"
* ^title = "Stroke Carotid Imaging Procedure Profile (R5)" // Indicate R5
* ^description = "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context." // Indicate R5
* ^status = #active
* code = SCT#58920005 "Angiography of carotid artery (procedure)"
* status 1..1 MS 
* status from http://hl7.org/fhir/ValueSet/event-status
* statusReason 0..1 MS
* statusReason from StrokeProcNotDoneReasonVS_URL (required)
* extension contains ProcedureTimingContextExtension named timingContext 0..1 MS


Profile: StrokeThrombolysisProcedureProfile
Id: stroke-mechanical-procedure-profile 
Parent: FHIR_Procedure // R5 Procedure Base
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-mechanical-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeThrombolysisProcedureProfile"
* ^title = "Stroke Thrombolysis Procedure Profile (R5)" // Indicate R5
* ^description = "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context." // Indicate R5
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
* ^fhirVersion = #5.0.0 // Specify R5
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-swallow-procedure-profile"
* ^version = "1.2.0" // Incremented version for R5 update
* ^name = "StrokeSwallowProcedureProfile"
* ^title = "Stroke Swallow Procedure Profile (R5)" // Indicate R5
* ^description = "Procedure profile to record key stroke procedures, including status, timing, complications, reasons, and context." // Indicate R5
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
Description: "A reason (statusReason) must be provided if the procedure status is 'not-done'."
Severity: #error
Expression: "status = 'not-done' implies statusReason.exists()"

Invariant: brain-imaging-timestamp-required
Description: "A timestamp (performed[x]) must be recorded if a brain imaging procedure was performed in this facility."
Severity: #error
Expression: "code.memberOf(%BrainImagingModalityVS_URL%) and status = 'completed' and (extension(%ProcPerfElsewhereExt_URL%).exists().not() or extension(%ProcPerfElsewhereExt_URL%).value = false) implies performed.exists()" // Alias syntax updated

Invariant: mt-not-done-reason-binding
Description: "If a thrombectomy was not performed (status='not-done'), statusReason must use codes from the StrokeProcNotDoneReasonVS ValueSet."
Severity: #error
Expression: "code.coding.where(system = 'http://snomed.info/sct' and code = '397046001').exists() and status = 'not-done' implies statusReason.memberOf(%StrokeProcNotDoneReasonVS_URL%)" // Alias syntax updated

Invariant: ivt-not-done-reason-binding
Description: "If an IV thrombolysis was not performed (status='not-done'), statusReason must use codes from the StrokeProcNotDoneReasonVS ValueSet."
Severity: #error
Expression: "code.coding.where(system = 'http://snomed.info/sct' and code = '472191000119101').exists() and status = 'not-done' implies statusReason.memberOf(%StrokeProcNotDoneReasonVS_URL%)" // Alias syntax updated

Invariant: mt-complication-only-if-completed
Description: "Complications (the 'complication' field) only apply to completed thrombectomies."
Severity: #error
// R5 path check: complication is the backbone, complication.code is the CC
Expression: "complication.exists() implies (code.coding.where(system = 'http://snomed.info/sct' and code = '397046001').exists() and status = 'completed')" // Check complication backbone existence

Invariant: screening-tool-required // *** UPDATED for R5 path used.concept ***
Description: "The tool used (used.concept) must be specified if swallowing screening was completed."
Severity: #warning
Expression: "(code.memberOf(%SwallowingScreeningToolVS_URL%)) and status = 'completed' implies used.concept.exists() and used.concept.memberOf(%SwallowingScreeningToolVS_URL%)" // Use used.concept path and Alias

Invariant: screening-timing-required
Description: "The timing category (extension) must be specified if swallowing screening was completed."
Severity: #error
Expression: "(code.memberOf(%SwallowingScreeningToolVS_URL%)) and status = 'completed' implies extension(%SwallowScreenTimeExt_URL%).exists()" // Alias syntax updated


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
