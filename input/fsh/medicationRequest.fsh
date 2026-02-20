// ------------------ Aliases ------------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir
Alias: FHIR_MedicationRequest = http://hl7.org/fhir/StructureDefinition/MedicationRequest
Alias: FHIR_Patient = http://hl7.org/fhir/StructureDefinition/Patient
Alias: FHIR_Encounter = http://hl7.org/fhir/StructureDefinition/Encounter
Alias: FHIR_Practitioner = http://hl7.org/fhir/StructureDefinition/Practitioner
Alias: FHIR_PractitionerRole = http://hl7.org/fhir/StructureDefinition/PractitionerRole
Alias: FHIR_Organization = http://hl7.org/fhir/StructureDefinition/Organization
Alias: FHIR_Device = http://hl7.org/fhir/StructureDefinition/Device
Alias: FHIR_CodeableConcept = http://hl7.org/fhir/StructureDefinition/CodeableConcept
Alias: MedReqAdminLocCS = http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location 

// URLs for Medication ValueSets
Alias: MedicationVS_URL = http://tecnomod-um.org/ValueSet/medication-vs
Alias: MedicationCS_URL = http://tecnomod-um.org/CodeSystem/medication-cs

CodeSystem: MedicationCS
Id: medication-cs
Title: "Discharge Medication Category CodeSystem"
Description: """
Local CodeSystem providing **coarse medication categories** used in discharge prescribing when the source system cannot
(or does not) provide a specific coded drug product/substance.

**Primary use-cases**
- Minimum-data capture for discharge medication classes relevant to stroke secondary prevention (e.g., anticoagulant vs antiplatelet).
- Registry reporting where only “medication class prescribed at discharge” is available.
- Analytics and quality indicators (e.g., “antithrombotic at discharge”) when specific agent is unknown.

**How it is used in FHIR**
- Included in `MedicationVS` so it can be used in `MedicationRequest.medication` (CodeableConcept).

"""
* ^url = MedicationCS_URL
* ^version = "1.0.0"
* ^name = "MedicationCS"
* ^status = #draft
* #other-anticoagulant "Other Anticoagulant" "Any anticoagulant medication"
* #antiplatelet "Any Antiplatelet" "Any antiplatelet medication"
* #antidiabetic "Any Antidiabetic" "Any antidiabetic medication"
* #other "Other Medication" "A medication other than those specifically listed was prescribed at discharge"

ValueSet: MedicationVS
Id: medication-vs
Title: "Discharge Medications ValueSet"
Description: """
ValueSet defining allowable coded medications (or medication categories) for discharge MedicationRequests.

**Primary use-case**
- Required binding to `MedicationRequest.medication` in `DischargeMedicationRequestProfile`.

**What this ValueSet supports**
1) **Specific SNOMED CT substance concepts** (e.g., aspirin, clopidogrel, warfarin) for agent-level capture.
2) **Local category codes** (from `MedicationCS`) for minimum-data capture when only the class is known.

**Scope and modeling notes**
- This ValueSet does not encode dose, route, frequency, or duration; those are expressed in MedicationRequest elements.
"""
* ^url = MedicationVS_URL
* ^version = "1.0.0"
* ^name = "MedicationVS"
* ^status = #draft
* include SCT#372756006 "Warfarin (substance)"
* include SCT#372586001 "Hypotensive agent (substance)"
* include SCT#372862008 "Anticoagulant (substance)"
* include SCT#312263009 "Sex hormone (substance)"
* include SCT#372912004 "Substance with 3-hydroxy-3-methylglutaryl-coenzyme A reductase inhibitor mechanism of action (substance)"
* include SCT#387458008 "Aspirin (substance)"
* include SCT#386952008 "Clopidogrel (substance)"
* include SCT#372877000 "Heparin (substance)"
* include codes from system MedicationCS_URL


// ------------------ Profile: Discharge Medication Request (Updated) -----------------------

Profile: DischargeMedicationRequestProfile
Id: discharge-medication-request-profile
Parent: FHIR_MedicationRequest
Title: "Discharge MedicationRequest Profile"
Description: """
Profile for representing a medication prescription issued as part of the patient’s **discharge plan** following a stroke encounter.

**Primary use-case**
- Capture secondary prevention and chronic therapy prescriptions intended to be taken **after discharge** (community setting),
  enabling:
  - discharge medication reconciliation,
  - continuity of care between hospital and primary care,
  - registry submission and quality improvement (e.g., antithrombotic/statin at discharge),
  - episode-linked analytics (tie to the index stroke Encounter).

**Key elements and how to use them**
- `status` (fixed to active): indicates the prescription is currently intended/valid at the time of discharge documentation.
  - Use `stopped` or `cancelled` in your broader implementation if a discharge prescription is later withdrawn (not constrained here).
- `category` (fixed to community): indicates the medication is intended for administration in the community/outpatient context.
  - This helps distinguish discharge prescriptions from inpatient medication orders.
- `medication` (required; bound to MedicationVS): identifies the prescribed agent or, if unavailable, a coarse category.
  - Prefer specific SNOMED CT substance concepts (e.g., aspirin) when available.
  - Use `MedicationCS` category codes only when the specific agent cannot be coded.
- `subject` (required): the patient who will take the medication.
- `encounter` (required): links the prescription to the index stroke admission encounter.
- `authoredOn` (optional but recommended): the date/time the discharge prescription was authored.
"""
* ^url = "http://tecnomod-um.org/StructureDefinition/discharge-medication-request-profile"
* ^version = "1.0.0"
* ^name = "DischargeMedicationRequestProfile"
* ^status = #active


* status = #active
* status MS


* category = MedReqAdminLocCS#community
* category 1..1 MS 

* medication 1..1 MS
* medication from MedicationVS_URL (required)
* subject 1..1 MS
* subject only Reference(FHIR_Patient)

* encounter 1..1 MS
* encounter only Reference(FHIR_Encounter)

* authoredOn 0..1 MS


Instance: DischargeMedicationRequest
InstanceOf: DischargeMedicationRequestProfile
* id = "discharge-medication-request-001"
* status = #active
* category = MedReqAdminLocCS#community
* medication = SCT#372756006 "Warfarin (substance)"
* intent = #order // Intent for discharge medication request
* subject = Reference(PatientExample) // Reference to the patient
* encounter = Reference(StrokeEncounterExample) // Reference to the stroke encounter
