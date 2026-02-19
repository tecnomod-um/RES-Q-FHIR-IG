// ------------------------- Aliases ----------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR_Encounter = http://hl7.org/fhir/StructureDefinition/Encounter
Alias: FHIR_Extension = http://hl7.org/fhir/StructureDefinition/Extension
Alias: FHIR_Location = http://hl7.org/fhir/StructureDefinition/Location


// URLs for Custom CodeSystems (Defined Below)
Alias: StrokeArrivalModeCS_URL = http://tecnomod-um.org/CodeSystem/stroke-arrival-mode-cs
Alias: DischargeDeptCS_URL = http://tecnomod-um.org/CodeSystem/discharge-dept-cs
Alias: InitialCareIntensityCS_URL = http://tecnomod-um.org/CodeSystem/initial-care-intensity-cs
Alias: StrokeDischargeDestinationCS_URL = http://tecnomod-um.org/CodeSystem/stroke-discharge-destination-cs
// URLs for Custom ValueSets (Defined Below - used in bindings)
Alias: StrokeArrivalModeVS_URL = http://tecnomod-um.org/ValueSet/stroke-arrival-mode-vs
Alias: StrokeDischargeDestinationVS_URL = http://tecnomod-um.org/ValueSet/stroke-discharge-destination-vs
Alias: DischargeDeptVS_URL = http://tecnomod-um.org/ValueSet/discharge-dept-vs
Alias: InitialCareIntensityVS_URL = http://tecnomod-um.org/ValueSet/initial-care-intensity-vs

// URLs for Custom Extensions (Defined Below)
Alias: FirstHospitalExt_URL = http://tecnomod-um.org/StructureDefinition/first-hospital-ext
Alias: InitialCareIntensityExt_URL = http://tecnomod-um.org/StructureDefinition/initial-care-intensity-ext
Alias: RequiredPostAcuteCareExt_URL = http://tecnomod-um.org/StructureDefinition/required-post-acute-care-ext
Alias: DischargeDepartmentServiceExt_URL = http://tecnomod-um.org/StructureDefinition/discharge-department-service-ext

// ------------------------- Custom CodeSystems & ValueSets -------------

// --- Initial Care Intensity ---
CodeSystem: StrokeArrivalModeCS
Id: stroke-arrival-mode-cs
Title: "Stroke Arrival Mode CodeSystem"
Description: """
Local CodeSystem describing **how and from where** the patient arrived to the treating hospital for the index stroke encounter.

**Primary use-case**
- Populate `Encounter.admission.admitSource` (via StrokeArrivalModeVS) to support:
  - workflow analysis (EMS vs private transport),
  - pathway compliance reporting (direct-to-stroke-center vs inter-facility transfer),
  - operational dashboards and registries.

**Modeling notes**
- These codes describe *arrival origin and transport pathway*, not clinical triage severity.
- If you need transport timestamps, EMS unit identifiers, or handover details, model them separately 
"""
* ^url = StrokeArrivalModeCS_URL
* ^status = #active
* ^experimental = true 
* ^caseSensitive = false  
* #priv-transport-home "Private Transportation from Home/Scene" "The patient arrived via personal or non-medical transport from their home or directly from the scene of the incident."
* #priv-transport-gp "Private Transportation from GP" "The patient was referred and transported privately from GP."
* #ems-gp "EMS from GP" "Emergency Medical Services (EMS) transported the patient from GP."
* #stroke-center "Stroke Center" "The patient was transferred from a specialized stroke center, indicating prior specialized care"
* #ems-home "EMS from Home" "Emergency Medical Services (EMS) transported the patient from their home or directly from the scene where the stroke symptoms began."
* #another-hosp "Another Hospital" "The patient was transferred from another hospital"

// --- Arrival Mode ---
ValueSet: StrokeArrivalModeVS
Id: stroke-arrival-mode-vs
Title: "Stroke Arrival Mode ValueSet"
Description: """
ValueSet restricting the allowed values for documenting the patient's arrival mode/origin.

**Primary use-case**
- Required binding to `Encounter.admission.admitSource` in `StrokeEncounterProfile`.

"""
* ^url = StrokeArrivalModeVS_URL
* ^status = #active
* include codes from system StrokeArrivalModeCS_URL

CodeSystem: StrokeDischargeDestinationCS
Id: stroke-discharge-destination-cs
Title: "Stroke Discharge Destination CodeSystem"
Description: """
Local CodeSystem for discharge disposition values that are not sufficiently covered (or not consistently available)
in the chosen standard terminology set.
"""
* ^url = StrokeDischargeDestinationCS_URL
* ^status = #active
* ^experimental = true
* #dead "Patient Deceased" "The patient died during the hospital stay."

// --- Discharge Destination ---
ValueSet: StrokeDischargeDestinationVS
Id: stroke-discharge-destination-vs
Title: "Stroke Discharge Destination ValueSet"
Description: """
ValueSet defining allowable discharge dispositions for the stroke encounter.

**Primary use-case**
- Required binding to `Encounter.admission.dischargeDisposition` in `StrokeEncounterProfile`.

**Composition**
- SNOMED CT “discharge/transfer” procedure concepts for common destinations.
- Local supplement (StrokeDischargeDestinationCS) for outcomes such as “deceased during stay”.
"""
* ^url = StrokeDischargeDestinationVS_URL
* ^status = #active
* include SCT#306689006 "Discharge to home (procedure)"
* include SCT#37729005 "Patient transfer, in-hospital (procedure)" 
* include SCT#19712007 "Patient transfer, to another health care facility (procedure)"
* include SCT#306694006 "Discharge to nursing home (procedure)" 
// * include SCT#371828006 "Patient deceased during stay (discharge status = dead) (finding)" 
* include codes from system StrokeDischargeDestinationCS_URL

// --- Discharge Department/Service ---
CodeSystem: DischargeDeptCS
Id: discharge-dept-cs
Title: "Discharge Department/Service CodeSystem"
Description: """
Local CodeSystem representing the **clinical service/department** responsible for the patient at discharge/transfer
(or the service the patient is transferred to).

**Primary use-case**
- Populate `DischargeDepartmentServiceExtension` on Encounter to support:
  - bed management and service-level reporting,
  - pathway characterization (e.g., discharge under neurology vs rehab),
  - operational analytics and capacity planning.

**Modeling notes**
- This captures *service classification*, not the physical ward/room. Physical location should be modeled using `Encounter.location`
  (and references to Location resources) if needed.
"""
* ^url = DischargeDeptCS_URL
* ^status = #active
* #acute "Acute Rehabilitation" "Patient discharged to an acute rehabilitation setting."
* #post-care "Post Care Bed" "Patient discharged to a post care bed."
* #neurology "Neurology" "Patient discharged to a neurology department or service."
* #another-department "Another Department" "Patient discharged to a different department within the same hospital."

ValueSet: DischargeDeptVS
Id: discharge-dept-vs
Title: "Discharge Department/Service ValueSet"
Description: """
ValueSet restricting the allowed department/service categories recorded at discharge.

**Primary use-case**
- Required binding for `DischargeDepartmentServiceExtension.valueCodeableConcept`.
"""
* ^url = DischargeDeptVS_URL
* ^status = #active
* include codes from system DischargeDeptCS_URL

// --- Initial Care Intensity ---
CodeSystem: InitialCareIntensityCS
Id: initial-care-intensity-cs
Title: "Initial Care Intensity CodeSystem"
Description: """
Local CodeSystem representing the **initial intensity of care** during the first day(s) of the stroke encounter.

**Primary use-case**
- Populate `InitialCareIntensityExtension` on Encounter to support:
  - case-mix characterization (ICU/stroke unit vs monitored vs standard bed),
  - operational benchmarking and staffing analysis,
  - research stratification where initial level-of-care is a confounder.

**Interpretation guidance**
- `standard`: no continuous monitoring beyond standard nursing observation.
- `monitored`: telemetry or continuous monitoring outside ICU.
- `icu-stroke`: ICU or dedicated stroke unit level care (per local definitions).
"""
* ^url = InitialCareIntensityCS_URL
* ^status = #active
* ^experimental = true 
* ^caseSensitive = false  
* #standard "Standard bed"
  "Patient placed in a standard inpatient bed without continuous telemetry/continuous physiologic monitoring."
* #monitored "Monitored bed"
  "Patient placed in a monitored setting (e.g., telemetry) without full ICU-level care."
* #icu-stroke "ICU / Stroke Unit"
  "Patient managed in an ICU or specialized stroke unit providing high-intensity care and monitoring."

ValueSet: InitialCareIntensityVS
Id: initial-care-intensity-vs
Title: "Initial Care Intensity ValueSet"
Description: """
ValueSet restricting allowed initial care intensity categories.

**Primary use-case**
- Required binding for `InitialCareIntensityExtension.valueCodeableConcept`.
"""
* ^url = InitialCareIntensityVS_URL
* ^status = #active
* include codes from system InitialCareIntensityCS_URL

// ------------------------- Extensions -------------------------------

Extension: FirstHospitalExtension
Id: first-hospital-ext
Title: "First Hospital Indicator Extension"
Description: """
Boolean extension indicating whether the reporting hospital was the **first medical facility** to admit the patient
for this stroke episode.

**Primary use-cases**
- Registry fields distinguishing “direct to treating hospital” vs “secondary transfer”.
- Analytics for inter-facility transfer patterns and treatment delays (door-in-door-out style analyses).

**How to interpret**
- `true`: this hospital is the first admitting facility for the episode.
- `false`: patient was admitted/treated elsewhere first (transfer-in).

**FHIR placement**
- `Encounter.extension[isFirstHospital].valueBoolean`
"""
* ^url = FirstHospitalExt_URL
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only boolean
* value[x] 1..1

Extension: InitialCareIntensityExtension
Id: initial-care-intensity-ext
Title: "Initial Care Intensity Extension"
Description: """
Extension capturing the **initial level of care** provided during the first day(s) of hospitalization for the stroke encounter.

**Primary use-cases**
- Operational reporting (ICU/stroke unit utilization).
- Case-mix adjustment for outcomes and length-of-stay analyses.
- Benchmarking across sites.

**Relationship to base Encounter**
- This is not a location/ward tracker; for physical moves use `Encounter.location` with Location references.
- This is a categorical “initial intensity” label used for reporting.

**FHIR placement**
- `Encounter.extension[initialCareIntensity].valueCodeableConcept` (required binding to InitialCareIntensityVS).
"""
* ^url = InitialCareIntensityExt_URL
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from InitialCareIntensityVS_URL (required)

Extension: RequiredPostAcuteCareExtension
Id: required-post-acute-care-ext
Title: "Required Post-Acute Care Extension"
Description: """
Boolean extension indicating whether the patient required **ongoing inpatient care beyond the acute phase**.

**Interpretation guidance**
- `true`: patient required hospitalization beyond the acute phase (operationalized here as >24 hours after the acute phase).
- `false`: no extended post-acute inpatient need was recorded for this encounter (per local workflow).

**FHIR placement**
- `Encounter.extension[requiredPostAcuteCare].valueBoolean`
"""
* ^url = RequiredPostAcuteCareExt_URL
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only boolean
* value[x] 1..1

Extension: DischargeDepartmentServiceExtension
Id: discharge-department-service-ext
Title: "Discharge Department/Service Extension"
Description: """
Extension capturing the **clinical department/service** responsible at discharge or the service the patient is transferred to.

**Primary use-cases**
- Service-level reporting and capacity planning.
- Distinguishing discharge under neurology vs rehab vs other services.
- Supporting downstream routing/coordination logic when a service category is required.

**FHIR placement**
- `Encounter.extension[dischargeDepartmentService].valueCodeableConcept` (required binding to DischargeDeptVS).
"""
* ^url = DischargeDepartmentServiceExt_URL
* ^context[0].type = #element
* ^context[0].expression = "Encounter"
* value[x] only CodeableConcept
* value[x] 1..1
* value[x] from DischargeDeptVS_URL (required)

// ------------------------- Encounter Profile -------------------------

Profile: StrokeEncounterProfile
Id: stroke-encounter-profile
Parent: Encounter
Title: "Stroke Encounter Profile"
Description: """
Profile for an Encounter representing a patient's **inpatient admission and hospital stay** for an index stroke event.

**Primary use-case**
- Acts as the episode anchor that Conditions, Observations, and Procedures reference via `encounter`, enabling consistent episode-level analytics.

**Captures**
- `status`: lifecycle state of the encounter (required).
- `class`: fixed to inpatient (IMP) to represent an admission.
- `actualPeriod`: start/end of the admission (required; end is required for completed stays).
- `admission.admitSource`: arrival mode/origin (required binding to StrokeArrivalModeVS when present).
- `admission.dischargeDisposition`: discharge destination (required binding to StrokeDischargeDestinationVS).
- Episode-level extensions for operational/registry attributes:
  - first hospital indicator,
  - initial care intensity,
  - required post-acute care flag,
  - discharge department/service.

**Typical scenarios**
1) Direct admission via EMS from home: admitSource=EMS-from-home, isFirstHospital=true.
2) Transfer-in: admitSource=another-hospital or stroke-center, isFirstHospital=false.
3) Discharge home vs rehab vs death: dischargeDisposition captures destination/outcome; dischargeDepartmentService can capture service.
"""
* ^fhirVersion = #5.0.0
* ^url = "http://tecnomod-um.org/StructureDefinition/stroke-encounter-profile"
* ^status = #active
* ^version = "1.0.0"

// Extensions
* extension contains FirstHospitalExtension named isFirstHospital 1..1 MS and
    InitialCareIntensityExtension named initialCareIntensity 0..1 MS and
    RequiredPostAcuteCareExtension named requiredPostAcuteCare 0..1 MS and
    DischargeDepartmentServiceExtension named dischargeDepartmentService 0..1 MS

// Standard Encounter Elements
* status 1..1 MS
* class = #IMP "inpatient encounter"
* class MS
* type MS // Consider defining a ValueSet for specific encounter types if needed

// Period (Start/End Dates)
* actualPeriod 1..1 MS
* actualPeriod.start 0..1 MS // hospital timestamp
* actualPeriod.end 1..1 MS // discharge date

* subject 1..1 
* subject MS // Reference to the patient
* subject only Reference(Patient) // Reference to the patient resource


// Hospitalization Details
* admission 1..1 MS
* admission.admitSource 0..1 MS // arrival mode
* admission.admitSource from StrokeArrivalModeVS (required)
* admission.dischargeDisposition 1..1 MS // discharge destination
* admission.dischargeDisposition from StrokeDischargeDestinationVS (required)

// Invariant: encounter-end-required-when-completed
// Description: "If Encounter.status is 'completed', actualPeriod.end must be present to support length-of-stay and discharge analytics."
// Severity: #error
// Expression: "status = 'completed' implies actualPeriod.end.exists()"

// Invariant: discharge-disposition-required-when-completed
// Description: "If Encounter.status is 'completed', dischargeDisposition must be present to support standardized discharge outcome reporting."
// Severity: #error
// Expression: "status = 'completed' implies admission.dischargeDisposition.exists()"

// Invariant: transfer-in-consistency
// Description: "If isFirstHospital is false, admitSource should indicate a transfer pathway (e.g., another hospital or stroke center)."
// Severity: #warning
// Expression: "extension('http://tecnomod-um.org/StructureDefinition/first-hospital-ext').valueBoolean = false implies (admission.admitSource.coding.where(system=%StrokeArrivalModeCS_URL and (code='another-hosp' or code='stroke-center')).exists())"


Instance: PatientExample
InstanceOf: Patient
* id = "example-patient"

Instance: StrokeEncounterExample
InstanceOf: StrokeEncounterProfile
* status = #completed
* type = #inpatient "Inpatient Encounter"

* actualPeriod.start = 2025-03-01T08:00:00Z
* actualPeriod.end   = 2025-03-10T12:00:00Z


* subject = Reference(PatientExample)

* admission.admitSource = StrokeArrivalModeCS_URL#ems-home "EMS from Home"
* admission.dischargeDisposition = SCT#306689006 "Discharge to home (procedure)"
* extension[isFirstHospital].valueBoolean = true
* extension[initialCareIntensity].valueCodeableConcept = InitialCareIntensityCS_URL#icu-stroke "ICU / Stroke Unit"
* extension[requiredPostAcuteCare].valueBoolean = false
* extension[dischargeDepartmentService].valueCodeableConcept = DischargeDeptCS_URL#neurology "Neurology"

